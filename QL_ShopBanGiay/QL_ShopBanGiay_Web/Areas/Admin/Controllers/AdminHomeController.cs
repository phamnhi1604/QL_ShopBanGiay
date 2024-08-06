using QL_ShopBanGiay_Web.Models;
using QL_ShopBanGiay_Web.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.Mvc;

namespace QL_ShopBanGiay_Web.Areas.Admin.Controllers
{
    public class AdminHomeController : Controller
    {
        ShopBanGiayDataContext db = new ShopBanGiayDataContext();
        //GET: Admin/AdminHome
        [CustomAuthorize("Admin", "Quản lý", "Nhân viên")]

        public ActionResult DashBoard()
        {
            return View();
        }
    }
}