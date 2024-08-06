using QL_ShopBanGiay_Web.Models;
using QL_ShopBanGiay_Web.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.Mvc;

namespace QL_ShopBanGiay_Web.Controllers
{
    public class SanPhamController : Controller
    {
        ShopBanGiayDataContext db = new ShopBanGiayDataContext();

        public ActionResult SanPham()
        {
            return View();
        }
        public ActionResult SanPhamNoiBat(int page = 1)
        {

            var query = from sanPham in db.SanPhams
                        orderby sanPham.SoLuongDanhGia descending
                        select new SanPhamVM
                        {
                            SanPham = sanPham,
                            Gia = db.func_GiaSanPham(sanPham.IdSanPham)
                        };

            // Paging
            int NoOfRecordPerPage = 12;
            int NoOfPages = (int)Math.Ceiling((double)query.Count() / NoOfRecordPerPage);
            int NoOfRecordToSkip = (page - 1) * NoOfRecordPerPage;
            ViewBag.Page = page;
            ViewBag.NoOfPages = NoOfPages;
            query = query.Skip(NoOfRecordToSkip).Take(NoOfRecordPerPage);
            return View(query);
        }
        public ActionResult SearchSanPhamByName(string searchValue, int page = 1)
        {
            if(searchValue == null)
            {
                return HttpNotFound();
            }
            else
            {
                var query = from sanPham in db.SanPhams
                            where sanPham.TenSanPham.Contains(searchValue)
                            select new SanPhamVM
                            {
                                SanPham = sanPham,
                                Gia = db.func_GiaSanPham(sanPham.IdSanPham)
                            };
                // Paging
                int NoOfRecordPerPage = 12;
                int NoOfPages = (int)Math.Ceiling((double)query.Count() / NoOfRecordPerPage);
                int NoOfRecordToSkip = (page - 1) * NoOfRecordPerPage;
                ViewBag.SearchValue = searchValue;
                ViewBag.Page = page;
                ViewBag.NoOfPages = NoOfPages;
                query = query.Skip(NoOfRecordToSkip).Take(NoOfRecordPerPage);
                return View(query);
            }
        }
        public ActionResult GetSanPhamById(int? id)
        {
            if (id == 0 || id == null)
            {
                return RedirectToAction("Index", "Home");
            }
            var query = from sanPham in db.SanPhams
                        where sanPham.IdSanPham == id
                        select new SanPhamVM
                        {
                            SanPham = sanPham,
                            Gia = db.func_GiaSanPham(sanPham.IdSanPham)
                        };
            List<string> query2 = (from sanPham in db.SanPhams
                                   join loaiSanPham in db.LoaiSanPhams on sanPham.IdLoaiSP equals loaiSanPham.IdLoaiSP
                                   join loaiSanPhamCha in db.LoaiSanPhamChas on loaiSanPham.IdLoaiSPCha equals loaiSanPhamCha.IdLoaiSPCha
                                   where sanPham.IdSanPham == id
                                   select loaiSanPhamCha.TenLoaiSPCha).ToList();

            ViewData["SimilarProduct"] = GetDsSanPhamByLoaiSpCha(query2[0]);
            return View(query);
        }
        public ActionResult GetDsSanPhamByTenLoaiSpCha(string tenLoaiSpCha, int page = 1)
        {
            if (tenLoaiSpCha == null)
            {
                return HttpNotFound();
            }    
            else
            {
                var query = (from sanPham in db.SanPhams
                             join loaiSanPham in db.LoaiSanPhams on sanPham.IdLoaiSP equals loaiSanPham.IdLoaiSP
                             join loaiSanPhamCha in db.LoaiSanPhamChas on loaiSanPham.IdLoaiSPCha equals loaiSanPhamCha.IdLoaiSPCha
                             where loaiSanPhamCha.TenLoaiSPCha == tenLoaiSpCha
                             orderby sanPham.IdSanPham descending
                             select new SanPhamVM
                             {
                                 SanPham = sanPham,
                                 Gia = db.func_GiaSanPham(sanPham.IdSanPham)
                             });
                @ViewBag.TenLoaiSpCha = tenLoaiSpCha;
                int NoOfRecordPerPage = 12;
                int NoOfPages = (int)Math.Ceiling((double)query.Count() / NoOfRecordPerPage);
                int NoOfRecordToSkip = (page - 1) * NoOfRecordPerPage;
                ViewBag.Page = page;
                ViewBag.NoOfPages = NoOfPages;
                query = query.Skip(NoOfRecordToSkip).Take(NoOfRecordPerPage);
                return View(query);
            }    
        }
        public List<SanPhamVM> GetDsSanPhamByLoaiSpCha(string tenLoaiCha)
        {
            var query = (from sanPham in db.SanPhams
                         join loaiSanPham in db.LoaiSanPhams on sanPham.IdLoaiSP equals loaiSanPham.IdLoaiSP
                         join loaiSanPhamCha in db.LoaiSanPhamChas on loaiSanPham.IdLoaiSPCha equals loaiSanPhamCha.IdLoaiSPCha
                         where loaiSanPhamCha.TenLoaiSPCha == tenLoaiCha
                         orderby sanPham.IdSanPham descending
                         select new SanPhamVM
                         {
                             SanPham = sanPham,
                             Gia = db.func_GiaSanPham(sanPham.IdSanPham)
                         });

            return query.ToList();
        }
        public ActionResult GetDsSanPhamByLoaiSp(string tenLoaiSp, int page = 1)
        {
            if (tenLoaiSp == null)
            {
                return HttpNotFound();
            }    
            else
            {
                var query = (from sanPham in db.SanPhams
                             join loaiSanPham in db.LoaiSanPhams on sanPham.IdLoaiSP equals loaiSanPham.IdLoaiSP
                             where loaiSanPham.TenLoaiSP == tenLoaiSp
                             orderby sanPham.IdSanPham descending
                             select new SanPhamVM
                             {
                                 SanPham = sanPham,
                                 Gia = db.func_GiaSanPham(sanPham.IdSanPham)
                             });
                @ViewBag.TenLoaiSp = tenLoaiSp;
                int NoOfRecordPerPage = 12;
                int NoOfPages = (int)Math.Ceiling((double)query.Count() / NoOfRecordPerPage);
                int NoOfRecordToSkip = (page - 1) * NoOfRecordPerPage;
                ViewBag.Page = page;
                ViewBag.NoOfPages = NoOfPages;
                query = query.Skip(NoOfRecordToSkip).Take(NoOfRecordPerPage);
                return View(query);
            }    
        }
    }
}