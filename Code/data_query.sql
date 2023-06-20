use QLBH
                             

/*1.	In ra danh sách các s?n ph?m (MASP,TENSP) do “Trung Quoc” s?n xu?t.*/
select MaSP, TenSP
from SanPham
where NuocSX = 'Trung Quoc'

/*2.	In ra danh sách các s?n ph?m (MASP, TENSP) có ??n v? tính là “cay”, ”quyen”.*/
select MaSP, TenSP
from SanPham
where (DVT = 'Cay' or DVT = 'quyen')

/*3.	In ra danh sách các s?n ph?m (MASP,TENSP) có mã s?n ph?m b?t ??u là “B” và k?t thúc là “01”.*/
select MaSP, TenSP
from SanPham
where( MaSP like 'B%01')

/*4.	In ra danh sách các s?n ph?m (MASP,TENSP) do “Trung Qu?c” s?n xu?t có giá t? 30.000 ??n 40.000*/
select MaSP, TenSP
from SanPham
where( NuocSX = 'Trung Quoc' and Gia between 30000 and 40000) /*ST01 s? tay 500 trang	, TV07 T?p 100 trang*/

/*5.	In ra danh sách các s?n ph?m (MASP,TENSP) do “Trung Quoc” ho?c “Thai Lan” s?n xu?t có giá t? 30.000 ??n 40.000.*/
select MaSP, TenSP
from SanPham
where((NuocSX = 'Trung Quoc ' or NuocSX = 'Thai Lan') and (Gia between 30000 and 40000))

/*6.	In ra các s? hóa ??n, tr? giá hóa ??n bán ra trong ngày 1/1/2007 và ngày 2/1/2007.*/
select SoHD, TriGia
from HoaDon
where(NgHD between 1/1/2007 and  2/1/2007)

/*7.	In ra các s? hóa ??n, tr? giá hóa ??n trong tháng 1/2007, s?p x?p theo ngày (t?ng d?n) và tr? giá c?a hóa ??n (gi?m d?n).*/
select SoHD, TriGia
from HoaDon
where (month(ngHD) = 1 and year(ngHD) = 2007)
order by NgHD ASC, TriGia DESC

/*8.	In ra danh sách các khách hàng (MAKH, HOTEN) ?ã mua hàng trong ngày 1/1/2007.*/
select HoTen, KHachHang.MaKH
from KhachHang, HoaDon
where HoaDon.MaKH = KhachHang.MaKH and HoaDon.NgHD = 1/1/2007

/*9.	In ra s? hóa ??n, tr? giá các hóa ??n do nhân viên có tên “Nguyen Van B” l?p trong ngày 28/10/2006.*/
select SoHD, TriGia
from NhanVien, HoaDon
where HoaDon.MaNV = NhanVien.MaNV and NhanVien.HoTen = 'Nguyen Van B' and HoaDon.NgHD = 28/10/2006

/*10.	In ra danh sách các s?n ph?m (MASP,TENSP) ???c khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.*/
select SoHD, TriGia
from NhanVien, HoaDon
where HoaDon.MaNV = NhanVien.MaNV and NhanVien.HoTen = 'Nguyen Van B' and month(HoaDon.NgHD)= 10 and year(HoaDon.NgHD) = 2006

/*12.	Tìm các s? hóa ??n ?ã mua s?n ph?m có mã s? “BB01” ho?c “BB02”, m?i s?n ph?m mua v?i s? l??ng t? 10 ??n 20.*/
select SoHD
from CTHD
where((MaSP in ( 'BB01', 'BB02')) and (SL between 10 and 20))


/*13.	Tìm các s? hóa ??n mua cùng lúc 2 s?n ph?m có mã s? “BB01” và “BB02”, m?i s?n ph?m mua v?i s? l??ng t? 10 ??n 20.*/
select SoHD
from CTHD
where((MaSP = 'BB01') and (SL between 10 and 20))
intersect
select SoHD
from CTHD
where((MaSP = 'BB02') and (SL between 10 and 20))

/*14.	In ra danh sách các s?n ph?m (MASP,TENSP) do “Trung Quoc” s?n xu?t ho?c các s?n ph?m ???c bán ra trong ngày 1/1/2007.*/
select distinct SanPham.MaSP, TenSP
from SanPham, CTHD, HoaDon
where(SanPham.NuocSX = 'Trung Quoc') or (HoaDon.NgHD = 1/1/2007) and (SanPham.MaSP = CTHD.MaSP) and (CTHD.SoHD = HoaDon.SoHD)

/*15.	In ra danh sách các s?n ph?m (MASP,TENSP) không bán ???c.*/
select MaSP, TenSP
from SanPham
except
select SanPham.MaSP, TenSP
from SanPham, CTHD
where SanPham.MaSP = CTHD.MaSP

/*16.	In ra danh sách các s?n ph?m (MASP,TENSP) không bán ???c trong n?m 2006.*/
select MaSP, TenSP
from SanPham
except
select SanPham.MaSP, TenSP
from SanPham, CTHD, HoaDon
where SanPham.MaSP = CTHD.MaSP and CTHD.SoHD = HoaDon.SoHD
and year(HoaDon.NgHD) = 2006

/*17.	In ra danh sách các s?n ph?m (MASP,TENSP) do “Trung Quoc” s?n xu?t không bán ???c trong n?m 2006.*/
select MaSP, TenSP
from SanPham
where NuocSX = 'Trung Quoc'
except
select SanPham.MaSP, TenSP
from SanPham, CTHD, HoaDon
where SanPham.MaSP = CTHD.MaSP and CTHD.SoHD = HoaDon.SoHD
and not year(HoaDon.NgHD) = 2006

/*18.	Tìm s? hóa ??n ?ã mua t?t c? các s?n ph?m do Singapore s?n xu?t.*/
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
/*19.	Tìm s? hóa ??n trong n?m 2006 ?ã mua ít nh?t t?t c? các s?n ph?m do Singapore s?n xu?t.*/
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
/*20.	Có bao nhiêu hóa ??n không ph?i c?a khách hàng ??ng ký thành viên mua?*/
select count(SoHD) as 'So Hoa Don'
from HoaDon
where  MaKH is null

/*21.	Có bao nhiêu s?n ph?m khác nhau ???c bán ra trong n?m 2006.*/
select count(distinct CTHD.MaSP) as 'So SP'
from CTHD, HoaDon
where CTHD.SoHD = HoaDon.SoHD and year(NgHD) = 2006

/*22.	Cho bi?t tr? giá hóa ??n cao nh?t, th?p nh?t là bao nhiêu ?*/
select max(TriGia) as maxTG , min(TriGia) as minTG
from HoaDon

/*23.	Tr? giá trung bình c?a t?t c? các hóa ??n ???c bán ra trong n?m 2006 là bao nhiêu?*/
select avg(TriGia) as 'Trung Binh'
from HoaDon
where year(NgHD) = 2006

/*24.	Tính doanh thu bán hàng trong n?m 2006.*/
select sum(TriGia) as 'Doanh Thu'
from HoaDon
where year(NgHD) = 2006

/*25.	Tìm s? hóa ??n có tr? giá cao nh?t trong n?m 2006*/
select TriGia as 'max TG'
from HoaDon
where year(NgHD) = 2006 and TriGia = (select max(TriGia) 
									  from HoaDon)


/*26.	Tìm h? tên khách hàng ?ã mua hóa ??n có tr? giá cao nh?t trong n?m 2006.*/
select HoTen as 'HT co TG max' 
from KhachHang, HoaDon
where KhachHang.MaKH = HoaDon.MaKH and TriGia = (select max(TriGia)
												 from HoaDon
												 where year(NgHD) = 2006)


/*27.	In ra danh sách 3 khách hàng ??u tiên (MAKH, HOTEN) s?p x?p theo doanh s? gi?m d?n.*/
select TOP 3 MaKH, HoTen
from KhachHang
order by DoanhSo DESC


/*28.	In ra danh sách các s?n ph?m (MASP, TENSP) có giá bán b?ng 1 trong 3 m?c giá cao nh?t.*/
select MaSP, TenSP, Gia
from SanPham
where Gia in (select distinct Top 3 Gia
			  from SanPham
			  order by Gia desc)




/*29.	In ra danh sách các s?n ph?m (MASP, TENSP) do “Thai Lan” s?n xu?t có giá b?ng 1 trong 3 m?c giá cao nh?t (c?a t?t c? các s?n ph?m).*/
select MaSP, TenSP, Gia
from SanPham
where NuocSX = 'Thai Lan' and Gia in (select distinct Top 3 Gia
									 from SanPham
									 order by Gia desc)


/*30.	In ra danh sách các s?n ph?m (MASP, TENSP) do “Trung Quoc” s?n xu?t có giá b?ng 1 trong 3 m?c giá cao nh?t (c?a s?n ph?m do “Trung Quoc” s?n xu?t).*/
select MaSP, TenSP, Gia, NuocSX
from SanPham
where NuocSX = 'Trung Quoc' and Gia in (select distinct Top 3 Gia
										from SanPham
										where NuocSX = 'Trung Quoc'
										order by Gia desc)


/*31.* In ra danh sách khách hàng n?m trong 3 h?ng cao nh?t (x?p h?ng theo doanh s?).*/
select Top 3 MaKH, HoTen
from KhachHang
order by DoanhSo desc


/*32.	Tính t?ng s? s?n ph?m do “Trung Quoc” s?n xu?t.*/
select count(MaSP)
from SanPham
where NuocSX = 'Trung Quoc'


/*33.	Tính t?ng s? s?n ph?m c?a t?ng n??c s?n xu?t.*/
select NuocSX, count(MaSP)
from SanPham
group by NuocSX

/*34.	V?i t?ng n??c s?n xu?t, tìm giá bán cao nh?t, th?p nh?t, trung bình c?a các s?n ph?m.*/
select NuocSX, Max(Gia) as 'max cost',Min(Gia) as 'min cost', AVG(gia) as 'avg cost'
from SanPham
group by NuocSX

/*35.	Tính doanh thu bán hàng m?i ngày.*/
select NgHD, Sum(TriGia) as 'Revenue'
from HoaDon
group by NgHD

/*36.	Tính t?ng s? l??ng c?a t?ng s?n ph?m bán ra trong tháng 10/2006.*/
SELECT MASP, COUNT(DISTINCT MASP) AS TONGSO
FROM SanPham
WHERE MASP IN(SELECT MASP
				FROM CTHD C INNER JOIN HoaDon H
				ON C.SOHD = H.SOHD
				WHERE MONTH(NGHD) = 10 AND YEAR(NGHD) = 2006)
GROUP BY MASP

/*37.	Tính doanh thu bán hàng c?a t?ng tháng trong n?m 2006.*/
select month(ngHD) as 'month', sum(TriGia) as 'Revenue'
from HoaDon
where year(ngHD) = 2006
group by month(ngHD)

/*38.	Tìm hóa ??n có mua ít nh?t 4 s?n ph?m khác nhau.*/
SELECT *
FROM HoaDon
WHERE SoHD IN(SELECT SoHD
FROM CTHD
WHERE SL >= 4)

/*39.	Tìm hóa ??n có mua 3 s?n ph?m do “Viet Nam” s?n xu?t (3 s?n ph?m khác nhau).*/
select SoHD
from HoaDon
where SoHD in (select SoHD
				from CTHD
				left join SanPham
				on CTHD.MaSP = SanPham.MaSP
				where SanPham.NuocSX = 'Viet Nam'
				group by SoHD
				having count(distinct CTHD.MaSP) >= 3)

/*40.	Tìm khách hàng (MAKH, HOTEN) có s? l?n mua hàng nhi?u nh?t. */
select MaKH, HoTen
from KhachHang
where MaKH = (	select Top 1(MaKH)
				from HoaDon
				group by MaKH
				order by COUNT(DISTINCT SoHD) desc)

/*41.	Tháng m?y trong n?m 2006, doanh s? bán hàng cao nh?t ?*/
select Top 1 month(NgHD) as 'month', Sum(TriGia) as 'Revenue'
from HoaDon
where year(NgHD) = 2006
group by month(NgHD)
order by sum(TriGia) desc

/*42.	Tìm s?n ph?m (MASP, TENSP) có t?ng s? l??ng bán ra th?p nh?t trong n?m 2006.*/
select MaSP, TenSP
from SanPham
where MaSP = (	select top 1 MaSP
				from CTHD
				join HoaDon on CTHD.SoHD = HoaDon.SoHD
				where year(NgHD) = 2006
				group by MaSP
				order by sum(SL) asc)
			
/*43.	*M?i n??c s?n xu?t, tìm s?n ph?m (MASP,TENSP) có giá bán cao nh?t.*/
select  MaxCost_per_Country.NuocSX, MaSP, TenSP, Gia
from	(	select NuocSX, max(gia) as 'cost'
			from SanPham
			group by NuocSX) as  MaxCost_per_Country
left join SanPham
on MaxCost_per_Country.NuocSX = SanPham.NuocSX
where MaxCost_per_Country.cost = SanPham.Gia

/*44.	Tìm n??c s?n xu?t s?n xu?t ít nh?t 3 s?n ph?m có giá bán khác nhau.*/
select NuocSX
from SanPham
group by NuocSX
having count(MaSP) >= 3 and count( distinct  Gia) >= 3

/*45.	*Trong 10 khách hàng có doanh s? cao nh?t, tìm khách hàng có s? l?n mua hàng nhi?u nh?t.*/
select Top 1 Top10_Customer.MaKH, count(HoaDon.SoHD)
from (	select Top 10 MaKH, DoanhSo
		from KhachHang
		order by DoanhSo Desc) As Top10_Customer
left join HoaDon
on Top10_Customer.MaKH = HoaDon.MaKH
group by Top10_Customer.MaKH
order by count(HoaDon.SoHD) desc
