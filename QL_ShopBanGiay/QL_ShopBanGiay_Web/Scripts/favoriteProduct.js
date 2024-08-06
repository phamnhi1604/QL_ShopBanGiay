$(document).ready(function () {

    //Thêm sản phẩm vào giỏ hàng
    $(".favorites-product").on("click", function (e) {
        e.preventDefault();

        var productId = $(this).data("product-id");

        $.ajax({
            url: "/FavoriteProduct/Add",
            type: "POST",
            data: { idSanPham: productId },
            success: function (result) {
                if (result.status) {
                    location.reload();
                    alert(result.message);
                } else {
                    alert(result.message);
                }
            },
            error: function () {
                alert("Đã có lỗi xảy ra khi thực hiện yêu cầu.");
            }
        });
    });


    //Xóa sản phẩm khỏi giỏ hàng
    $(".remove-favorite").on("click", function (e) {
        e.preventDefault();

        var productId = $(this).data("product-id");

        $.ajax({
            url: "/FavoriteProduct/Delete",
            type: "POST",
            data: { idSanPham: productId },
            success: function (result) {
                if (result.status) {
                    location.reload();
                } else {
                    alert("Đã có lỗi xảy ra khi xóa sản phẩm yêu thích.");
                }
            },
            error: function () {
                alert("Đã có lỗi xảy ra khi thực hiện yêu cầu.");
            }
        });
    });
});