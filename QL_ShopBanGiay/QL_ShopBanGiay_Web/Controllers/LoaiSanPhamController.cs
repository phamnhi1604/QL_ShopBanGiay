using QL_ShopBanGiay_Web.Models;
using QL_ShopBanGiay_Web.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.Mvc;

namespace QL_ShopBanGiay_Web.Controllers
{
    public class LoaiSanPhamController : Controller
    {
        ShopBanGiayDataContext db = new ShopBanGiayDataContext();
        // GET: LoaiSanPham
        public ActionResult LoaiSanPhamPartial()
        {
            var lspChaList = db.LoaiSanPhamChas.ToList();


            foreach (var item in lspChaList)
            {
                ViewData[item.IdLoaiSPCha.ToString()] = GetLoaiSpByIdLoaiSpCha(item.IdLoaiSPCha);
            }
            return PartialView(lspChaList);
        }
        public List<LoaiSanPham> GetLoaiSpByIdLoaiSpCha(int idLoaiCha)
        {
            var query = from l in db.LoaiSanPhams
                        where l.IdLoaiSPCha == idLoaiCha
                        select l;
            return query.ToList();
        }
    }
}