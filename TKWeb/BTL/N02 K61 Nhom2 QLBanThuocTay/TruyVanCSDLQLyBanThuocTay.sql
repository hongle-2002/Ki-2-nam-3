--_________________________VIEW________________________
-- Cau1: Hiển thị thuốc tên Garen
create view cau1
as
select * from DanhMucThuoc 
where TenThuoc = N'Garen'
-- Cau2: Hiển thi các thuốc nhập sau tháng 7 năm 2013 
create view cau2
as
select DanhMucThuoc.MaThuoc, DanhMucThuoc.TenThuoc, HoaDonNhap.NgayNhap
from DanhMucThuoc inner join ChiTietHDN on DanhMucThuoc.MaThuoc = ChiTietHDN.MaThuoc inner 
join HoaDonNhap on HoaDonNhap.MaHDN = ChiTietHDN.MaHDN
where month(NgayNhap) > 7 and year(NgayNhap) > 2013
-- Cau3: Hiển thị những nhân viên có tuổi lớn hơn 32
create view cau3
as
select MaNV,TenNV,GioiTinh, (2022-year(NgaySinh))as NgaySinh , DiaChi, MaTrinhDo, MaChuyenMon, DienThoai from NhanVien
where 2022 - year(NgaySinh) > 32
-- Cau4: Tính tổng số tiền của từng hóa đơn nhap 
create view cau4
as
select HoaDonNhap.MaHDN, (ngayNhap) as NgayNhap, sum(slNhap*donGia) as TongTienNhap
from HoaDonNhap join ChiTietHDN on HoaDonNhap.MaHDN = ChiTietHDN.MaHDN
group by HoaDonNhap.MaHDN, NgayNhap
--Cau5: Hien thi cac thuoc ko ban dc
create view cau5
as
select DanhMucThuoc.MaThuoc, TenThuoc from DanhMucThuoc join ChiTietHDB on DanhMucThuoc.MaThuoc = ChiTietHDB.MaThuoc
where DanhMucThuoc.MaThuoc not in (select MaThuoc from ChiTietHDB)
--Cau6: Hiển thị các thuốc do Việt Nam sản xuất 
create view cau6
as
select NuocSanXuat.MaNuocSX, NuocSanXuat.TenNuocSX, DanhMucThuoc.TenThuoc from NuocSanXuat join DanhMucThuoc 
on DanhMucThuoc.MaNuocSX = NuocSanXuat.MaNuocSX
where NuocSanXuat.MaNuocSX = N'VN'
--Cau7: Hiển thị các khách hàng có địa chỉ Hà Nội
create view cau7
as
select * from KhachHang
where DiaChi = N'Hà Nội'
--Cau8: Liệt kê những hóa đơn bán do nhân viên Đỗ Thảo lập
select HoaDonBan.MaHDB, HoaDonBan.MaNV, NhanVien.TenNV from NhanVien join HoaDonBan on NhanVien.MaNV = HoaDonBan.MaNV
where HoaDonBan.MaNV = N'NV09'

--_________________________PROCEDURE________________________
--Cau1: Thêm khách hàng
create proc ThemKhachHang
@MaKhach nvarchar(20) ,
@TenKhach nvarchar(20) ,
@DiaChi nvarchar(20),
@DienThoai nvarchar(20)
as
begin
	insert into KhachHang values (@MaKhach,@TenKhach,@DiaChi,@DienThoai)
end
exec ThemKhachHang N'KH11',N'Tuan Anh', N'Ha Noi' ,N'324254523'
--Cau2: Lấy danh sách khách hàng
create proc LayDSKH
as
begin
	select * from KhachHang
end
exec LayDSKH
--Cau3: Sửa thông tin khách hàng 
create proc SuaKhachHang
@MaKhach nvarchar(20),
@TenKhach nvarchar(20),
@DiaChi nvarchar(20),
@DienThoai nvarchar(20)
as
begin
	update KhachHang
	set TenKhach=@TenKhach,
		DiaChi=@DiaChi,
		DienThoai=@DienThoai
	where MaKhach=@MaKhach
end
--Cau4: Xóa khách hàng
create proc XoaKhachHang
@MaKhach nvarchar(20)
as
begin
	delete KhachHang where MaKhach = @MaKhach
end

--Cau5: Lấy danh sách nhân viên 
create proc LayDSNV
as
begin
	select * from NhanVien
end


--Cau6: Thêm nhân viên
create proc ThemNhanVien
	@MaNV nvarchar(10),
	@TenNV nvarchar(100),
	@NgaySinh datetime,
	@GioiTinh nvarchar (20),
	@DiaChi nvarchar (50),
	@MaTrinhDo nvarchar(20),
	@MaChuyenMon nvarchar(20),
	@DienThoai nvarchar(20)
as
begin
	insert into NhanVien values (@MaNV,@TenNV,@NgaySinh,@GioiTinh,@DiaChi,@MaTrinhDo,@MaChuyenMon,@DienThoai)
end
	

--Cau7: Sửa thông tin nhân viên
create proc SuaNhanVien
	@MaNV nvarchar(10),
	@TenNV nvarchar(100),
	@NgaySinh datetime,
	@GioiTinh nvarchar (20),
	@DiaChi nvarchar (50),
	@MaTrinhDo nvarchar(20),
	@MaChuyenMon nvarchar(20),
	@DienThoai nvarchar(20)
as
begin
	update NhanVien
	set TenNV = @TenNV,
		NgaySinh = @NgaySinh,
		GioiTinh = @GioiTinh,
		DiaChi = @DiaChi,
		MaTrinhDo = @MaTrinhDo,
		MaChuyenMon = @MaChuyenMon,
		DienThoai = @DienThoai
	where MaNV = @MaNV
end


--Cau8: Xóa nhân viên
create proc XoaNhanVien
@MaNV nvarchar(10)
as
begin
	delete NhanVien where MaNV = @MaNV
end

--Cau9: Lấy danh sách nhà cung cấp
create proc LayDSNCC
as
begin
	select * from NhaCungCap
end
--Cau10: Thêm nhà cung cấp
create proc ThemNhaCungCap
	@MaNCC nvarchar(20),
	@TenNCC nvarchar(20),
	@DiaChi nvarchar(50),
	@DienThoai nvarchar(20)
as
begin
	insert into NhaCungCap values (@MaNCC,@TenNCC,@DiaChi,@DienThoai)
end

--Cau11: Sửa thông tin nhà cung cấp
create proc SuaNhaCungCap
	@MaNCC nvarchar(20),
	@TenNCC nvarchar(20),
	@DiaChi nvarchar(50),
	@DienThoai nvarchar(20)
as
begin
	update NhaCungCap
	set 
	TenNCC = @TenNCC,
	DiaChi = @DiaChi,
	DienThoai = @DienThoai
	where MaNCC = @MaNCC
end
--Cau12: Xóa nhà cung cấp
create proc XoaNhaCungCap
@MaNCC nvarchar(20)
as
begin
	delete NhaCungCap where MaNCC = @MaNCC
end

--Cau13: Lấy danh sách hóa đơn nhập
create proc LayDSHDN
as
begin
	select * from HoaDonNhap
end
--Cau14: Thêm hóa đơn nhập 
create proc ThemHoaDonNhap
	@MaHDN nvarchar(20),
	@NgayNhap datetime,
	@MaNV nvarchar(10),
	@MaNCC nvarchar(20),
	@TongTien int 
as
begin
	insert into HoaDonNhap values (@MaHDN,@NgayNhap,@MaNV,@MaNCC,@TongTien)
end

--Cau15: Sửa thông tin hóa đơn nhập
create proc SuaHoaDonNhap
	@MaHDN nvarchar(20),
	@NgayNhap datetime,
	@MaNV nvarchar(10),
	@MaNCC nvarchar(20),
	@TongTien int 
as
begin
	update HoaDonNhap 
	set 
	NgayNhap = @NgayNhap,
	MaNV = @MaNV,
	MaNCC = @MaNCC,
	TongTien = @TongTien
	where MaHDN = @MaHDN
end
--Cau16: Xóa hóa đơn nhập
create proc XoaHoaDonNhap
@MaHDN nvarchar(20)
as
begin
	delete HoaDonNhap where MaHDN = @MaHDN
end

--Cau17: Lấy danh sách hóa đơn nhập
create proc LayDSHDN
as
begin
	select * from HoaDonNhap
end
--Cau18: Thêm hóa đơn bán 
create proc ThemHoaDonNhap
	@MaHDN nvarchar(20),
	@NgayNhap datetime,
	@MaNV nvarchar(10),
	@MaNCC nvarchar(20),
	@TongTien int 
as
begin
	insert into HoaDonNhap values (@MaHDN,@NgayNhap,@MaNV,@MaNCC,@TongTien)
end

--Cau19: Sửa thông tin hóa đơn bán
create proc SuaHoaDonNhap
	@MaHDN nvarchar(20),
	@NgayNhap datetime,
	@MaNV nvarchar(10),
	@MaNCC nvarchar(20),
	@TongTien int 
as
begin
	update HoaDonNhap 
	set 
	NgayNhap = @NgayNhap,
	MaNV = @MaNV,
	MaNCC = @MaNCC,
	TongTien = @TongTien
	where MaHDN = @MaHDN
end
--Cau20: Xóa hóa đơn nhập
create proc XoaHoaDonNhap
@MaHDN nvarchar(20)
as
begin
	delete HoaDonNhap where MaHDN = @MaHDN
end

--Cau21: Lay danh sach thuoc
create proc LayDSThuoc
as
begin
	select * from DanhMucThuoc
end

--Cau22: Lay danh sach cong dung
create proc LayDSCongDung
as
begin
	select * from CongDung
end

--Cau23: Lay danh sach dang dieu che
create proc LayDSDieuChe
as
begin
	select * from DangDieuChe
end

--Cau24: Lấy danh sách chi tiet hóa đơn bán 
create proc LayDSCTHDB
as
begin
	select * from ChiTietHDB 
end

--Cau25: Lấy danh sách chi tiet hóa đơn nhap
create proc LayDSCTHDN
as
begin
	select * from ChiTietHDN 
end




--_________________________FUCTION________________________
--Cau1: Hiển thị thông tin khách hàng đã mua trong tháng bất kì
go
create function DSKHMuaThuoc(@thang int) return table as 
return(select KhachHang.* from KhachHang join HoaDonBan on KhachHang.MaKhach = HoaDonBan.MaKhach
where month(HoaDonBan.NgayBan)=@thang)

select * from DSKHMuaThuoc(9)

--Cau2: Tính số lượng thuốc đã bán theo mã thuốc
go
create function SLThuocBan(@MaThuoc nvarchar(50)) returns int as
begin
	declare @sl int
	select @sl = sum(ChiTietHDB.SoLuong) from ChiTietHDB
	where ChiTietHDB.MaThuoc = @MaThuoc
	group by ChiTietHDB.MaThuoc
	return @sl
end

select dbo.SLThuocBan(N'MT01') as "SL Bán"

--Cau3: Tính doanh thu của tháng bất kì
go
create function DoanhThuThang(@thang int) returns money as
begin
	declare @dthu int
	select @dthu = sum(ChiTietHDB.SoLuong*DanhMucThuoc.GiaBan) from ChiTietHDB join DanhMucThuoc
	on ChiTietHDB.MaThuoc = DanhMucThuoc.MaThuoc
	join HoaDonBan on ChiTietHDB.MaHDB = HoaDonBan.MaHDB
	where month(HoaDonBan.NgayBan) = @thang
	return @dthu
end

select dbo.DoanhThuThang(6) as "Doanh Thu"

--Câu 4: Tìm các hóa đơn nhập do nhân viên có mã 'NV01' lập. đầu vào là mã nv
go
create function HoaDonNhap_NV(@manv nvarchar(20)) returns table as
return(
	select HoaDonNhap.* from HoaDonNhap
	where HoaDonNhap.MaNV = @manv)
go 
select * from HoaDonNhap_NV(N'NV02')

--Câu 5: Tính tổng nhân viên 
go 
create function TongNV(@MaNV nvarchar(20)) returns int as
begin
	declare @t int
	select @t =  count(NhanVien.MaNV) from NhanVien 
	where NhanVien.MaNV = @MaNV
	return @t
end

select dbo.TongNV(N'8') as "Tổng nhân viên"

--Câu 6: Tìm các thuốc có giá rẻ hơn 500000 

create or alter function ThuocGiaRe ()
returns TABLE as
return (
		select * 
		from DanhMucThuoc
		where GiaBan < 500000
		)

--Câu 7: Truyền vào tên khách hàng, tìm tất cả các hóa đơn của khách có tên đó(dùng like%ten%)
go
create or alter function function1 (@TenKhach nvarchar(40))
returns table
as
return (
	select MaHDB, NgayBan, HoaDonBan.MaKhach, TongTien
	from HoaDonBan join KhachHang on HoaDonBan.MaKhach = KhachHang.MaKhach
	where TenKhach like '%' + @TenKhach
)

--_________________________TRIGGER________________________
--Cau1: tự động cập nhật tongtien ở hoadonban khi thêm chitietHDB
go
create or alter trigger Trigger1 on ChiTietHDB for insert, update, delete 
as
begin	
	declare @soHDB1 nvarchar(10), @TT1 money ,@soHDB2 nvarchar(10), @TT2 money
	begin tran
		begin try
			select @soHDB1 = i.MaHDB , @TT1 = (i.SoLuong * sp.GiaBan)
			from inserted i join DanhMucThuoc sp on sp.MaThuoc = i.MaThuoc

			select @soHDB2 = d.MaHDB , @TT2 = (d.SoLuong * sp.GiaBan)
			from deleted d join DanhMucThuoc sp on sp.MaThuoc = d.MaThuoc

			update HoaDonBan
			set TongTien = ISNULL(TongTien,0) + ISNULL(@TT1,0) - ISNULL(@TT2,0)
			where MaHDB = isnull(@sohdb1,@sohdb2)
			commit 
		end try
		begin catch
			print 'Error:Thêm không thành công, bạn cần phải thêm MaHDB trong HoaDonBan trước vì MaHDB không tồn tại!';
			rollback tran
		end catch
end

--Cau2: Khi thấy thuốc hết hạn, k xóa mà thay trạng thái đang hợp tác thành không còn hợp tác
go
create or alter trigger trigger2 on DanhMucThuoc instead of delete
as
begin
	update DanhMucThuoc 
	set GhiChu = N'Không còn hợp tác'
	where (year(GETDATE()-year(HanSD)) > 0 
end

--Cau3: thêm trường ghi chú ở DanhMucThuoc, khi xóa 1 sản phẩm,  k xóa mà thay trạng thái thành không còn kinh doanh
go
create or alter trigger Trigger3 on DanhMucThuoc instead of delete
as
begin
	update DanhMucThuoc 
	set GhiChu = N'Không còn kinh doanh'
	where MaThuoc in (select deleted.MaThuoc from deleted)
end

--Cau4: Khi update hoặc insert trong bảng tChiTietHDB thì SoLuong không lớn hơn số lượng trong kho.
create or alter trigger Trigger4 on ChiTietHDB
for insert, update
as
begin
	declare @SLhienCo int
	declare @MaThuoc nvarchar(20)
	declare @SoLuong int
	set @MaThuoc = (select MaThuoc from inserted)
	set @SLhienCo = (select @SLhienCo from DanhMucThuoc where MaThuoc = @MaThuoc)
	set @SoLuong = (select SoLuong from inserted)
	if @SoLuong > @SLhienCo 
	begin
	rollback transaction
	end
end

/* Cau5:Số lượng trong bảng DanhMucThuoc là số lượng tồn kho,
cập nhật tự động dữ liệu cho trường này mỗi khi nhập hay bán sách */
create or alter trigger cau5 on chiTietHDN
after insert, update, delete
as
begin
	declare @SLNhap1 int, @MaThuoc1 nvarchar(10), @SLNhap2 int, @MaThuoc2
	nvarchar(10)
	set @SLNhap1 = (select SLNhap from inserted)
	set @MaThuoc1 = (select MaThuoc from inserted)
	set @SLNhap2 = (select SLNhap from inserted)
	set @MaThuoc2 = (select MaThuoc from inserted)
	update DanhMucThuoc
	set SLHienCo = isnull(SLHienCo,0)+isnull(@SLNhap1,0)
	where MaThuoc = @MaThuoc1
	update DanhMucThuoc
	set SLHienCo = isnull(SLHienCo,0)+isnull(@SLNhap2,0)
	where MaThuoc = @MaThuoc2
end

/* Cau6: Thêm trường số sản phẩm vào bảng hóa đơn bán,
cập nhật tự động cho trường này mỗi khi thêm, xóa, sửa chi tiết hóa đơn 
*/
alter table HoaDonBan
add [SoSP] int

create or alter trigger cau6 on ChiTietHDB
for insert, update, delete
as
begin
	declare @MaHDB nvarchar(10), @soLuong int
	set @MaHDB = (select MaHDB from inserted)
	set @Soluong = (select Soluong from inserted)
	update HoaDonBan set SoSP = isnull(SoSP,0)+isnull(@soLuong,0)
	where @MaHDB = @MaHDB

	set @Soluong = (select Soluong from inserted)
	set @MaHDB = (select MaHDB from deleted)
	update HoaDonBan set SoSP = isnull(SoSP,0)+isnull(@soLuong,0)
	where @MaHDB = @MaHDB
end

--_________________________ConTrol________________________
/* Kich ban1
-To login QuanLy,NhanVien
-Tao user QuanLy,NhanVien tuong ung voi login QuanLy, NhanVien
-Gan quyen select, update, delete, insert cho QuanLy tren bang HoaDonNhap
cua CSDL QLBanThuocTay, QuanLy co quyen trao quyen nay cho nguoi khac
- Tu QuanLy, trao quyen select cho NhanVien tren bang HoaDonNhap cua CSDL QLBanThuocTay
*/

exec sp_addlogin QuanLy,123
exec sp_addlogin NhanVien, 123

exec sp_adduser QuanLy, QuanLy
exec sp_adduser NhanVien, NhanVien

grant select, update, insert on HoaDonNhap to QuanLy with grant option


/*
Kich ban 2
- Tao login QuanLy, NhanVien, NhanVien1
- Tao user QuanLy, NhanVien, NhanVien1 tuong ung voi login QuanLy, Nhanvien, NhanVien1
- Gan quyen select, update, delete, insert cho QuanLy tren bang NhanVien cua CSDL
QLBanThuocTay,QuanLy co quyen trao quyen nay cho nguoi khac
- Tu QuanLy, Trao quyen select, update, delete cho NhanVien tren bang NhanVien 
cua CSDL QLBanThuocTay
- Tu QuanLy, trao quyen select cho NhanVien1 tren bang NhanVien cua CSDL QLBanThuocTay
- Tu NhanVien, Trao quyen update cho NhanVien1 tren bang NhanVien cua CSDL QLBanThuocTay
*/
exec sp_addlogin QuanLy, 123
exec sp_addlogin NhanVien, 123
exec sp_addlogin NhanVien1, 123

exec sp_adduser QuanLy, QuanLy
exec sp_adduser NhanVien, NhanVien
exec sp_adduser NhanVien1,NhanVien1

grant select, update, delete, insert on NhanVien to QuanLy with grant option

grant select on NhanVien to NhanVien1

grant select, update on NhanVien to NhanVien1

/*
Kich ban 3
- Tao login QuanLy, NhanVien, NhanVien2
- Tao user QuanLy, NhanVien, NhanVien2 tuong ung voi login
QuanLy, Nhanvien, NhanVien2
- Gan quyen select, update, delete, insert cho QuanLy tren bang DanhMucThuoc cua CSDL
QLBanThuocTay,QuanLy co quyen trao quyen nay cho nguoi khac
- Tu QuanLy, Trao quyen select, update, delete cho QuanLy tren bang DanhMucThuoc 
cua CSDL QLBanThuocTay
- Tu QuanLy, xoa quyen select cho NhanVien tren DanhMucThuoc
- Xoa login user NhanVien2
*/

exec sp_addlogin QuanLy, 123
exec sp_addlogin NhanVien, 123
exec sp_addlogin NhanVien2, 123

exec sp_adduser QuanLy, QuanLy
exec sp_adduser NhanVien, NhanVien
exec sp_adduser NhanVien2,NhanVien2

grant select, update, delete, insert on DanhMucThuoc to QuanLy with grant option

exec sp_droplogin NhanVien2
exec sp_dropuser NhanVien2

grant select, update on DanhMucThuoc to NhanVien

revoke select on DanhMucThuoc to NhanVien







