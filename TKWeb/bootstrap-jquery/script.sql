CREATE DATABASE QuanLyCuaHangThuoc
GO
USE [QuanLyCuaHangThuoc]
GO
/****** Object:  Table [dbo].[tBenhNhan]    Script Date: 10/31/2022 6:34:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tBenhNhan](
	[MaBenhNhan] [nvarchar](10) NOT NULL,
	[TenBenhNhan] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](150) NULL,
	[DienThoai] [nvarchar](15) NULL,
 CONSTRAINT [PK_tBenhNhan] PRIMARY KEY CLUSTERED 
(
	[MaBenhNhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tChiTietHDB]    Script Date: 10/31/2022 6:34:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tChiTietHDB](
	[SoHDB] [nvarchar](10) NOT NULL,
	[MaThuoc] [nvarchar](10) NOT NULL,
	[SLBan] [int] NULL,
 CONSTRAINT [PK_tChiTietHDB] PRIMARY KEY CLUSTERED 
(
	[SoHDB] ASC,
	[MaThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tChiTietHDN]    Script Date: 10/31/2022 6:34:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tChiTietHDN](
	[SoHDN] [nvarchar](10) NOT NULL,
	[MaThuoc] [nvarchar](10) NOT NULL,
	[SLNhap] [int] NULL,
 CONSTRAINT [PK_tChiTietHDN] PRIMARY KEY CLUSTERED 
(
	[SoHDN] ASC,
	[MaThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tDuocSi]    Script Date: 10/31/2022 6:34:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tDuocSi](
	[MaDuocSi] [nvarchar](10) NOT NULL,
	[TenDuocSi] [nvarchar](50) NULL,
	[BangCap] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](5) NULL,
	[NgaySinh] [datetime] NULL,
	[DiaChi] [nvarchar](150) NULL,
	[DienThoai] [nvarchar](15) NULL,
 CONSTRAINT [PK_tDuocSi] PRIMARY KEY CLUSTERED 
(
	[MaDuocSi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tHoaDonBan]    Script Date: 10/31/2022 6:34:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tHoaDonBan](
	[SoHDB] [nvarchar](10) NOT NULL,
	[MaDuocSi] [nvarchar](10) NULL,
	[NgayBan] [datetime] NULL,
	[CongDung] [nvarchar](255) NULL,
	[MaBenhNhan] [nvarchar](10) NULL,
 CONSTRAINT [PK_tHoaDonBan] PRIMARY KEY CLUSTERED 
(
	[SoHDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tHoaDonNhap]    Script Date: 10/31/2022 6:34:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tHoaDonNhap](
	[SoHDN] [nvarchar](10) NOT NULL,
	[MaDuocSi] [nvarchar](10) NULL,
	[NgayNhap] [datetime] NULL,
	[MaNCC] [nvarchar](10) NULL,
 CONSTRAINT [PK_tHoaDonNhap] PRIMARY KEY CLUSTERED 
(
	[SoHDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tLoaiThuoc]    Script Date: 10/31/2022 6:34:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tLoaiThuoc](
	[MaLoaiThuoc] [nvarchar](10) NOT NULL,
	[TenLoaiThuoc] [nvarchar](150) NULL,
 CONSTRAINT [PK_tLoaiThuoc] PRIMARY KEY CLUSTERED 
(
	[MaLoaiThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tNhaCungCap]    Script Date: 10/31/2022 6:34:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tNhaCungCap](
	[MaNCC] [nvarchar](10) NOT NULL,
	[TenNCC] [nvarchar](50) NULL,
 CONSTRAINT [PK_tNhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tNhaSanXuat]    Script Date: 10/31/2022 6:34:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tNhaSanXuat](
	[MaNSX] [nvarchar](10) NOT NULL,
	[TenNSX] [nvarchar](150) NULL,
 CONSTRAINT [PK_tNhaSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tThuoc]    Script Date: 10/31/2022 6:34:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tThuoc](
	[MaThuoc] [nvarchar](10) NOT NULL,
	[TenThuoc] [nvarchar](200) NULL,
	[DonGiaNhap] [money] NULL,
	[DonGiaBan] [money] NULL,
	[HanSuDung] [int] NULL,
	[SoLuong] [int] NULL,
	[DonViTinh] [nvarchar](15) NULL,
	[MaLoaiThuoc] [nvarchar](10) NULL,
	[MaNSX] [nvarchar](10) NULL,
 CONSTRAINT [PK_tThuoc] PRIMARY KEY CLUSTERED 
(
	[MaThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tChiTietHDB]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietHDB_tHoaDonBan] FOREIGN KEY([SoHDB])
REFERENCES [dbo].[tHoaDonBan] ([SoHDB])
GO
ALTER TABLE [dbo].[tChiTietHDB] CHECK CONSTRAINT [FK_tChiTietHDB_tHoaDonBan]
GO
ALTER TABLE [dbo].[tChiTietHDB]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietHDB_tThuoc] FOREIGN KEY([MaThuoc])
REFERENCES [dbo].[tThuoc] ([MaThuoc])
GO
ALTER TABLE [dbo].[tChiTietHDB] CHECK CONSTRAINT [FK_tChiTietHDB_tThuoc]
GO
ALTER TABLE [dbo].[tChiTietHDN]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietHDN_tHoaDonNhap] FOREIGN KEY([SoHDN])
REFERENCES [dbo].[tHoaDonNhap] ([SoHDN])
GO
ALTER TABLE [dbo].[tChiTietHDN] CHECK CONSTRAINT [FK_tChiTietHDN_tHoaDonNhap]
GO
ALTER TABLE [dbo].[tChiTietHDN]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietHDN_tThuoc] FOREIGN KEY([MaThuoc])
REFERENCES [dbo].[tThuoc] ([MaThuoc])
GO
ALTER TABLE [dbo].[tChiTietHDN] CHECK CONSTRAINT [FK_tChiTietHDN_tThuoc]
GO
ALTER TABLE [dbo].[tHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_tHoaDonBan_tBenhNhan] FOREIGN KEY([MaBenhNhan])
REFERENCES [dbo].[tBenhNhan] ([MaBenhNhan])
GO
ALTER TABLE [dbo].[tHoaDonBan] CHECK CONSTRAINT [FK_tHoaDonBan_tBenhNhan]
GO
ALTER TABLE [dbo].[tHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_tHoaDonBan_tDuocSi] FOREIGN KEY([MaDuocSi])
REFERENCES [dbo].[tDuocSi] ([MaDuocSi])
GO
ALTER TABLE [dbo].[tHoaDonBan] CHECK CONSTRAINT [FK_tHoaDonBan_tDuocSi]
GO
ALTER TABLE [dbo].[tHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_tHoaDonNhap_tDuocSi] FOREIGN KEY([MaDuocSi])
REFERENCES [dbo].[tDuocSi] ([MaDuocSi])
GO
ALTER TABLE [dbo].[tHoaDonNhap] CHECK CONSTRAINT [FK_tHoaDonNhap_tDuocSi]
GO
ALTER TABLE [dbo].[tHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_tHoaDonNhap_tNhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[tNhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[tHoaDonNhap] CHECK CONSTRAINT [FK_tHoaDonNhap_tNhaCungCap]
GO
ALTER TABLE [dbo].[tThuoc]  WITH CHECK ADD  CONSTRAINT [FK_tThuoc_tLoaiThuoc] FOREIGN KEY([MaLoaiThuoc])
REFERENCES [dbo].[tLoaiThuoc] ([MaLoaiThuoc])
GO
ALTER TABLE [dbo].[tThuoc] CHECK CONSTRAINT [FK_tThuoc_tLoaiThuoc]
GO
ALTER TABLE [dbo].[tThuoc]  WITH CHECK ADD  CONSTRAINT [FK_tThuoc_tNhaSanXuat] FOREIGN KEY([MaNSX])
REFERENCES [dbo].[tNhaSanXuat] ([MaNSX])
GO
ALTER TABLE [dbo].[tThuoc] CHECK CONSTRAINT [FK_tThuoc_tNhaSanXuat]
GO


-- INSERT DATA
GO
INSERT [dbo].[tDuocSi] ([MaDuocSi], [TenDuocSi], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'DS01', N'Lê Huy', N'Nam', CAST(N'1990-09-11T00:00:00.000' AS DateTime), N'Hà Nội', N'0986868686')
INSERT [dbo].[tDuocSi] ([MaDuocSi], [TenDuocSi], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'DS02', N'Đào Thanh Tâm', N'Nữ', CAST(N'1986-01-12T00:00:00.000' AS DateTime), N'Bắc Ninh', N'0979657676')
INSERT [dbo].[tDuocSi] ([MaDuocSi], [TenDuocSi], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'DS03', N'Nguyễn Minh Ngọc', N'Nam', CAST(N'1989-07-05T00:00:00.000' AS DateTime), N'Hải Dương', N'0968145689')
INSERT [dbo].[tDuocSi] ([MaDuocSi], [TenDuocSi], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'DS04', N'Phan Nam Cao', N'Nam', CAST(N'1991-08-12T00:00:00.000' AS DateTime), N'Ninh Bình', N'0985143235')
INSERT [dbo].[tDuocSi] ([MaDuocSi], [TenDuocSi], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'DS05', N'Bùi Ngọc Trinh', N'Nữ', CAST(N'1987-03-01T00:00:00.000' AS DateTime), N'Thái Bình', N'0918167892')
INSERT [dbo].[tDuocSi] ([MaDuocSi], [TenDuocSi], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'DS06', N'Nguyễn Hoàng Hải', N'Nam', CAST(N'1990-04-04T00:00:00.000' AS DateTime), N'Nam Định', N'0962091660')
INSERT [dbo].[tDuocSi] ([MaDuocSi], [TenDuocSi], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'DS07', N'Nguyễn Hải Hoàng', N'Nam', CAST(N'1994-05-05T00:00:00.000' AS DateTime), N'Hà Nội', N'0962091666')
INSERT [dbo].[tDuocSi] ([MaDuocSi], [TenDuocSi], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'DS08', N'Đỗ Thảo Hà', N'Nữ', CAST(N'1990-06-06T00:00:00.000' AS DateTime), N'Hà Nội', N'0962099666')
INSERT [dbo].[tDuocSi] ([MaDuocSi], [TenDuocSi], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'DS09', N'Đỗ Thảo Phương', N'Nữ', CAST(N'1990-07-07T00:00:00.000' AS DateTime), N'Hà Nội', N'0966666666')
INSERT [dbo].[tDuocSi] ([MaDuocSi], [TenDuocSi], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'DS10', N'Đỗ Huy Lực', N'Nam', CAST(N'1995-08-08T00:00:00.000' AS DateTime), N'Nam Định', N'0983646585')
GO
INSERT [dbo].[tBenhNhan] ([MaBenhNhan], [TenBenhNhan], [DiaChi], [DienThoai]) VALUES (N'BN01', N'Trịnh Đình Sơn', N'Phú Thọ', N'0968686868')
INSERT [dbo].[tBenhNhan] ([MaBenhNhan], [TenBenhNhan], [DiaChi], [DienThoai]) VALUES (N'BN02', N'Đỗ Hoàng Văn Bắc', N'Yên Bái', N'0905883993')
INSERT [dbo].[tBenhNhan] ([MaBenhNhan], [TenBenhNhan], [DiaChi], [DienThoai]) VALUES (N'BN03', N'Mạnh Thường Quân', N'Hải Dương', N'0918688685')
INSERT [dbo].[tBenhNhan] ([MaBenhNhan], [TenBenhNhan], [DiaChi], [DienThoai]) VALUES (N'BN04', N'Mai Thị Lan Phương', N'Hà Nội', N'0978656790')
INSERT [dbo].[tBenhNhan] ([MaBenhNhan], [TenBenhNhan], [DiaChi], [DienThoai]) VALUES (N'BN05', N'Nguyễn Thị Phương', N'Hà Nội', NULL)
INSERT [dbo].[tBenhNhan] ([MaBenhNhan], [TenBenhNhan], [DiaChi], [DienThoai]) VALUES (N'BN06', N'Vũ Đăng Hưng', N'Ninh Bình', NULL)
INSERT [dbo].[tBenhNhan] ([MaBenhNhan], [TenBenhNhan], [DiaChi], [DienThoai]) VALUES (N'BN07', N'Hoàng Thị Hồng Ngân', N'Thái Nguyên', NULL)
INSERT [dbo].[tBenhNhan] ([MaBenhNhan], [TenBenhNhan], [DiaChi], [DienThoai]) VALUES (N'BN08', N'Cẩm Tú Đào', N'TP HCM', NULL)
INSERT [dbo].[tBenhNhan] ([MaBenhNhan], [TenBenhNhan], [DiaChi], [DienThoai]) VALUES (N'BN09', N'Mai Thị Tuyết', N'Bình Dương', NULL)
GO
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC]) VALUES (N'NCC01', N'Mediphar USA')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC]) VALUES (N'NCC02', N'Traphaco')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC]) VALUES (N'NCC03', N'Dược Hậu Giang')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC]) VALUES (N'NCC04', N'Dược phẩm Hà Tây')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC]) VALUES (N'NCC05', N'Hóa dược phẩm Mekophar')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC]) VALUES (N'NCC06', N'Zeullig Pharma')
GO
INSERT [dbo].[tNhaSanXuat] ([MaNSX], [TenNSX]) VALUES (N'NSX01', N'Công ty cổ phần Dược phẩm Imexpharm')
INSERT [dbo].[tNhaSanXuat] ([MaNSX], [TenNSX]) VALUES (N'NSX02', N'Công ty cổ phần Dược Hậu Giang')
INSERT [dbo].[tNhaSanXuat] ([MaNSX], [TenNSX]) VALUES (N'NSX03', N'Công ty cổ phần Dược phẩm Sanofisynthelabo Việt Nam')
INSERT [dbo].[tNhaSanXuat] ([MaNSX], [TenNSX]) VALUES (N'NSX04', N'Công ty TNHH MTV Dược phẩm và sinh học Y tế')
INSERT [dbo].[tNhaSanXuat] ([MaNSX], [TenNSX]) VALUES (N'NSX05', N'Công ty TNHH Dược phẩm Hisamitsu Việt Nam')
INSERT [dbo].[tNhaSanXuat] ([MaNSX], [TenNSX]) VALUES (N'NSX06', N'Công ty TNHH Pierre Fabre Việt Nam')
INSERT [dbo].[tNhaSanXuat] ([MaNSX], [TenNSX]) VALUES (N'NSX07', N'Công ty TNHH RohtoMentholatum Việt Nam')
INSERT [dbo].[tNhaSanXuat] ([MaNSX], [TenNSX]) VALUES (N'NSX08', N'Công ty TNHH Sanofi Aventis Việt Nam')
INSERT [dbo].[tNhaSanXuat] ([MaNSX], [TenNSX]) VALUES (N'NSX09', N'Công ty TNHH B.Braun Việt Nam')
INSERT [dbo].[tNhaSanXuat] ([MaNSX], [TenNSX]) VALUES (N'NSX10', N'Công ty cổ phần Traphaco')
GO
INSERT [dbo].[tLoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc]) VALUES (N'LT01', N'Thuốc hạ sốt, kháng viêm')
INSERT [dbo].[tLoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc]) VALUES (N'LT02', N'Thuốc giảm đau')
INSERT [dbo].[tLoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc]) VALUES (N'LT03', N'Thuốc tiêu hóa')
INSERT [dbo].[tLoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc]) VALUES (N'LT04', N'Thuốc da liễu')
INSERT [dbo].[tLoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc]) VALUES (N'LT05', N'Thuốc sát trùng')
INSERT [dbo].[tLoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc]) VALUES (N'LT06', N'Nước muối sinh lý')
INSERT [dbo].[tLoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc]) VALUES (N'LT07', N'Hormone')
INSERT [dbo].[tLoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc]) VALUES (N'LT08', N'Thần kinh')
GO
INSERT [dbo].[tThuoc] ([MaThuoc], [TenThuoc], [DonGiaNhap], [DonGiaBan], [SoLuong], [HanSuDung], [DonViTinh], [MaLoaiThuoc], [MaNSX]) 
VALUES (N'T01', N'Synthroid', 100000.0000, 108000.0000, 120, 365, N'Vỉ', 'LT07', 'NSX01')
INSERT [dbo].[tThuoc] ([MaThuoc], [TenThuoc], [DonGiaNhap], [DonGiaBan], [SoLuong], [HanSuDung], [DonViTinh], [MaLoaiThuoc], [MaNSX]) 
VALUES (N'T02', N'Namenda', 300000.0000, 350000.0000, 543, 365, N'Lọ', 'LT08', 'NSX05')
INSERT [dbo].[tThuoc] ([MaThuoc], [TenThuoc], [DonGiaNhap], [DonGiaBan], [SoLuong], [HanSuDung], [DonViTinh], [MaLoaiThuoc], [MaNSX]) 
VALUES (N'T03', N'Aricept', 123000.0000, 234000.0000, 786, 265, N'Vỉ', 'LT08', 'NSX07')
INSERT [dbo].[tThuoc] ([MaThuoc], [TenThuoc], [DonGiaNhap], [DonGiaBan], [SoLuong], [HanSuDung], [DonViTinh], [MaLoaiThuoc], [MaNSX]) 
VALUES (N'T04', N'Ambien', 543654.0000, 1080000.0000, 654, 365, N'Vỉ', 'LT08', 'NSX10')
INSERT [dbo].[tThuoc] ([MaThuoc], [TenThuoc], [DonGiaNhap], [DonGiaBan], [SoLuong], [HanSuDung], [DonViTinh], [MaLoaiThuoc], [MaNSX]) 
VALUES (N'T05', N'Imitrex', 573892.0000, 603829.0000, 334, 730, N'Vỉ', 'LT02', 'NSX06')
INSERT [dbo].[tThuoc] ([MaThuoc], [TenThuoc], [DonGiaNhap], [DonGiaBan], [SoLuong], [HanSuDung], [DonViTinh], [MaLoaiThuoc], [MaNSX]) 
VALUES (N'T06', N'Generic Only', 173953.0000, 200000.0000, 232, 120, N'Vỉ', 'LT02', 'NSX03')
INSERT [dbo].[tThuoc] ([MaThuoc], [TenThuoc], [DonGiaNhap], [DonGiaBan], [SoLuong], [HanSuDung], [DonViTinh], [MaLoaiThuoc], [MaNSX]) 
VALUES (N'T07', N'Amoxil', 175463.0000, 190000.0000, 534, 334, N'Vỉ', 'LT01', 'NSX04')
INSERT [dbo].[tThuoc] ([MaThuoc], [TenThuoc], [DonGiaNhap], [DonGiaBan], [SoLuong], [HanSuDung], [DonViTinh], [MaLoaiThuoc], [MaNSX]) 
VALUES (N'T08', N'Nexium', 693832.0000, 789012.0000, 654, 233, N'Lọ', 'LT03', 'NSX02')
INSERT [dbo].[tThuoc] ([MaThuoc], [TenThuoc], [DonGiaNhap], [DonGiaBan], [SoLuong], [HanSuDung], [DonViTinh], [MaLoaiThuoc], [MaNSX]) 
VALUES (N'T09', N'Candiderm Cream Glenmark', 234789.0000, 389122.0000, 123, 123, N'Tuýp', 'LT04', 'NSX07')
INSERT [dbo].[tThuoc] ([MaThuoc], [TenThuoc], [DonGiaNhap], [DonGiaBan], [SoLuong], [HanSuDung], [DonViTinh], [MaLoaiThuoc], [MaNSX]) 
VALUES (N'T10', N'Pvp - Iodine 10% Danapha', 839271.0000, 918271.0000, 432, 653, N'Lọ', 'LT04', 'NSX08')
INSERT [dbo].[tThuoc] ([MaThuoc], [TenThuoc], [DonGiaNhap], [DonGiaBan], [SoLuong], [HanSuDung], [DonViTinh], [MaLoaiThuoc], [MaNSX]) 
VALUES (N'T11', N'Nước muối Cửu Long', 562892.0000, 651281.0000, 675, 365, N'Chai', 'LT06', 'NSX09')
INSERT [dbo].[tThuoc] ([MaThuoc], [TenThuoc], [DonGiaNhap], [DonGiaBan], [SoLuong], [HanSuDung], [DonViTinh], [MaLoaiThuoc], [MaNSX]) 
VALUES (N'T12', N'Cồn 70 độ Bidophar', 222222.0000, 250000.0000, 123, 730, N'Chai', 'LT05', 'NSX10')
INSERT [dbo].[tThuoc] ([MaThuoc], [TenThuoc], [DonGiaNhap], [DonGiaBan], [SoLuong], [HanSuDung], [DonViTinh], [MaLoaiThuoc], [MaNSX]) 
VALUES (N'T13', N'Panadol', 555321.0000, 600000.0000, 755, 342, N'Vỉ', 'LT01', 'NSX01')
INSERT [dbo].[tThuoc] ([MaThuoc], [TenThuoc], [DonGiaNhap], [DonGiaBan], [SoLuong], [HanSuDung], [DonViTinh], [MaLoaiThuoc], [MaNSX]) 
VALUES (N'T14', N'Paracetamol', 109853.0000, 120000.0000, 786, 123, N'Vỉ', 'LT01', 'NSX03')
INSERT [dbo].[tThuoc] ([MaThuoc], [TenThuoc], [DonGiaNhap], [DonGiaBan], [SoLuong], [HanSuDung], [DonViTinh], [MaLoaiThuoc], [MaNSX]) 
VALUES (N'T15', N'Efferalgan', 373289.0000, 400000.0000, 886, 654, N'Vỉ', 'LT01', 'NSX04')
INSERT [dbo].[tThuoc] ([MaThuoc], [TenThuoc], [DonGiaNhap], [DonGiaBan], [SoLuong], [HanSuDung], [DonViTinh], [MaLoaiThuoc], [MaNSX]) 
VALUES (N'T16', N'Tiffy', 123843.0000, 150000.0000, 567, 730, N'Vỉ', 'LT01', 'NSX05')
INSERT [dbo].[tThuoc] ([MaThuoc], [TenThuoc], [DonGiaNhap], [DonGiaBan], [SoLuong], [HanSuDung], [DonViTinh], [MaLoaiThuoc], [MaNSX]) 
VALUES (N'T17', N'Yuraf', 123764.0000, 145000.0000, 897, 365, N'Vỉ', 'LT01', 'NSX07')
INSERT [dbo].[tThuoc] ([MaThuoc], [TenThuoc], [DonGiaNhap], [DonGiaBan], [SoLuong], [HanSuDung], [DonViTinh], [MaLoaiThuoc], [MaNSX]) 
VALUES (N'T18', N'Coldacmin', 982712.0000, 1000000.0000, 565, 365, N'Vỉ', 'LT01', 'NSX06')
INSERT [dbo].[tThuoc] ([MaThuoc], [TenThuoc], [DonGiaNhap], [DonGiaBan], [SoLuong], [HanSuDung], [DonViTinh], [MaLoaiThuoc], [MaNSX]) 
VALUES (N'T19', N'E – cox 90', 875212.0000, 900000.0000, 874, 365, N'Vỉ', 'LT01', 'NSX08')
INSERT [dbo].[tThuoc] ([MaThuoc], [TenThuoc], [DonGiaNhap], [DonGiaBan], [SoLuong], [HanSuDung], [DonViTinh], [MaLoaiThuoc], [MaNSX]) 
VALUES (N'T20', N'Pabemin', 198752.0000, 200000.0000, 234, 365, N'Vỉ', 'LT01', 'NSX09')
GO
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaDuocSi], [NgayBan], [MaBenhNhan]) VALUES (N'HDB01', N'DS01', CAST(N'2014-08-11T00:00:00.000' AS DateTime), N'BN01')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaDuocSi], [NgayBan], [MaBenhNhan]) VALUES (N'HDB02', N'DS02', CAST(N'2014-05-03T00:00:00.000' AS DateTime), N'BN02')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaDuocSi], [NgayBan], [MaBenhNhan]) VALUES (N'HDB03', N'DS03', CAST(N'2013-12-01T00:00:00.000' AS DateTime), N'BN03')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaDuocSi], [NgayBan], [MaBenhNhan]) VALUES (N'HDB04', N'DS04', CAST(N'2013-11-12T00:00:00.000' AS DateTime), N'BN01')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaDuocSi], [NgayBan], [MaBenhNhan]) VALUES (N'HDB05', N'DS04', CAST(N'2014-05-14T00:00:00.000' AS DateTime), N'BN04')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaDuocSi], [NgayBan], [MaBenhNhan]) VALUES (N'HDB06', N'DS05', CAST(N'2014-06-30T00:00:00.000' AS DateTime), N'BN02')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaDuocSi], [NgayBan], [MaBenhNhan]) VALUES (N'HDB07', N'DS06', CAST(N'2014-05-10T00:00:00.000' AS DateTime), N'BN01')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaDuocSi], [NgayBan], [MaBenhNhan]) VALUES (N'HDB08', N'DS01', CAST(N'2013-01-01T00:00:00.000' AS DateTime), N'BN02')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaDuocSi], [NgayBan], [MaBenhNhan]) VALUES (N'HDB09', N'DS01', CAST(N'2013-02-10T00:00:00.000' AS DateTime), N'BN02')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaDuocSi], [NgayBan], [MaBenhNhan]) VALUES (N'HDB10', N'DS02', CAST(N'2014-04-10T00:00:00.000' AS DateTime), N'BN04')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaDuocSi], [NgayBan], [MaBenhNhan]) VALUES (N'HDB11', N'DS03', CAST(N'2014-03-11T00:00:00.000' AS DateTime), N'BN04')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaDuocSi], [NgayBan], [MaBenhNhan]) VALUES (N'HDB12', N'DS03', CAST(N'2014-07-10T00:00:00.000' AS DateTime), N'BN03')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaDuocSi], [NgayBan], [MaBenhNhan]) VALUES (N'HDB13', N'DS05', CAST(N'2014-04-12T00:00:00.000' AS DateTime), N'BN04')
GO
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB01', N'T01', 7)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB01', N'T02', 10)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB01', N'T04', 10)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB02', N'T04', 9)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB02', N'T05', 3)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB03', N'T02', 3)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB03', N'T06', 7)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB03', N'T08', 11)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB04', N'T03', 2)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB04', N'T04', 2)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB04', N'T10', 9)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB05', N'T05', 3)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB05', N'T07', 3)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB05', N'T08', 14)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB06', N'T02', 13)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB06', N'T05', 1)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB06', N'T10', 4)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB06', N'T11', 4)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB07', N'T01', 10)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB07', N'T06', 4)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB07', N'T08', 2)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB08', N'T01', 2)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB08', N'T06', 3)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB08', N'T07', 2)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB09', N'T03', 5)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB09', N'T06', 1)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB09', N'T09', 6)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB10', N'T07', 3)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB10', N'T11', 6)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB10', N'T13', 6)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB11', N'T04', 2)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB11', N'T08', 5)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB11', N'T11', 5)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB12', N'T05', 3)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB12', N'T09', 4)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB12', N'T12', 5)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB13', N'T02', 3)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB13', N'T03', 5)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaThuoc], [SLBan]) VALUES (N'HDB13', N'T04', 2)
GO
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaDuocSi], [NgayNhap], [MaNCC]) VALUES (N'HDN01', N'DS02', CAST(N'2014-04-13T00:00:00.000' AS DateTime), N'NCC01')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaDuocSi], [NgayNhap], [MaNCC]) VALUES (N'HDN02', N'DS01', CAST(N'2014-06-28T00:00:00.000' AS DateTime), N'NCC03')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaDuocSi], [NgayNhap], [MaNCC]) VALUES (N'HDN03', N'DS04', CAST(N'2014-01-01T00:00:00.000' AS DateTime), N'NCC06')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaDuocSi], [NgayNhap], [MaNCC]) VALUES (N'HDN04', N'DS05', CAST(N'2014-03-05T00:00:00.000' AS DateTime), N'NCC04')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaDuocSi], [NgayNhap], [MaNCC]) VALUES (N'HDN05', N'DS03', CAST(N'2014-04-10T00:00:00.000' AS DateTime), N'NCC05')
GO
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaThuoc], [SLNhap]) VALUES (N'HDN01', N'T01', 20)
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaThuoc], [SLNhap]) VALUES (N'HDN02', N'T06', 10)
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaThuoc], [SLNhap]) VALUES (N'HDN03', N'T03', 20)
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaThuoc], [SLNhap]) VALUES (N'HDN04', N'T09', 10)
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaThuoc], [SLNhap]) VALUES (N'HDN05', N'T06', 15)

-- VIEW
--1 View Chi tiết Dược sĩ nào nhập các loại thuốc nào với số lượng bao nhiêu
GO
create view DuocSiNhapThuoc
as
SELECT dbo.tHoaDonNhap.SoHDN, dbo.tDuocSi.TenDuocSi, dbo.tThuoc.TenThuoc, dbo.tChiTietHDN.SLNhap
FROM dbo.tChiTietHDN INNER JOIN
                         dbo.tHoaDonNhap ON dbo.tChiTietHDN.SoHDN = dbo.tHoaDonNhap.SoHDN INNER JOIN
                         dbo.tDuocSi ON dbo.tHoaDonNhap.MaDuocSi = dbo.tDuocSi.MaDuocSi INNER JOIN
                         dbo.tNhaCungCap ON dbo.tHoaDonNhap.MaNCC = dbo.tNhaCungCap.MaNCC INNER JOIN
                         dbo.tThuoc ON dbo.tChiTietHDN.MaThuoc = dbo.tThuoc.MaThuoc
GO
select * from DuocSiNhapThuoc
GO
GO
--2 View Thuốc và nhà cung cấp
create view Thuoc_NhaCC
as
SELECT      DISTINCT  dbo.tThuoc.TenThuoc, dbo.tNhaCungCap.TenNCC
FROM            dbo.tChiTietHDN INNER JOIN
                         dbo.tHoaDonNhap ON dbo.tChiTietHDN.SoHDN = dbo.tHoaDonNhap.SoHDN INNER JOIN
                         dbo.tNhaCungCap ON dbo.tHoaDonNhap.MaNCC = dbo.tNhaCungCap.MaNCC INNER JOIN
                         dbo.tThuoc ON dbo.tChiTietHDN.MaThuoc = dbo.tThuoc.MaThuoc
GO
select * from Thuoc_NhaCC
GO
GO
--3 View Thuốc và hạn sử dụng hiện tại
create view HSD_Thuoc
as
SELECT        dbo.tThuoc.TenThuoc, HanSuDung - DATEDIFF(MONTH,NgayNhap,GETDATE()) AS HanSD_Con_Lai
FROM            dbo.tChiTietHDN INNER JOIN
                         dbo.tHoaDonNhap ON dbo.tChiTietHDN.SoHDN = dbo.tHoaDonNhap.SoHDN INNER JOIN
                         dbo.tThuoc ON dbo.tChiTietHDN.MaThuoc = dbo.tThuoc.MaThuoc
GO
select * from HSD_Thuoc
GO
GO
-- 4 view các hóa đơn mua thuốc
create view Loaithuoc
as
	select SoHDB,TenThuoc,DonGiaBan,SLBan 
	from tThuoc inner join tChiTietHDB on tThuoc.MaThuoc = tChiTietHDB.MaThuoc
GO
select * from Loaithuoc
GO
GO
--5 view thông tin dược sĩ
CREATE view DuocSi
as select MaDuocSi,TenDuocSi,BangCap,DiaChi,GioiTinh,(Year(Getdate())-Year(NgaySinh)) as Tuoi  from tDuocSi
GO
select * from DuocSi
GO
GO
--6 view duoc si cung quê
CREATE view Cungque as
select * from tDuocSi
where DiaChi like N'Hà Nội'
GO
select * from Cungque
GO
GO
--7 liệt kê thông tin hóa đơn và tổng số tiền thu được của từng hóa đơn
create view tongtien as
select hdb.SoHDB, SUM(SLBan* DonGiaBan) as tien from tHoaDonBan hdb
inner join tChiTietHDB ctb on hdb.SoHDB =ctb.SoHDB 
inner join tThuoc t on t.MaThuoc = ctb.MaThuoc
 group by hdb.SoHDB
GO
 select * from tongtien
GO
--8  liệt kê doanh thu theo từng tháng từng loại thuốc
GO
CREATE view Doanhthutungthang as
select --tThuoc.MaThuoc, tThuoc.TenThuoc,
Sum(Case Month(tHoaDonBan.NgayBan) When 1 then tChiTietHDB.SLBan* tThuoc.DonGiaBan else 0 end ) As 'Thang 1',
Sum(Case Month(tHoaDonBan.NgayBan) When 2 then tChiTietHDB.SLBan* tThuoc.DonGiaBan else 0 end ) As 'Thang 2',
Sum(Case Month(tHoaDonBan.NgayBan) When 3 then tChiTietHDB.SLBan* tThuoc.DonGiaBan else 0 end ) As 'Thang 3',
Sum(Case Month(tHoaDonBan.NgayBan) When 4 then tChiTietHDB.SLBan* tThuoc.DonGiaBan else 0 end ) As 'Thang 4',
Sum(Case Month(tHoaDonBan.NgayBan) When 5 then tChiTietHDB.SLBan* tThuoc.DonGiaBan else 0 end ) As 'Thang 5',
Sum(Case Month(tHoaDonBan.NgayBan) When 6 then tChiTietHDB.SLBan* tThuoc.DonGiaBan else 0 end ) As 'Thang 6',
Sum(Case Month(tHoaDonBan.NgayBan) When 7 then tChiTietHDB.SLBan* tThuoc.DonGiaBan else 0 end ) As 'Thang 7',
Sum(Case Month(tHoaDonBan.NgayBan) When 8 then tChiTietHDB.SLBan* tThuoc.DonGiaBan else 0 end ) As 'Thang 8',
Sum(Case Month(tHoaDonBan.NgayBan) When 9 then tChiTietHDB.SLBan* tThuoc.DonGiaBan else 0 end ) As 'Thang 9',
Sum(Case Month(tHoaDonBan.NgayBan) When 10 then tChiTietHDB.SLBan* tThuoc.DonGiaBan else 0 end ) As 'Thang 10',
Sum(Case Month(tHoaDonBan.NgayBan) When 11 then tChiTietHDB.SLBan* tThuoc.DonGiaBan else 0 end ) As 'Thang 11',
Sum(Case Month(tHoaDonBan.NgayBan) When 12 then tChiTietHDB.SLBan* tThuoc.DonGiaBan else 0 end ) As 'Thang 12',
Sum(tChiTietHDB.SLBan * tThuoc.DonGiaBan) As 'Ca Nam'
From(tHoaDonBan inner join tChiTietHDB on tHoaDonBan.SoHDB=tChiTietHDB.SoHDB)
INNER JOIN tThuoc on tThuoc.MaThuoc = tChiTietHDB.MaThuoc
--Group by tThuoc.MaThuoc, tThuoc.TenThuoc
GO
select * from Doanhthutungthang
GO

-- TRIGGER
GO
--1. Thêm trường số lượng hóa đơn vào bệnh nhân  và cập nhật tự động cho trường này mỗi khi thêm hóa đơn
GO
alter table tBenhNhan add SLHD int
GO
create trigger Cau1_1  on tHoaDonBan for insert as
begin
	declare @mabn nvarchar(20)
	select @mabn=MaBenhNhan from inserted
	update tBenhNhan set SLHD = ISNULL(SLHD,0) + 1 where MaBenhNhan=@mabn	
end
GO
GO
--2. Thêm trường số sản phẩm vào bảng hóa đơn bán cập nhật tự động cho trường này mỗi khi thêm chi tiết hóa đơn
alter table tHoaDonBan add SSP int
GO
create trigger Cau2 on tChiTietHDB for insert as
begin
	declare @shd nvarchar(10), @sl int
	select @shd = SoHDB, @sl = SLBan from inserted
	update tHoaDonBan set SSP = isnull(SSP,0) + @sl where SoHDB = @shd
end
GO
GO
--3. Thêm trường số lượng hóa đơn vào bảng bệnh nhân và cập nhật tự động cho trường này mỗi khi thêm hóa đơn
GO
alter table tBenhNhan add SoLuongHD int
GO
create trigger SoLuongHoaDonBN on tHoaDonBan
for insert
as begin
	declare @MaBenhNhan nvarchar(50)
	select @MaBenhNhan = MaBenhNhan from inserted
	update tBenhNhan set SoLuongHD = isnull(SoLuongHD,0) + 1
	where  tBenhNhan.MaBenhNhan = @MaBenhNhan
end
GO
GO
--4. Thêm trường số sản phẩm vào bảng hóa đơn bán cập nhật tự động cho trường này mỗi khi xóa chi tiết hóa đơn
GO
alter table tHoaDonBan add SoSanPham int
GO
create trigger SoSanPham on tChiTietHDB
for delete
as begin
	declare @SoHDB nvarchar(50)
	select @SoHDB = SoHDB from inserted
	update tHoaDonBan set SoSanPham = isnull(SoSanPham,0) - 1
	where tHoaDonBan.SoHDB = @SoHDB
end
GO
--5. Thêm trường tổng tiền cho hóa đơn bán cập nhật tự động cho trường này mỗi khi thêm một bản ghi vào chi tiết hóa đơn
GO
alter table tHoaDonBan add TongTien money
GO
create trigger TongTien_trig on tHoaDonBan
for insert
as begin
	update tHoaDonBan set tHoaDonBan.TongTien = isnull(tHoaDonBan.TongTien,0) + SLBan * DonGiaBan
	from tHoaDonBan join tChiTietHDB on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB 
	join tThuoc on tThuoc.MaThuoc = tChiTietHDB.MaThuoc join inserted on inserted.SoHDB = tHoaDonBan.SoHDB
end
GO

-- PROCEDURES
-- 1. tạo thủ tục đầu vào 1 tháng và đưa ra doanh thu tháng đó
GO
create proc DoanhThuTheoThang @thang int ,@nam int
as
begin
	declare @tongthu int
	select @tongthu = SUM(DonGiaNhap*SLBan) from tHoaDonBan inner join tChiTietHDB on tHoaDonBan.SoHDB=tChiTietHDB.SoHDB
	inner join tThuoc on tChiTietHDB.MaThuoc= tThuoc.MaThuoc
	where month(NgayBan)=@thang and year(NgayBan)=@nam 

	SELECT @thang AS "Tháng", @nam AS "Năm", @tongthu AS "Doanh Thu" 
end
GO
EXEC dbo.DoanhThuTheoThang @thang = 10, -- int
    @nam = 2021 -- int
go
GO
-- 2. tạo thủ tục tổng số tiền cửa hàng nhập thuốc trong năm nhập vào
create proc Nhapthuoc @nam int
as
begin
	Declare @tongchi int
	begin
		select @tongchi =sum(DonGiaNhap*SoLuong) from tThuoc inner join tChiTietHDN 
		on tChiTietHDN.MaThuoc=tThuoc.MaThuoc inner join tHoaDonNhap on tHoaDonNhap.SoHDN=tChiTietHDN.SoHDN
		where year(NgayNhap)= @nam
		select @nam as 'Năm', @tongchi as 'Tổng Chi'
	end
end
go
exec Nhapthuoc @nam = 2014
GO
GO
--3. thủ tục đầu vào là mã nhà cung cấp, đầu ra là số thuốc mà nhà cung cấp đó cung cấp cho Hiệu thuốc
CREATE proc Nhacungcap @NCC nvarchar(10)
as
begin
	Declare @SoNCC int
	select @SoNCC=Count(*) from tNhaCungCap where MaNCC =@NCC
	if(@SoNCC !=0)
	Begin 
		Select TenNCC,tThuoc.MaThuoc,TenThuoc,DonGiaNhap,DonGiaBan,HanSuDung,DonViTinh,SoLuong from tNhaCungCap 
		inner join tHoaDonNhap on tNhaCungCap.MaNCC=tHoaDonNhap.MaNCC 
		inner join tChiTietHDN on tHoaDonNhap.SoHDN= tChiTietHDN.SoHDN 
		inner join tThuoc on tThuoc.MaThuoc = tChiTietHDN.MaThuoc
		where tNhaCungCap.MaNCC=@NCC
		group by TenNCC,tThuoc.MaThuoc,TenThuoc,DonGiaNhap,DonGiaBan,HanSuDung,DonViTinh,SoLuong
	end
	else
	print 'Nha cung cap nay khong ton tai'
end
go
select * from tNhaCungCap
exec Nhacungcap @NCC='MCT001'
GO
GO
--4. Nhân viên bán hàng nhiều nhất trong tháng đó
create proc BanHangMax @thang int
as begin
	if exists(select 'true' from tHoaDonBan where month(NgayBan)=@thang)
	begin
	select TenDuocSi,BangCap,GioiTinh from tDuocSi ds inner join tHoaDonBan hdb
	 on ds.MaDuocSi = hdb.MaDuocSi inner join tChiTietHDB ctb on hdb.SoHDB= ctb.SoHDB
	 where @thang = MONTH(NgayBan)
	 group by ds.MaDuocSi,ds.TenDuocSi,ds.BangCap,ds.GioiTinh 
	 having sum(SLBan) >= all(select sum(SLBan) from tChiTietHDB 
	 inner join tHoaDonBan on tChiTietHDB.SoHDB=tHoaDonBan.SoHDB where month(NgayBan)=@thang group by MaDuocSi)
		end
	else
		print 'Khong tim thay'
end
go
exec BanHangMax @thang='9'
exec BanHangMax @thang='7'
GO
GO
--5. Tạo thủ tục có đầu vào là số hóa đơn, đầu ra là số tiền cần thanh toán
CREATE proc HDcanthanhtoan @SOHD nvarchar(10)
as
begin
	select sum(tChiTietHDB.SLBan* tThuoc.DonGiaBan) as So_tien from tHoaDonBan inner join tChiTietHDB
	on tHoaDonBan.SoHDB= tChiTietHDB.SoHDB inner join tThuoc on tThuoc.MaThuoc= tChiTietHDB.MaThuoc
	where @SOHD =tHoaDonBan.SoHDB
end
GO
select * from tHoaDonBan
exec HDcanthanhtoan @SOHD='B1001'
GO
GO
--6 Tạo thủ tục với đầu vào là ngày, đầu ra là số lượng hóa đơn, doanh thu của ngày đó
select * from tHoaDonBan
GO
create proc SoHoaDon @Ngay int, @SLDon int output,@DTNgay int output
as begin
		select  @SLDon= count(b.SoHDB),@DTNgay =sum(SLBan*DonGiaBan) from tHoaDonBan b join tChiTietHDB t
		on b.SoHDB=t.SoHDB join tThuoc m on m.MaThuoc= t.MaThuoc where day(NgayBan)=@Ngay
end
GO
declare @SLHD int,@DT int
exec SoHoaDon 27, @SLHD output,@DT output
print @SLHD
print @DT
GO

-- FUNCTION
GO
--cau 1: tao ham dua ra tong tien da nhap thuoc trong 1 nam voi dau vao la nam cho truoc 
create function cau1 (@nam int)
returns table as
return
(
	select sum(tChiTietHDN.SLNhap*tThuoc.DonGiaNhap) as doanhthu from tThuoc 
	inner join tChiTietHDN on tThuoc.MaThuoc = tChiTietHDN.MaThuoc
	inner join tHoaDonNhap on tChiTietHDN.SoHDN = tHoaDonNhap.SoHDN
	where year(tHoaDonNhap.NgayNhap) = 2014
)
GO
select * from cau1(2014)
GO
--cau 2: tao ham dau ra danh sach 5 ma thuoc ban chay nhat trong thang nao do(tham so dau vao la thang)
create function cau2_copy (@thang int,@nam int)
returns table as
return
(
	select top(5) with ties tThuoc.MaThuoc,sum(tThuoc.DonGiaBan*tChiTietHDB.SLBan) as doanhthu from tThuoc
	inner join tChiTietHDB on tThuoc.MaThuoc = tChiTietHDB.MaThuoc
	inner join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
	where Month(tHoaDonBan.NgayBan) = @thang and Year(tHoaDonBan.NgayBan) = @nam
	group by tThuoc.MaThuoc
	order by sum(tThuoc.DonGiaBan*tChiTietHDB.SLBan) desc
)
GO
select * from cau2_copy(4,2014)
GO
--cau 3: tao ham dua ra thong tin duoc si co sinh nhat voi ngay la tham so truyen vao
create function cau3 (@ngay int,@thang int)
returns table as
return 
(
	select tDuocSi.* from tDuocSi
	where Day(tDuocSi.NgaySinh) = @ngay and MONTH(tDuocSi.NgaySinh) = @thang  
)
GO
--cau 4: tao ham dua ra danh sach n duoc si co doanh thu cao nhat trong 1 nam voi n va nam la tham so truyen vao
create function cau4(@sl int,@nam int)
returns table as
return
(
	select top(@sl) with ties tDuocSi.TenDuocSi,sum(tThuoc.DonGiaBan*tChiTietHDB.SLBan) as doanhthu from tThuoc
	inner join tChiTietHDB on tThuoc.MaThuoc = tChiTietHDB.MaThuoc
	inner join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
	inner join tDuocSi on tDuocSi.MaDuocSi = tHoaDonBan.MaDuocSi
	where Year(tHoaDonBan.NgayBan) = @nam
	group by tDuocSi.TenDuocSi
	order by sum(tThuoc.DonGiaBan*tChiTietHDB.SLBan) desc
)
GO
select * from cau4(4,2014)
GO
--cau 5: tao ham dua ra so luong thuoc ban duoc trong nam voi dau vao la ma thuoc va nam
create function cau5 (@mathuoc nvarchar(10),@nam int)
returns table as
return
(
	select count (distinct tHoaDonBan.SoHDB) as soluong from tHoaDonBan 
	inner join tChiTietHDB on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
	inner join tThuoc on tThuoc.MaThuoc = tChiTietHDB.MaThuoc
	where Year(tHoaDonBan.NgayBan) = @nam and tThuoc.MaThuoc = @mathuoc
)
GO
select * from cau5('T01',2014)
GO
select * from tThuoc
GO
--cau 6: tao ham dem so ma thuoc theo nha san xuat (ma NSX la tham so)
create function cau6 (@mansx nvarchar(10))
returns table as 
return 
(
	select count(tThuoc.MaThuoc) as soluong from tThuoc
	where MaNSX = @mansx
)
GO
select * from cau6('NSX01')
GO

-- PROC, FUNCTION FOR C# PROGRAM
-- Tim thuoc
GO
create proc timThuoc @maThuoc nvarchar(50), @tenThuoc nvarchar(150) as
	select * from tThuoc where MaThuoc = @maThuoc or TenThuoc = @tenThuoc
GO
-- Top ban chay
GO
CREATE VIEW topBanChay AS
SELECT TOP(100) WITH TIES tThuoc.MaThuoc, tThuoc.TenThuoc, SUM(tChiTietHDB.SLBan) AS SLBan
FROM tThuoc JOIN tChiTietHDB ON tThuoc.MaThuoc = tChiTietHDB.MaThuoc
GROUP BY tThuoc.MaThuoc, tThuoc.TenThuoc
ORDER BY SUM(tChiTietHDB.SLBan) DESC
GO
-- SELECT * FROM topBanChay
GO