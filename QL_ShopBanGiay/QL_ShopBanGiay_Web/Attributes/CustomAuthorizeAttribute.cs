using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QL_ShopBanGiay_Web.Models;

namespace QL_ShopBanGiay_Web
{
    [AttributeUsage(AttributeTargets.Method | AttributeTargets.Class, Inherited = true, AllowMultiple = true)]
    public class CustomAuthorizeAttribute : AuthorizeAttribute
    {
        private readonly string[] _allowedRoles;
        private readonly string _redirectUrl; // Redirect URL for unauthorized access
        ShopBanGiayDataContext db = new ShopBanGiayDataContext();

        // Default Access Denied URL
        private const string DefaultRedirectUrl = "~/Home/AccessDenied";

        public CustomAuthorizeAttribute(params string[] allowedRoles)
        {
            _allowedRoles = allowedRoles;
            _redirectUrl = DefaultRedirectUrl;
        }

        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            if (httpContext == null)
                throw new ArgumentNullException(nameof(httpContext));

            string currentUserName = httpContext.User.Identity.Name;
            string roleName = GetRoleNameByUserName(currentUserName);

            return _allowedRoles.Any(role => roleName == role);
        }

        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            if (!filterContext.HttpContext.User.Identity.IsAuthenticated)
            {
                //base.HandleUnauthorizedRequest(filterContext);
                string redirectUrl = "/";
                filterContext.Result = new RedirectResult(redirectUrl);
            }
            else
            {
                // Redirect to the specified URL for unauthorized access
                filterContext.Result = new RedirectResult(_redirectUrl);
            }
        }

        private string GetRoleNameByUserName(string userName)
        {
            var query = from nguoiDung in db.NguoiDungs
                        join vaiTro in db.VaiTros on nguoiDung.IdVaiTro equals vaiTro.IdVaiTro
                        where nguoiDung.TenTaiKhoan == userName
                        select vaiTro.TenVaiTro;
            return query.FirstOrDefault();
        }
    }
}
