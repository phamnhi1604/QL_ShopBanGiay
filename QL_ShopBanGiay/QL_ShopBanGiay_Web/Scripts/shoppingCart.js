$(document).ready(function () {

    //Thêm sản phẩm vào giỏ hàng
    $(".product-cart").on("click", function (e) {
        e.preventDefault();

        var productId = $(this).data("product-id");

        $.ajax({
            url: "/ShoppingCart/Them",
            type: "POST",
            data: { idSanPham: productId },
            success: function (result) {
                if (result.status) {
                    location.reload();
                } else {
                    alert("Đã có lỗi xảy ra khi thêm sản phẩm vào giỏ hàng.");
                }
            },
            error: function () {
                alert("Đã có lỗi xảy ra khi thực hiện yêu cầu.");
            }
        });
    });

    //Xóa sản phẩm khỏi giỏ hàng
    $(".remove-cart").on("click", function (e) {
        e.preventDefault();

        var productId = $(this).data("product-id");

        $.ajax({
            url: "/ShoppingCart/Xoa",
            type: "POST",
            data: { idSanPham: productId },
            success: function (result) {
                if (result.status) {
                    location.reload();
                } else {
                    alert("Đã có lỗi xảy ra khi xóa sản phẩm khỏi giỏ hàng.");
                }
            },
            error: function () {
                alert("Đã có lỗi xảy ra khi thực hiện yêu cầu.");
            }
        });
    });

    //Cập nhật giỏ hàng
    $(".quantityInput").on("input", function () {
        var newQuantity = $(this).val();
        if (newQuantity == null || newQuantity == "") {
            return;
        }

        var productId = $(this).data("product-id");

        $.ajax({
            url: "/ShoppingCart/CapNhat",
            type: "POST",
            data: { idSanPham: productId, soLuong: newQuantity },
            success: function (result) {
                if (result.status) {
                    location.reload();
                } else {
                    alert("Đã có lỗi xảy ra khi cập nhật số lượng sản phẩm.");
                }
            },
            error: function () {
                alert("Đã có lỗi xảy ra khi thực hiện yêu cầu.");
            }
        });
    });

    // Xóa toàn bộ giỏ hàng
    $(".deleteAll").on("click", function (e) {
        e.preventDefault();

        $.ajax({
            url: "/ShoppingCart/XoaTatCa",
            type: "POST",
            dataType: "json",
            success: function (result) {
                if (result.status) {
                    location.reload();
                } else {
                    alert("Đã có lỗi xảy ra khi xóa toàn bộ giỏ hàng.");
                }
            },
            error: function () {
                alert("Đã có lỗi xảy ra khi thực hiện yêu cầu.");
            }
        });
    });


    //Kiểm trang đăng nhập trước khi thanh toán
    $("#checkout").on("click", function () {
        kiemTraDangNhap();
    });
    $("#cartbtn").on("click", function () {
        window.location.href = "/ShoppingCart/GioHang";
    });
    function kiemTraDangNhap() {
        $.ajax({
            url: "/Account/KiemTraDangNhap", // Đường dẫn tới hành động kiểm tra đăng nhập, thay thế bằng đường dẫn thực tế
            type: "POST",
            dataType: "json",
            success: function (result) {
                if (result.status) {
                    window.location.href = "/ShoppingCart/ThanhToan";
                } else {
                    alert("Bạn cần đăng nhập trước khi đặt hàng.");
                    $(".account").css("display", "flex");
                }

            },
            error: function () {
                alert("Đã có lỗi xảy ra khi kiểm tra đăng nhập.");
            }
        });
    }

    //Đóng mở form thanh toán
    $("#btn-checkout").on("click", function () {
        // Thêm lớp active
        $(".checkout-box").addClass("active");
    });
    $(".close-checkout-box-btn").on("click", function () {
        // Thêm lớp active
        $(".checkout-box").removeClass("active")
    });

    //Xác nhận đơn hàng
    $("#checkout-form").on("submit", function (e) {
        e.preventDefault(); 

        var formData = {
            soDienThoai: $("#phone-number").val(),
            diaChi: $("#delivery-address").val(),
            ptThanhToan: $("#mode-of-payment").val()
        };

        // Sử dụng Ajax để gửi yêu cầu đến máy chủ
        $.ajax({
            url: "/ShoppingCart/XacNhanThanhToan", // Đường dẫn xử lý yêu cầu, thay thế bằng đường dẫn thực tế
            type: "POST",
            data: formData,
            dataType: "json", 
            success: function (result) {
                
                if (result.status) {
                    alert("Thanh toán thành công!");
                    window.location.href = "/Home/Index";
                } else {
                    alert("Đã có lỗi xảy ra khi thanh toán.");
                }
            },
            error: function () {
                // Xử lý lỗi khi Ajax thất bại
                alert("Đã có lỗi xảy ra khi thực hiện yêu cầu.");
            }
        });
    });
});
