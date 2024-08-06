USE master
GO

CREATE DATABASE QL_ShopBanGiay
GO
USE QL_ShopBanGiay

GO
--------------------------------------
CREATE TABLE VaiTro (
    IdVaiTro INT IDENTITY(1,1),
    TenVaiTro NVARCHAR(255) NOT NULL,
    CONSTRAINT PK_VaiTro PRIMARY KEY (IdVaiTro),
    CONSTRAINT UNI_TenVaiTro UNIQUE(TenVaiTro)
);
GO
INSERT INTO VaiTro VALUES (N'Admin');
INSERT INTO VaiTro VALUES (N'Quản lý');
INSERT INTO VaiTro VALUES (N'Nhân viên');
INSERT INTO VaiTro VALUES (N'Khách hàng');

SELECT * FROM VaiTro

--====================================================================================================---
CREATE TABLE NguoiDung 
(
    IdNguoiDung BIGINT IDENTITY(1,1),
    TenTaiKhoan VARCHAR(255) NOT NULL,
    MatKhau VARCHAR(255) NOT NULL,
    IdVaiTro INT NOT NULL,
	TonTai BIT NOT NULL,
	Cam BIT NOT NULL
    CONSTRAINT UNI_TenTaiKhoan UNIQUE(TenTaiKhoan),
    CONSTRAINT PK_NguoiDung PRIMARY KEY (IdNguoiDung),
	CONSTRAINT FK_NguoiDung_VaiTro FOREIGN KEY(IdVaiTro) REFERENCES VaiTro(IdVaiTro)
);


INSERT INTO NguoiDung VALUES ('admin','admin@123',1, 1, 0)
INSERT INTO NguoiDung VALUES ('quanly1','123123123',2, 1, 0)
INSERT INTO NguoiDung VALUES ('quanly2','123123123',2, 1 , 0)
INSERT INTO NguoiDung VALUES ('nhanvien1','123123123',3, 1, 0)
INSERT INTO NguoiDung VALUES ('nhanvienkho1','123123123',3, 1, 0)
INSERT INTO NguoiDung VALUES ('nhanvienkho2','123123123',3, 1, 0)
INSERT INTO NguoiDung VALUES ('customer1','123123123',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer2','123123123',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer3','thaian45',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer4','bichthuy14',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer5','myhuyen15',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer6','nhile21',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer7','thunguyen25',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer8','thaipham05',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer9','123123123',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer10','lanle31',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer11','minhhieu17',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer12','ductran35',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer13','mainguyen15',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer14','thule21',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer15','vanhai16',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer16','trannhung21',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer17','hungle45',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer18','thitrinh21',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer19','vanthanh15',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer20','quynhtran31',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer21','loinguye35',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer22','thingoc25',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer23','namtran21',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer24','hongnguyen31',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer25','vanphuc1502',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer26','kimnguyen3010',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer27','thihuong15',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer28','tranphuong27',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer29','haiyen1506',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer30','thilinh12',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer31','thuydung0206',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer32','thanhhang31',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer33','nguyenha12',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer34','loantran17',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer35','phamngoc25',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer36','thaovy20',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer37','hongnhung01',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer38','thutrang24',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer39','dieulinh06',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer40','thanhtruc12',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer41','lananh10',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer42','bichngoc18',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer43','thanhhuong31',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer44','hoaithu35',4, 1, 0)
INSERT INTO NguoiDung VALUES ('customer45','mylinh07',4, 1, 0)
SELECT * FROM NguoiDung


--====================================================================================================---


CREATE TABLE KhachHang
(
	IdKhachHang  BIGINT IDENTITY(1,1),
	IdNguoiDung BIGINT NOT NULL,
	TenKhachHang NVARCHAR(255) NOT NULL,
	NgaySinh DATE,
	GioiTinh NCHAR(5),
	DiaChi NVARCHAR(255),
	SoDienThoai CHAR(10),
	Email VARCHAR(100),
	CONSTRAINT PK_KhachHang PRIMARY KEY(IdKhachHang),
	CONSTRAINT UNI_IdNguoiDung_KhachHang UNIQUE(IdNguoiDung),
	CONSTRAINT UNI_SoDienThoai_KhachHang UNIQUE(SoDienThoai),
	CONSTRAINT UNI_Email_KhachHang UNIQUE(Email),
	CONSTRAINT FK_KhachHang_NguoiDung FOREIGN KEY(IdNguoiDung) REFERENCES NguoiDung(IdNguoiDung),
	
);
ALTER TABLE KhachHang
ADD CONSTRAINT DF_DiaChi_KhachHang DEFAULT N'Không xác định' FOR DiaChi;

SET DATEFORMAT DMY
INSERT INTO KhachHang VALUES (7,N'Vũ Văn Anh','13/02/2003',N'Nam',N'Số 351A Hùng Vương, Phường An Sơn, Tam Kỳ, Quảng Nam, Việt Nam','0393123123','nhatthienhuonglogistics@gmail.com')
INSERT INTO KhachHang VALUES (8,N'Trần Thái An','13/04/2003',N'Nam',N'Ấp 6A, Tam Bình, Vĩnh Long, Việt Nam','0393755621','thienhuonglogistics@gmail.com')
INSERT INTO KhachHang VALUES (9,N'Lê Bích Thủy','13/05/2003',N'Nữ',N'Hoà Tân, Châu Thành, Đồng Tháp, Việt Nam','0979598491','customer3@gmail.com')
INSERT INTO KhachHang VALUES (10,N'Trần Mỹ Huyền','13/06/2003',N'Nữ',N'Mỹ Hoà, Thành phố Long Xuyên, An Giang, Việt Nam','0979598492','vantaiduongviet@gmail.com')
INSERT INTO KhachHang VALUES (11,N'Lê Ly Trang Nhi','13/07/2003',N'Nữ',N'ĐT745, Uyên Hưng, Tân Uyên, Bình Dương, Việt Nam','0393888888','taynambacsg@gmail.com')
INSERT INTO KhachHang VALUES (12,N'Nguyễn Thị Thu','13/08/2003',N'Nữ',N'26B Đường Võ Văn Tần, Phú Chánh, Tân Uyên, Bình Dương, Việt Nam','0393888889','vantaivohongphat@gmail.com')
INSERT INTO KhachHang VALUES (13,N'Phạm Hồng Thái','13/09/2003',N'Nam',N'Ấp Xóm Đồng, xã Thanh Phước, huyện Gò Dầu, Tây Ninh, Việt Nam','0393123457','customer7@gmail.com')
INSERT INTO KhachHang VALUES (14,N'Nguyễn Văn Tú','13/10/2003',N'Nam',N'19 Hai Bà Trưng, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh','0393123458','customer8@gmail.com')
INSERT INTO KhachHang VALUES (15,N'Lê Thị Lan','13/11/2003',N'Nữ',N'20 Hai Bà Trưng, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh','0393123459','customer9@gmail.com')
INSERT INTO KhachHang VALUES (16,N'Nguyễn Minh Hiếu','13/12/2003',N'Nam',N'98 Ng. Tất Tố,Phường 19, Bình Thạnh, Thành phố Hồ Chí Minh','0393123460','customer10@gmail.com')
INSERT INTO KhachHang VALUES (17,N'Trần Văn Đức','11/02/2003',N'Nam',N'21 Hai Bà Trưng, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh','0393123461','customer11@gmail.com')
INSERT INTO KhachHang VALUES (18,N'Nguyễn Thị Mai','12/02/2003',N'Nữ',N'317 Quang Trung, Trần Hưng Đạo, Quảng Ngãi, Việt Nam','0393123462','customer12@gmail.com')
INSERT INTO KhachHang VALUES (19,N'Lê Thị Thu','14/02/2003',N'Nữ',N'Thị trấn, Phong Nha, Sơn Trạch, Quảng Bình, Việt Nam','0393123463','customer13@gmail.com')
INSERT INTO KhachHang VALUES (20,N'Phạm Văn Hải','15/02/2003',N'Nam',N'118A Hữu Nghị, Nam Lý, Đồng Hới, Quảng Bình, Việt Nam','0393123464','customer14@gmail.com')
INSERT INTO KhachHang VALUES (21,N'Trần Thị Nhung','16/02/2003',N'Nữ',N'Tịnh Châu, Sơn Tịnh, Quảng Ngãi, Việt Nam','0393123465','customer15@gmail.com')
INSERT INTO KhachHang VALUES (22,N'Lê Văn Hưng','17/02/2003',N'Nam',N'1026 Phạm Văn Đồng, Hiệp Bình Chánh, Thủ Đức, Thành phố Hồ Chí Minh','0393123466','customer16@gmail.com')
INSERT INTO KhachHang VALUES (23,N'Nguyễn Thị Trinh','18/02/2003',N'Nữ',N'14 Hai Bà Trưng, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh','0393123467','customer17@gmail.com')
INSERT INTO KhachHang VALUES (24,N'Phạm Văn Thanh','19/02/2003',N'Nam',N'Bàu Đưng, thôn Thuận Vinh, xã Thuận Đức Cuối đường, Nguyễn Kim Chi, Đồng Hới, Quảng Bình, Việt Nam','0393123468','customer18@gmail.com')
INSERT INTO KhachHang VALUES (25,N'Trần Thị Quỳnh','20/02/2003',N'Nữ',N'16 Hai Bà Trưng, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh','0393123469','customer19@gmail.com')
INSERT INTO KhachHang VALUES (26,N'Nguyễn Văn Lợi','21/02/2003',N'Nam',N'27 Lý Thường Kiệt, Phường 7, Quận 11, Thành phố Hồ Chí Minh','0393123470','customer20@gmail.com')
INSERT INTO KhachHang VALUES (27,N'Phạm Thị Ngọc','22/02/2003',N'Nam',N'QL24B, Tịnh Sơn, Sơn Tịnh, Quảng Ngãi, Việt Nam','0393123471','customer21@gmail.com')
INSERT INTO KhachHang VALUES (28,N'Trần Văn Nam','23/02/2003',N'Nam',N'777 Hai Bà Trưng, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh','0393123472','customer22@gmail.com')
INSERT INTO KhachHang VALUES (29,N'Nguyễn Thị Hồng','24/02/2003',N'Nữ',N'664 Hai Bà Trưng, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh','0393123473','customer23@gmail.com')
INSERT INTO KhachHang VALUES (30,N'Lê Văn Phúc','25/02/2003',N'Nam',N'Vinh Thanh, Phú Vang, Thừa Thiên Huế, Việt Nam','0393123474','customer24@gmail.com')
INSERT INTO KhachHang VALUES (31,N'Nguyễn Thị Kim','26/02/2003',N'Nữ',N'Phú Thứ, Thủy Lương, Phú Vang, Thừa Thiên Huế, Việt Nam','0393123475','customer25@gmail.com')
INSERT INTO KhachHang VALUES (32,N'Nguyễn Thị Hương','27/02/2003',N'Nữ',N'85 Duy Tân, An Phú, Tam Kỳ, Quảng Nam, Việt Nam','0393123476','customer26@gmail.com')
INSERT INTO KhachHang VALUES (33,N'Trần Thị Phương','28/03/2003',N'Nữ',N'6-8 Trần Thánh Tông, Phường Tân Thạnh, Tam Kỳ, Quảng Nam, Việt Nam','0393123477','customer27@gmail.com')
INSERT INTO KhachHang VALUES (34,N'Lê Thị Hải Yến','04/03/2003',N'Nữ',N'81 Huyền Trân Công Chúa, Hoà Hải, Ngũ Hành Sơn, Đà Nẵng, Việt Nam','0393123478','customer28@gmail.com')
INSERT INTO KhachHang VALUES (35,N'Phạm Thị Trang','22/05/2003',N'Nữ',N'K3/12 Hà Thị Thân, An Hải Tây, Sơn Trà, Đà Nẵng, Việt Nam','0393123479','customer29@gmail.com')
INSERT INTO KhachHang VALUES (36,N'Nguyễn Thị Linh','23/06/2003',N'Nữ',N'270 Võ Nguyên Giáp, Bắc Mỹ Phú, Ngũ Hành Sơn, Đà Nẵng, Việt Nam','0393123480','customer30@gmail.com')
INSERT INTO KhachHang VALUES (37,N'Trần Thị Thuỳ Dung','03/07/2003',N'Nữ',N'Lô e, Đường số 7, khu công nghiệp, Liên Chiểu, Đà Nẵng, Việt Nam','0393123481','customer31@gmail.com')
INSERT INTO KhachHang VALUES (38,N'Lê Thị Thanh Hằng','13/01/2003',N'Nữ',N'89 Hai Bà Trưng, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh','0393123482','customer32@gmail.com')
INSERT INTO KhachHang VALUES (39,N'Nguyễn Thị Hà','13/02/2002',N'Nữ',N'50 Hai Bà Trưng, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh','0393123483','customer33@gmail.com')
INSERT INTO KhachHang VALUES (40,N'Trần Thị Hồng Loan','13/01/2001',N'Nữ',N'43 Nguyễn Chí Thanh, Ba Đình, Thủ đô Hà Nội','0393123484','customer34@gmail.com')
INSERT INTO KhachHang VALUES (41,N'Phạm Thị Ánh Ngọc','13/02/2007',N'Nữ',N'27 Nguyễn Thái Sơn, Phường 7, Quận Gò Vấp, Thành phố Hồ Chí Minh','0393123485','customer35@gmail.com')
INSERT INTO KhachHang VALUES (42,N'Nguyễn Thị Thảo Vy','13/02/2000',N'Nữ',N'20 Đ. Trường Sa, Phường 17, Bình Thạnh, Thành phố Hồ Chí Minh','0393123486','customer36@gmail.com')
INSERT INTO KhachHang VALUES (43,N'Trần Thị Hồng Nhung','13/02/1999',N'Nữ',N'100 Ng. Tất Tố,Phường 19, Bình Thạnh,Thành phố Hồ Chí Minh','0393123487','customer37@gmail.com')
INSERT INTO KhachHang VALUES (44,N'Trần Thị Thu Trang','13/02/1993',N'Nữ',N'1210 Đ. Trường Sa, Phường 17, Bình Thạnh, Thành phố Hồ Chí Minh','0393123488','customer38@gmail.com')
INSERT INTO KhachHang VALUES (45,N'Nguyễn Thị Diệu Linh','13/02/1999',N'Nữ',N'10 Đ. Trường Sa, Phường 17, Bình Thạnh, Thành phố Hồ Chí Minh','0393123489','customer39@gmail.com')
INSERT INTO KhachHang VALUES (46,N'Lê Thị Thanh Trúc','13/02/1998',N'Nữ',N'30 Lý Thường Kiệt, Phường 7, Quận 11, Thành phố Hồ Chí Minh','0393123490','customer40@gmail.com')
INSERT INTO KhachHang VALUES (47,N'Phạm Thị Lan Anh','13/02/1968',N'Nữ',N'106 Phạm Văn Đồng, Hiệp Bình Chánh, Thủ Đức, Thành phố Hồ Chí Minh','0393123491','customer41@gmail.com')
INSERT INTO KhachHang VALUES (48,N'Trần Thị Bích Ngọc','13/02/1978',N'Nữ',N'98 Ng. Tất Tố,Phường 19, Bình Thạnh, Thành phố Hồ Chí Minh','0393123492','customer42@gmail.com')
INSERT INTO KhachHang VALUES (49,N'Nguyễn Thị Thanh Hương','13/02/1989',N'Nữ',N'1026 Phạm Văn Đồng, Hiệp Bình Chánh, Thủ Đức,','0393123493','customer43@gmail.com')
INSERT INTO KhachHang VALUES (50,N'Lê Thị Hoài Thu','13/02/1982',N'Nữ',N'27 Lý Thường Kiệt, Phường 7, Quận 11, Thành phố Hồ Chí Minh','0393163493','customer44@gmail.com')
INSERT INTO KhachHang VALUES (51,N'Phạm Thị Mỹ Linh','13/02/1991',N'Nữ',N'8 Đ. Trường Sa, Phường 17, Bình Thạnh, Thành phố Hồ Chí Minh','0393123494','customer45@gmail.com')
SELECT *FROM KhachHang


--====================================================================================================---
CREATE TABLE NhanVien
(
	IdNhanVien  BIGINT IDENTITY(1,1),
	IdNguoiDung BIGINT NOT NULL,
	TenNhanVien NVARCHAR(255) NOT NULL,
	NgaySinh DATE,
	GioiTinh NCHAR(5),
	DiaChi NVARCHAR(255),
	SoDienThoai CHAR(10),
	Email VARCHAR(100),
	CONSTRAINT PK_NhanVien PRIMARY KEY(IdNhanVien),
	CONSTRAINT UNI_IdNguoiDung_NhanVien UNIQUE(IdNguoiDung),
	CONSTRAINT UNI_SoDienThoai_NhanVien UNIQUE(SoDienThoai),
	CONSTRAINT UNI_Email_NhanVien UNIQUE(Email),
	CONSTRAINT FK_NhanVien_NguoiDung FOREIGN KEY(IdNguoiDung) REFERENCES NguoiDung(IdNguoiDung)
);
ALTER TABLE NhanVien
ADD CONSTRAINT DF_DiaChi_NhanVien DEFAULT N'Không xác định' FOR DiaChi;

SET DATEFORMAT DMY
INSERT INTO NhanVien VALUES (1,N'Vũ Văn Anh','13/02/2003',N'Nam',N'Tây Thạnh, Tân Phú, Thành phố Hồ Chí Minh','0393222222','fashionshop@gmail.com')
INSERT INTO NhanVien VALUES (2,N'Hà Tri Thủy','17/01/2003',N'Nam',N'Tân Sơn Nhì, Tân Phú, Thành phố Hồ Chí Minh','0393222','hatrithuy@gmail.com')
INSERT INTO NhanVien VALUES (3,N'Huỳnh Tuấn Khang','07/04/2003',N'Nam',N'Phường 7, Quận 5, Thành phố Hồ Chí Minh, Việt Nam','0393555222','khanghuynh@gmail.com')
INSERT INTO NhanVien VALUES (4,N'Đinh Tuyết Anh','20/11/1990',N'Nữ',N'212-242 Đ. Độc Lập, Tân Thành, Tân Phú, Thành phố Hồ Chí Minh, Việt Nam','0393666222','tuyeanhdinh20@gmail.com')
INSERT INTO NhanVien VALUES (5,N'Nguyễn Lê Huyền Trang','14/03/1998',N'Nữ',N'Bình Hưng Hòa A, Bình Hưng Hoà A, Bình Tân, Thành phố Hồ Chí Minh, Việt Nam','0393777222','trangnguyen14@gmail.com')
INSERT INTO NhanVien VALUES (6,N'Huỳnh Thái Cường','21/06/2000',N'Nam',N'131 Đ. 26/3, Bình Hưng Hoà, Bình Tân, Thành phố Hồ Chí Minh, Việt Nam','0393000222','cuonghuynh21@gmail.com')
SELECT* FROM NhanVien

--====================================================================================================---
CREATE TABLE LoaiSanPhamCha
(
	IdLoaiSPCha INT IDENTITY(1,1),
	TenLoaiSPCha NVARCHAR(255),
	CONSTRAINT PK_IdLoaiSPCha PRIMARY KEY(IdLoaiSPCha),
	CONSTRAINT UNI_TenLoaiSPCha UNIQUE(TenLoaiSPCha)
);
INSERT INTO LoaiSanPhamCha VALUES (N'Nam');
INSERT INTO LoaiSanPhamCha VALUES (N'Nữ');
INSERT INTO LoaiSanPhamCha VALUES (N'Trẻ em');
INSERT INTO LoaiSanPhamCha VALUES (N'Phụ Kiện');
SELECT * FROM LoaiSanPhamCha
--====================================================================================================---
CREATE TABLE LoaiSanPham
(
	IdLoaiSP INT IDENTITY(1,1),
	TenLoaiSP NVARCHAR(255),
	IdLoaiSPCha INT,
	CONSTRAINT PK_LoaiSanPham PRIMARY KEY(IdLoaiSP),
	CONSTRAINT UNI_TenLoaiSP UNIQUE(TenLoaiSP),
	CONSTRAINT FK_LoaiSanPham_LoaiSanPhamCha FOREIGN KEY (IdLoaiSPCha) REFERENCES LoaiSanPhamCha(IdLoaiSPCha)
);
INSERT INTO LoaiSanPham VALUES (N'Áo nam',1);
INSERT INTO LoaiSanPham VALUES (N'Quần nam',1);
INSERT INTO LoaiSanPham VALUES (N'Vest - Blazer',1);
INSERT INTO LoaiSanPham VALUES (N'Áo khoác nam',1);
INSERT INTO LoaiSanPham VALUES (N'Áo nữ',2);
INSERT INTO LoaiSanPham VALUES (N'Áo dài',2);
INSERT INTO LoaiSanPham VALUES (N'Áo khoác nữ',2);
INSERT INTO LoaiSanPham VALUES (N'Quần nữ',2);
INSERT INTO LoaiSanPham VALUES (N'Đầm',2);
INSERT INTO LoaiSanPham VALUES (N'Váy',2);
INSERT INTO LoaiSanPham VALUES (N'Chân váy',2);
INSERT INTO LoaiSanPham VALUES (N'Quần',3);
INSERT INTO LoaiSanPham VALUES (N'Áo',3);
INSERT INTO LoaiSanPham VALUES (N'Mắt kính',4);
INSERT INTO LoaiSanPham VALUES (N'Giày - Dép',4);
INSERT INTO LoaiSanPham VALUES (N'Mũ - Nón',4);
INSERT INTO LoaiSanPham VALUES (N'Vớ - Tất',4);
INSERT INTO LoaiSanPham VALUES (N'Túi - Ví',4);
INSERT INTO LoaiSanPham VALUES (N'Thắt lưng',4);
INSERT INTO LoaiSanPham VALUES (N'Đồng hồ',4);
SELECT * FROM LoaiSanPham

--====================================================================================================---

CREATE TABLE SanPham (
  IdSanPham BIGINT IDENTITY(1,1),
  TenSanPham NVARCHAR(255) NOT NULL,
  IdLoaiSP INT NOT NULL,
  AnhSP VARCHAR(255) NOT NULL,
  AnhSPChiTiet1 VARCHAR(255),
  AnhSPChiTiet2 VARCHAR(255),
  GiaBan BIGINT,
  GiamGia INT,
  SoLuongDanhGia INT,
  NoiDungSanPham NVARCHAR(MAX),
  DanhGiaSanPham NVARCHAR(MAX),
  ThanhToanVanChuyen NVARCHAR(MAX),
  TonTai BIT NOT NULL,
  CONSTRAINT PK_SanPham PRIMARY KEY(IdSanPham),
  CONSTRAINT UNI_TenSanPham UNIQUE(TenSanPham),
  CONSTRAINT FK_SanPham_LoaiSanPham FOREIGN KEY (IdLoaiSP) REFERENCES LoaiSanPham(IdLoaiSP),
  CONSTRAINT CHK_Gia_SanPham CHECK(GiaBan >= 0),
  CONSTRAINT CHK_GiamGia_SanPham CHECK(GiamGia >= 0),
  CONSTRAINT CHK_SoLuongDanhGia_SanPham CHECK(SoLuongDanhGia >= 0),
);

INSERT INTO SanPham VALUES(N'Đầm ngắn 2 dây', 9, 'product_img1.jpg', 'product_img1_compact1.jpg', 'product_img1_compact2.jpg', 1319000, 20, 89,N'Đầm ngắn 2 dây cup ngực sang trọng, gợi cảm\nTrang phục phù hợp dạo phố, thường ngày, đi tiệc...\nKích thước áo: S - M - L\nChiều dài: S : 60,5 cm - M: 62 cm - L : 63,5 cm', N'Kiểu dáng: Đầm ngắn\nChất liệu: cotton\nMàu sắc: Kem-Đen\nKích cỡ: S-M-L\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Blazer nam trắng', 3, 'product_img2.jpg', 'product_img2_compact1.jpg', 'product_img2_compact2.jpg', 2199000, 30, 135,N'Áo Blazer nam phom Premio phù hợp mọi dáng người\nGam màu trung tính, lịch lãm tạo điểm nhấn nổi bật và thời thượng', N'Kiểu dáng:\nChất liệu: 100% Polyester\nMàu sắc: Đen-Trắng\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Áo 2 dây xếp li', 5, 'product_img3.jpg', 'product_img3_compact1.jpg', 'product_img3_compact2.jpg', 359000, 15, 74, N'Áo 2 dây xếp li thời trang, nữ tính\nTrang phục phù hợp dạo phố, thường ngày, đi tiệc...\nKích thước áo: S - M - L\nS : 38.7cm &#8226; M : 39.4cm &#8226; L : 40.1cm', N'Kiểu dáng: Áo kiểu\nChất liệu: Linen\nMàu sắc: Kem-Đỏ\nKích cỡ: S-M-L\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Sơ mi tay dài', 1, 'product_img4.jpg', 'product_img4_compact1.jpg', 'product_img4_compact2.jpg', 1144000, 15, 55, N'Áo sơ mi dài tay phom Regular fit có độ suông rộng vừa đủ\nThiết kế chỉn chu đến từng chi tiết với tà lượn, túi ngực.', N'Kiểu dáng: Áo sơ mi\nChất liệu: 50% Polyester mang đến bộ bóng sắc nét, bền màu\nMàu sắc: Đen\nKích cỡ: L-XL-XXL\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Áo blazer oversize', 7, 'product_img5.jpg', 'product_img5_compact1.jpg', 'product_img5_compact2.jpg', 790000, 20, 102, N'Áo blazer oversize chất liệu Tweed thời trang\nTrang phục phù hợp dạo phố, đi làm, đi tiệc....\nKích thước áo: S - M - L\nS: 67.5cm - M: 68.5cm - L: 69.5cm', N'Kiểu dáng: Áo khoác\nChất liệu: Poly\nMàu sắc: Xanh-Đen\nKích cỡ: S-M-L\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Áo polo nam', 1, 'product_img6.jpg', 'product_img6_compact1.jpg', 'product_img6_compact2.jpg', 524000, 5, 81, N'Áo polo chất liệu polyester pha cafe, cổ đức tay cộc, phom regular.', N'Kiểu dáng:\nChất liệu: 50% cafe 50% recycle polyester.)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Chân váy midi xẻ', 11, 'product_img7.jpg', 'product_img7_compact1.jpg', 'product_img7_compact2.jpg', 749000, 25, 95, N'Chân váy midi xẻ nữ tính\nTrang phục phù hợp dạo phố, thường ngày,...\nKích thước áo: S - M - L\nS: 62,5cm &#8226; M: 63,5cm &#8226; L: 64,5cm', N'Kiểu dáng:\nChất liệu: Khaki\nMàu sắc: Đen-Nâu-Xám\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Air Jordan I High G', 15, 'product_img8.jpg', 'product_img8_compact1.jpg', 'product_img8_compact2.jpg', 4100000, 28, 106, N'Giày thể thao\nTrang phục phù hợp dạo phố, thường ngày,...\nKích thước giày: 36 &#8594; 46', N'Chất liệu: da\nMàu sắc: Xanh lá - trắng\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Váy lửng dáng xoè', 10, 'product_img9.jpg', 'product_img9_compact1.jpg', 'product_img9_compact2.jpg', 599000, 20, 83, N'Váy lửng dáng xoè nữ tính\nTrang phục phù hợp dạo phố, thường ngày,đi tiệc...\nKích thước áo: S - M - L\nS : 70 cm - M : 72 cm - L : 72 cm', N'Kiểu dáng: Váy lưng\nChất liệu: Spandex\nMàu sắc: Đen-Kem\nKích cỡ: S-M-L\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Mắt Kính Polygon', 14, 'product_img10.jpg', 'product_img10_compact1.jpg', 'product_img10_compact2.jpg', 519000, 30, 57, N'Mắt kính polygon Classic kim loại thời trang\nThiết kế phù hợp phối với nhiều trang phục thời trang đa dạng\nHộp kính tam giác da PU chống nước, nắp nam châm và kèm khăn lau kính', N'Kiểu dáng: Mắt kính thời trang\nChất liệu: Kim loại\nMàu sắc: Xám xanh-Đen-Nâu\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Khoác blazer oversize sọc', 7, 'product_img11.jpg', 'product_img11_compact1.jpg', 'product_img11_compact2.jpg', 1689000, 30, 175, N'Khoác blazer oversized phối denim cá tính\nTrang phục phù hợp dạo phố, thường ngày,...\nKích thước áo: S - M - L\nS : 43,2 cm - M : 45,7cm - L : 48,2 cm', N'Kiểu dáng: Áo khoác\nChất liệu: Kaki\nMàu sắc: Caro nâu-Đen\nKích cỡ: S-M-L\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Đầm nhung 2 dây midi', 9, 'product_img12.jpg', 'product_img12_compact1.jpg', 'product_img12_compact2.jpg', 874000, 25, 77, N'Đầm nhung 2 dây midi thời trang, sang trọng\nTrang phục phù hợp dạo phố, thường ngày, đi tiệc...\nKích thước áo: S - M - L\nS : 88cm - M : 89,5cm - L : 91cm', N'Kiểu dáng: Đầm lửng\nChất liệu: Velvet\nMàu sắc: Đen-Đỏ\nKích cỡ: S-M-L\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Đầm Thun Mini Tay Lở Dáng Xoè', 9, 'product_img13.jpg', 'product_img13_compact1.jpg', 'product_img13_compact2.jpg', 588000, 10, 72, N'Đầm thun mini tay lở dáng xoè thiết kế basic tôn dáng\nTrang phục phù hợp dạo phố, thường ngày, đi tiệc...\nKích thước áo: S - M - L\nS : 79cm - M : 81cm - L : 83cm', N'Kiểu dáng: Đầm ngắn\nChất liệu: jersey\nMàu sắc: Xanh-Đen\nKích cỡ: S-M-L\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Đầm Mini Tay Dài, Đắp Chéo Xếp Ly', 9, 'product_img14.jpg', 'product_img14_compact1.jpg', 'product_img14_compact2.jpg', 682000, 25, 75, N'Đầm Đầm mini tay dài, đắp chéo xếp ly thanh lịch, ôm eo tạo điểm nhấn\nTrang phục phù hợp dạo phố, thường ngày,đi tiệc, đi làm...', N'Kiểu dáng: Đầm ngắn\nChất liệu: Spandex\nMàu sắc: Tím-Đen\nKích cỡ: S-M-L\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Set Quần Short Áo Sơ Mi Oversize Tay Phồng', 5, 'product_img15.jpg', 'product_img15_compact1.jpg', 'product_img15_compact2.jpg', 784000, 25, 78, N'Áo sơ mi oversize tay phồng năng động, trẻ trung\nTrang phục phù hợp đi làm, thường ngày,...\nKích thước áo: F (Freesize)', N'Kiểu dáng: Áo kiểu\nChất liệu: chiffon\nMàu sắc: Xanh mint-Trắng\nKích cỡ: F\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Đầm 2 dây dài buộc nơ vai', 9, 'product_img16.jpg', 'product_img16_compact1.jpg', 'product_img16_compact2.jpg', 799000, 10, 66, N'Đầm 2 dây dài buộc nơ vai.\nTrẻ trung - Nữ tính.\nTrang phục dạo phố.', N'Kiểu dáng: Đầm lửng\nChất liệu: twill\nMàu sắc: Đỏ\nKích cỡ: S-M-L)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Đầm bút chì phối Organza', 9, 'product_img17.jpg', 'product_img17_compact1.jpg', 'product_img17_compact2.jpg', 699000, 15, 75, N'Đầm bút chì phối Organza.\nThanh lịch - Hiện đại..\nTrang phục phù hợp dạo phố, đi tiệc,...', N'Kiểu dáng: Đầm lửng\nChất liệu: Vải sợi poly tổng hợp x Organza.\nMàu sắc: Đen\nKích cỡ: S-M-L)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Áo Thun BabyTee Tay Ngắn In Hình', 5, 'product_img18.jpg', 'product_img18_compact1.jpg', 'product_img18_compact2.jpg', 399000, 30, 71, N'Áo thun BabyTee tay ngắn in hình trẻ trung, năng động.\nTrang phục phù hợp dạo phố, thường ngày, đi học...', N'Kiểu dáng: Áo thun\nChất liệu: jersey\nMàu sắc: Trắng-Đen\nKích cỡ: S-M-L)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Đầm Mini Phối Ren Cúp Ngực Tay Dài', 9, 'product_img19.jpg', 'product_img19_compact1.jpg', 'product_img19_compact2.jpg', 599000, 17, 102, N'Đầm mini phối ren cúp ngực tay dài thời trang, gợi cảm\nTrang phục phù hợp dạo phố, đi tiệc,...', N'Kiểu dáng: Đầm lửng\nChất liệu: twill\nMàu sắc: Đen\nKích cỡ: S-M-L\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Đầm lửng bẹt vai nhún tà', 9, 'product_img20.jpg', 'product_img20_compact1.jpg', 'product_img20_compact2.jpg', 699000, 15, 57, N'Đầm lửng bẹt vai nhún tà.\nTrẻ trung - Nữ tính.', N'Kiểu dáng: Đầm lửng\nChất liệu: Chiffon.\nMàu sắc: Đen-Trắng\nKích cỡ: S-M-L\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Áo Vest Blazer Nam Tay Dài Trơn', 3, 'product_img21.jpg', 'product_img21_compact1.jpg', 'product_img21_compact2.jpg', 1400000, 8, 47, N'Áo vest cũng mang đến một hình ảnh chỉnh chu, sang trọng và nam tính quyến rũ\nTrang phục phù hợp lễ cưới, sự kiện, tham gia tiệc, đi làm, hẹn hò,... ', N'Kiểu dáng: Fitted\nChất liệu: Cotton.\nMàu sắc: Đen\nKích cỡ: L-XL-XXL\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Áo Vest Blazer Nam Kẻ Sọc Dọc', 3, 'product_img22.jpg', 'product_img22_compact1.jpg', 'product_img22_compact2.jpg', 1340000, 10, 52, N'Áo vest cũng mang đến một hình ảnh chỉnh chu, sang trọng và nam tính quyến rũ\nTrang phục phù hợp môi trường làm việc công sở hoặc những buổi tiệc sang trọng,... ', N'Kiểu dáng: Fitted\nChất liệu: Cotton.\nMàu sắc: Đen\nKích cỡ: S-M-L-XL\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Áo sơ mi dài tay dây rút', 5, 'product_img23.jpg', 'product_img23_compact1.jpg', 'product_img23_compact2.jpg', 599000, 10, 146, N'Áo sơ mi dài tay dây rút  sành điệu, hiện đại\nTrang phục phù hợp dạo phố, thường ngày,đi chơi... ', N'Kiểu dáng: \nChất liệu: Cotton.\nMàu sắc: Trắng-Kem\nKích cỡ: S-M-L\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Áo Cropped Blazer', 5, 'product_img24.jpg', 'product_img24_compact1.jpg', 'product_img24_compact2.jpg', 599000, 0, 116, N'Áo Cropped Blazer cá tính\nTrang phục phù hợp dạo phố, thường ngày,...', N'Kiểu dáng: \nChất liệu: Cotton.\nMàu sắc: Đen-Nâu\nKích cỡ: S-M-L\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 700.000 đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Áo Parka Hai Mặt', 1, 'product_img25.jpg', 'product_img25_compact1.jpg', 'product_img25_compact2.jpg', 980000, 20, 42, N'Hai phong cách trong một chiếc áo.\nÁo parka không thấm nước để bảo vệ chống lại các yếu tố thời tiết.', N'Kiểu dáng: \nChất liệu: Mặt Trước: 100% Polyeste/ Mặt Sau: 100% Polyeste.\nMàu sắc: Đen-Nâu\nKích cỡ: L-XL-XXL\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Đồng hồ ORIENT Star 39.3 mm Nam', 20, 'product_img26.jpg', 'product_img26_compact1.jpg', 'product_img26_compact2.jpg', 19460000, 30, 12, N'Đến từ hãng đồng hồ Orient, thương hiệu Nhật Bản nổi tiếng với nhiều chiếc đồng hồ thời thượng\nĐồng hồ cơ tự động, bền bỉ, không cần dùng pin, lên dây cót bằng chuyển động của cổ tay\nVới đường kính mặt 39.3 mm, dành cho bạn nam có cổ tay với chu vi từ 18 - 19 cm\nChiếc đồng hồ nam có dây đeo và khung viền được làm từ thép không gỉ bền bỉ, chống ăn mòn và oxi hóa tốt\nHệ số chống nước 10 ATM, người dùng yên tâm đeo đồng hồ khi bơi lội, tắm rửa, đi mưa, rửa tay. Không nên đeo đồng hồ khi đi lặn', N'Đường kính mặt: 39.3 mm\nDây đeo Khung viền: Thép không gỉ\nLoại máy: Cơ tự động\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Đồng hồ CITIZEN Mechanical 42 mm Nam', 20, 'product_img27.jpg', 'product_img27_compact1.jpg', 'product_img27_compact2.jpg', 11185000, 20, 9, N'Mẫu đồng hồ đến từ thương hiệu Citizen - một trong những thương hiệu nổi tiếng và uy tín đến từ Nhật Bản\nĐồng hồ CITIZEN Mechanical 42 mm Nam NJ0080-50E sở hữu đường kính mặt 42 mm và độ rộng dây 18 mm.\nĐồng hồ cơ tự động, bền bỉ, không cần dùng pin, lên dây cót bằng chuyển động của cổ tay\n5 ATM là độ kháng nước của chiếc đồng hồ nam này, người dùng có thể an toàn đeo khi đi tắm, đi mưa. Lưu ý: không nên mang khi đi bơi, lặn.', N'Đường kính mặt: 42 mm\nChất liệu mặt kính: Kính Sapphire\nDây đeo Khung viền: Thép không gỉ\nLoại máy: Cơ tự động\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Áo Sơ Mi Nam Oxford Tay Dài', 1, 'product_img28.jpg', 'product_img28_compact1.jpg', 'product_img28_compact2.jpg', 569000, 6, 49, N'Thiết kế đặc biệt với phần cổ trụ, áo vẫn giữ nguyên được nét trang nhã và tối giản nhưng không mang lại cảm giác tẻ nhạt.\nForm dáng ôm vừa vặn, phần thân và tay áo suông, không ôm sẽ mang đến cảm giác rộng rãi, dễ chịu cho người mặc vào những ngày hè oi bức.', N'Kiểu dáng: Fitted\nChất liệu: Cotton.\nMàu sắc: Đen-Trắng\nKích cỡ: L-XL-XXL\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Áo kiểu bẹt vai tay phồng', 5, 'product_img29.jpg', 'product_img29_compact1.jpg', 'product_img29_compact2.jpg', 499000, 10, 146, N'Miêu tả: ÁO BẸT VAI TAY PHỒNG.\nĐặc tính: Trẻ trung - Nữ tính - Gợi cảm.\nThể loại: Trang phục dạo phố, tiệc.', N'Kiểu dáng: \nChất liệu: Poly xốp tổng hợp.\nMàu sắc: Xanh - Cam - Đen - Kem.\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Áo cúp ngang bẹt vai', 5, 'product_img30.jpg', 'product_img30_compact1.jpg', 'product_img30_compact2.jpg', 499000, 10, 166, N'Miêu tả: ÁO CÚP NGANG BẸT VAI.\nĐặc tính: Hiện đại - Nữ tính.\nThể loại: Trang phục tiệc, dạo phố. ', N'Kiểu dáng: \nChất liệu: Vải poly tổng hợp.\nMàu sắc: Đen - Kem.\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Áo Kiểu Dây Yếm Cổ Tay Phồng', 5, 'product_img31.jpg', 'product_img31_compact1.jpg', 'product_img31_compact2.jpg', 699000, 10, 141, N'Miêu tả: ÁO KIỂU DÂY YẾM CỔ TAY PHỒNG.\nĐặc tính: Nữ tính - Cá tính.\nThể loại: Trang phục dạo phố.', N'Kiểu dáng: \nChất liệu: Cotton gân.\nMàu sắc: Xanh - Kem - Đen.\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
INSERT INTO SanPham VALUES(N'Áo kiểu tay lỡ cổ gấp nếp', 5, 'product_img32.jpg', 'product_img32_compact1.jpg', 'product_img32_compact2.jpg', 699000, 15, 162, N'Áo kiểu tay lỡ cổ gấp nếp nữ tính, sang trọng\nTrang phục phù hợp dạo phố, thường ngày,đi làm...', N'Kiểu dáng: \nChất liệu: cotton.\nMàu sắc: Đen - Trắng - Kem.\nGiá đã bao gồm VAT)', N'Miễn phí giao hàng toàn quốc với đơn trên 1.000.000đ\nMiễn phí đổi trả trong 30 ngày', 1);
SELECT * FROM SanPham


--====================================================================================================---

CREATE TABLE DonHang (
  IdDonHang BIGINT IDENTITY(1,1),
  IdKhachHang  BIGINT NOT NULL,
  SoDienThoai VARCHAR(10) NOT NULL,
  DiaChiGiaoHang NVARCHAR(255) NOT NULL,
  PhuongThucThanhToan NVARCHAR(30)NOT NULL,
  ThoiGianDatHang DATETIME NOT NULL,
  ThoiGianGiaoHangDuKien DATETIME NOT NULL,
  TrangThaiDonHang NVARCHAR(30)NOT NULL,
  TrangThaiThanhToan NVARCHAR(30)NOT NULL,
  CONSTRAINT PK_DonHang PRIMARY KEY(IdDonHang),
  CONSTRAINT FK_DonHang_KhachHang FOREIGN KEY(IdKhachHang) REFERENCES KhachHang(IdKhachHang),
  CONSTRAINT CHK_NgayDatHang CHECK(ThoiGianDatHang <= ThoiGianGiaoHangDuKien),
  CONSTRAINT CHK_NgayGiaoHangDuKien CHECK(ThoiGianGiaoHangDuKien >= ThoiGianDatHang),
);
ALTER TABLE DonHang
ADD CONSTRAINT DF_TrangThaiDonHang DEFAULT N'Chờ xử lý' FOR TrangThaiDonHang;
ALTER TABLE DonHang
ADD CONSTRAINT DF_TrangThaiThanhToan DEFAULT N'Chưa thanh toán' FOR TrangThaiThanhToan;

INSERT INTO DonHang VALUES (6,'0393123123',N'12 Hai Bà Trưng, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh',N'Tiền mặt','10:53:47 18/7/2023','08:00:47 21/7/2023',N'Đã xác nhận',N'Đã thanh toán')
INSERT INTO DonHang VALUES (7,'0393755621',N'98 Ng. Tất Tố,Phường 19, Bình Thạnh, Thành phố Hồ Chí Minh',N'Tiền mặt','13:53:47 16/7/2023','13:53:47 18/7/2023',N'Đã xác nhận',N'Đã thanh toán')
INSERT INTO DonHang VALUES (8,'0979598491',N'1026 Phạm Văn Đồng, Hiệp Bình Chánh, Thủ Đức, Thành phố Hồ Chí Minh',N'Tiền mặt','10:35:47 18/7/2023','8:35:47 21/7/2023',N'Đang chờ xử lý',N'Chờ thanh toán')
INSERT INTO DonHang VALUES (45,'0979951492',N'27 Lý Thường Kiệt, Phường 7, Quận 11, Thành phố Hồ Chí Minh',N'Tiền mặt','10:55:47 15/7/2023','17:55:47 18/7/2023',N'Đã xác nhận',N'Đã thanh toán')
INSERT INTO DonHang VALUES (1,'0393888888',N'12 Hai Bà Trưng, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh',N'Tiền mặt','20:47:29 20/7/2023','18:47:29 22/7/2023',N'Đang chờ xử lý',N'Chờ thanh toán')
INSERT INTO DonHang VALUES (12,'0979541478',N'8 Đ. Trường Sa, Phường 17, Bình Thạnh, Thành phố Hồ Chí Minh',N'Tiền mặt','13:20:58 28/7/2023','15:20:58 30/7/2023',N'Đang chờ xử lý',N'Đã thanh toán')
INSERT INTO DonHang VALUES (1,'0393123123',N'12 Hai Bà Trưng, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh',N'Tiền mặt','19:53:51 09/10/2023','07:53:51 12/10/2023',N'Đã xác nhận',N'Đã thanh toán')
SELECT * FROM DonHang
--====================================================================================================---


CREATE TABLE ChiTietDonHang (
  IdDonHang BIGINT NOT NULL,
  IdSanPham BIGINT NOT NULL,
  SoLuong INT NOT NULL,
  DonGia FLOAT NOT NULL,
  CONSTRAINT PK_ChiTietDonHang PRIMARY KEY(IdDonHang, IdSanPham),
  CONSTRAINT FK_ChiTietDonHang_DonHang FOREIGN KEY(IdDonHang) REFERENCES DonHang(IdDonHang),
  CONSTRAINT FK_ChiTietDonHang_SanPham FOREIGN KEY(IdSanPham) REFERENCES SanPham(IdSanPham),
  CONSTRAINT CHK_SoLuong_ChiTietDonHang CHECK(SoLuong >= 0),
  CONSTRAINT CHK_DonGia_ChiTietDonHang CHECK(DonGia >= 0)
);


INSERT INTO ChiTietDonHang VALUES (1,1,8,8792000);
INSERT INTO ChiTietDonHang VALUES (1,2,8,5070000);
INSERT INTO ChiTietDonHang VALUES (2,11,2,2598000);
INSERT INTO ChiTietDonHang VALUES (2,9,2,998000);
INSERT INTO ChiTietDonHang VALUES (2,12,1,699000);
INSERT INTO ChiTietDonHang VALUES (3,9,2,998000);
INSERT INTO ChiTietDonHang VALUES (3,10,1,399000);
INSERT INTO ChiTietDonHang VALUES (3,11,1,1299000);
INSERT INTO ChiTietDonHang VALUES (4,10,1,399000);
INSERT INTO ChiTietDonHang VALUES (4,11,1,1299000);
INSERT INTO ChiTietDonHang VALUES (4,1,2,2198000);
INSERT INTO ChiTietDonHang VALUES (4,5,2,1318000);
INSERT INTO ChiTietDonHang VALUES (4,9,1,499000);
INSERT INTO ChiTietDonHang VALUES (5,2,1,1690000);
INSERT INTO ChiTietDonHang VALUES (5,6,1,499000);
INSERT INTO ChiTietDonHang VALUES (5,1,1,1099000);
INSERT INTO ChiTietDonHang VALUES (5,3,1,359000);
INSERT INTO ChiTietDonHang VALUES (6,27,1,8948000);
INSERT INTO ChiTietDonHang VALUES (6,16,1,719100);
INSERT INTO ChiTietDonHang VALUES (6,13,1,529200);
INSERT INTO ChiTietDonHang VALUES (7,26,2,27244000);
INSERT INTO ChiTietDonHang VALUES (7,27,1,8948000);
INSERT INTO ChiTietDonHang VALUES (7,29,3,1347300);
INSERT INTO ChiTietDonHang VALUES (7,2,2,3380000);
SELECT * FROM ChiTietDonHang


--====================================================================================================---


CREATE TABLE ChiNhanh
(
	IdChiNhanh INT IDENTITY(1,1),
	TenChiNhanh NVARCHAR(100) NOT NULL,
	DiaChi NVARCHAR(255) NOT NULL,
	CONSTRAINT PK_ChiNhanh PRIMARY KEY(IdChiNhanh)
)


INSERT INTO ChiNhanh VALUES(N'Chi Nhánh Trường Chinh',N'2 Trường Chinh, Tây Thạnh, Tân Phú, Thành phố Hồ Chí Minh');
INSERT INTO ChiNhanh VALUES(N'Chi Nhánh Nguyễn Hữu Cảnh',N'67 Đ. Nguyễn Hữu Cảnh, Phường 22, Bình Thạnh, Thành phố Hồ Chí Minh');
INSERT INTO ChiNhanh VALUES(N'Chi Nhánh Phạm Văn Đồng',N'526 Phạm Văn Đồng, Phường 13, Bình Thạnh, Thành phố Hồ Chí Minh');
INSERT INTO ChiNhanh VALUES(N'Chi Nhánh Song Hành',N'37 Đường Song Hành, Thảo Điền, Quận 2, Thành phố Hồ Chí Minh');
INSERT INTO ChiNhanh VALUES(N'Chi Nhánh Huỳnh Tấn Phát',N'612A Huỳnh Tấn Phát, Tân Phú, Quận 7, Thành phố Hồ Chí Minh');
SELECT * FROM ChiNhanh

--====================================================================================================---


CREATE TABLE Kho
(
	IdChiNhanh INT NOT NULL,
	IdSanPham BIGINT NOT NULL,
	SoLuongTonKho INT NOT NULL,
	CONSTRAINT PK_Kho PRIMARY KEY(IdChiNhanh, IdSanPham),
	CONSTRAINT FK_Kho_ChiNhanh FOREIGN KEY(IdChiNhanh) REFERENCES ChiNhanh(IdChiNhanh),
	CONSTRAINT FK_Kho_SanPham FOREIGN KEY(IdSanPham) REFERENCES SanPham(IdSanPham),
)

--====================================================================================================---

CREATE TABLE HoaDonNhapKho
(
    IdHoaDonNhapKho BIGINT IDENTITY(1,1),
    NgayNhap DATETIME NOT NULL,
    IdNhanVien BIGINT NOT NULL,
    IdChiNhanh INT NOT NULL,
	CONSTRAINT PK_HoaDonNhapKho PRIMARY KEY(IdHoaDonNhapKho),
    CONSTRAINT FK_HoaDonNhapKho_ChiNhanh FOREIGN KEY(IdChiNhanh) REFERENCES ChiNhanh(IdChiNhanh),
    CONSTRAINT FK_HoaDonNhapKho_NhanVien FOREIGN KEY(IdNhanVien) REFERENCES NhanVien(IdNhanVien)
);


--====================================================================================================---

CREATE TABLE ChiTietHoaDonNhapKho (
  IdHoaDonNhapKho BIGINT NOT NULL,
  IdSanPham BIGINT NOT NULL,
  SoLuong INT,
  CONSTRAINT PK_ChiTietHoaDonNhapKho PRIMARY KEY(IdHoaDonNhapKho, IdSanPham),
  CONSTRAINT FK_ChiTietHoaDonNhapKho_HoaDonNhapKho FOREIGN KEY(IdHoaDonNhapKho) REFERENCES HoaDonNhapKho(IdHoaDonNhapKho),
  CONSTRAINT FK_ChiTietHoaDonNhapKho_SanPham FOREIGN KEY(IdSanPham) REFERENCES SanPham(IdSanPham)
);
--====================================================================================================---

CREATE TABLE HoaDon (
  IdHoaDon BIGINT IDENTITY(1,1),
  IdNhanVien BIGINT NOT NULL,
  IdChiNhanh INT NOT NULL,
  SoDienThoai VARCHAR(10),
  PhuongThucThanhToan NVARCHAR(30) NOT NULL,
  NgayXuatHD DATETIME NOT NULL,
  CONSTRAINT PK_HoaDon PRIMARY KEY(IdHoaDon),
  CONSTRAINT FK_HoaDon_NhanVien FOREIGN KEY(IdNhanVien) REFERENCES NhanVien(IdNhanVien),
  CONSTRAINT FK_HoaDon_ChiNhanh FOREIGN KEY(IdChiNhanh) REFERENCES ChiNhanh(IdChiNhanh)
);


SELECT * FROM HoaDon
--====================================================================================================---


CREATE TABLE ChiTietHoaDon (
  IdHoaDon BIGINT NOT NULL,
  IdSanPham BIGINT NOT NULL,
  SoLuong INT NOT NULL,
  DonGia FLOAT NOT NULL,
  CONSTRAINT PK_ChiTietHoaDon PRIMARY KEY(IdHoaDon, IdSanPham),
  CONSTRAINT FK_ChiTietHoaDon_HoaDon FOREIGN KEY(IdHoaDon) REFERENCES HoaDon(IdHoaDon),
  CONSTRAINT FK_ChiTietHoaDon_SanPham FOREIGN KEY(IdSanPham) REFERENCES SanPham(IdSanPham),
  CONSTRAINT CHK_SoLuong_ChiTietHoaDon CHECK(SoLuong >= 0),
  CONSTRAINT CHK_DonGia_ChiTietHoaDon CHECK(DonGia >= 0)
);

--====================================================================================================---



CREATE TABLE PhanHoi
(
	IdPhanHoi BIGINT IDENTITY(1,1),
	IdKhachHang BIGINT NOT NULL,
	SoDienThoai CHAR(10) NOT NULL,
	VanDe NVARCHAR(100) NOT NULL,
	NoiDungVanDe NVARCHAR(MAX) NOT NULL,
	ThoiGianPhanHoi DATETIME NOT NULL,
	CONSTRAINT PK_PhanHoi PRIMARY KEY(IdPhanHoi),
	CONSTRAINT FK_PhanHoi_SanPham FOREIGN KEY(IdKhachHang) REFERENCES KhachHang(IdKhachHang)
)
INSERT INTO PhanHoi VALUES (1,'0123456789',N'Sản phẩm',N'Sản phẩm tốt đúng nhưng hình ảnh','10:18:21 7/7/2023');
INSERT INTO PhanHoi VALUES (13,'0123456789',N'Dịch vụ',N'Dịch vụ khách hàng tốt','10:18:46 11/7/2023');
INSERT INTO PhanHoi VALUES (15,'0123456789',N'Mua hàng không thành công',N'Đẫ thanh toán nhưng hệ thống chưa xác nhận','10:18:46 11/7/2023');
INSERT INTO PhanHoi VALUES (1,'0979888215',N'Sản phẩm',N'Chất lượng tốt. Sẽ tiếp tục ủng hộ','11:21:57 12/7/2023');
INSERT INTO PhanHoi VALUES (2,'0123451234',N'Giao hàng',N'Giao hàng chậm','14:30:12 15/7/2023');
INSERT INTO PhanHoi VALUES (4,'0123455678',N'Dịch vụ',N'Dịch vụ khách hàng không tốt','16:45:23 16/7/2023');
INSERT INTO PhanHoi VALUES (9,'0123454321',N'Sản phẩm',N'Sản phẩm không đạt yêu cầu','09:12:35 17/7/2023');
INSERT INTO PhanHoi VALUES (7,'0123456789',N'Giao hàng',N'Giao hàng không đúng địa chỉ','13:25:19 18/7/2023');
INSERT INTO PhanHoi VALUES (2,'0123459876',N'Sản phẩm',N'Sản phẩm đẹp và chất lượng tốt','10:30:45 19/7/2023');
INSERT INTO PhanHoi VALUES (5,'0123456789',N'Mua hàng không thành công',N'Hệ thống thanh toán gặp lỗi','11:45:21 20/7/2023');
INSERT INTO PhanHoi VALUES (11,'0987654321',N'Vận chuyển',N'Giao hàng nhanh chóng. Rất hài lòng','15:30:10 14/7/2023');
INSERT INTO PhanHoi VALUES (13,'0987654321',N'Phục vụ',N'Nhân viên phục vụ rất nhiệt tình','15:31:25 14/7/2023');
INSERT INTO PhanHoi VALUES (14,'0123456789',N'Sản phẩm',N'Sản phẩm chất lượng, giá cả hợp lý','16:45:12 14/7/2023');
INSERT INTO PhanHoi VALUES (3,'0932123123',N'Dịch vụ',N'Dịch vụ hỗ trợ khách hàng rất tốt','16:47:35 14/7/2023');
INSERT INTO PhanHoi VALUES (18,'0123456789',N'Thanh toán',N'Hình thức thanh toán đa dạng và tiện lợi','18:10:19 14/7/2023');
INSERT INTO PhanHoi VALUES (19,'0123456789',N'Giao hàng',N'Giao hàng không đúng thời gian','09:30:50 21/7/2023');
INSERT INTO PhanHoi VALUES (20,'0987654321',N'Dịch vụ',N'Không có sự hỗ trợ từ nhân viên','11:45:21 22/7/2023');
INSERT INTO PhanHoi VALUES (26,'0123456789',N'Sản phẩm',N'Sản phẩm không giống như mô tả','14:20:35 23/7/2023');
INSERT INTO PhanHoi VALUES (27,'0123456789',N'Giao hàng',N'Giao hàng không đúng địa chỉ','16:35:10 24/7/2023');
INSERT INTO PhanHoi VALUES (28,'0123459876',N'Dịch vụ',N'Dịch vụ không phản hồi kịp thời','09:50:45 25/7/2023');
INSERT INTO PhanHoi VALUES (29,'0123456789',N'Sản phẩm',N'Sản phẩm không đáp ứng mong đợi','11:15:20 26/7/2023');
INSERT INTO PhanHoi VALUES (30,'0123456789',N'Giao hàng',N'Giao hàng bị hỏng','13:40:18 27/7/2023');
INSERT INTO PhanHoi VALUES (31,'0123459876',N'Dịch vụ',N'Dịch vụ chưa đáp ứng mong đợi','15:55:33 28/7/2023');
INSERT INTO PhanHoi VALUES (32,'0123456789',N'Sản phẩm',N'Sản phẩm bị lỗi','09:10:49 29/7/2023');
INSERT INTO PhanHoi VALUES (33,'0123459876',N'Giao hàng',N'Giao hàng chậm và không chuẩn','11:25:57 30/7/2023');
INSERT INTO PhanHoi VALUES (34,'0123456789',N'Dịch vụ',N'Dịch vụ không thân thiện','13:50:02 31/7/2023');
INSERT INTO PhanHoi VALUES (36,'0123456789',N'Sản phẩm',N'Sản phẩm không đúng kích thước','09:30:25 1/8/2023');
INSERT INTO PhanHoi VALUES (37,'0123459876',N'Giao hàng',N'Giao hàng không đúng sản phẩm','11:45:39 2/8/2023');
INSERT INTO PhanHoi VALUES (38,'0123456789',N'Dịch vụ',N'Dịch vụ không chuyên nghiệp','14:10:57 3/8/2023');
INSERT INTO PhanHoi VALUES (39,'0123459876',N'Sản phẩm',N'Sản phẩm hỏng sau khi nhận','16:25:12 4/8/2023');
INSERT INTO PhanHoi VALUES (40,'0123456789',N'Giao hàng',N'Giao hàng không đúng hẹn','18:40:28 5/8/2023');
SELECT * FROM PhanHoi



--====================================================================================================---
CREATE TABLE DanhGiaSanPham (
  IdDanhGia BIGINT IDENTITY(1,1),
  IdSanPham BIGINT NOT NULL,
  IdKhachHang BIGINT NOT NULL,
  DiemDanhGia INT NOT NULL,
  NhanXet NVARCHAR(MAX) NOT NULL,
  ThoiGianDanhGia DATETIME NOT NULL,
  CONSTRAINT FK_DanhGiaSanPham_SanPham FOREIGN KEY (IdSanPham) REFERENCES SanPham(IdSanPham),
  CONSTRAINT FK_DanhGiaSanPham_KhachHang FOREIGN KEY (IdKhachHang) REFERENCES KhachHang(IdKhachHang),
  CONSTRAINT CHK_DiemDanhGia CHECK (DiemDanhGia >= 1 AND DiemDanhGia <= 5)
);
