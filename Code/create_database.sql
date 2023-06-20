create database QLBH
go
use QLBH
go
create table KhachHang
(
	MaKH char(4) constraint PK_KH primary key,
	HoTen varchar(40),
	DChi varchar(50),
	SoDT varchar(20),
	NgSinh smalldatetime,
	DoanhSo money,
	NgDK smalldatetime,
)
go
create table NhanVien
(
	MaNV char(4) constraint PK_NV primary key,
	HoTen varchar(40),
	SoDT varchar(20),
	NgVL smalldatetime,
)
go
create table SanPham
(
	MaSP char(4) constraint PK_SP primary key,
	TenSP varchar(40),
	DVT varchar(20),/* don vi tinh*/
	NuocSX varchar(40),
	Gia money,
)
go
create table HoaDon
(
	SoHD int constraint PK_HD primary key,
	NgHD smalldatetime, /* ngay mua hang*/
	MaKH char(4),
	MaNV char(4),
	TriGia money,
)
go
create table CTHD
(
	SoHD int,
	MaSP char(4),
	SL int,
	constraint PK_CTHD primary key(SoHD, MaSP),
)
go
alter table HoaDon add
constraint FK_HD_KH foreign key(MaKH) references KhachHang(MaKH),
constraint FK_HD_NV foreign key(MaNV) references NhanVien(MaNV)
alter table CTHD add 
constraint FK_CTHD_HD foreign key(SoHD) references HoaDon(SoHD),
constraint FK_CTHD_SP foreign key(MaSP) references SanPham(MaSP)

/* Nhap du lieu Khach hang*/ /**/
SET DATEFORMAT dmy
INSERT INTO KhachHang VALUES ('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','08823451','22/10/1960 ',13060000 ,'22/07/2006')
INSERT INTO KhachHang VALUES ('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','0908256478','3/4/1974 ',280000 ,'30/07/2006')
INSERT INTO KhachHang VALUES ('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','0938776266','12/6/1980 ',3860000 ,'05/08/2006')
INSERT INTO KhachHang VALUES ('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','0917325476','9/3/1965 ',250000 ,'02/10/2006')
INSERT INTO KhachHang VALUES ('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','08246108','10/3/1950 ',21000 ,'28/10/2006')
INSERT INTO KhachHang VALUES ('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','08631738','31/12/1981 ',915000 ,'24/11/2006')
INSERT INTO KhachHang VALUES ('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','0916783565','6/4/1971 ',12500 ,'01/12/2006')
INSERT INTO KhachHang VALUES ('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','0938435756','10/1/1971 ',365000 ,'13/12/2006')
INSERT INTO KhachHang VALUES ('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','08654763','3/9/1979 ',70000 ,'14/01/2007')
INSERT INTO KhachHang VALUES ('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','08768904','2/5/1983 ',67500 ,'16/01/2007')

-----------------
/*Nhâ?p d?? liê?u NHANVIEN*//**/
SET DATEFORMAT dmy
INSERT INTO NhanVien VALUES('NV01','Nguyen Nhu Nhut','0927345678','13/4/2006')
INSERT INTO NhanVien VALUES('NV02','Le Thi Phi Yen','0987567390','21/4/2006')
INSERT INTO NhanVien VALUES('NV03','Nguyen Van B','0997047382','27/4/2006')
INSERT INTO NhanVien VALUES('NV04','Ngo Thanh Tuan','0913768498','24/6/2006')
INSERT INTO NhanVien VALUES('NV05','Nguyen Thi Truc Thanh','0918590387','20/7/2006')
-----------------
/*Nhâ?p d?? liê?u SANPHAM*//**/
INSERT INTO SanPham VALUES('BC01','But chi','cay','Singapore',3000)
INSERT INTO SanPham VALUES('BC02','But chi','cay','Singapore',5000)
INSERT INTO SanPham VALUES('BC03','But chi','cay','Viet Nam',3500)
INSERT INTO SanPham VALUES('BC04','But chi','hop','Viet Nam',30000)
INSERT INTO SanPham VALUES('BB01','But bi','cay','Viet Nam',5000)
INSERT INTO SanPham VALUES('BB02','But bi','cay','Trung Quoc',7000)
INSERT INTO SanPham VALUES('BB03','But bi','hop','Thai Lan',100000)
INSERT INTO SanPham VALUES('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
INSERT INTO SanPham VALUES('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
INSERT INTO SanPham VALUES('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
INSERT INTO SanPham VALUES('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
INSERT INTO SanPham VALUES('TV05','Tap 100 trang','chuc','Viet Nam',23000)
INSERT INTO SanPham VALUES('TV06','Tap 200 trang','chuc','Viet Nam',53000)
INSERT INTO SanPham VALUES('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
INSERT INTO SanPham VALUES('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
INSERT INTO SanPham VALUES('ST02','So tay loai 1','quyen','Viet Nam',55000)
INSERT INTO SanPham VALUES('ST03','So tay loai 2','quyen','Viet Nam',51000)
INSERT INTO SanPham VALUES('ST04','So tay','quyen','Thai Lan',55000)
INSERT INTO SanPham VALUES('ST05','So tay mong','quyen','Thai Lan',20000)
INSERT INTO SanPham VALUES('ST06','Phan viet bang','hop','Viet Nam',5000)
INSERT INTO SanPham VALUES('ST07','Phan khong bui','hop','Viet Nam',7000)
INSERT INTO SanPham VALUES('ST08','Bong bang','cai','Viet Nam',1000)
INSERT INTO SanPham VALUES('ST09','But long','cay','Viet Nam',5000)
INSERT INTO SanPham VALUES('ST10','But long','cay','Trung Quoc',7000)
-----------------
/*Nhâ?p d?? liê?u HOADON*//**/
INSERT INTO HoaDon VALUES(1001,'23/07/2006','KH01','NV01',320000)
INSERT INTO HoaDon VALUES(1002,'12/08/2006','KH01','NV02',840000)
INSERT INTO HoaDon VALUES(1003,'23/08/2006','KH02','NV01',100000)
INSERT INTO HoaDon VALUES(1004,'01/09/2006','KH02','NV01',180000)
INSERT INTO HoaDon VALUES(1005,'20/10/2006','KH01','NV02',3800000)
INSERT INTO HoaDon VALUES(1006,'16/10/2006','KH01','NV03',2430000)
INSERT INTO HoaDon VALUES(1007,'28/10/2006','KH03','NV03',510000)
INSERT INTO HoaDon VALUES(1008,'28/10/2006','KH01','NV03',440000)
INSERT INTO HoaDon VALUES(1009,'28/10/2006','KH03','NV04',200000)
INSERT INTO HoaDon VALUES(1010,'01/11/2006','KH01','NV01',5200000)
INSERT INTO HoaDon VALUES(1011,'04/11/2006','KH04','NV03',250000)
INSERT INTO HoaDon VALUES(1012,'30/11/2006','KH05','NV03',21000)
INSERT INTO HoaDon VALUES(1013,'12/12/2006','KH06','NV01',5000)
INSERT INTO HoaDon VALUES(1014,'31/12/2006','KH03','NV02',3150000)
INSERT INTO HoaDon VALUES(1015,'01/01/2007','KH06','NV01',910000)
INSERT INTO HoaDon VALUES(1016,'01/01/2007','KH07','NV02',12500)
INSERT INTO HoaDon VALUES(1017,'02/01/2007','KH08','NV03',35000)
INSERT INTO HoaDon VALUES(1018,'13/01/2007','KH08','NV03',330000)
INSERT INTO HoaDon VALUES(1019,'13/01/2007','KH01','NV03',30000)
INSERT INTO HoaDon VALUES(1020,'14/01/2007','KH09','NV04',70000)
INSERT INTO HoaDon VALUES(1021,'16/01/2007','KH10','NV03',67500)
INSERT INTO HoaDon VALUES(1022,'16/01/2007',Null,'NV03',7000)
INSERT INTO HoaDon VALUES(1023,'17/01/2007',Null,'NV01',330000)

-----------------
/*Nhâ?p d?? liê?u CTHD*/ /**/
INSERT INTO CTHD VALUES(1001,'TV02',10)
INSERT INTO CTHD VALUES(1001,'ST01',5)
INSERT INTO CTHD VALUES(1001,'BC01',5)
INSERT INTO CTHD VALUES(1001,'BC02',10)
INSERT INTO CTHD VALUES(1001,'ST08',10)
INSERT INTO CTHD VALUES(1002,'BC04',20)
INSERT INTO CTHD VALUES(1002,'BB01',20)
INSERT INTO CTHD VALUES(1002,'BB02',20)
INSERT INTO CTHD VALUES(1003,'BB03',10)
INSERT INTO CTHD VALUES(1004,'TV01',20)
INSERT INTO CTHD VALUES(1004,'TV02',10)
INSERT INTO CTHD VALUES(1004,'TV03',10)
INSERT INTO CTHD VALUES(1004,'TV04',10)
INSERT INTO CTHD VALUES(1005,'TV05',50)
INSERT INTO CTHD VALUES(1005,'TV06',50)
INSERT INTO CTHD VALUES(1006,'TV07',20)
INSERT INTO CTHD VALUES(1006,'ST01',30)
INSERT INTO CTHD VALUES(1006,'ST02',10)
INSERT INTO CTHD VALUES(1007,'ST03',10)
INSERT INTO CTHD VALUES(1008,'ST04',8)
INSERT INTO CTHD VALUES(1009,'ST05',10)
INSERT INTO CTHD VALUES(1010,'TV07',50)
INSERT INTO CTHD VALUES(1010,'ST07',50)
INSERT INTO CTHD VALUES(1010,'ST08',100)
INSERT INTO CTHD VALUES(1010,'ST04',50)
INSERT INTO CTHD VALUES(1010,'TV03',100)
INSERT INTO CTHD VALUES(1011,'ST06',50)
INSERT INTO CTHD VALUES(1012,'ST07',3)
INSERT INTO CTHD VALUES(1013,'ST08',5)
INSERT INTO CTHD VALUES(1014,'BC02',80)
INSERT INTO CTHD VALUES(1014,'BB02',100)
INSERT INTO CTHD VALUES(1014,'BC04',60)
INSERT INTO CTHD VALUES(1014,'BB01',50)
INSERT INTO CTHD VALUES(1015,'BB02',30)
INSERT INTO CTHD VALUES(1015,'BB03',7)
INSERT INTO CTHD VALUES(1016,'TV01',5)
INSERT INTO CTHD VALUES(1017,'TV02',1)
INSERT INTO CTHD VALUES(1017,'TV03',1)
INSERT INTO CTHD VALUES(1017,'TV04',5)
INSERT INTO CTHD VALUES(1018,'ST04',6)
INSERT INTO CTHD VALUES(1019,'ST05',1)
INSERT INTO CTHD VALUES(1019,'ST06',2)
INSERT INTO CTHD VALUES(1020,'ST07',10)
INSERT INTO CTHD VALUES(1021,'ST08',5)
INSERT INTO CTHD VALUES(1021,'TV01',7)
INSERT INTO CTHD VALUES(1021,'TV02',10)
INSERT INTO CTHD VALUES(1022,'ST07',1)
INSERT INTO CTHD VALUES(1023,'ST04',6)

								/*Ngôn ng? ??nh ngh?a d? li?u*/

/* 2> Thêm thu?c tính ghi chú vào SanPham*/
ALTER table SanPham add
GhiChu VarChar(20)

/*3>Thêm thu?c tính LoaiKH có ki?u d? li?u tinyint cho quan h? khách hàng*/
ALTER TABLE KhachHang add
LoaiKH tinyint


/* 4> s?a ki?u d? li?u thu?c tính ghi chú thanh varchar(100)*/
ALTER TABLE SanPham
ALTER COLUMN GhiChu varchar(100)

/*5> xóa thu?c tính ghi chú trong quan h? SanPham*/
ALTER TABLE SanPham
DROP COLUMN GhiChu

/*6> Làm th? nào ?? thu?c tính LOAIKH trong quan h? KHACHHANG có th? l?u các giá tr? là: “Vang lai”, “Thuong xuyen”, “Vip”, …*/
ALTER table KhachHang
AlTER COLUMN LoaiKH varchar(40)

/* 7.	??n v? tính c?a s?n ph?m ch? có th? là (“cay”,”hop”,”cai”,”quyen”,”chuc”)*/
ALTER table SanPham add constraint CHK_DVT check (DVT in( 'cay', 'hop', 'cai', 'quyen', 'chuc'))
/*alter table SanPham 
drop constraint CHK_DVT*/

/*8> Giá bán sp t? 500 ??ng tr? lên*/
ALTER table SanPham add constraint CHK_Gia
check(Gia>500)

/*9>M?i l?n mua, khách hàng ph?i mua ít nh?t m?t s?n ph?m*/
AlTER table CTHD add constraint CHK_SL
check(SL>=1)

/*10>Ngày khách hàng ??ng ký là khách hàng thành viên ph?i l?n h?n ngày sinh c?a ng??i ?ó.*/
ALTER table KhachHang add constraint Check_NgDK
check(NgDK>NgSinh)
