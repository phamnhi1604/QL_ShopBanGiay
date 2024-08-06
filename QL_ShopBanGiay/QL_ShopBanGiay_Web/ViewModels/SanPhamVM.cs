using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using QL_ShopBanGiay_Web.Models; 

namespace QL_ShopBanGiay_Web.ViewModels
{
    public class SanPhamVM
    {
        public SanPham SanPham { get; set; }
        public long? Gia { get; set; }
        public SanPhamVM() { }
    }
}