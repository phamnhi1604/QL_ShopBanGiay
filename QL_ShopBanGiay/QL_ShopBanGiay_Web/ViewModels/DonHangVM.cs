using QL_ShopBanGiay_Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QL_ShopBanGiay_Web.ViewModels
{
    public class DonHangVM
    {
        public DonHang DonHang { get; set; }
        public long? TongTien { get; set; }
        public List<ChiTietDonHang> ListChiTietDonHang { get; set; }
    }
}