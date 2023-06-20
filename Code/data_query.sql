use QLBH
                             

/*1.	In ra danh s�ch c�c s?n ph?m (MASP,TENSP) do �Trung Quoc� s?n xu?t.*/
select MaSP, TenSP
from SanPham
where NuocSX = 'Trung Quoc'

/*2.	In ra danh s�ch c�c s?n ph?m (MASP, TENSP) c� ??n v? t�nh l� �cay�, �quyen�.*/
select MaSP, TenSP
from SanPham
where (DVT = 'Cay' or DVT = 'quyen')

/*3.	In ra danh s�ch c�c s?n ph?m (MASP,TENSP) c� m� s?n ph?m b?t ??u l� �B� v� k?t th�c l� �01�.*/
select MaSP, TenSP
from SanPham
where( MaSP like 'B%01')

/*4.	In ra danh s�ch c�c s?n ph?m (MASP,TENSP) do �Trung Qu?c� s?n xu?t c� gi� t? 30.000 ??n 40.000*/
select MaSP, TenSP
from SanPham
where( NuocSX = 'Trung Quoc' and Gia between 30000 and 40000) /*ST01 s? tay 500 trang	, TV07 T?p 100 trang*/

/*5.	In ra danh s�ch c�c s?n ph?m (MASP,TENSP) do �Trung Quoc� ho?c �Thai Lan� s?n xu?t c� gi� t? 30.000 ??n 40.000.*/
select MaSP, TenSP
from SanPham
where((NuocSX = 'Trung Quoc ' or NuocSX = 'Thai Lan') and (Gia between 30000 and 40000))

/*6.	In ra c�c s? h�a ??n, tr? gi� h�a ??n b�n ra trong ng�y 1/1/2007 v� ng�y 2/1/2007.*/
select SoHD, TriGia
from HoaDon
where(NgHD between 1/1/2007 and  2/1/2007)

/*7.	In ra c�c s? h�a ??n, tr? gi� h�a ??n trong th�ng 1/2007, s?p x?p theo ng�y (t?ng d?n) v� tr? gi� c?a h�a ??n (gi?m d?n).*/
select SoHD, TriGia
from HoaDon
where (month(ngHD) = 1 and year(ngHD) = 2007)
order by NgHD ASC, TriGia DESC

/*8.	In ra danh s�ch c�c kh�ch h�ng (MAKH, HOTEN) ?� mua h�ng trong ng�y 1/1/2007.*/
select HoTen, KHachHang.MaKH
from KhachHang, HoaDon
where HoaDon.MaKH = KhachHang.MaKH and HoaDon.NgHD = 1/1/2007

/*9.	In ra s? h�a ??n, tr? gi� c�c h�a ??n do nh�n vi�n c� t�n �Nguyen Van B� l?p trong ng�y 28/10/2006.*/
select SoHD, TriGia
from NhanVien, HoaDon
where HoaDon.MaNV = NhanVien.MaNV and NhanVien.HoTen = 'Nguyen Van B' and HoaDon.NgHD = 28/10/2006

/*10.	In ra danh s�ch c�c s?n ph?m (MASP,TENSP) ???c kh�ch h�ng c� t�n �Nguyen Van A� mua trong th�ng 10/2006.*/
select SoHD, TriGia
from NhanVien, HoaDon
where HoaDon.MaNV = NhanVien.MaNV and NhanVien.HoTen = 'Nguyen Van B' and month(HoaDon.NgHD)= 10 and year(HoaDon.NgHD) = 2006

/*12.	T�m c�c s? h�a ??n ?� mua s?n ph?m c� m� s? �BB01� ho?c �BB02�, m?i s?n ph?m mua v?i s? l??ng t? 10 ??n 20.*/
select SoHD
from CTHD
where((MaSP in ( 'BB01', 'BB02')) and (SL between 10 and 20))


/*13.	T�m c�c s? h�a ??n mua c�ng l�c 2 s?n ph?m c� m� s? �BB01� v� �BB02�, m?i s?n ph?m mua v?i s? l??ng t? 10 ??n 20.*/
select SoHD
from CTHD
where((MaSP = 'BB01') and (SL between 10 and 20))
intersect
select SoHD
from CTHD
where((MaSP = 'BB02') and (SL between 10 and 20))

/*14.	In ra danh s�ch c�c s?n ph?m (MASP,TENSP) do �Trung Quoc� s?n xu?t ho?c c�c s?n ph?m ???c b�n ra trong ng�y 1/1/2007.*/
select distinct SanPham.MaSP, TenSP
from SanPham, CTHD, HoaDon
where(SanPham.NuocSX = 'Trung Quoc') or (HoaDon.NgHD = 1/1/2007) and (SanPham.MaSP = CTHD.MaSP) and (CTHD.SoHD = HoaDon.SoHD)

/*15.	In ra danh s�ch c�c s?n ph?m (MASP,TENSP) kh�ng b�n ???c.*/
select MaSP, TenSP
from SanPham
except
select SanPham.MaSP, TenSP
from SanPham, CTHD
where SanPham.MaSP = CTHD.MaSP

/*16.	In ra danh s�ch c�c s?n ph?m (MASP,TENSP) kh�ng b�n ???c trong n?m 2006.*/
select MaSP, TenSP
from SanPham
except
select SanPham.MaSP, TenSP
from SanPham, CTHD, HoaDon
where SanPham.MaSP = CTHD.MaSP and CTHD.SoHD = HoaDon.SoHD
and year(HoaDon.NgHD) = 2006

/*17.	In ra danh s�ch c�c s?n ph?m (MASP,TENSP) do �Trung Quoc� s?n xu?t kh�ng b�n ???c trong n?m 2006.*/
select MaSP, TenSP
from SanPham
where NuocSX = 'Trung Quoc'
except
select SanPham.MaSP, TenSP
from SanPham, CTHD, HoaDon
where SanPham.MaSP = CTHD.MaSP and CTHD.SoHD = HoaDon.SoHD
and not year(HoaDon.NgHD) = 2006

/*18.	T�m s? h�a ??n ?� mua t?t c? c�c s?n ph?m do Singapore s?n xu?t.*/
select SoHD
from HoaDon
where not exists
(select *
from SanPham
where(NuocSX = 'Singapore')
and MaSP not in( select MaSP
				 from CTHD
		         where SoHD = HoaDon.SoHD))

				                        /*Tuan 4*/
/*19.	T�m s? h�a ??n trong n?m 2006 ?� mua �t nh?t t?t c? c�c s?n ph?m do Singapore s?n xu?t.*/
select SoHD
from HoaDon
where year(NgHD) = 2006 and not exists
(select *
from SanPham
where(NuocSX = 'Singapore')
and MaSP not in( select MaSP
				 from CTHD
		         where SoHD = HoaDon.SoHD))

/*union: h?i
intersect:giao
except:tr?*/
/*20.	C� bao nhi�u h�a ??n kh�ng ph?i c?a kh�ch h�ng ??ng k� th�nh vi�n mua?*/
select count(SoHD) as 'So Hoa Don'
from HoaDon
where  MaKH is null

/*21.	C� bao nhi�u s?n ph?m kh�c nhau ???c b�n ra trong n?m 2006.*/
select count(distinct CTHD.MaSP) as 'So SP'
from CTHD, HoaDon
where CTHD.SoHD = HoaDon.SoHD and year(NgHD) = 2006

/*22.	Cho bi?t tr? gi� h�a ??n cao nh?t, th?p nh?t l� bao nhi�u ?*/
select max(TriGia) as maxTG , min(TriGia) as minTG
from HoaDon

/*23.	Tr? gi� trung b�nh c?a t?t c? c�c h�a ??n ???c b�n ra trong n?m 2006 l� bao nhi�u?*/
select avg(TriGia) as 'Trung Binh'
from HoaDon
where year(NgHD) = 2006

/*24.	T�nh doanh thu b�n h�ng trong n?m 2006.*/
select sum(TriGia) as 'Doanh Thu'
from HoaDon
where year(NgHD) = 2006

/*25.	T�m s? h�a ??n c� tr? gi� cao nh?t trong n?m 2006*/
select TriGia as 'max TG'
from HoaDon
where year(NgHD) = 2006 and TriGia = (select max(TriGia) 
									  from HoaDon)


/*26.	T�m h? t�n kh�ch h�ng ?� mua h�a ??n c� tr? gi� cao nh?t trong n?m 2006.*/
select HoTen as 'HT co TG max' 
from KhachHang, HoaDon
where KhachHang.MaKH = HoaDon.MaKH and TriGia = (select max(TriGia)
												 from HoaDon
												 where year(NgHD) = 2006)


/*27.	In ra danh s�ch 3 kh�ch h�ng ??u ti�n (MAKH, HOTEN) s?p x?p theo doanh s? gi?m d?n.*/
select TOP 3 MaKH, HoTen
from KhachHang
order by DoanhSo DESC


/*28.	In ra danh s�ch c�c s?n ph?m (MASP, TENSP) c� gi� b�n b?ng 1 trong 3 m?c gi� cao nh?t.*/
select MaSP, TenSP, Gia
from SanPham
where Gia in (select distinct Top 3 Gia
			  from SanPham
			  order by Gia desc)




/*29.	In ra danh s�ch c�c s?n ph?m (MASP, TENSP) do �Thai Lan� s?n xu?t c� gi� b?ng 1 trong 3 m?c gi� cao nh?t (c?a t?t c? c�c s?n ph?m).*/
select MaSP, TenSP, Gia
from SanPham
where NuocSX = 'Thai Lan' and Gia in (select distinct Top 3 Gia
									 from SanPham
									 order by Gia desc)


/*30.	In ra danh s�ch c�c s?n ph?m (MASP, TENSP) do �Trung Quoc� s?n xu?t c� gi� b?ng 1 trong 3 m?c gi� cao nh?t (c?a s?n ph?m do �Trung Quoc� s?n xu?t).*/
select MaSP, TenSP, Gia, NuocSX
from SanPham
where NuocSX = 'Trung Quoc' and Gia in (select distinct Top 3 Gia
										from SanPham
										where NuocSX = 'Trung Quoc'
										order by Gia desc)


/*31.* In ra danh s�ch kh�ch h�ng n?m trong 3 h?ng cao nh?t (x?p h?ng theo doanh s?).*/
select Top 3 MaKH, HoTen
from KhachHang
order by DoanhSo desc


/*32.	T�nh t?ng s? s?n ph?m do �Trung Quoc� s?n xu?t.*/
select count(MaSP)
from SanPham
where NuocSX = 'Trung Quoc'


/*33.	T�nh t?ng s? s?n ph?m c?a t?ng n??c s?n xu?t.*/
select NuocSX, count(MaSP)
from SanPham
group by NuocSX

/*34.	V?i t?ng n??c s?n xu?t, t�m gi� b�n cao nh?t, th?p nh?t, trung b�nh c?a c�c s?n ph?m.*/
select NuocSX, Max(Gia) as 'max cost',Min(Gia) as 'min cost', AVG(gia) as 'avg cost'
from SanPham
group by NuocSX

/*35.	T�nh doanh thu b�n h�ng m?i ng�y.*/
select NgHD, Sum(TriGia) as 'Revenue'
from HoaDon
group by NgHD

/*36.	T�nh t?ng s? l??ng c?a t?ng s?n ph?m b�n ra trong th�ng 10/2006.*/
SELECT MASP, COUNT(DISTINCT MASP) AS TONGSO
FROM SanPham
WHERE MASP IN(SELECT MASP
				FROM CTHD C INNER JOIN HoaDon H
				ON C.SOHD = H.SOHD
				WHERE MONTH(NGHD) = 10 AND YEAR(NGHD) = 2006)
GROUP BY MASP

/*37.	T�nh doanh thu b�n h�ng c?a t?ng th�ng trong n?m 2006.*/
select month(ngHD) as 'month', sum(TriGia) as 'Revenue'
from HoaDon
where year(ngHD) = 2006
group by month(ngHD)

/*38.	T�m h�a ??n c� mua �t nh?t 4 s?n ph?m kh�c nhau.*/
SELECT *
FROM HoaDon
WHERE SoHD IN(SELECT SoHD
FROM CTHD
WHERE SL >= 4)

/*39.	T�m h�a ??n c� mua 3 s?n ph?m do �Viet Nam� s?n xu?t (3 s?n ph?m kh�c nhau).*/
select SoHD
from HoaDon
where SoHD in (select SoHD
				from CTHD
				left join SanPham
				on CTHD.MaSP = SanPham.MaSP
				where SanPham.NuocSX = 'Viet Nam'
				group by SoHD
				having count(distinct CTHD.MaSP) >= 3)

/*40.	T�m kh�ch h�ng (MAKH, HOTEN) c� s? l?n mua h�ng nhi?u nh?t. */
select MaKH, HoTen
from KhachHang
where MaKH = (	select Top 1(MaKH)
				from HoaDon
				group by MaKH
				order by COUNT(DISTINCT SoHD) desc)

/*41.	Th�ng m?y trong n?m 2006, doanh s? b�n h�ng cao nh?t ?*/
select Top 1 month(NgHD) as 'month', Sum(TriGia) as 'Revenue'
from HoaDon
where year(NgHD) = 2006
group by month(NgHD)
order by sum(TriGia) desc

/*42.	T�m s?n ph?m (MASP, TENSP) c� t?ng s? l??ng b�n ra th?p nh?t trong n?m 2006.*/
select MaSP, TenSP
from SanPham
where MaSP = (	select top 1 MaSP
				from CTHD
				join HoaDon on CTHD.SoHD = HoaDon.SoHD
				where year(NgHD) = 2006
				group by MaSP
				order by sum(SL) asc)
			
/*43.	*M?i n??c s?n xu?t, t�m s?n ph?m (MASP,TENSP) c� gi� b�n cao nh?t.*/
select  MaxCost_per_Country.NuocSX, MaSP, TenSP, Gia
from	(	select NuocSX, max(gia) as 'cost'
			from SanPham
			group by NuocSX) as  MaxCost_per_Country
left join SanPham
on MaxCost_per_Country.NuocSX = SanPham.NuocSX
where MaxCost_per_Country.cost = SanPham.Gia

/*44.	T�m n??c s?n xu?t s?n xu?t �t nh?t 3 s?n ph?m c� gi� b�n kh�c nhau.*/
select NuocSX
from SanPham
group by NuocSX
having count(MaSP) >= 3 and count( distinct  Gia) >= 3

/*45.	*Trong 10 kh�ch h�ng c� doanh s? cao nh?t, t�m kh�ch h�ng c� s? l?n mua h�ng nhi?u nh?t.*/
select Top 1 Top10_Customer.MaKH, count(HoaDon.SoHD)
from (	select Top 10 MaKH, DoanhSo
		from KhachHang
		order by DoanhSo Desc) As Top10_Customer
left join HoaDon
on Top10_Customer.MaKH = HoaDon.MaKH
group by Top10_Customer.MaKH
order by count(HoaDon.SoHD) desc
