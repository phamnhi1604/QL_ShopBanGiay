$(document).ready(function () {
    //nhan dien giong noi
    function toggleSpeechRecognition() {
        if (!isRecognizing) {
            // Bắt đầu nhận dạng giọng nói
            startSpeechRecognition();
        } else {
            // Kết thúc nhận dạng giọng nói
            stopSpeechRecognition();
        }
    }
    $('#start-recognition').on('click', function () {
        startSpeechRecognition();
    });
    function startSpeechRecognition() {
        if ('SpeechRecognition' in window || 'webkitSpeechRecognition' in window) {
            const searchBox = document.getElementById('search-box');
            const recognition = new (window.SpeechRecognition || window.webkitSpeechRecognition)();
            recognition.lang = 'vi-VN';
            recognition.onresult = function (event) {
                const transcript = event.results[0][0].transcript;
                // Gửi dữ liệu về server
                searchBox.value = transcript;
            };

            recognition.start();

            isRecognizing = true;
        } else {
            alert('Trình duyệt của bạn không hỗ trợ chuyển đổi giọng nói thành văn bản.');
        }
    }

    function stopSpeechRecognition() {
        recognition.stop();
        isRecognizing = false;
    }

    document.querySelector('#start-recognition').addEventListener('click', toggleSpeechRecognition);

    //change image
    window.changeImage = function (imageUrl) {
        console.log(imageUrl)
        var productImage = document.querySelector("#product-image");
        productImage.src = imageUrl;
    };

    //Change tap
    $("#tab-1").show();
    $(".tab-link[data-tab='tab-1']").addClass("current");

    $(".tab-link").click(function () {
        var tabId = $(this).attr("data-tab");

        $(".tab-content").hide();
        $(".tab-link").removeClass("current");

        $("#" + tabId).show();
        $(this).addClass("current");
    });

    //Login form
    $.validator.unobtrusive.parse("#loginForm");

    $('#btnLoginSubmit').on('click', function () {
        var formData = $('#loginForm').serialize();
        console.log('hello');
        $.ajax({
            url: '/Account/Login',
            type: 'POST',
            data: formData,

            success: function (result) {
                if (result.success) {
                    if (result.isInRoleAdmin) {
                        alert('Chào mừng tới trang quản lý hệ thống');
                        window.location.href = result.redirectUrl;
                    } else {
                        alert('Đăng nhập thành công');
                        window.location.href = "../Home/Index"
                    }
                } else {
                    alert(result.message);
                    if (result.validationErrors) {
                        $.each(result.validationErrors, function (key, value) {
                            var errorElement = $('[name="' + key + '"]').next('.field-validation-valid');
                            errorElement.text(value);
                        });
                    }
                }
            },
            error: function () {
                alert('An error occurred during login.');
            }
        });
    });



    $.validator.unobtrusive.parse("#registerForm");

    $('#btnRegisterSubmit').on('click', function () {
        var formData = $('#registerForm').serialize();
        $.ajax({
            url: '/Account/Register',
            type: 'POST',
            data: formData,

            success: function (result) {
                if (result.success) {
                    alert('Đăng ký thành công. Vui lòng đăng nhập');
                    //window.location.reload();
                    window.location.href = '/account/login1';
                } else {
                    // Handle failure
                    alert(result.message);

                    if (result.validationErrors) {
                        $.each(result.validationErrors, function (key, value) {
                            var errorElement = $('[name="' + key + '"]').next('.field-validation-valid');
                            errorElement.text(value);
                        });
                    }
                }
            },
            error: function () {
                alert('An error occurred during registration.');
            }
        });
    });


    $('#user-btn').on('click', function () {

        $.ajax({
            url: '/Account/CheckAuthentication',
            type: 'GET',
            dataType: 'json',
            success: function (result) { 
                if (result.isAuthenticated) {
                    if (result.isInRoleAdmin) {
                        window.location.href = result.redirectUrl;
                    } else {
                        $('.user-box').css('display', 'unset');
                    }
                } else {
                    window.location.href = "/Account/Login1";
                }
            },
            error: function () {
                console.log('Error checking authentication status.');
            }
        });        if ($('.user-box').css('display', 'unset')) {
            $('.user-box').css('display', 'none');
        }
    });
    //close account form
    $('.close-btn').on('click', function () {
        $('.account').css('display','none')
    });
    $('#logoutButton').on('click', function () {
        $.ajax({
            url: '/Account/Logout',
            type: 'POST',
            dataType: 'json',
            success: function (result) {
                if (result.success) {
                    alert('Đăng xuất thành công');
                    window.location.href = result.redirectUrl;
                } else {
                    alert('Đăng xuất thất bại');
                }
            },
            error: function () {
                alert('An error occurred during logout.');
            }
        });
    });


});