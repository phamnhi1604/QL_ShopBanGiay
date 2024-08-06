using QL_ShopBanGiay_Web.Models;
using QL_ShopBanGiay_Web.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
//using System.Web.Script.Serialization;

namespace QL_ShopBanGiay_Web.Controllers
{
    public class ShoppingCartController : Controller
    {
        ShopBanGiayDataContext db = new ShopBanGiayDataContext();
        string sessionCartName = "SessionCart";
        // GET: ShoppingCart
        public ActionResult GioHang()
        {
            List<ShoppingCartVM> lstGioHang = LayGioHang();
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongThanhTien = TongThanhTien();
            return View(lstGioHang);
        }
        public ActionResult GioHangPartial()
        {
            List<ShoppingCartVM> lstGioHang = LayGioHang();
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongThanhTien = TongThanhTien();
            return PartialView(lstGioHang);
        }
        public ActionResult SoLuongPartial()
        {
            ViewBag.TongSoLuong = TongSoLuong();
            return PartialView();
        }
        public List<ShoppingCartVM> LayGioHang()
        
        {
            List<ShoppingCartVM> lstGioHang = Session[sessionCartName] as List<ShoppingCartVM>;
            if (lstGioHang == null)
            {
                lstGioHang = new List<ShoppingCartVM>();
                Session[sessionCartName] = lstGioHang;
            }
            return lstGioHang;
        }
        private int TongSoLuong()
        {
            int tsl = 0;
            List<ShoppingCartVM> lstGioHang = Session[sessionCartName] as List<ShoppingCartVM>;
            if (lstGioHang != null)
            {
                tsl = lstGioHang.Sum(x => x.SoLuong);
            }
            return tsl;
        }
        private long? TongThanhTien()
        {
            long? ttt = 0;
            List<ShoppingCartVM> lstGioHang = Session[sessionCartName] as List<ShoppingCartVM>;
            if (lstGioHang != null)
            {
                ttt = lstGioHang.Sum(x => x.ThanhTien());
            }
            return ttt;
        }
        [HttpPost]
        public JsonResult Them(long idSanPham)
        {
            List<ShoppingCartVM> cartList = LayGioHang();
            if (cartList == null)
            {
                cartList = new List<ShoppingCartVM>();
            }
            if (cartList.Any(x=>x.IdSanPham==idSanPham))
            {
                foreach(var item in cartList)
                {
                    if(item.IdSanPham == idSanPham)
                    {
                        item.SoLuong += 1;
                    }    
                }
               
            }  
            else
            {
                ShoppingCartVM newItem = new ShoppingCartVM(idSanPham);
                cartList.Add(newItem);
            }
            Session[sessionCartName] = cartList;
            return Json(new
            {
                status = true
            }) ;
        }
        [HttpPost]
        public JsonResult Xoa(long idSanPham)
        {
            List<ShoppingCartVM> cartList = LayGioHang();
            ShoppingCartVM cartItem = cartList.Single(x => x.IdSanPham == idSanPham);
            cartList.RemoveAll(x => x.IdSanPham == idSanPham);
            Session[sessionCartName] = cartList;
            return Json(new
            {
                status = true
            });
        }
        [HttpPost]
        public JsonResult CapNhat(long idSanPham, int soLuong)
        {
            List<ShoppingCartVM> cartList = LayGioHang();
            ShoppingCartVM cartItem = cartList.Single(x => x.IdSanPham == idSanPham);
            if (cartItem != null)
            {
                cartItem.SoLuong = soLuong;
            }
            Session[sessionCartName] = cartList;
            return Json(new
            {
                status = true
            });
        }
        [HttpPost]
        public JsonResult XoaTatCa()
        {
            Session[sessionCartName] = new List<ShoppingCartVM>();
            return Json(new
            {
                status = true
            });
        }
        [CustomAuthorize("Khách hàng")]
        public ActionResult ThanhToan()
        {
            List<ShoppingCartVM> cartList = LayGioHang();
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongThanhTien = TongThanhTien();
            return View(cartList);
        }
        [HttpPost]
        [CustomAuthorize("Khách hàng")]
        public JsonResult XacNhanThanhToan(FormCollection f)
        {
            List<ShoppingCartVM> cartList = LayGioHang();
            string soDienThoai = f["soDienThoai"];
            string diaChi = f["diaChi"];
            string ptThanhToan = f["ptThanhToan"];
            if(cartList.Count > 0)
            {
                Models.DonHang dh = new Models.DonHang()
                {
                    IdKhachHang = GetIdKhByUsername(HttpContext.User.Identity.Name.ToString()),
                    SoDienThoai = soDienThoai,
                    DiaChiGiaoHang = diaChi,
                    PhuongThucThanhToan = ptThanhToan,
                    ThoiGianDatHang = DateTime.Now,
                    ThoiGianGiaoHangDuKien = DateTime.Now.AddDays(7),
                    TrangThaiDonHang = "Đang chờ xử lý",
                    TrangThaiThanhToan = "Đã thanh toán"
                };
                db.DonHangs.InsertOnSubmit(dh);
                db.SubmitChanges();

                long idDonHang = dh.IdDonHang;

                foreach(ShoppingCartVM vm in cartList)
                {
                    ChiTietDonHang ct = new ChiTietDonHang()
                    {
                        IdDonHang = idDonHang,
                        IdSanPham = vm.IdSanPham,
                        SoLuong = vm.SoLuong,
                        DonGia = double.Parse(vm.Gia.ToString()),
                    };
                    db.ChiTietDonHangs.InsertOnSubmit(ct);
                    db.SubmitChanges();
                }

            }
            Session[sessionCartName] = new List<ShoppingCartVM>();
            return Json(new
            {
                status = true
            });
        }

        public long GetIdKhByUsername(string userName)
        {
            var query = from khachHang in db.KhachHangs
                        join nguoiDung in db.NguoiDungs on khachHang.IdNguoiDung equals nguoiDung.IdNguoiDung
                        where nguoiDung.TenTaiKhoan == userName
                        select khachHang.IdKhachHang;
            return query.FirstOrDefault();
        }
    }
}