using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QL_ShopBanGiay_Web.Models;
using QL_ShopBanGiay_Web.ViewModels;

namespace QL_ShopBanGiay_Web.Controllers
{
    public class HomeController : Controller
    {
        ShopBanGiayDataContext db = new ShopBanGiayDataContext();
        public ActionResult Index()
        {
            List<string> tenLoaiSPChaList = db.LoaiSanPhamChas.Select(lspc => lspc.TenLoaiSPCha).ToList();

            foreach (var tenLoaiSPCha in tenLoaiSPChaList)
            {
                ViewData[tenLoaiSPCha] = GetSanPhamPartial(tenLoaiSPCha);
            }
            return View(tenLoaiSPChaList);

        }

        public ActionResult AccessDenied()
        {
            return View();
        }
        public List<SanPhamVM> GetSanPhamPartial(string tenLoaiCha)
        {
            var query = (from sanPham in db.SanPhams
                         join loaiSanPham in db.LoaiSanPhams on sanPham.IdLoaiSP equals loaiSanPham.IdLoaiSP
                         join loaiSanPhamCha in db.LoaiSanPhamChas on loaiSanPham.IdLoaiSPCha equals loaiSanPhamCha.IdLoaiSPCha
                         where loaiSanPhamCha.TenLoaiSPCha == tenLoaiCha
                         orderby sanPham.IdSanPham descending
                         select new SanPhamVM
                         {
                             SanPham = sanPham,
                             //Gia = db.func_GiaSanPham(sanPham.IdSanPham)
                             Gia = db.func_GiaSanPham(sanPham.IdSanPham)
                         }).Take(4);

            return query.ToList();
        }
    }
}