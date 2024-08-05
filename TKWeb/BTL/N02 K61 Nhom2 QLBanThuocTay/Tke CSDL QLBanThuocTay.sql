CREATE DATABASE QLBanThuocTay
USE QLBanThuocTay
GO
/****** Object:  Table [dbo].[[HoaDonBan]]    Script Date: 11/10/2021 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonBan](
	[MaHDB] [nvarchar](20) NOT NULL,
	[NgayBan] [datetime] NULL,
	[MaNV] [nvarchar](20) NOT NULL,
	[MaKhach] [nvarchar](20) NOT NULL,
	[TongTien] [int] NULL
 CONSTRAINT [PK_HoaDonBan] PRIMARY KEY CLUSTERED 
(
	[MaHDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[[KhachHang]]    Script Date: 11/10/2021 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhach] [nvarchar](20) NOT NULL,
	[TenKhach] [nvarchar](20) NOT NULL,
	[DiaChi] [nvarchar](20) NULL,
	[DienThoai] [nvarchar](20) NULL
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[[HoaDonNhap]]    Script Date: 11/10/2021 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TABLE [dbo].[HoaDonNhap](
	[MaHDN] [nvarchar](20) NOT NULL,
	[NgayNhap] [datetime] NULL,
	[MaNV] [nvarchar](10) NOT NULL,
	[MaNCC] [nvarchar](20) NOT NULL,
	[TongTien] [int] NULL
 CONSTRAINT [PK_HoaDonNhap] PRIMARY KEY CLUSTERED 
(
	[MaHDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[[CongDung]]    Script Date: 11/10/2021 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongDung](
	[MaCongDung] [nvarchar](20) NOT NULL,
	[TenCongDung] [nvarchar](20) NULL
 CONSTRAINT [PK_CongDung] PRIMARY KEY CLUSTERED 
(
	[MaCongDung] 
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[[ChiTietHDB]]    Script Date: 11/10/2021 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHDB](
	[MaHDB] [nvarchar](20) NOT NULL,
	[MaThuoc] [nvarchar](50) NOT NULL,
	[SoLuong] [nvarchar](150) NULL,
	[GiamGia] [nvarchar](15) NULL,
	[ThanhTien] [money] NULL,
 CONSTRAINT [PK_ChiTietHDB] PRIMARY KEY CLUSTERED 
(
	[MaHDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[[DanhMucThuoc]]    Script Date: 11/10/2021 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMucThuoc](
	[MaThuoc] [nvarchar](20) NOT NULL,
	[TenThuoc] [nvarchar](20) NULL,
	[MaDVT] [nvarchar](20) NOT NULL,
	[MaDangDC] [nvarchar](20) NOT NULL,
	[ThanhPhan] [nvarchar](20) NOT NULL,
	[DonGiaNhap] [money] NULL,
	[GiaBan] [money] NULL,
	[SLHienCo] [int],
	[NgaySX] [datetime] NULL,
	[MaNuocSX] [nvarchar](20) NOT NULL,
	[HanSD] [datetime] NULL,
	[ChongChiDinh] [nvarchar](20) NOT NULL,

 CONSTRAINT [PK_DanhMucThuoc] PRIMARY KEY CLUSTERED 
(
	[MaThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[[ChiTietHDN]]    Script Date: 11/10/2021 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHDN](
	[MaHDN] [nvarchar](20) NOT NULL,
	[MaThuoc] [nvarchar](50) NOT NULL,
	[SLNhap] [int],
	[DonGia] [money],
	[KhuyenMai] [nvarchar](10) NULL,
	[ThanhTien] [money] NULL,
 CONSTRAINT [PK_ChiTietHDN] PRIMARY KEY CLUSTERED 
(
	[MaHDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[[Thuoc_CongDung]]    Script Date: 11/10/2021 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Thuoc_CongDung](
	[MaThuoc] [nvarchar](50) NOT NULL,
	[MaCongDung] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](50) NULL
 CONSTRAINT [PK_Thuoc_CongDung] PRIMARY KEY CLUSTERED 
(
	[MaThuoc] 
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[[NhaCungCap]]    Script Date: 11/10/2021 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [nvarchar](20) NOT NULL,
	[TenNCC] [nvarchar](20) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](20) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[[NhanVien]]    Script Date: 11/10/2021 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nvarchar](10) NOT NULL,
	[TenNV] [nvarchar](100) NULL,
	[NgaySinh] [datetime] NULL,
	[GioiTinh] [nvarchar] (20) NULL,
	[DiaChi] [nvarchar] (50) NULL,
	[MaTrinhDo] [nvarchar](20) NOT NULL,
	[MaChuyenMon] [nvarchar](20) NOT NULL,
	[DienThoai] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[[DangDieuChe]]    Script Date: 11/10/2021 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangDieuChe](
	[MaDangDC] [nvarchar](20) NOT NULL,
	[TenDangDC] [nvarchar](20) NOT NULL,
	
 CONSTRAINT [PK_DangDieuChe] PRIMARY KEY CLUSTERED 
(
	[MaDangDC] 
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
/****** Object:  Table [dbo].[[TrinhDo]]    Script Date: 11/10/2021 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrinhDo](
	[MaTrinhDo] [nvarchar](20) NOT NULL,
	[TenTrinhDo] [nvarchar](20) NULL,
 CONSTRAINT [PK_TrinhDo] PRIMARY KEY CLUSTERED 
(
	[MaTrinhDo] 
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[[DonViTinh]]    Script Date: 11/10/2021 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonViTinh](
	[MaDVT] [nvarchar](20) NOT NULL,
	[TenDVT] [nvarchar](20) NULL,
 CONSTRAINT [PK_DonViTinh] PRIMARY KEY CLUSTERED 
(
	[MaDVT] 
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tSach]    Script Date: 11/10/2021 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NuocSanXuat](
	[MaNuocSX] [nvarchar](20) NOT NULL,
	[TenNuocSX] [nvarchar](20) NULL,
 CONSTRAINT [PK_NuocSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaNuocSX] 
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[[ChuyenMon]]    Script Date: 11/10/2021 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuyenMon](
	[MaChuyenMon] [nvarchar](20) NOT NULL,
	[TenChuyenMon] [nvarchar](20) NULL,
 CONSTRAINT [PK_ChuyenMon] PRIMARY KEY CLUSTERED 
(
	[MaChuyenMon] 
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

----------------------------

GO
INSERT [dbo].[TrinhDo] ([MaTrinhDo], [TenTrinhDo])
VALUES (N'DH', N'Đại học')
INSERT [dbo].[TrinhDo] ([MaTrinhDo], [TenTrinhDo])
VALUES (N'TS', N'Tiến sĩ')
INSERT [dbo].[TrinhDo] ([MaTrinhDo], [TenTrinhDo])
VALUES (N'CG', N'Chuyên gia')
INSERT [dbo].[TrinhDo] ([MaTrinhDo], [TenTrinhDo])
VALUES (N'KS', N'Kĩ sư')
INSERT [dbo].[TrinhDo] ([MaTrinhDo], [TenTrinhDo])
VALUES (N'CT', N'Cao thủ')
INSERT [dbo].[TrinhDo] ([MaTrinhDo], [TenTrinhDo])
VALUES (N'GS', N'Giáo sư')
INSERT [dbo].[TrinhDo] ([MaTrinhDo], [TenTrinhDo])
VALUES (N'CN', N'Cử nhân')
INSERT [dbo].[TrinhDo] ([MaTrinhDo], [TenTrinhDo])
VALUES (N'CD', N'Cao đẳng')
INSERT [dbo].[TrinhDo] ([MaTrinhDo], [TenTrinhDo])
VALUES (N'TC', N'Trung cấp')
INSERT [dbo].[TrinhDo] ([MaTrinhDo], [TenTrinhDo])
VALUES (N'PT', N'Phổ thông')
INSERT [dbo].[TrinhDo] ([MaTrinhDo], [TenTrinhDo])
VALUES (N'LDTD', N'Lao động tự do')
INSERT [dbo].[TrinhDo] ([MaTrinhDo], [TenTrinhDo])
VALUES (N'DS', N'Dược sĩ')

GO
INSERT [dbo].[ChuyenMon] ([MaChuyenMon], [TenChuyenMon])
VALUES (N'HTHoan', N'Hệ tuần hoàn')
INSERT [dbo].[ChuyenMon] ([MaChuyenMon], [TenChuyenMon])
VALUES (N'HHH', N'Hệ hô hấp')
INSERT [dbo].[ChuyenMon] ([MaChuyenMon], [TenChuyenMon])
VALUES (N'HTK', N'Hệ thần kinh')
INSERT [dbo].[ChuyenMon] ([MaChuyenMon], [TenChuyenMon])
VALUES (N'HVD', N'Hệ vận động')
INSERT [dbo].[ChuyenMon] ([MaChuyenMon], [TenChuyenMon])
VALUES (N'HTH', N'Hệ tiêu hóa')
INSERT [dbo].[ChuyenMon] ([MaChuyenMon], [TenChuyenMon])
VALUES (N'HNT', N'Hệ nội tiết')
INSERT [dbo].[ChuyenMon] ([MaChuyenMon], [TenChuyenMon])
VALUES (N'HBT', N'Hệ bài tiết')
INSERT [dbo].[ChuyenMon] ([MaChuyenMon], [TenChuyenMon])
VALUES (N'HSS', N'Hệ sinh sản')

GO
INSERT [dbo].[DonViTinh] ([MaDVT], [TenDVT])
VALUES (N'goi', N'Gói')
INSERT [dbo].[DonViTinh] ([MaDVT], [TenDVT])
VALUES (N'vien', N'Viên')
INSERT [dbo].[DonViTinh] ([MaDVT], [TenDVT])
VALUES (N'lo', N'Lọ')
INSERT [dbo].[DonViTinh] ([MaDVT], [TenDVT])
VALUES (N'hop', N'Hộp')
INSERT [dbo].[DonViTinh] ([MaDVT], [TenDVT])
VALUES (N'thung', N'Thùng')


GO
INSERT [dbo].[NuocSanXuat] ([MaNuocSX], [TenNuocSX])
VALUES (N'VN', N'Việt Nam')
INSERT [dbo].[NuocSanXuat] ([MaNuocSX], [TenNuocSX])
VALUES (N'UK', N'United Kingdom')
INSERT [dbo].[NuocSanXuat] ([MaNuocSX], [TenNuocSX])
VALUES (N'US', N'United States')
INSERT [dbo].[NuocSanXuat] ([MaNuocSX], [TenNuocSX])
VALUES (N'TQ', N'Trung Quốc')
INSERT [dbo].[NuocSanXuat] ([MaNuocSX], [TenNuocSX])
VALUES (N'Lao', N'Lào')
INSERT [dbo].[NuocSanXuat] ([MaNuocSX], [TenNuocSX])
VALUES (N'TL', N'Thái Lan')
INSERT [dbo].[NuocSanXuat] ([MaNuocSX], [TenNuocSX])
VALUES (N'JP', N'JaPan')
INSERT [dbo].[NuocSanXuat] ([MaNuocSX], [TenNuocSX])
VALUES (N'KR', N'Korea')
INSERT [dbo].[NuocSanXuat] ([MaNuocSX], [TenNuocSX])
VALUES (N'Bi', N'Bi')
INSERT [dbo].[NuocSanXuat] ([MaNuocSX], [TenNuocSX])
VALUES (N'CR7', N'Spain')


GO
INSERT [dbo].[DangDieuChe] ([MaDangDC], [TenDangDC])
VALUES (N'BN', N'Bột nhão')
INSERT [dbo].[DangDieuChe] ([MaDangDC], [TenDangDC])
VALUES (N'CT', N'Cao thuốc')
INSERT [dbo].[DangDieuChe] ([MaDangDC], [TenDangDC])
VALUES (N'CL', N'Cao lỏng')
INSERT [dbo].[DangDieuChe] ([MaDangDC], [TenDangDC])
VALUES (N'CM', N'Cao mềm')
INSERT [dbo].[DangDieuChe] ([MaDangDC], [TenDangDC])
VALUES (N'CK', N'Cao khô')
INSERT [dbo].[DangDieuChe] ([MaDangDC], [TenDangDC])
VALUES (N'CX', N'Cao xoa')
INSERT [dbo].[DangDieuChe] ([MaDangDC], [TenDangDC])
VALUES (N'ConThuoc', N'Cồn thuốc')
INSERT [dbo].[DangDieuChe] ([MaDangDC], [TenDangDC])
VALUES (N'DX', N'Dầu xoa')
INSERT [dbo].[DangDieuChe] ([MaDangDC], [TenDangDC])
VALUES (N'DDT', N'Dung dịch thuốc')
INSERT [dbo].[DangDieuChe] ([MaDangDC], [TenDangDC])
VALUES (N'DDU', N'Dung dịch uống')

GO
INSERT [dbo].[CongDung] ([MaCongDung], [TenCongDung])
VALUES (N'Gau', N'Giảm đau')
INSERT [dbo].[CongDung] ([MaCongDung], [TenCongDung])
VALUES (N'HTAN', N'Hỗ trợ ăn ngon')
INSERT [dbo].[CongDung] ([MaCongDung], [TenCongDung])
VALUES (N'TN', N'Thanh nhiệt')
INSERT [dbo].[CongDung] ([MaCongDung], [TenCongDung])
VALUES (N'GD', N'Giải độc')
INSERT [dbo].[CongDung] ([MaCongDung], [TenCongDung])
VALUES (N'GDom', N'Giảm đờm')
INSERT [dbo].[CongDung] ([MaCongDung], [TenCongDung])
VALUES (N'BTTD', N'Bổ thận tráng dương')
INSERT [dbo].[CongDung] ([MaCongDung], [TenCongDung])
VALUES (N'MS', N'Mờ sẹo')
INSERT [dbo].[CongDung] ([MaCongDung], [TenCongDung])
VALUES (N'NNM', N'Ngăn ngừa mụn')
INSERT [dbo].[CongDung] ([MaCongDung], [TenCongDung])
VALUES (N'GK', N'Giải khát')
INSERT [dbo].[CongDung] ([MaCongDung], [TenCongDung])
VALUES (N'CM', N'Cầm máu')

GO
INSERT [dbo].[Thuoc_CongDung] ([MaThuoc], [MaCongDung], [GhiChu])
VALUES (N'MT01', N'Giảm đau', N'Tránh tiếp xúc trực tiếp')
INSERT [dbo].[Thuoc_CongDung] ([MaThuoc], [MaCongDung], [GhiChu])
VALUES (N'MT02', N'Hỗ trợ ăn ngon', N'Ko dành cho trẻ em')
INSERT [dbo].[Thuoc_CongDung] ([MaThuoc], [MaCongDung], [GhiChu])
VALUES (N'MT03', N'Thanh nhiệt', N'Ko được để lọt vào tai, mũi, họng')
INSERT [dbo].[Thuoc_CongDung] ([MaThuoc], [MaCongDung], [GhiChu])
VALUES (N'MT04', N'Giải độc', N'Sản phẩm này ko phải là thuốc')
INSERT [dbo].[Thuoc_CongDung] ([MaThuoc], [MaCongDung], [GhiChu])
VALUES (N'MT05', N'Giảm đờm', N'Ko có tác dụng thay thế thuốc chữa bệnh')
INSERT [dbo].[Thuoc_CongDung] ([MaThuoc], [MaCongDung], [GhiChu])
VALUES (N'MT06', N'Bổ thận tráng dương', N'Ko được dùng quá liều')
INSERT [dbo].[Thuoc_CongDung] ([MaThuoc], [MaCongDung], [GhiChu])
VALUES (N'MT07', N'Mờ sẹo', N'Kiểm tra hạn sử dụng')
INSERT [dbo].[Thuoc_CongDung] ([MaThuoc], [MaCongDung], [GhiChu])
VALUES (N'MT08', N'Ngăn ngừa mụn', N'Ko sử dụng cho người mẫn cảm')
INSERT [dbo].[Thuoc_CongDung] ([MaThuoc], [MaCongDung], [GhiChu])
VALUES (N'MT09', N'Giải khát', N'Phụ nữ có thai cần lưu ý')
INSERT [dbo].[Thuoc_CongDung] ([MaThuoc], [MaCongDung], [GhiChu])
VALUES (N'MT10', N'Cầm máu', N'Đọc kĩ hướng dẫn sử dụng')

GO
INSERT [dbo].[KhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai])
VALUES (N'NV01', N'Trần Huy',  N'Hà Nội', N'0986868686')
INSERT [dbo].[KhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai])
VALUES (N'KH01', N'Nguyễn Đình Sơn', N'Bắc Ninh', N'0968686868')
INSERT [dbo].[KhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai])
VALUES (N'KH02', N'Đỗ Văn Bắc', N'Hải Dương', N'0905883993')
INSERT [dbo].[KhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai])
VALUES (N'KH03', N'Mạnh Thường Quân', N'Hải Phòng', N'0918688685')
INSERT [dbo].[KhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai])
VALUES (N'KH04', N'Mai Phương Lan', N'Hà Nội', N'0978656790')
INSERT [dbo].[KhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai])
VALUES (N'KH05', N'Nguyễn Thị Phương', N'Hà Nội', NULL)
INSERT [dbo].[KhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai])
VALUES (N'KH06', N'Trần Đăng Hưng', N'Ninh Bình', NULL)
INSERT [dbo].[KhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai])
VALUES (N'KH07', N'Hoàng Thị Hồng', N'Thái Nguyên', NULL)
INSERT [dbo].[KhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai])
VALUES (N'KH08', N'Cẩm Thị Hương', N'TP HCM', NULL)
INSERT [dbo].[KhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai])
VALUES (N'Kh09', N'Mai Văn Hùng', N'Phú Thọ', NULL)
INSERT [dbo].[KhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai])
VALUES (N'KH10', N'Lò Văn Tèo', N'Thanh Thần', NULL)


GO
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [MaTrinhDo], [MaChuyenMon], [DienThoai])
VALUES (N'NV01', N'Trần Huy',CAST(N'1990-09-11T00:00:00.000' AS DateTime), N'Nam' , N'Hà Nội',N'TS', N'HTHoan', N'0986868686')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [MaTrinhDo], [MaChuyenMon], [DienThoai])
VALUES (N'NV02', N'Thanh Tâm',CAST(N'1986-01-12T00:00:00.000' AS DateTime), N'Nữ' , N'Bắc Ninh',N'CD', N'HHH', N'0979657676')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [MaTrinhDo], [MaChuyenMon], [DienThoai])
VALUES (N'NV03', N'Nguyễn Minh',CAST(N'1989-07-05T00:00:00.000' AS DateTime), N'Nam' , N'Hải Dương',N'DH', N'HVD', N'0968145689')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [MaTrinhDo], [MaChuyenMon], [DienThoai])
VALUES (N'NV04', N'Phan Cao',CAST(N'1991-08-12T00:00:00.000' AS DateTime), N'Nam' , N'Ninh Bình',N'TS', N'HTK', N'0985143235')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [MaTrinhDo], [MaChuyenMon], [DienThoai])
VALUES (N'NV05', N'Bùi Ngọc',CAST(N'1987-03-01T00:00:00.000' AS DateTime), N'Nữ' , N'Thái Bình',N'DS', N'HTH', N'0918167892')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [MaTrinhDo], [MaChuyenMon], [DienThoai])
VALUES (N'NV06', N'Nguyễn Hoàng',CAST(N'1990-04-04T00:00:00.000' AS DateTime), N'Nam' , N'Nam Định',N'GS', N'HTH', N'0962091660')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [MaTrinhDo], [MaChuyenMon], [DienThoai])
VALUES (N'NV07', 'Nguyễn Hải',CAST(N'1994-05-05T00:00:00.000' AS DateTime), N'Nam' , N'Hà Nội',N'TC', N'HNT', N'0962091666')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [MaTrinhDo], [MaChuyenMon], [DienThoai])
VALUES (N'NV08', N'Đỗ Thảo',CAST(N'1990-06-06T00:00:00.000' AS DateTime), N'Nữ' , N'Hà Nội',N'CG', N'HBT', N'0962099666')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [MaTrinhDo], [MaChuyenMon], [DienThoai])
VALUES (N'NV09', N'Đỗ Thảo Phương',CAST(N'1990-07-07T00:00:00.000' AS DateTime), N'Nữ' , N'Hà Nội',N'CT', N'HSS', N'0966666666')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [MaTrinhDo], [MaChuyenMon], [DienThoai])
VALUES (N'NV10', N'Đỗ Huy Long',CAST(N'1995-08-08T00:00:00.000' AS DateTime), N'Nữ' , N'Nam Định',N'PT', N'HSS', N'0983646585')


GO
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaThuoc], [SoLuong], [GiamGia], [ThanhTien])
VALUES (N'HDB01', N'MT01', 1, NULL, 110000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaThuoc], [SoLuong], [GiamGia], [ThanhTien])
VALUES (N'HDB02', N'MT02', 2, NULL, 220000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaThuoc], [SoLuong], [GiamGia], [ThanhTien])
VALUES (N'HDB03', N'MT03', 3, NULL, 330000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaThuoc], [SoLuong], [GiamGia], [ThanhTien])
VALUES (N'HDB04', N'MT04', 4, NULL, 440000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaThuoc], [SoLuong], [GiamGia], [ThanhTien])
VALUES (N'HDB05', N'MT05', 5, NULL, 550000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaThuoc], [SoLuong], [GiamGia], [ThanhTien])
VALUES (N'HDB06', N'MT06', 6, NULL, 660000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaThuoc], [SoLuong], [GiamGia], [ThanhTien])
VALUES (N'HDB07', N'MT07', 7, NULL, 770000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaThuoc], [SoLuong], [GiamGia], [ThanhTien])
VALUES (N'HDB08', N'MT08', 8, NULL, 880000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaThuoc], [SoLuong], [GiamGia], [ThanhTien])
VALUES (N'HDB09', N'MT09', 9, NULL, 990000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaThuoc], [SoLuong], [GiamGia], [ThanhTien])
VALUES (N'HDB10', N'MT10', 10, NULL, 1100000)

GO
INSERT [dbo].[DanhMucThuoc] ([MaThuoc], [TenThuoc], [MaDVT], [MaDangDC], [ThanhPhan], [DonGiaNhap], [GiaBan], [SLHienCo], [NgaySX], [MaNuocSX], [HanSD], [ChongChiDinh])
VALUES (N'MT01', N'Garen', N'goi', N'BN', N'MaVuSongKiem', 100000, 110000, 120, CAST(N'1980-01-08T00:00:00.000'
AS DateTime), N'VN', CAST(N'1990-01-01T00:00:00.000' AS DateTime), N'ko')
INSERT [dbo].[DanhMucThuoc] ([MaThuoc], [TenThuoc], [MaDVT], [MaDangDC], [ThanhPhan], [DonGiaNhap], [GiaBan], [SLHienCo], [NgaySX], [MaNuocSX], [HanSD], [ChongChiDinh])
VALUES (N'MT02', N'Taliyah', N'vien', N'CT', N'DaiBacLienThanh', 200000, 220000, 130, CAST(N'1981-02-08T00:00:00.000'
AS DateTime), N'UK', CAST(N'1991-02-02T00:00:00.000' AS DateTime), N'ko')
INSERT [dbo].[DanhMucThuoc] ([MaThuoc], [TenThuoc], [MaDVT], [MaDangDC], [ThanhPhan], [DonGiaNhap], [GiaBan], [SLHienCo], [NgaySX], [MaNuocSX], [HanSD], [ChongChiDinh])
VALUES (N'MT03', N'Aatrox', N'lo', N'CL', N'CuongCung', 300000, 330000, 140, CAST(N'1982-03-08T00:00:00.000'
AS DateTime), N'VN', CAST(N'1992-03-03T00:00:00.000' AS DateTime), N'ko')
INSERT [dbo].[DanhMucThuoc] ([MaThuoc], [TenThuoc], [MaDVT], [MaDangDC], [ThanhPhan], [DonGiaNhap], [GiaBan], [SLHienCo], [NgaySX], [MaNuocSX], [HanSD], [ChongChiDinh])
VALUES (N'MT04', N'Malphite', N'hop', N'CM', N'VongAm', 400000, 440000, 150, CAST(N'1983-04-08T00:00:00.000'
AS DateTime), N'TQ', CAST(N'1993-04-04T00:00:00.000' AS DateTime), N'ko')
INSERT [dbo].[DanhMucThuoc] ([MaThuoc], [TenThuoc], [MaDVT], [MaDangDC], [ThanhPhan], [DonGiaNhap], [GiaBan], [SLHienCo], [NgaySX], [MaNuocSX], [HanSD], [ChongChiDinh])
VALUES (N'MT05', N'Rumble', N'thung', N'CK', N'MatNaThongKho', 500000, 550000, 160, CAST(N'1984-05-08T00:00:00.000'
AS DateTime), N'Lao', CAST(N'1994-05-05T00:00:00.000' AS DateTime), N'ko')
INSERT [dbo].[DanhMucThuoc] ([MaThuoc], [TenThuoc], [MaDVT], [MaDangDC], [ThanhPhan], [DonGiaNhap], [GiaBan], [SLHienCo], [NgaySX], [MaNuocSX], [HanSD], [ChongChiDinh])
VALUES (N'MT06', N'Lucian', N'goi', N'CX', N'TamHopKiem', 600000, 660000, 170, CAST(N'1985-06-08T00:00:00.000'
AS DateTime), N'TL', CAST(N'1995-06-06T00:00:00.000' AS DateTime), N'ko')
INSERT [dbo].[DanhMucThuoc] ([MaThuoc], [TenThuoc], [MaDVT], [MaDangDC], [ThanhPhan], [DonGiaNhap], [GiaBan], [SLHienCo], [NgaySX], [MaNuocSX], [HanSD], [ChongChiDinh])
VALUES (N'MT07', N'Yasuo', N'vien', N'ConThuoc', N'BuaRiuSatThan', 700000, 770000, 180, CAST(N'1986-07-08T00:00:00.000'
AS DateTime), N'JP', CAST(N'1996-07-07T00:00:00.000' AS DateTime), N'ko')
INSERT [dbo].[DanhMucThuoc] ([MaThuoc], [TenThuoc], [MaDVT], [MaDangDC], [ThanhPhan], [DonGiaNhap], [GiaBan], [SLHienCo], [NgaySX], [MaNuocSX], [HanSD], [ChongChiDinh])
VALUES (N'MT08', N'Zac', N'lo', N'DauXoa', N'NguyetDao', 800000, 880000, 190, CAST(N'1987-08-08T00:00:00.000'
AS DateTime), N'KR', CAST(N'1997-08-08T00:00:00.000' AS DateTime), N'ko')
INSERT [dbo].[DanhMucThuoc] ([MaThuoc], [TenThuoc], [MaDVT], [MaDangDC], [ThanhPhan], [DonGiaNhap], [GiaBan], [SLHienCo], [NgaySX], [MaNuocSX], [HanSD], [ChongChiDinh])
VALUES (N'MT09', N'Kayn', N'hop', N'DungDichThuoc', N'VuDieuTuThan', 900000, 990000, 200, CAST(N'1988-09-08T00:00:00.000'
AS DateTime), N'BI', CAST(N'1998-09-09T00:00:00.000' AS DateTime), N'ko')
INSERT [dbo].[DanhMucThuoc] ([MaThuoc], [TenThuoc], [MaDVT], [MaDangDC], [ThanhPhan], [DonGiaNhap], [GiaBan], [SLHienCo], [NgaySX], [MaNuocSX], [HanSD], [ChongChiDinh])
VALUES (N'MT10', N'Hecarim', N'thung', N'DungDichUong', N'GiapLietSi', 1000000, 1100000, 210, CAST(N'1989-10-08T00:00:00.000'
AS DateTime), N'CR7', CAST(N'1999-10-10T00:00:00.000' AS DateTime), N'ko')

GO
INSERT [dbo].[HoaDonNhap] ([MaHDN], [NgayNhap], [MaNV], [MaNCC], [TongTien]) 
VALUES (N'HDN01', CAST(N'2010-04-13T00:00:00.000' AS DateTime), N'NV01', N'NCC01',100000)
INSERT [dbo].[HoaDonNhap] ([MaHDN], [NgayNhap], [MaNV], [MaNCC], [TongTien]) 
VALUES (N'HDN02', CAST(N'2011-05-14T00:00:00.000' AS DateTime), N'NV02', N'NCC02',200000)
INSERT [dbo].[HoaDonNhap] ([MaHDN], [NgayNhap], [MaNV], [MaNCC], [TongTien]) 
VALUES (N'HDN03', CAST(N'2012-06-15T00:00:00.000' AS DateTime), N'NV03', N'NCC03',300000)
INSERT [dbo].[HoaDonNhap] ([MaHDN], [NgayNhap], [MaNV], [MaNCC], [TongTien]) 
VALUES (N'HDN04', CAST(N'2013-07-16T00:00:00.000' AS DateTime), N'NV04', N'NCC04',400000)
INSERT [dbo].[HoaDonNhap] ([MaHDN], [NgayNhap], [MaNV], [MaNCC], [TongTien]) 
VALUES (N'HDN05', CAST(N'2014-08-17T00:00:00.000' AS DateTime), N'NV05', N'NCC05',500000)
INSERT [dbo].[HoaDonNhap] ([MaHDN], [NgayNhap], [MaNV], [MaNCC], [TongTien]) 
VALUES (N'HDN06', CAST(N'2015-09-18T00:00:00.000' AS DateTime), N'NV06', N'NCC06',600000)
INSERT [dbo].[HoaDonNhap] ([MaHDN], [NgayNhap], [MaNV], [MaNCC], [TongTien]) 
VALUES (N'HDN07', CAST(N'2016-10-19T00:00:00.000' AS DateTime), N'NV07', N'NCC07',700000)
INSERT [dbo].[HoaDonNhap] ([MaHDN], [NgayNhap], [MaNV], [MaNCC], [TongTien]) 
VALUES (N'HDN08', CAST(N'2017-11-20T00:00:00.000' AS DateTime), N'NV08', N'NCC08',800000)
INSERT [dbo].[HoaDonNhap] ([MaHDN], [NgayNhap], [MaNV], [MaNCC], [TongTien]) 
VALUES (N'HDN09', CAST(N'2018-12-21T00:00:00.000' AS DateTime), N'NV09', N'NCC09',900000)
INSERT [dbo].[HoaDonNhap] ([MaHDN], [NgayNhap], [MaNV], [MaNCC], [TongTien]) 
VALUES (N'HDN10', CAST(N'2019-02-22T00:00:00.000' AS DateTime), N'NV10', N'NCC10',1000000)

GO
INSERT [dbo].[HoaDonBan] ([MaHDB], [NgayBan], [MaNV], [MaKhach],[TongTien])
VALUES (N'HDB01', CAST(N'2011-03-11T00:00:00.000' AS DateTime), N'NV01', N'KH01',110000)
INSERT [dbo].[HoaDonBan] ([MaHDB], [NgayBan], [MaNV], [MaKhach],[TongTien])
VALUES (N'HDB02', CAST(N'2012-04-12T00:00:00.000' AS DateTime), N'NV02', N'KH02',220000)
INSERT [dbo].[HoaDonBan] ([MaHDB], [NgayBan], [MaNV], [MaKhach],[TongTien])
VALUES (N'HDB03', CAST(N'2013-05-13T00:00:00.000' AS DateTime), N'NV03', N'KH03',330000)
INSERT [dbo].[HoaDonBan] ([MaHDB], [NgayBan], [MaNV], [MaKhach],[TongTien])
VALUES (N'HDB04', CAST(N'2014-06-14T00:00:00.000' AS DateTime), N'NV04', N'KH04',440000)
INSERT [dbo].[HoaDonBan] ([MaHDB], [NgayBan], [MaNV], [MaKhach],[TongTien])
VALUES (N'HDB05', CAST(N'2015-07-15T00:00:00.000' AS DateTime), N'NV05', N'KH05',550000)
INSERT [dbo].[HoaDonBan] ([MaHDB], [NgayBan], [MaNV], [MaKhach],[TongTien])
VALUES (N'HDB06', CAST(N'2016-08-16T00:00:00.000' AS DateTime), N'NV06', N'KH06',660000)
INSERT [dbo].[HoaDonBan] ([MaHDB], [NgayBan], [MaNV], [MaKhach],[TongTien])
VALUES (N'HDB07', CAST(N'2017-09-17T00:00:00.000' AS DateTime), N'NV07', N'KH07',770000)
INSERT [dbo].[HoaDonBan] ([MaHDB], [NgayBan], [MaNV], [MaKhach],[TongTien])
VALUES (N'HDB08', CAST(N'2018-10-18T00:00:00.000' AS DateTime), N'NV08', N'KH08',880000)
INSERT [dbo].[HoaDonBan] ([MaHDB], [NgayBan], [MaNV], [MaKhach],[TongTien])
VALUES (N'HDB09', CAST(N'2019-11-19T00:00:00.000' AS DateTime), N'NV09', N'KH09',990000)
INSERT [dbo].[HoaDonBan] ([MaHDB], [NgayBan], [MaNV], [MaKhach],[TongTien])
VALUES (N'HDB10', CAST(N'2020-12-20T00:00:00.000' AS DateTime), N'NV10', N'KH10',1100000)

GO
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaThuoc], [SLNhap], [DonGia], [KhuyenMai], [ThanhTien])
VALUES (N'HDN01', N'S01', 7, 1, NULL, 100000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaThuoc], [SLNhap], [DonGia], [KhuyenMai], [ThanhTien])
VALUES (N'HDN02', N'S02', 7, 1, NULL, 200000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaThuoc], [SLNhap], [DonGia], [KhuyenMai], [ThanhTien])
VALUES (N'HDN03', N'S03', 7, 1, NULL, 300000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaThuoc], [SLNhap], [DonGia], [KhuyenMai], [ThanhTien])
VALUES (N'HDN04', N'S04', 7, 1, NULL, 400000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaThuoc], [SLNhap], [DonGia], [KhuyenMai], [ThanhTien])
VALUES (N'HDN05', N'S05', 7, 1, NULL, 500000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaThuoc], [SLNhap], [DonGia], [KhuyenMai], [ThanhTien])
VALUES (N'HDN06', N'S06', 7, 1, NULL, 600000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaThuoc], [SLNhap], [DonGia], [KhuyenMai], [ThanhTien])
VALUES (N'HDN07', N'S07', 7, 1, NULL, 700000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaThuoc], [SLNhap], [DonGia], [KhuyenMai], [ThanhTien])
VALUES (N'HDN08', N'S08', 7, 1, NULL, 800000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaThuoc], [SLNhap], [DonGia], [KhuyenMai], [ThanhTien])
VALUES (N'HDN09', N'S09', 7, 1, NULL, 900000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaThuoc], [SLNhap], [DonGia], [KhuyenMai], [ThanhTien])
VALUES (N'HDN10', N'S10', 7, 1, NULL, 1000000)

INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC01', N'Bách Việt', N'Hà Nội', N'1111111111')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC02', N'NXB Trẻ', N'Hà Tây', N'2222222222')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC03', N'Phú Hà book', N'Hà Nam', N'3333333333')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC04', N'Alphabooks', N'Hà Giang', N'4444444444')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC05', N'TGM Books', N'Hà Nam', N'5555555555')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC06', N'Thái Hà', N'Hà Bắc', N'6666666666')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC07', N'Thái Thịnh', N'Thanh Thần', N'7777777777')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC08', N'Trung Tự', N'Xóm Lý', N'8888888888')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC09', N'Tây Sơn', N'Xóm Tây', N'9999999999')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC10', N'Đống Đa', N'Xóm Cõi', N'0000000000')

------------------------------------------------------------

GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ChuyenMon] FOREIGN KEY([MaChuyenMon])
REFERENCES [dbo].[ChuyenMon] ([MaChuyenMon])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_ChuyenMon]

GO
ALTER TABLE [dbo].[DanhMucThuoc]  WITH CHECK ADD CONSTRAINT [FK_DanhMucThuoc_DangDieuChe] FOREIGN KEY([MaDangDieuChe])
REFERENCES [dbo].[DangDieuChe] ([MaDangDieuChe])
GO
ALTER TABLE [dbo].[DanhMucThuoc] CHECK CONSTRAINT [FK_DanhMucThuoc_DangDieuChe]

GO
ALTER TABLE [dbo].[ChiTietHDN]  WITH CHECK ADD CONSTRAINT [FK_ChiTietHDN_Thuoc_CongDung] FOREIGN KEY([MaThuoc])
REFERENCES [dbo].[Thuoc_CongDung] ([MaThuoc])
GO
ALTER TABLE [dbo].[ChiTietHDN] CHECK CONSTRAINT [FK_ChiTietHDN_Thuoc_CongDung]

GO
ALTER TABLE [dbo].[ChiTietHDB]  WITH CHECK ADD CONSTRAINT [FK_ChiTietHDB_Thuoc_CongDung] FOREIGN KEY([MaThuoc])
REFERENCES [dbo].[Thuoc_CongDung] ([MaThuoc])
GO
ALTER TABLE [dbo].[ChiTietHDB] CHECK CONSTRAINT [FK_ChiTietHDB_Thuoc_CongDung]

GO
ALTER TABLE [dbo].[DanhMucThuoc]  WITH CHECK ADD CONSTRAINT [FK_DanhMucThuoc_DonViTinh] FOREIGN KEY([MaDVT])
REFERENCES [dbo].[DonViTinh] ([MaDonViTinh])
GO
ALTER TABLE [dbo].[DanhMucThuoc] CHECK CONSTRAINT [FK_DanhMucThuoc_DonViTinh]

GO
ALTER TABLE [dbo].[Thuoc_CongDung]  WITH CHECK ADD CONSTRAINT [FK_Thuoc_CongDung_CongDung] FOREIGN KEY([MaCongDung])
REFERENCES [dbo].[CongDung] ([MaCongDung])
GO
ALTER TABLE [dbo].[Thuoc_CongDung] CHECK CONSTRAINT [FK_Thuoc_CongDung_CongDung]

GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD CONSTRAINT [FK_HoaDonBan_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDonBan] CHECK CONSTRAINT [FK_HoaDonBan_NhanVien]

GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD CONSTRAINT [FK_HoaDonBan_KhachHang] FOREIGN KEY([MaKhach])
REFERENCES [dbo].[KhachHang] ([MaKhach])
GO
ALTER TABLE [dbo].[HoaDonBan] CHECK CONSTRAINT [FK_HoaDonBan_KhachHang]

GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD CONSTRAINT [FK_HoaDonNhap_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDonNhap] CHECK CONSTRAINT [FK_HoaDonNhap_NhanVien]

GO
ALTER TABLE [dbo].[DanhMucThuoc]  WITH CHECK ADD CONSTRAINT [FK_DanhMucThuoc_NuocSanXuat] FOREIGN KEY([MaNuocSX])
REFERENCES [dbo].[NuocSanXuat] ([MaNuocSX])
GO
ALTER TABLE [dbo].[DanhMucThuoc] CHECK CONSTRAINT [FK_DanhMucThuoc_NuocSanXuat]

GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD CONSTRAINT [FK_HoaDonNhap_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[HoaDonNhap] CHECK CONSTRAINT [FK_HoaDonNhap_NhaCungCap]

GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD CONSTRAINT [FK_NhanVien_TrinhDo] FOREIGN KEY([MaTrinhDo])
REFERENCES [dbo].[TrinhDo] ([MaTrinhDo])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_TrinhDo]

------------------------------------------------------------
