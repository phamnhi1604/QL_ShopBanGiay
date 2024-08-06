using QL_ShopBanGiay_Web.Models;
using System.Linq;
using System.Security.Principal;
using System.Web.Mvc;
using System.Web.Security;
using QL_ShopBanGiay_Web.ViewModels;
namespace QL_ShopBanGiay_Web.Controllers
{
    public class AccountController : Controller
    {
        ShopBanGiayDataContext db = new ShopBanGiayDataContext();

        // GET: Account
        public ActionResult Register1()
        {
            return PartialView();
        }

        public ActionResult RoleAndNamePartial()
        {
            string username = User.Identity.Name.ToString();
            if (!string.IsNullOrEmpty(username))
            {
                ViewBag.Roles = GetRolesForUser(username)[0];
                ViewBag.EmployeeName = (from nguoiDung in db.NguoiDungs
                                        join tenKh in db.KhachHangs on nguoiDung.IdNguoiDung equals tenKh.IdNguoiDung
                                        where nguoiDung.TenTaiKhoan == username
                                        select tenKh.TenKhachHang).FirstOrDefault();
            }
            else
            {
                ViewBag.Roles = string.Empty;
                ViewBag.EmployeeName = string.Empty;
            }
            return PartialView();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult Register(LoginUserVM lg)
        {
            if (ModelState.IsValid)
            {
                bool existsUsername = db.NguoiDungs.Any(x => x.TenTaiKhoan == lg.Username);

                if (existsUsername)
                {
                    return Json(new { success = false, message = "Tài khoản đã tồn tại" });
                }
                else if (lg.Password == lg.ConfirmPassword)
                {
                    NguoiDung u = new NguoiDung()
                    {
                        TenTaiKhoan = lg.Username,
                        MatKhau = lg.Password,
                        IdVaiTro = 4,
                        TonTai = true,
                        Cam = false
                    };

                    db.NguoiDungs.InsertOnSubmit(u);
                    db.SubmitChanges();

                    return Json(new
                    {
                        JsonRequestBehavior.AllowGet,
                        success = true,
                        message = "Đăng ký thành công"
                    });

                }
                else
                {
                    return Json(new { success = false, message = "Mật khẩu và xác nhận mật khẩu không khớp" });
                }
            }
            else
            {
                var validationErrors = ModelState.ToDictionary(
                    kvp => kvp.Key,
                    kvp => kvp.Value.Errors.Select(e => e.ErrorMessage).ToArray());

                return Json(new { success = false, validationErrors });
            }
        }
        public ActionResult Login1()
        {
            return PartialView();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult Login(string userName, string password)
        {
            if (ModelState.IsValid)
            {

                var count = db.NguoiDungs.Count(x => x.TenTaiKhoan == userName && x.MatKhau == password);
                if (count > 0)
                {
                    //Trong phương thức xác thực(trong controller hoặc nơi khác)
                    var roles = GetRolesForUser(userName); // Lấy danh sách vai trò cho người dùng
                    var identity = new GenericIdentity(userName);
                    var principal = new GenericPrincipal(identity, roles);
                    HttpContext.User = principal;
                    FormsAuthentication.SetAuthCookie(userName, false);

                    string query = (from nguoiDung in db.NguoiDungs
                                    join vaiTro in db.VaiTros on nguoiDung.IdVaiTro equals vaiTro.IdVaiTro
                                    where nguoiDung.TenTaiKhoan == userName && nguoiDung.MatKhau == password
                                    select vaiTro.TenVaiTro).FirstOrDefault().ToString();
                    if (roles.Contains("Khách hàng"))
                    {
                        return Json(new { success = true });
                    }
                    else
                    {
                        return Json(new { success = true, isInRoleAdmin = true, redirectUrl = Url.Action("DashBoard", "AdminHome", new { area = "Admin" }) });
                    }
                }
                else
                {
                    return Json(new { success = false, message = "Đăng nhập thất bại!" });

                }

            }
            else
            {
                var validationErrors = ModelState.ToDictionary(
                kvp => kvp.Key,
                kvp => kvp.Value.Errors.Select(e => e.ErrorMessage).ToArray());

                return Json(new { success = false, validationErrors });
            }
        }
        public JsonResult CheckAuthentication()
        {
            if (User.Identity.IsAuthenticated)
            { 
                return Json(new
                {
                    isAuthenticated = true
                }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(new
                {
                    isAuthenticated = false
                }, JsonRequestBehavior.AllowGet);
            }
        }

        public string[] GetRolesForUser(string userName)
        {
            var role = (from nguoiDung in db.NguoiDungs
                        join vaiTro in db.VaiTros on nguoiDung.IdVaiTro equals vaiTro.IdVaiTro
                        where nguoiDung.TenTaiKhoan == userName
                        select vaiTro.TenVaiTro).FirstOrDefault();
            return string.IsNullOrEmpty(role) ? new string[0] : new string[] { role };
        }
        public JsonResult KiemTraDangNhap()
        {
            return Json(new
            {
                status = HttpContext.User.Identity.IsAuthenticated
            });
        }

        public JsonResult Logout()
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            Session.Abandon();
            return Json(new { success = true, redirectUrl = "/" });
        }


    }
}