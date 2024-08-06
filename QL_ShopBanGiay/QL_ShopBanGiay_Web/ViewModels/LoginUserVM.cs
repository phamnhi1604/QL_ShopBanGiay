using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace QL_ShopBanGiay_Web.ViewModels
{
    public class LoginUserVM
    {
        [Key]
        [Required(ErrorMessage = "Tên tài khoản không thể để trống")]
        [StringLength(255, MinimumLength = 5, ErrorMessage = "Tên tài khoản phải từ 5 ký tự")]
        [RegularExpression(@"^([a-zA-Z0-9]+)$", ErrorMessage = "Tên tài khoản không hợp lệ")]
        public string Username { get; set; }


        [Required(ErrorMessage = "Vui lòng nhập mật khẩu")]
        [StringLength(255, MinimumLength = 6, ErrorMessage = "Mật khẩu phải lớn hơn 5 ký tự")]
        [RegularExpression(@"^[a-zA-Z0-9!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]+$", ErrorMessage = "Mật khẩu không hợp lệ")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [System.ComponentModel.DataAnnotations.Compare("Password", ErrorMessage = "Mật khẩu xác nhận không khớp")]

        [DataType(DataType.Password)]
        public string ConfirmPassword { get; set; }



    }
}
