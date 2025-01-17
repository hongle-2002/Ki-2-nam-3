USE [QuanLyThuoc]
GO
/****** Object:  Table [dbo].[tAnhChiTietSp]    Script Date: 3/30/2023 11:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tAnhChiTietSp](
	[MaChiTietSp] [nvarchar](50) NOT NULL,
	[TenFileAnh] [nvarchar](50) NOT NULL,
	[Vitri] [nvarchar](50) NULL,
 CONSTRAINT [PK_tAnhChiTietSp] PRIMARY KEY CLUSTERED 
(
	[MaChiTietSp] ASC,
	[TenFileAnh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tAnhSanPham]    Script Date: 3/30/2023 11:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tAnhSanPham](
	[MaThuoc] [nvarchar](50) NOT NULL,
	[TenFileAnh] [nvarchar](50) NOT NULL,
	[Vitri] [nvarchar](50) NULL,
 CONSTRAINT [PK_tAnhSanPham] PRIMARY KEY CLUSTERED 
(
	[TenFileAnh] ASC,
	[MaThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tChiTietHDB]    Script Date: 3/30/2023 11:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tChiTietHDB](
	[MaHDB] [nvarchar](50) NOT NULL,
	[MaChiTietSp] [nvarchar](50) NOT NULL,
	[SLBan] [int] NULL,
	[DonGiaBan] [money] NULL,
	[GiamGia] [nvarchar](50) NULL,
 CONSTRAINT [PK_tChiTietHDB] PRIMARY KEY CLUSTERED 
(
	[MaHDB] ASC,
	[MaChiTietSp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tChiTietHDN]    Script Date: 3/30/2023 11:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tChiTietHDN](
	[MaHDN] [nvarchar](50) NOT NULL,
	[MaThuoc] [nvarchar](50) NOT NULL,
	[DonGiaNhap] [money] NULL,
	[GiamGia] [nvarchar](50) NULL,
	[SLNhap] [int] NULL,
 CONSTRAINT [PK_tChiTietHDN] PRIMARY KEY CLUSTERED 
(
	[MaHDN] ASC,
	[MaThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tChiTietSanPham]    Script Date: 3/30/2023 11:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tChiTietSanPham](
	[MaChiTietSp] [nvarchar](50) NOT NULL,
	[MaThuoc] [nvarchar](50) NULL,
	[AnhDaiDien] [nvarchar](50) NULL,
	[DonGiaBan] [money] NULL,
	[GiamGia] [nvarchar](50) NULL,
	[SLTon] [int] NULL,
 CONSTRAINT [PK_tChiTietSanPham] PRIMARY KEY CLUSTERED 
(
	[MaChiTietSp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tChuyenMon]    Script Date: 3/30/2023 11:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tChuyenMon](
	[MaChuyenMon] [nvarchar](50) NOT NULL,
	[TenChuyenMon] [nvarchar](200) NULL,
 CONSTRAINT [PK_tChuyenMon] PRIMARY KEY CLUSTERED 
(
	[MaChuyenMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tDanhMucThuoc]    Script Date: 3/30/2023 11:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tDanhMucThuoc](
	[MaThuoc] [nvarchar](50) NOT NULL,
	[TenThuoc] [nvarchar](200) NULL,
	[CongDung] [nvarchar](200) NULL,
	[LieuDung] [nvarchar](200) NULL,
	[DoiTuongSD] [nvarchar](200) NULL,
	[TacDungPhu] [nvarchar](200) NULL,
	[BaoQuan] [nvarchar](200) NULL,
	[LuyY] [nvarchar](200) NULL,
	[ThanhPhan] [nvarchar](200) NULL,
	[MoTaThuoc] [nvarchar](200) NULL,
	[MaDVT] [nvarchar](50) NULL,
	[MaLoai] [nvarchar](50) NULL,
	[NgaySanXuat] [datetime] NULL,
	[HanSuDung] [datetime] NULL,
	[MaNuocSX] [nvarchar](50) NULL,
	[GiaLonNhat] [money] NULL,
	[GiaNhoNhat] [money] NULL,
	[AnhDaiDien] [nvarchar](50) NULL,
 CONSTRAINT [PK_tDanhMucThuoc] PRIMARY KEY CLUSTERED 
(
	[MaThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tDonViTinh]    Script Date: 3/30/2023 11:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tDonViTinh](
	[MaDVT] [nvarchar](50) NOT NULL,
	[TenDVT] [nvarchar](50) NULL,
 CONSTRAINT [PK_tDonViTinh] PRIMARY KEY CLUSTERED 
(
	[MaDVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tDuocSi]    Script Date: 3/30/2023 11:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tDuocSi](
	[MaDs] [nvarchar](50) NOT NULL,
	[TenDs] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
	[NgaySinh] [datetime] NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[MaTrinhDo] [nvarchar](50) NULL,
	[MaChuyenMon] [nvarchar](50) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_tDuocSi] PRIMARY KEY CLUSTERED 
(
	[MaDs] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tHoaDonBan]    Script Date: 3/30/2023 11:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tHoaDonBan](
	[MaHDB] [nvarchar](50) NOT NULL,
	[NgayBan] [datetime] NULL,
	[MaKH] [nvarchar](50) NULL,
	[MaDS] [nvarchar](50) NULL,
	[GiamGia] [nvarchar](50) NULL,
	[TongTienHD] [money] NULL,
	[PhuongThucThanhToan] [nvarchar](50) NULL,
 CONSTRAINT [PK_tHoaDonBan] PRIMARY KEY CLUSTERED 
(
	[MaHDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tHoaDonNhap]    Script Date: 3/30/2023 11:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tHoaDonNhap](
	[MaHDN] [nvarchar](50) NOT NULL,
	[MaNCC] [nvarchar](50) NULL,
	[MaDS] [nvarchar](50) NULL,
	[NgayNhap] [datetime] NULL,
	[SLNhap] [int] NULL,
	[DonGiaNhap] [money] NULL,
	[GiamGia] [nvarchar](50) NULL,
	[TongTienHDN] [money] NULL,
	[PhuongThucThanhToan] [nvarchar](50) NULL,
 CONSTRAINT [PK_tHoaDonNhap] PRIMARY KEY CLUSTERED 
(
	[MaHDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tKhach]    Script Date: 3/30/2023 11:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tKhach](
	[MaKH] [nvarchar](50) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_tKhach] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tLoaiThuoc]    Script Date: 3/30/2023 11:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tLoaiThuoc](
	[MaLoai] [nvarchar](50) NOT NULL,
	[TenLoai] [nvarchar](200) NULL,
 CONSTRAINT [PK_tLoaiThuoc] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tNhaCungCap]    Script Date: 3/30/2023 11:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tNhaCungCap](
	[MaNCC] [nvarchar](50) NOT NULL,
	[TenNCC] [nvarchar](200) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_tNhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tNuocSanXuat]    Script Date: 3/30/2023 11:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tNuocSanXuat](
	[MaNuocSX] [nvarchar](50) NOT NULL,
	[TenNuocSX] [nvarchar](50) NULL,
 CONSTRAINT [PK_tNuocSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaNuocSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tTrinhDo]    Script Date: 3/30/2023 11:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tTrinhDo](
	[MaTrinhDo] [nvarchar](50) NOT NULL,
	[TenTrinhDo] [nvarchar](50) NULL,
 CONSTRAINT [PK_tTrinhDo] PRIMARY KEY CLUSTERED 
(
	[MaTrinhDo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tUser]    Script Date: 3/30/2023 11:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tUser](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[LoaiUser] [nvarchar](50) NULL,
 CONSTRAINT [PK_tUser] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'aloclair-plus-gel-alliance', N'aloclair-plus-gel-alliance.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'aloclair-plus-gel-alliance', N'aloclair-plus-gel-alliance1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'aloclair-plus-gel-alliance', N'aloclair-plus-gel-alliance2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'aloclair-plus-gel-alliance', N'aloclair-plus-gel-alliance3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'an-da-naga', N'an-da-naga.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'an-da-naga', N'an-da-naga1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'an-da-naga', N'an-da-naga2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'an-da-naga', N'an-da-naga3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'an-ngon-ngu-ngon', N'an-ngon-ngu-ngon.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'an-ngon-ngu-ngon', N'an-ngon-ngu-ngon1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'an-ngon-ngu-ngon', N'an-ngon-ngu-ngon2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'an-ngon-ngu-ngon', N'an-ngon-ngu-ngon3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'bamogin', N'bamogin.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'bamogin', N'bamogin1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'bamogin', N'bamogin2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'bamogin', N'bamogin3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'ban-chai-danh-rang-dien', N'ban-chai-danh-rang-dien.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'ban-chai-danh-rang-dien', N'ban-chai-danh-rang-dien1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'ban-chai-danh-rang-dien', N'ban-chai-danh-rang-dien2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'ban-chai-danh-rang-dien', N'ban-chai-danh-rang-dien3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'bao-xuan', N'bao-xuan.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'bao-xuan', N'bao-xuan1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'bao-xuan', N'bao-xuan2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'bao-xuan', N'bao-xuan3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'best-king-jpanwell', N'best-king-jpanwell.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'best-king-jpanwell', N'best-king-jpanwell1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'best-king-jpanwell', N'best-king-jpanwell2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'best-king-jpanwell', N'best-king-jpanwell3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'bifido-plus-jpanwell', N'bifido-plus-jpanwell.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'bifido-plus-jpanwell', N'bifido-plus-jpanwell1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'bifido-plus-jpanwell', N'bifido-plus-jpanwell2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'bifido-plus-jpanwell', N'bifido-plus-jpanwell3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'blood-pressure', N'blood-pressure.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'blood-pressure', N'blood-pressure1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'blood-pressure', N'blood-pressure2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'blood-pressure', N'blood-pressure3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'brightening-cleansing-milk', N'brightening-cleansing-milk.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'brightening-cleansing-milk', N'brightening-cleansing-milk1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'brightening-cleansing-milk', N'brightening-cleansing-milk2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'brightening-cleansing-milk', N'brightening-cleansing-milk3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'cholessen', N'cholessen.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'cholessen', N'cholessen1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'cholessen', N'cholessen2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'cholessen', N'cholessen3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'cholesterol-aid', N'cholesterol-aid.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'cholesterol-aid', N'cholesterol-aid1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'cholesterol-aid', N'cholesterol-aid2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'cholesterol-aid', N'cholesterol-aid3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'coq10', N'coq10.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'coq10', N'coq101.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'coq10', N'coq102.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'coq10', N'coq103.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'curcumin-va-tinh-chat-dau-tram', N'curcumin-va-tinh-chat-dau-tram.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'curcumin-va-tinh-chat-dau-tram', N'curcumin-va-tinh-chat-dau-tram1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'curcumin-va-tinh-chat-dau-tram', N'curcumin-va-tinh-chat-dau-tram2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'curcumin-va-tinh-chat-dau-tram', N'curcumin-va-tinh-chat-dau-tram3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dau-goi-duoc-lieu-thai-duong', N'dau-goi-duoc-lieu-thai-duong.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dau-goi-duoc-lieu-thai-duong', N'dau-goi-duoc-lieu-thai-duong1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dau-goi-duoc-lieu-thai-duong', N'dau-goi-duoc-lieu-thai-duong2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dau-goi-duoc-lieu-thai-duong', N'dau-goi-duoc-lieu-thai-duong3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dau-goi-hoa-buoi-la-beauty', N'dau-goi-hoa-buoi-la-beauty.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dau-goi-hoa-buoi-la-beauty', N'dau-goi-hoa-buoi-la-beauty1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dau-goi-hoa-buoi-la-beauty', N'dau-goi-hoa-buoi-la-beauty2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dau-goi-hoa-buoi-la-beauty', N'dau-goi-hoa-buoi-la-beauty3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dau-goi-thao-duoc-la-beauty', N'dau-goi-thao-duoc-la-beauty.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dau-goi-thao-duoc-la-beauty', N'dau-goi-thao-duoc-la-beauty1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dau-goi-thao-duoc-la-beauty', N'dau-goi-thao-duoc-la-beauty2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dau-goi-thao-duoc-la-beauty', N'dau-goi-thao-duoc-la-beauty3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dau-goi-tri-gau', N'dau-goi-tri-gau.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dau-goi-tri-gau', N'dau-goi-tri-gau1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dau-goi-tri-gau', N'dau-goi-tri-gau2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dau-goi-tri-gau', N'dau-goi-tri-gau3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dau-goi-tri-gau-nazorel-shampoo-ketoconazol', N'dau-goi-tri-gau-nazorel-shampoo-ketoconazol.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dau-goi-tri-gau-nazorel-shampoo-ketoconazol', N'dau-goi-tri-gau-nazorel-shampoo-ketoconazol1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dau-goi-tri-gau-nazorel-shampoo-ketoconazol', N'dau-goi-tri-gau-nazorel-shampoo-ketoconazol2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dau-goi-tri-gau-nazorel-shampoo-ketoconazol', N'dau-goi-tri-gau-nazorel-shampoo-ketoconazol3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dau-mu-u-thai-duong', N'dau-mu-u-thai-duong.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dau-mu-u-thai-duong', N'dau-mu-u-thai-duong1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dau-mu-u-thai-duong', N'dau-mu-u-thai-duong2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dau-mu-u-thai-duong', N'dau-mu-u-thai-duong3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'decumar', N'decumar.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'decumar', N'decumar1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'decumar', N'decumar2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'decumar', N'decumar3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dr-liver-jpanwell', N'dr-liver-jpanwell.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dr-liver-jpanwell', N'dr-liver-jpanwell1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dr-liver-jpanwell', N'dr-liver-jpanwell2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dr-liver-jpanwell', N'dr-liver-jpanwell3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dung-dich-ve-sinh-phu-nu', N'dung-dich-ve-sinh-phu-nu.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dung-dich-ve-sinh-phu-nu', N'dung-dich-ve-sinh-phu-nu1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dung-dich-ve-sinh-phu-nu', N'dung-dich-ve-sinh-phu-nu2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dung-dich-ve-sinh-phu-nu', N'dung-dich-ve-sinh-phu-nu3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dung-dich-ve-sinh-phu-nu-natural-feminine', N'dung-dich-ve-sinh-phu-nu-natural-feminine.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dung-dich-ve-sinh-phu-nu-natural-feminine', N'dung-dich-ve-sinh-phu-nu-natural-feminine1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dung-dich-ve-sinh-phu-nu-natural-feminine', N'dung-dich-ve-sinh-phu-nu-natural-feminine2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'dung-dich-ve-sinh-phu-nu-natural-feminine', N'dung-dich-ve-sinh-phu-nu-natural-feminine3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'euro-ginko-gold', N'euro-ginko-gold.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'euro-ginko-gold', N'euro-ginko-gold1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'euro-ginko-gold', N'euro-ginko-gold2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'euro-ginko-gold', N'euro-ginko-gold3.jpg', NULL)
GO
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'evening-primrose-oil', N'evening-primrose-oil.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'evening-primrose-oil', N'evening-primrose-oil1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'evening-primrose-oil', N'evening-primrose-oil2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'evening-primrose-oil', N'evening-primrose-oil3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'gasso-max', N'gasso-max.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'gasso-max', N'gasso-max1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'gasso-max', N'gasso-max2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'gasso-max', N'gasso-max3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'gel-lo-hoi-la-beauty', N'gel-lo-hoi-la-beauty.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'gel-lo-hoi-la-beauty', N'gel-lo-hoi-la-beauty1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'gel-lo-hoi-la-beauty', N'gel-lo-hoi-la-beauty2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'gel-lo-hoi-la-beauty', N'gel-lo-hoi-la-beauty3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'gel-rua-tay-kho', N'gel-rua-tay-kho.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'gel-rua-tay-kho', N'gel-rua-tay-kho1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'gel-rua-tay-kho', N'gel-rua-tay-kho2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'gel-rua-tay-kho', N'gel-rua-tay-kho3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'giai-doc-gan-liverwell', N'giai-doc-gan-liverwell.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'giai-doc-gan-liverwell', N'giai-doc-gan-liverwell1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'giai-doc-gan-liverwell', N'giai-doc-gan-liverwell2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'giai-doc-gan-liverwell', N'giai-doc-gan-liverwell3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'ha-ap-ich-nhan', N'ha-ap-ich-nhan.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'ha-ap-ich-nhan', N'ha-ap-ich-nhan1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'ha-ap-ich-nhan', N'ha-ap-ich-nhan2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'ha-ap-ich-nhan', N'ha-ap-ich-nhan3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'hai-thuong-vuong', N'hai-thuong-vuong.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'hai-thuong-vuong', N'hai-thuong-vuong1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'hai-thuong-vuong', N'hai-thuong-vuong2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'hai-thuong-vuong', N'hai-thuong-vuong3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'hoang-to-nu', N'hoang-to-nu.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'hoang-to-nu', N'hoang-to-nu1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'hoang-to-nu', N'hoang-to-nu2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'hoang-to-nu', N'hoang-to-nu3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'hoat-huyet-thong-mach', N'hoat-huyet-thong-mach.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'hoat-huyet-thong-mach', N'hoat-huyet-thong-mach1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'hoat-huyet-thong-mach', N'hoat-huyet-thong-mach2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'hoat-huyet-thong-mach', N'hoat-huyet-thong-mach3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'kem-boi-dac-tri', N'kem-boi-dac-tri.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'kem-boi-dac-tri', N'kem-boi-dac-tri1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'kem-boi-dac-tri', N'kem-boi-dac-tri2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'kem-boi-dac-tri', N'kem-boi-dac-tri3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'kem-danh-rang-duoc-lieu', N'kem-danh-rang-duoc-lieu.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'kem-danh-rang-duoc-lieu', N'kem-danh-rang-duoc-lieu1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'kem-danh-rang-duoc-lieu', N'kem-danh-rang-duoc-lieu2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'kem-danh-rang-duoc-lieu', N'kem-danh-rang-duoc-lieu3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'kutieskin-kem-boi', N'kutieskin-kem-boi.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'kutieskin-kem-boi', N'kutieskin-kem-boi1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'kutieskin-kem-boi', N'kutieskin-kem-boi2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'kutieskin-kem-boi', N'kutieskin-kem-boi3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'lacto-biomin-gold', N'lacto-biomin-gold.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'lacto-biomin-gold', N'lacto-biomin-gold1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'lacto-biomin-gold', N'lacto-biomin-gold2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'lacto-biomin-gold', N'lacto-biomin-gold3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'lacto-biomin-gold-new', N'lacto-biomin-gold-new.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'lacto-biomin-gold-new', N'lacto-biomin-gold-new1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'lacto-biomin-gold-new', N'lacto-biomin-gold-new2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'lacto-biomin-gold-new', N'lacto-biomin-gold-new3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'leana-ocavill', N'leana-ocavill.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'leana-ocavill', N'leana-ocavill1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'leana-ocavill', N'leana-ocavill2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'leana-ocavill', N'leana-ocavill3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'liverwell-nutrimed', N'liverwell-nutrimed.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'liverwell-nutrimed', N'liverwell-nutrimed1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'liverwell-nutrimed', N'liverwell-nutrimed2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'liverwell-nutrimed', N'liverwell-nutrimed3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'lutein', N'lutein.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'lutein', N'lutein1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'lutein', N'lutein2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'lutein', N'lutein3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'maca-m-male-power', N'maca-m-male-power.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'maca-m-male-power', N'maca-m-male-power1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'maca-m-male-power', N'maca-m-male-power2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'maca-m-male-power', N'maca-m-male-power3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'maxpremum-naga-plus', N'maxpremum-naga-plus.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'maxpremum-naga-plus', N'maxpremum-naga-plus1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'maxpremum-naga-plus', N'maxpremum-naga-plus2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'maxpremum-naga-plus', N'maxpremum-naga-plus3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'may-tam-nuoc-cam-tay', N'may-tam-nuoc-cam-tay.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'may-tam-nuoc-cam-tay', N'may-tam-nuoc-cam-tay1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'may-tam-nuoc-cam-tay', N'may-tam-nuoc-cam-tay2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'may-tam-nuoc-cam-tay', N'may-tam-nuoc-cam-tay3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'may-xong-khi', N'may-xong-khi.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'may-xong-khi', N'may-xong-khi1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'may-xong-khi', N'may-xong-khi2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'may-xong-khi', N'may-xong-khi3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'mo-mau-tam-binh', N'mo-mau-tam-binh.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'mo-mau-tam-binh', N'mo-mau-tam-binh1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'mo-mau-tam-binh', N'mo-mau-tam-binh2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'mo-mau-tam-binh', N'mo-mau-tam-binh3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'nattocerebest', N'nattocerebest.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'nattocerebest', N'nattocerebest1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'nattocerebest', N'nattocerebest2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'nattocerebest', N'nattocerebest3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'neothera-acnes-gel', N'neothera-acnes-gel.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'neothera-acnes-gel', N'neothera-acnes-gel1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'neothera-acnes-gel', N'neothera-acnes-gel2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'neothera-acnes-gel', N'neothera-acnes-gel3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'ninh-tam-vuong', N'ninh-tam-vuong.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'ninh-tam-vuong', N'ninh-tam-vuong1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'ninh-tam-vuong', N'ninh-tam-vuong2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'ninh-tam-vuong', N'ninh-tam-vuong3.jpg', NULL)
GO
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'nuoc-hoa-hong-la-beauty', N'nuoc-hoa-hong-la-beauty.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'nuoc-hoa-hong-la-beauty', N'nuoc-hoa-hong-la-beauty1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'nuoc-hoa-hong-la-beauty', N'nuoc-hoa-hong-la-beauty2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'nuoc-hoa-hong-la-beauty', N'nuoc-hoa-hong-la-beauty3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'nuoc-suc-mieng', N'nuoc-suc-mieng.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'nuoc-suc-mieng', N'nuoc-suc-mieng1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'nuoc-suc-mieng', N'nuoc-suc-mieng2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'nuoc-suc-mieng', N'nuoc-suc-mieng3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'nuoc-tay-trang-la-beauty', N'nuoc-tay-trang-la-beauty.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'nuoc-tay-trang-la-beauty', N'nuoc-tay-trang-la-beauty1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'nuoc-tay-trang-la-beauty', N'nuoc-tay-trang-la-beauty2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'nuoc-tay-trang-la-beauty', N'nuoc-tay-trang-la-beauty3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'omega-plus', N'omega-plus.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'omega-plus', N'omega-plus1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'omega-plus', N'omega-plus2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'omega-plus', N'omega-plus3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'omexxel-cardio', N'omexxel-cardio.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'omexxel-cardio', N'omexxel-cardio1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'omexxel-cardio', N'omexxel-cardio2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'omexxel-cardio', N'omexxel-cardio3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'omexxel-ginkgo', N'omexxel-ginkgo.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'omexxel-ginkgo', N'omexxel-ginkgo1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'omexxel-ginkgo', N'omexxel-ginkgo2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'omexxel-ginkgo', N'omexxel-ginkgo3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'onagre', N'onagre.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'onagre', N'onagre1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'onagre', N'onagre2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'onagre', N'onagre3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'optimax-immunity', N'optimax-immunity.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'optimax-immunity', N'optimax-immunity1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'optimax-immunity', N'optimax-immunity2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'optimax-immunity', N'optimax-immunity3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'pikolin-ocavill', N'pikolin-ocavill.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'pikolin-ocavill', N'pikolin-ocavill1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'pikolin-ocavill', N'pikolin-ocavill2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'pikolin-ocavill', N'pikolin-ocavill3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'proctogel', N'proctogel.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'proctogel', N'proctogel1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'proctogel', N'proctogel2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'proctogel', N'proctogel3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'rosette-acne-clear', N'rosette-acne-clear.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'rosette-acne-clear', N'rosette-acne-clear1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'rosette-acne-clear', N'rosette-acne-clear2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'rosette-acne-clear', N'rosette-acne-clear3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'rua-mat-nghe-nano', N'rua-mat-nghe-nano.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'rua-mat-nghe-nano', N'rua-mat-nghe-nano1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'rua-mat-nghe-nano', N'rua-mat-nghe-nano2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'rua-mat-nghe-nano', N'rua-mat-nghe-nano3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'sam-nhung-bo-than', N'sam-nhung-bo-than.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'sam-nhung-bo-than', N'sam-nhung-bo-than1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'sam-nhung-bo-than', N'sam-nhung-bo-than2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'sam-nhung-bo-than', N'sam-nhung-bo-than3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'siro-an-ngon-healthy', N'siro-an-ngon-healthy.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'siro-an-ngon-healthy', N'siro-an-ngon-healthy1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'siro-an-ngon-healthy', N'siro-an-ngon-healthy2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'siro-an-ngon-healthy', N'siro-an-ngon-healthy3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'tam-bong', N'tam-bong.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'tam-bong', N'tam-bong1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'tam-bong', N'tam-bong2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'tam-bong', N'tam-bong3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'tam-chi-ke-rang-okamura', N'tam-chi-ke-rang-okamura.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'tam-chi-ke-rang-okamura', N'tam-chi-ke-rang-okamura1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'tam-chi-ke-rang-okamura', N'tam-chi-ke-rang-okamura2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'tam-chi-ke-rang-okamura', N'tam-chi-ke-rang-okamura3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'tam-goi-em-be', N'tam-goi-em-be.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'tam-goi-em-be', N'tam-goi-em-be1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'tam-goi-em-be', N'tam-goi-em-be2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'tam-goi-em-be', N'tam-goi-em-be3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'tam-that-xa-den', N'tam-that-xa-den.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'tam-that-xa-den', N'tam-that-xa-den1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'tam-that-xa-den', N'tam-that-xa-den2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'tam-that-xa-den', N'tam-that-xa-den3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'tinh-dau-buoi-yanagiya', N'tinh-dau-buoi-yanagiya.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'tinh-dau-buoi-yanagiya', N'tinh-dau-buoi-yanagiya1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'tinh-dau-buoi-yanagiya', N'tinh-dau-buoi-yanagiya2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'tinh-dau-buoi-yanagiya', N'tinh-dau-buoi-yanagiya3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'to-nu-vuong', N'to-nu-vuong.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'to-nu-vuong', N'to-nu-vuong1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'to-nu-vuong', N'to-nu-vuong2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'to-nu-vuong', N'to-nu-vuong3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'trang-hai-thuong-vuong-vesta', N'trang-hai-thuong-vuong-vesta.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'trang-hai-thuong-vuong-vesta', N'trang-hai-thuong-vuong-vesta1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'trang-hai-thuong-vuong-vesta', N'trang-hai-thuong-vuong-vesta2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'trang-hai-thuong-vuong-vesta', N'trang-hai-thuong-vuong-vesta3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'trung-thao-gold', N'trung-thao-gold.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'trung-thao-gold', N'trung-thao-gold1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'trung-thao-gold', N'trung-thao-gold2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'trung-thao-gold', N'trung-thao-gold3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N've-sinh-pn-herbal-nano-vinapharma', N've-sinh-pn-herbal-nano-vinapharma.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N've-sinh-pn-herbal-nano-vinapharma', N've-sinh-pn-herbal-nano-vinapharma1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N've-sinh-pn-herbal-nano-vinapharma', N've-sinh-pn-herbal-nano-vinapharma2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N've-sinh-pn-herbal-nano-vinapharma', N've-sinh-pn-herbal-nano-vinapharma3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N've-sinh-tai', N've-sinh-tai.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N've-sinh-tai', N've-sinh-tai1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N've-sinh-tai', N've-sinh-tai2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N've-sinh-tai', N've-sinh-tai3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'vien-dat-emoran', N'vien-dat-emoran.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'vien-dat-emoran', N'vien-dat-emoran1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'vien-dat-emoran', N'vien-dat-emoran2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'vien-dat-emoran', N'vien-dat-emoran3.jpg', NULL)
GO
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'vien-sang-mat-hai-thuong-vuong', N'vien-sang-mat-hai-thuong-vuong.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'vien-sang-mat-hai-thuong-vuong', N'vien-sang-mat-hai-thuong-vuong1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'vien-sang-mat-hai-thuong-vuong', N'vien-sang-mat-hai-thuong-vuong2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'vien-sang-mat-hai-thuong-vuong', N'vien-sang-mat-hai-thuong-vuong3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'vien-thia-canh', N'vien-thia-canh.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'vien-thia-canh', N'vien-thia-canh1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'vien-thia-canh', N'vien-thia-canh2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'vien-thia-canh', N'vien-thia-canh3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'vien-uong-kenkan', N'vien-uong-kenkan.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'vien-uong-kenkan', N'vien-uong-kenkan1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'vien-uong-kenkan', N'vien-uong-kenkan2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'vien-uong-kenkan', N'vien-uong-kenkan3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'vitamin-e-duong-am', N'vitamin-e-duong-am.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'vitamin-e-duong-am', N'vitamin-e-duong-am1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'vitamin-e-duong-am', N'vitamin-e-duong-am2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'vitamin-e-duong-am', N'vitamin-e-duong-am3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'vuong-nu-khang', N'vuong-nu-khang.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'vuong-nu-khang', N'vuong-nu-khang1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'vuong-nu-khang', N'vuong-nu-khang2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'vuong-nu-khang', N'vuong-nu-khang3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'xit-mui-muoi-bien', N'xit-mui-muoi-bien.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'xit-mui-muoi-bien', N'xit-mui-muoi-bien1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'xit-mui-muoi-bien', N'xit-mui-muoi-bien2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'xit-mui-muoi-bien', N'xit-mui-muoi-bien3.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'xit-thom-mieng', N'xit-thom-mieng.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'xit-thom-mieng', N'xit-thom-mieng1.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'xit-thom-mieng', N'xit-thom-mieng2.jpg', NULL)
INSERT [dbo].[tAnhSanPham] ([MaThuoc], [TenFileAnh], [Vitri]) VALUES (N'xit-thom-mieng', N'xit-thom-mieng3.jpg', NULL)
GO
INSERT [dbo].[tChuyenMon] ([MaChuyenMon], [TenChuyenMon]) VALUES (N'HBT', N'Hệ bài tiết')
INSERT [dbo].[tChuyenMon] ([MaChuyenMon], [TenChuyenMon]) VALUES (N'HHH', N'Hệ hô hấp')
INSERT [dbo].[tChuyenMon] ([MaChuyenMon], [TenChuyenMon]) VALUES (N'HNT', N'Hệ nội tiết')
INSERT [dbo].[tChuyenMon] ([MaChuyenMon], [TenChuyenMon]) VALUES (N'HSS', N'Hệ sinh sản')
INSERT [dbo].[tChuyenMon] ([MaChuyenMon], [TenChuyenMon]) VALUES (N'HTH', N'Hệ tiêu hóa')
INSERT [dbo].[tChuyenMon] ([MaChuyenMon], [TenChuyenMon]) VALUES (N'HTHoan', N'Hệ tuần hoàn')
INSERT [dbo].[tChuyenMon] ([MaChuyenMon], [TenChuyenMon]) VALUES (N'HTK', N'Hệ thần kinh')
INSERT [dbo].[tChuyenMon] ([MaChuyenMon], [TenChuyenMon]) VALUES (N'HVD', N'Hệ vận động')
GO
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'aloclair-plus-gel-alliance', N'Gel bôi Aloclair Plus Gel Alliance điều trị tay chân miệng, nhiệt miệng, viêm lợi', N'Gel bôi nhiệt miệng, tay chân miệng Aloclair Plus Gel Alliance là sản phẩm chuyên dụng trong việc điều trị các vết thương hở trong khoang miệng và ngoài da', N'Thoa một lớp nhẹ trực tiếp lên bề mặt vết thương hoặc sử dụng tăm bông.Đợi 30 giây để Aloclair Plus Gel tạo màng sinh học giúp giảm đau tức thì và hỗ trợ lành thương', N'Aloclair Plus Gel thích hợp dùng với mọi lứa tuổi, mọi đối tượng (trẻ trên 2 tháng tuổi, trẻ em, người lớn và phụ nữ mang thai).', N'Sản phẩm thân thiện với người dùng: Không độc hại, không gây tác dụng phụ và dễ sử dụng.', N'Nơi khô ráo, thoáng mát.', N'Sau khi bôi gel, đợi 30 giây - 1 phút để Aloclair Plus Gel có đủ thời gian hình thành lớp màng sinh học.

Hạn chế ăn hoặc uống trong vòng 1 tiếng sau khi sử dụng sản phẩm.', N'Sodium benzoate,Potassium sorbate,..', N'Lành thương thần tốc, giảm đau tức thì', N'Gel', N'CSRM', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), N'VN', NULL, NULL, N'aloclair-plus-gel-alliance.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'an-da-naga', N'Viên dạ dày An Dạ Khang Naga Vesta giúp bảo vệ niêm mạc dạ dày, tá tràng', N'Viên dạ dày An Dạ Khang Naga giúp bảo vệ niêm mạc dạ dày, tá tràng. Hỗ trợ giảm viêm loét dạ dày - tá tràng với các biểu hiện: đau rát vùng thượng vị, ợ chua, chậm tiêu.', N'Mỗi lần uống 2 - 3 viên, ngày 2 lần.

Uống sau khi ăn từ 30 phút đến 1 giờ.', N'Viên dạ dày An Dạ Khang Naga thích hợp sử dụng cho người bị viêm loét dạ dày - tá tràng với các biểu hiện: đau rát vùng thượng vị, ợ chua, chậm tiêu.', N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, nhiệt độ không quá 30oC, tránh ánh sáng trực tiếp.

Để xa tầm tay trẻ em.', N'Không dùng cho người mẫn cảm với bất kỳ thành phần nào của sản phẩm.

Sản phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.

Đọc kỹ hướng dẫn sử dụng trước khi dùng.', N'Sinh khương,Bạch hoa xà thiệt thảo,Nghệ vàng,...', N'Giảm triệu chứng đau dạ dày.Bảo vệ niêm mạc, ngăn ngừa viêm loét dạ dày - tá tràngien', N'Vien', N'HTTH', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), N'HQ', NULL, NULL, N'an-da-naga.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'an-ngon-ngu-ngon', N'Viên uống Ăn Ngon Ngủ Ngon New Tất Thành hỗ trợ ăn ngon, ngủ ngon', N' Ăn Ngon Ngủ Ngon New Tất Thành hỗ trợ ăn ngon, ngủ ngon, giúp an thần, bồi bổ cơ thể, tạo giấc ngủ sinh lý sâu và chất lượng.', N'Uống 2 viên/ngày.

Uống trước khi ngủ 30 - 60 phút.

Khi đã ngủ tốt nên dừng lại. Mỗi đợt nên uống 2 - 3 tuần.', N'Mất ngủ, ngủ kém, ngủ không sâu giấc.
Ăn uống kém, ăn không ngon miệng.', N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', N'Không dùng cho người mẫn cảm với bất kỳ thành phần nào của sản phẩm.

Sản phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.

Đọc kỹ hướng dẫn sử dụng trước khi dùng.', N'L-Lysine hydrochloride,Rotundin,..', N'Cải thiện tuần hoàn máu não, ăn ngon hơn, ngủ ngon hơn,Bồi bổ cơ thể, ăn uống ngon miệng', N'Vien', N'TKN', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'an-ngon-ngu-ngon.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'bamogin', N'Viên uống Bamogin Thành Công giúp tăng cường tuần hoàn não', N'Bamogin giúp tăng cường tuần hoàn não, cải thiện trí nhớ, tăng khả năng tập trung, giảm tình trạng căng thẳng, lo lắng, suy nhược thần kinh.', N'Uống 1 viên/lần x 1 - 2 lần/ngày.

Uống vào buổi sáng và trưa.', N'Người bị suy nhược thần kinh, đau đầu, hoa mắt, chóng mặt, ù tai, rối loạn tiền đình, giảm trí nhớ, tê bì chân tay.
Người bị mắc bệnh hay quên, lơ đãng, người bị Alzheimer.', N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', N'Không sử dụng cho người mẫn cảm với bất kỳ thành phần nào của sản phẩm.

Sản phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.

Đọc kĩ hướng dẫn trước khi dùng.', N'Rau má,Vitamin B1,Lạc tiên,..', N'Tăng tuần hoàn não - Cải thiện trí nhớ.An thần và cải thiện giấc ngủ', N'Hop', N'TKN', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'bamogin.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'ban-chai-danh-rang-dien', NULL, NULL, NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'DCYT', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'ban-chai-danh-rang-dien.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'bao-xuan', N'Viên uống Bảo Xuân Tuổi 50+ Nam Dược cân bằng nội tiết', N'Cải thiện các triệu chứng trong thời kỳ mãn kinh', N' Ngày 1 lần x 2 viên.', N'Phụ nữ mãn kinh, sau mãn kinh.
Phụ nữ sau cắt buồng trứng.', N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', N'Không sử dụng cho người mẫn cảm với bất kỳ thành phần nào của sản phẩm.

Sản phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.

Đọc kĩ hướng dẫn trước khi dùng.', N'Calci gluconat,Xuyên khung,Đương quy,..', N'Cải thiện các triệu chứng trong thời kỳ mãn kinh', N'Hop', N'NTT', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'bao-xuan.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'best-king-jpanwell', N'Tinh chất hàu Best King Jpanwell hỗ trợ tăng cường sinh lý và khả năng sinh sản ở nam giới', N'Thúc đẩy sản sinh hormone testosterone', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'NTT', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'best-king-jpanwell.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'bifido-plus-jpanwell', N'Viên uống Bifido Plus Jpanwell bổ sung lợi khuẩn tăng cường sức khỏe đại tràng', N'Bifido Plus bổ sung lợi khuẩn tăng cường sức khỏe đại tràng; giúp giảm thiểu các chứng bệnh hay mắc ở đại tràng. Giảm nguy cơ rối loạn tiêu hóa, cải thiện các triệu chứng ăn uống kém', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'HTTH', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'bifido-plus-jpanwell.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'blood-pressure', N'Viên uống Blood Pressure+++ Jpanwell hỗ trợ ổn định và điều hòa huyết áp', N'Blood Pressure+++ hỗ trợ ổn định và điều hòa huyết áp, tăng lượng máu cho cơ thể, tăng cường lưu thông máu đến các bộ phận.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'SKTM', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'blood-pressure.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'brightening-cleansing-milk', N'Sữa rửa mặt Anti-Acne Brightening Cleansing Milk Decumar Advanced giúp ngừa mụn, giảm thâm', N'à sản phẩm chuyên biệt cho da mụn Decumar là phiên bản hoàn toàn mới, được bổ sung thêm các dưỡng chất sáng da từ Hàn Quốc kết hợp cùng công nghệ Nano THC không màu giúp làm sạch dịu nhẹ', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'CSDM', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'brightening-cleansing-milk.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'cholessen', N'Viên uống Cholessen Decotra hỗ trợ giảm cholesterol máu, giảm gan nhiễm mỡ', N' Cholessen với các dược liệu từ thiên nhiên giúp tăng cường chuyển hóa chất béo trong cơ thể, giảm cholesterol máu, giảm gan nhiễm mỡ và rất an toàn đối với sức khỏe.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'SKTM', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'cholessen.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'cholesterol-aid', N'Viên uống Cholesterol Aid Vitamins For Life hỗ trợ giảm cholesterol', N'Cholesterol Aid giúp ngăn ngừa và giảm cholesterol có hại, giảm triglyceride trong máu (mỡ máu...).', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'SKTM', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'cholesterol-aid.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'coq10', N'Viên uống CoQ10 30mg Pharmekal hỗ trợ sức khoẻ cho tim, giảm quá trình oxy hoá', N'CoQ10 hỗ trợ sức khỏe cho tim mạch, giảm cholesterol máu ( trong rối loạn lipid máu), giúp hô hấp tế bào cơ tim. Hỗ trợ làm chậm quá trình lão hóa và giúp cơ thể khỏe mạnh.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'SKTM', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'coq10.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'curcumin-va-tinh-chat-dau-tram', N'Xà phòng Acnes Body Bar Neo Acnes Curcumin & Teatree Oil hỗ trợ điều trị mụn', N'Neo Acnes Curcumin &amp; Teatree Oil nhẹ nhàng loại bỏ bụi bẩn trên bề mặt da. Làm sạch cơ thể, ngừa mụn, làm mờ thâm sẹo vùng cổ, lưng, mông', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, N'Kháng viêm, kháng khuẩn, hỗ trợ giảm mụn vùng lưng', NULL, N'CSCT', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'curcumin-va-tinh-chat-dau-tram.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'dau-goi-duoc-lieu-thai-duong', N'Dầu gội dược liệu Thái Dương 3 hương hoa 3 ngày không gàu không ngứa', N'ầu gội dược liệu Thái Dương 3 Hương Hoa là bước đột phá mới chăm sóc toàn diện mái tóc bằng các tinh chất thảo dược đã được ca tụng hàng ngàn đời nay, nuôi dưỡng tóc từ gốc đến ngọn', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'CST', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'dau-goi-duoc-lieu-thai-duong.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'dau-goi-hoa-buoi-la-beauty', N'Dầu gội hoa bưởi La Beauty Lavita giảm gãy rụng, kích thích mọc tóc', N'ầu Gội Hoa Bưởi La Beauty giúp đáp ứng nhu cầu chăm sóc mái tóc hiệu quả từ tinh dầu vỏ bưởi và thảo dược,  cho tóc và da đầu sạch gàu, thơm dịu nhẹ', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'CST', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'dau-goi-hoa-buoi-la-beauty.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'dau-goi-thao-duoc-la-beauty', N'Dầu gội thảo dược La Beauty dưỡng tóc suôn mượt, phục hồi tóc chuyên sâu', N'Dầu gội thảo dược La Beauty 250ml là sản phẩm kết hợp các dưỡng chất tốt lành từ thiên nhiên để nuôi dưỡng da dầu và tóc phát triển khỏe mạnh suôn mượt.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'CST', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'dau-goi-thao-duoc-la-beauty.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'dau-goi-tri-gau', NULL, NULL, NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'CSRM', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'dau-goi-tri-gau.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'dau-goi-tri-gau-nazorel-shampoo-ketoconazol', N'Dầu gội Nazorel Shampoo Ketoconazol điều trị gàu và nấm trên da đầu', N'Dầu gội trị gàu Nazorel Shampoo Ketoconazol giúp hỗ trợ điều trị mẩn ngứa trên da đầu do gàu và nấm gây ra. Sản phẩm không gây kích ứng trên da khi sử dụng.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'CST', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'dau-goi-tri-gau-nazorel-shampoo-ketoconazol.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'dau-mu-u-thai-duong', N'Dầu Mù U Thái Dương Đất Việt hỗ trợ điều trị bỏng, tái tạo da, làm lành vết thương', N'Dầu Mù U Thái Dương 100% thiên nhiên, hàm lượng axit béo cao, hiệu quả và an toàn cho sức khỏe của mọi người.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, N'Bí quyết dưỡng da hoàn toàn tự nhiên', NULL, N'CSCT', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'dau-mu-u-thai-duong.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'decumar', N'Gel ngừa mụn Anti-Acne Nano THC Decumar Advanced', N'chuyên biệt cho da mụn với chất gel trong suốt chứa Nano THC (Nano Tetrahydrocurcumin), một chất chuyển hóa không màu của curcumin giúp ngăn ngừa, giảm mụn', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'CSDM', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'decumar.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'dr-liver-jpanwell', N'Viên uống Dr. Liver Jpanwell hỗ trợ bảo vệ chức năng gan', N'Dr.Liver hỗ trợ bảo vệ chức năng gan.', N'Uống 2 viên/ngày với nước nguội hoặc nước ấm', N'Người muốn cải thiện sức khỏe lá gan.Người bị các bệnh lý về gan.', N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, nhiệt độ dưới 30 độ C.', N'Không sử dụng cho người mẫn cảm với bất kỳ thành phần nào của sản phẩm.', N'chiết xuất cây kế sữa,Vintamin B6,C,B1,A', N'Dr.Liver giúp bạn chủ động thải độc gan, tăng cường chức năng gan tại nhà vừa hiệu quả, tiện lợi lại an toàn cho sức khỏe.', N'Lo', N'CTTCCN', CAST(N'2021-03-04T00:00:00.000' AS DateTime), CAST(N'2024-04-03T00:00:00.000' AS DateTime), N'US', 990000.0000, 950000.0000, N'dr-liver-jpanwell.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'dung-dich-ve-sinh-phu-nu', N'Dung dịch vệ sinh phụ nữ Natural Feminine Curcumin Wash hỗ trợ làm sạch và dưỡng ẩm', N'Dung dịch vệ sinh phụ nữ Natural Feminine Curcumin Wash 100ml giúp làm sạch, dưỡng ẩm và bảo vệ vùng da nhạy cảm của phái nữ', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'VSCN', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'dung-dich-ve-sinh-phu-nu.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'dung-dich-ve-sinh-phu-nu-natural-feminine', N'Nước rửa phụ khoa Natural Feminine Trầu Không bảo vệ hằng ngày an toàn dịu nhẹ', N'giúp làm sạch, dưỡng ẩm và bảo vệ vùng da nhạy cảm của phái nữ. Sản phẩm giúp làm giảm cảm giác khô rát, ngứa và ngăn mùi hôi từ vùng kín.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'CSCT', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'dung-dich-ve-sinh-phu-nu-natural-feminine.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'euro-ginko-gold', N'Viên uống Euro Ginko Gold HD Pharma hỗ trợ hoạt huyết, tăng cường tuần hoàn máu não', N'Viên uống Euro Ginko Gold HD Pharma hỗ trợ hoạt huyết, tăng cường tuần hoàn máu não, giúp giảm các triệu chứng do thiểu năng tuần hoàn não', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'TKN', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'euro-ginko-gold.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'evening-primrose-oil', N'Viên uống Evening Primrose Oil (EPO) 1000mg Good Health cải thiện nội tiết tố nữ', N'có tác dụng cân bằng nội tiết tố nữ, duy trì làn da khỏe đẹp, cải thiện các triệu chứng suy giảm nội tiết tố. Giúp phái đẹp luôn tươi trẻ, khỏe mạnh mặc cho những tác động của thời gian và lão hóa', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'NTT', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'evening-primrose-oil.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'gasso-max', N'Viên uống Gasso Max Vitamins For Life bổ sung enzym và các thảo mộc', N'Gasso Max bổ sung enzym và các thảo mộc, hỗ trợ tiêu hóa tốt.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'HTTH', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'gasso-max.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'gel-lo-hoi-la-beauty', N'Gel lô hội La Beauty hỗ trợ giữ ẩm, mát dịu da', N'Gel Lô hội La Beauty được chiết xuất trực tiếp từ Lô hội tự nhiên và các dưỡng chất giữ ẩm giúp làm mát và dịu da. Ngăn ngừa lão hoá da,  giúp làn da mịn màng, tươi trẻ. Dưỡng tóc, giữ nếp tóc.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'CSCT', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'gel-lo-hoi-la-beauty.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'gel-rua-tay-kho', N'Gel rửa tay khô Natural Hand Sanitizer hỗ trợ làm sạch tay, khử mùi, dưỡng ẩm', N'Natural Hand Sanitizer làm sạch vi khuẩn và bụi bẩn bám trên tay, ngăn ngừa các bệnh lây nhiễm qua tay.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'VSCN', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'gel-rua-tay-kho.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'giai-doc-gan-liverwell', N'Viên uống LiverWell Navi hỗ trợ thanh nhiệt', N'Bệnh gan do rượu, Viêm gân, Gan nhiễm mỡ, Xơ gan, Rối loạn chức năng gan', N'Thiếu niên và người lớn: Uống 2 viên/lần x 1 - 2 lần/ngày.', N'Người bị suy giảm chức năng gan với biểu hiện: Mẫn ngứa, nổi mề đay, vàng da, mụn nhọt, ăn uống kém tiêu.', N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, nhiệt độ dưới 30 độ C.', N'Không sử dụng cho người mẫn cảm với bất kỳ thành phần nào của sản phẩm.', N'Atisô,nhân trần,sài đất,...', N'viên uống giải độc gan LiverWell hỗ trợ điều trị các bệnh viêm gan và tăng cường chức năng gan, mang đến cho bạn một lá gan khỏe mạnh.', N'Vi', N'CTTCCN', CAST(N'2021-05-06T00:00:00.000' AS DateTime), CAST(N'2023-12-12T00:00:00.000' AS DateTime), N'VN', 132000.0000, 120000.0000, N'giai-doc-gan-liverwell.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'ha-ap-ich-nhan', N'Viên uống Ích Nhân Nam Dược hỗ trợ hạ huyết áp, giảm nguy cơ tai biến', N'Hạ Áp Ích Nhân hỗ trợ tăng cường sức bền thành mạch, hỗ trợ giảm huyết áp cao. Hỗ trợ giảm thiểu nguy cơ tai biến mạch máu não.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'SKTM', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'ha-ap-ich-nhan.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'hai-thuong-vuong', N'Viên uống Dạ Dày Hải Thượng Vương hỗ trợ giảm acid dịch vị, bảo vệ niêm mạc dạ dày ', N'Dạ Dày Hải Thượng Vương hỗ trợ giảm acid dịch vị, bảo vệ niêm mạc dạ dày. Hỗ trợ giảm triệu chứng: ợ chua, đau thượng vị, trào ngược dạ dày, thực quản do viêm loét dạ dày, tá tràng.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'HTTH', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'hai-thuong-vuong.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'hoang-to-nu', N'Viên uống Hoàng Tố Nữ Hose Hoa Sen giúp bổ trung ích khí, sinh tân, chỉ khá', N'Bổ sung ích khí, sinh tân, chỉ khát', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'NTT', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'hoang-to-nu.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'hoat-huyet-thong-mach', N'Viên uống Hoạt Huyết Thông Mạch Hoàng Gia Royal Care tăng tuần hoàn não', N'Viên uống Hoạt Huyết Thông Mạch giúp hoạt huyết, tăng cường tuần hoàn não, hỗ trợ giảm nguy cơ hình thành cục máu đông, hỗ trợ làm giảm các triệu chứng: khó ngủ, mất ngủ, đau đầu', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'TKN', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'hoat-huyet-thong-mach.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'kem-boi-dac-tri', N'Kem bôi Procream phục hồi, làm lành, dịu nhẹ các tổn thương da cho trẻ nhỏ', N'Procream 30g là kem bôi hỗ trợ điều trị chàm sữa, hăm tã, kích ứng, bỏng, ... giúp phục hồi và làm lành nhanh các tổn thương trên da, duy trì độ ẩm và hỗ trợ giảm tổn thương da hiệu quả.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'DCYT', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'kem-boi-dac-tri.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'kem-danh-rang-duoc-lieu', N'Kem đánh răng dược liệu Ngọc Châu hỗ trợ răng chắc khỏe từ gốc', N'hứa các dược liệu có tác dụng tăng cường nuôi dưỡng răng lợi,  chống ê buốt, giúp răng chắc khỏe từ gốc, thanh nhiệt, ngừa sâu răng, giữ răng sáng bóng ', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'CSRM', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'kem-danh-rang-duoc-lieu.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'kutieskin-kem-boi', N'Kem bôi dịu da cho bé Kutieskin hỗ trợ giảm ngứa nhanh, mẩn đỏ, tái tạo da', N' giúp chống viêm, kháng khuẩn, giảm ngứa, dịu mẩn đỏ, dưỡng ẩm, tạo màng bảo vệ, tái tạo da, ngăn ngừa thâm sẹo.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'CSCT', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'kutieskin-kem-boi.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'lacto-biomin-gold', N'Cốm vi sinh Lacto Biomin Gold HdPharma tăng lợi khuẩn cho hệ tiêu hóa', N'Giúp ăn ngon và nâng cao khả năng hấp thu dưỡng chất, nâng cao sức đề kháng. Hỗ trợ cải thiện hệ vi sinh đường ruột và giúp giảm nguy cơ rối loạn tiêu hóa do loạn khuẩn đường ruột.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'HTTH', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'lacto-biomin-gold.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'lacto-biomin-gold-new', N'Viên nang Lacto Biomin Gold New HdPharma hỗ trợ cải thiện hệ vi sinh đường ruột', N'Giúp ăn ngon và nâng cao khả năng hấp thu dưỡng chất, nâng cao sức đề kháng. Hỗ trợ cải thiện hệ vi sinh đường ruột và giúp giảm nguy cơ rối loạn tiêu hóa do loạn khuẩn đường ruột.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'HTTH', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'lacto-biomin-gold-new.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'leana-ocavill', N'Viên uống Léana Ocavill hỗ trợ cân bằng nội tiết tố ', N'Cân bằng nội tiết tố, níu giữ tuổi xuân cho phụ nữ', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'NTT', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'leana-ocavill.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'liverwell-nutrimed', N'Viên uống Liverwell Nutrimed hỗ trợ giải độc gan', N'Liverwell Nutrimed giúp bổ gan, hỗ trợ giải độc gan. Tăng cường chức năng gan. Giảm triệu chứng: Vàng da, chán ăn, mệt mỏi', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, N'Liverwell Nutrimed với công thức chứa nhiều thành phần bổ gan vượt trội như silymarin, L-cystine cùng vitamin nhóm B và các thảo dược tự nhiên giúp phòng ngừa và cải thiện nhanh chóng các bệnh về gan,', NULL, N'CTTCCN', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'liverwell-nutrimed.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'lutein', N'Viên uống Lutein Nature''s Bounty bổ sung Lutein giúp tăng cường thị lực cho mắt', N'Lutein Nature''s Bounty bổ sung Lutein giúp duy trì và tăng cường thị lực cho mắt giảm nguy cơ thoái hóa điểm vàng ở mắt giúp mắt khỏe mạnh.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, N'Lutein Nature''s Bounty được nhập khẩu từ Hoa Kỳ với thành phần quan trọng trong việc bảo vệ đôi mắt zeaxanthin giúp đôi mắt luôn sáng khỏe, giảm quá trình lão hóa mạnh', NULL, N'CTTCCN', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'lutein.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'maca-m-male-power', N'Viên uống Maca M Male Power Nature''s Supplements bổ thận, tráng dương', N'Hỗ trợ phục hồi sinh lý nam - Lấy lại bản lĩnh đàn ông', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'NTT', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'maca-m-male-power.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'maxpremum-naga-plus', N'Viên uống MaxPremum Naga Plus Vesta tăng sức khỏe, đề kháng cho thai phụ', N'MaxPremum Naga Plus bổ sung sắt, DHA, acid folic, một số vitamin và khoáng chất cho phụ nữ trong thời kỳ mang thai', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, N'MaxPremum Naga Plus giúp phát triển trí não', NULL, N'CTTCCN', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'maxpremum-naga-plus.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'may-tam-nuoc-cam-tay', N'Máy tăm nước cầm tay 6 chế độ Halio Professional Cordless Oral Irrigator', N'à sản phẩm hỗ trợ vệ sinh răng miệng với sự kết hợp tiên tiến giữa áp lực nước và xung lực 1', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'CSRM', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'may-tam-nuoc-cam-tay.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'may-xong-khi', N'Máy xông khí dung BioHealth Neb Pro giúp khuếch tán thuốc theo dạng sương mù', N'áy xông khí dung BioHealth NEB Pro với kích thước nhỏ gọn, thiết kế đơn giản dễ sử dụng,  giúp khuếch tán thuốc theo dạng sương mù, tác động vào hệ thống niêm mạc đường hô hấp trên hoặc dưới', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'DCYT', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'may-xong-khi.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'mo-mau-tam-binh', N'Viên uống Mỡ Máu Tâm Bình hỗ trợ giảm mỡ máu, giảm mỡ gan', N'Mỡ Máu Tâm Bình hỗ trợ giảm mỡ máu,  giảm cholesterol và triglyceride; giảm mỡ gan,  giảm nguy cơ gan nhiễm mỡ; giảm nguy cơ xơ vữa mạch máu gây huyết áp cao', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'SKTM', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'mo-mau-tam-binh.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'nattocerebest', N'Viên uống NattocereBest 1000-Q10 Navi hỗ trợ làm tan huyết khối, giảm nguy cơ tai biến mạch máu não', N'NattocereBest hỗ trợ làm tan huyết khối (cục máu đông) trong lòng mạch, giúp tăng tuần hoàn máu. Hỗ trợ giảm nguy cơ tai biến mạch máu não và thiểu năng tuần hoàn.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'TKN', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'nattocerebest.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'neothera-acnes-gel', N'Gel Neothera Acnes giảm mụn thâm, sẹo mụn', N'Gel giảm mụn thâm, sẹo mụn Neothera Acnes Gel 15ml giúp nhanh chóng dịu nốt mụn, cải thiện tình trạng bóng nhờn, phục hồi tinh chỉnh bề mặt da láng mịn sau mụn.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'CSDM', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'neothera-acnes-gel.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'ninh-tam-vuong', N'Viên uống Ninh Tâm Vương Hồng Bàng dùng cho người hồi hộp, trống ngực, tim đập nhanh', N' Ninh Tâm Vương với tinh chất Khổ sâm được xem là sự lựa chọn số 1 cho người bệnh rối loạn nhịp tim nhanh, ngoại tâm thu, giúp giảm tim đập nhanh, hồi hộp, trống ngực hiệu quả.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'SKTM', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'ninh-tam-vuong.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'nuoc-hoa-hong-la-beauty', N'Nước hoa hồng La Beauty dưỡng ẩm, làm mềm da', N'Nước hoa hồng La Beauty dưỡng ẩm, làm mềm da, không chứa cồn, hoàn toàn lành tính cho mọi loại da kể cả làn da nhạy cảm nhất.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'CSDM', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'nuoc-hoa-hong-la-beauty.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'nuoc-suc-mieng', N'Nước súc miệng Dr. Muối hỗ trợ làm sạch khoang miệng, loại bỏ vi khuẩn', N' Nước súc miệng Dr. Muối giúp làm giảm nguy cơ các bệnh về răng miệng. Làm sạch khoang miệng, loại bỏ vi khuẩn. Giảm mùi hôi miệng và giữ hơi thở thơm tho.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'CSRM', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'nuoc-suc-mieng.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'nuoc-tay-trang-la-beauty', NULL, NULL, NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'CSCT', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'nuoc-tay-trang-la-beauty.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'omega-plus', N'Viên uống Omega Plus 10 Vitamins For Life giúp chống oxy hóa, hỗ trợ tốt cho tim mạch', N'Omega Plus 10 chống oxy hóa, hỗ trợ tốt cho tim mạch và trẻ hóa hoạt động tim mạch.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'SKTM', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'omega-plus.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'omexxel-cardio', N'Viên uống Omexxel Cardio Excelife hỗ trợ duy trì sức khỏe tim mạch', N'Omexxel Cardio Excelife hỗ trợ tăng cường khả năng chống oxy hóa, giúp hạn chế xơ vữa động mạch, giúp duy trì sức khỏe tim mạch.
', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'SKTM', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'omexxel-cardio.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'omexxel-ginkgo', N'Viên uống Omexxel Ginkgo 120 Excelife hỗ trợ tăng cường tuần hoàn máu não, tốt cho tim mạch', N'mexxel Ginkgo 120 hỗ trợ tăng cường tuần hoàn máu não, tốt cho tim mạch.
', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'TKN', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'omexxel-ginkgo.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'onagre', N'Viên uống Onagre Cevrai hỗ trợ làm giảm triệu chứng tiền kinh nguyệt, tiền mãn kinh và mãn kinh', N'Hỗ trợ tăng cường sinh lý nữ', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'NTT', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'onagre.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'optimax-immunity', N'Viên sủi Optimax Immunity Booster Vid - Fighter tăng cường sức đề kháng', N'Optimax Immunity Booster Vid-Fighter giúp bổ sung vitamin C, vitamin D, kẽm và mangan cho cơ thể, giúp tăng cường sức đề kháng.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, N'Giảm căng thẳng và mệt mỏi', NULL, N'CTTCCN', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'optimax-immunity.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'pikolin-ocavill', N'Viên uống Pikolin Ocavill hỗ trợ tăng tuần hoàn máu não', N' Hỗ trợ cải thiện các triệu chứng do thiểu năng tuần hoàn não. Hỗ trợ giảm nguy cơ hình thành cục máu đông và giảm di chứng sau tai biến mạch máu não do tắc mạch.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'TKN', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'pikolin-ocavill.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'proctogel', N'Gel Proctogel Bimex hỗ trợ làm liền nhanh vết thương, giảm viêm nhiễm, ngứa ', N'Proctogel giúp dưỡng da, làm giảm rát da, nứt nẻ da. Giúp làm mát da, dịu da, săn se da, nhanh liền vết thương, làm giảm các tác nhân gây viêm nhiễm, nấm ngứa.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'CSCT', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'proctogel.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'rosette-acne-clear', N'Sữa rửa mặt làm giảm mụn Rosette Face Wash Pasta Acne Clear sạch bụi bẩn, bã nhờn và tạp chất trên da', N' kết hợp bùn biển và đất sét tự nhiên giúp làm sạch bụi bẩn, bã nhờn và tạp chất trên da, giúp lỗ chân lông thông thoáng,  hỗ trợ điều trị mụn.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'CSDM', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'rosette-acne-clear.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'rua-mat-nghe-nano', N'Sữa rửa mặt nghệ Nano Neo Cleanser hỗ trợ làm sạch da mặt, ngừa mụn, giảm nhờn', N'Sữa rửa mặt nghệ Nano ngừa mụn Neo Cleanser có thành phần nano curcumin siêu phân tử, thẩm thấu nhanh và tạo tác dụng tối ưu, làm sạch da mặt, giảm tiết dầu thừa, mờ vết thâm, ngăn ngừa sẹo.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'CSDM', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'rua-mat-nghe-nano.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'sam-nhung-bo-than', N'Viên uống Sâm Nhung Bổ Thận NV Dolexpharm giúp tráng dương, mạnh gân cốt ', N'Hỗ trợ bổ thận, tăng cường sinh lực phái mạnh', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'NTT', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'sam-nhung-bo-than.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'siro-an-ngon-healthy', N'Siro Healthy New Kids hỗ trợ kích thích tiêu hóa, giúp ăn ngon', N'Siro Healthy New được chiết xuất dựa trên các thành phần acid amin, các vitamin và khoáng chất thiết yếu giúp trẻ ăn ngon miệng', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, N'Bổ sung vi chất cho sự phát triển của trẻ', NULL, N'CTTCCN', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'siro-an-ngon-healthy.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'tam-bong', N'Tăm bông Niva AZ2 túi zipper hỗ trợ vệ sinh tai, mũi, vết thương', N'mềm mại và thấm nước cực tốt cùng que bông từ nhựa nguyên sinh nhập khẩu với độ đàn hồi thích hợp giúp chăm sóc thật an toàn và êm ái cho cả gia đình.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'VSCN', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'tam-bong.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'tam-chi-ke-rang-okamura', N'Tăm chỉ kẽ răng Okamura hỗ trợ làm sạch mảng bám thức ăn dư thừa', N'Chỉ Kẽ Răng Okamura sẽ bổ sung cho bàn chải đánh răng, làm sạch thức ăn, mảng bám ở cổ răng, kẽ răng…', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'CSRM', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'tam-chi-ke-rang-okamura.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'tam-goi-em-be', N'Tắm gội em bé Baby Gentle Wash giúp làm sạch, chăm sóc, bảo vệ da ', N'là sản phẩm sữa tắm hằng ngày,   giúp làm sạch,  chăm sóc và bảo vệ da cho bé. Làm giảm và ngăn ngừa các triệu chứng như rôm sảy, hâm da ở trẻ em và trẻ sơ sinh.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'CSCT', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'tam-goi-em-be.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'tam-that-xa-den', N'Viên uống Nanocurcumin Tam Thất Xạ Đen Plus HVQY hỗ trợ bảo vệ niêm mạc dạ dày - ruột', N' Viên uống Nano Curcumin Tam Thất Xạ Đen được sản xuất bằng kỹ thuật nano tiên tiến sẽ giúp cơ thể hấp thụ nhanh nhất các dưỡng chất từ đó hỗ trợ giảm các triệu chứng viêm dạ dày', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'HTTH', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'tam-that-xa-den.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'tinh-dau-buoi-yanagiya', N'Dưỡng tóc Yanagiya Hair Tonic hương bưởi ngăn ngừa gãy rụng, gàu, ngứa', N'Dưỡng tóc tinh dầu bưởi Yanagiya Hair Tonic giúp ngăn ngừa tóc gãy rụng,  tóc thưa mỏng, gàu và ngứa, nuôi dưỡng tóc khỏe mạnh', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'CST', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'tinh-dau-buoi-yanagiya.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'to-nu-vuong', N'Viên uống Tố Nữ Vương Royal Care hỗ trợ cải thiện nội tiết tố nữ', N'Cân bằng nội tiết - Đời sống thăng hoa', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'NTT', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'to-nu-vuong.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'trang-hai-thuong-vuong-vesta', N'Viên uống Đại Tràng Hải Thượng Vương Vesta hỗ trợ tiêu hóa', N'Đại Tràng Hải Thượng Vương hỗ trợ tăng cường tiêu hóa, giúp giảm các biểu hiện đau bụng, rối loạn tiêu hóa do viêm đại tràng.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'HTTH', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'trang-hai-thuong-vuong-vesta.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'trung-thao-gold', N'Viên uống Trùng Thảo Gold Thành Công hỗ trợ dễ ngủ, ngủ sâu giấc', N'Trùng Thảo Gold hỗ trợ dễ ngủ, ngủ sâu giấc trong các trường hợp mất ngủ, ngủ kém. Hỗ trợ tăng cường sức khỏe, nâng cao sức đề kháng.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'TKN', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'trung-thao-gold.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N've-sinh-pn-herbal-nano-vinapharma', N'Gel tắm và vệ sinh phụ nữ Herbal Nano Vinapharma giúp vệ sinh vùng kín ', N'dùng để vệ sinh vùng sinh dục phụ nữ, kể cả phụ nữ có thai, sản phụ trước và sau khi sinh. Rất tốt cho những ngày hành kinh, làm sạch vùng kín, kể cả phụ nữ và nam giới, khử mùi hôi.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'CSCT', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N've-sinh-pn-herbal-nano-vinapharma.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N've-sinh-tai', N'Phun sương vệ sinh tai Spray-C Nano Bạc Aero Chemie hỗ trợ làm sạch ráy tai', N'Phun sương vệ sinh tai Spray-C Nano Bạc giúp làm sạch ráy tai, phục hồi cơ chế tự làm sạch ráy, hết ngứa và ổn định thính giác', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'DCYT', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N've-sinh-tai.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'vien-dat-emoran', N'Viên đạn đặt trĩ, viêm trực tràng Supposte Emoran hỗ trợ điều trị bệnh trĩ', N'Viên đặt Emoran được sản xuất bởi Mar-Farma SRL/Italy,  giúp giảm nhanh các triệu chứng liên quan đến bệnh trĩ và viêm trực tràng. Sản phẩm giúp giảm ngứa,  bỏng rát nhờ đặc tính làm mát và làm mềm da', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'DCYT', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'vien-dat-emoran.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'vien-sang-mat-hai-thuong-vuong', N'Viên Sáng Mắt Hải Thượng Vương hỗ trợ tăng cường thị lực', N'Viên Sáng Mắt Hải Thượng Vương hỗ trợ tăng cường thị lực, hỗ trợ giảm các triệu chứng khó mắt, mỏi mắt, nhìn mở. Hỗ trợ giảm nguy cơ thoái hóa điểm vàng, đục thủy tinh thể.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, N'Tăng cường thị lực, giảm khô mỏi mắt', NULL, N'CTTCCN', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'vien-sang-mat-hai-thuong-vuong.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'vien-thia-canh', N'Viên thìa canh Giảo Cổ Lam Đại Đức Mạnh giúp hạ đường huyết, giảm cholesterol và lipid', N'iên Thìa Canh Giảo Cổ Lam giúp hạ đường huyết ở người mắc bệnh tiểu đường, duy trì đường huyết ở mức ổn định, giảm cholesterol và lipid trong máu ở người mắc bệnh tiểu đường', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'SKTM', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'vien-thia-canh.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'vien-uong-kenkan', N'Viên uống Kenkan Nattokinase 2400FU giúp tăng cường lưu thông máu', N'Kenkan Nattokinase 2400 FU hỗ trợ làm giảm nguy cơ hình thành huyết khối, giúp tăng cường lưu thông máu. Tốt cho tim mạch.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'SKTM', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'vien-uong-kenkan.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'vitamin-e-duong-am', N'Mặt nạ Banobagi Vita Genic Jelly Mask Cica sáng da, mờ nếp nhăn, giảm mụn', N'giúp nuôi dưỡng và phục hồi làn da thô ráp, giúp làm sáng da, mờ nếp nhăn và giảm mụn hiệu quả.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'CSDM', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'vitamin-e-duong-am.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'vuong-nu-khang', N'Viên uống Vương Nữ Khang Royal Care hỗ trợ hạn chế sự phát triển của u xơ tử cung, u vú lành tính ở nữ giới', N'Vương Nữ Khang - giải pháp hỗ trợ điều trị u xơ tử cung cho phụ nữ', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'NTT', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'vuong-nu-khang.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'xit-mui-muoi-bien', N'Bình xịt mũi muối biển Nano Sea Baby Spray Phương Y Nam ngừa sổ mũi cho bé', N'ịt Mũi Muối Biển Nano Sea Baby Spray giúp làm sạch và ngừa sổ mũi cho bé, trong các trường hợp như: Chảy nước mũi, tắt ngạt mũi, vệ sinh mũi họng, ...', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'DCYT', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'xit-mui-muoi-bien.jpg')
INSERT [dbo].[tDanhMucThuoc] ([MaThuoc], [TenThuoc], [CongDung], [LieuDung], [DoiTuongSD], [TacDungPhu], [BaoQuan], [LuyY], [ThanhPhan], [MoTaThuoc], [MaDVT], [MaLoai], [NgaySanXuat], [HanSuDung], [MaNuocSX], [GiaLonNhat], [GiaNhoNhat], [AnhDaiDien]) VALUES (N'xit-thom-mieng', N'Xịt thơm miệng thảo dược GreeLux Extra Cool Hoa Linh làm thơm miệng tức thì', N'Greelux Extra Cool giúp làm thơm miệng tức thì. Khử mùi hội miệng, mùi thức ăn (hành tỏi, đồ tanh, hải sản...), mùi rượu bia, thuốc lá... Góp phần ngăn ngừa: Sâu răng, viêm lợi, miệng.', NULL, NULL, N'Chưa có thông tin về tác dụng phụ của sản phẩm.', N'Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời.

Để xa tầm tay trẻ em.', NULL, NULL, NULL, NULL, N'CSRM', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2026-04-06T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'xit-thom-mieng.jpg')
GO
INSERT [dbo].[tDonViTinh] ([MaDVT], [TenDVT]) VALUES (N'Gel', N'Del')
INSERT [dbo].[tDonViTinh] ([MaDVT], [TenDVT]) VALUES (N'Goi', N'Gói')
INSERT [dbo].[tDonViTinh] ([MaDVT], [TenDVT]) VALUES (N'Hop', N'Hộp')
INSERT [dbo].[tDonViTinh] ([MaDVT], [TenDVT]) VALUES (N'Lo', N'Lọ')
INSERT [dbo].[tDonViTinh] ([MaDVT], [TenDVT]) VALUES (N'Vi', N'Vỉ')
INSERT [dbo].[tDonViTinh] ([MaDVT], [TenDVT]) VALUES (N'Vien', N'Viên')
GO
INSERT [dbo].[tDuocSi] ([MaDs], [TenDs], [username], [NgaySinh], [GioiTinh], [MaTrinhDo], [MaChuyenMon], [SoDienThoai]) VALUES (N'DS01', N'Trần Huy', N'abc', CAST(N'1990-09-11T00:00:00.000' AS DateTime), N'Nam', N'TS', N'HHH', N'09776374821')
INSERT [dbo].[tDuocSi] ([MaDs], [TenDs], [username], [NgaySinh], [GioiTinh], [MaTrinhDo], [MaChuyenMon], [SoDienThoai]) VALUES (N'DS02', N'Thanh Tâm', N'abc', CAST(N'1989-01-12T00:00:00.000' AS DateTime), N'Nữ', N'GS', N'HTH', N'04672839273')
INSERT [dbo].[tDuocSi] ([MaDs], [TenDs], [username], [NgaySinh], [GioiTinh], [MaTrinhDo], [MaChuyenMon], [SoDienThoai]) VALUES (N'DS03', N'Nguyễn Minh', N'abc', CAST(N'1987-07-05T00:00:00.000' AS DateTime), N'Nam', N'CG', N'HNT', N'09635678223')
INSERT [dbo].[tDuocSi] ([MaDs], [TenDs], [username], [NgaySinh], [GioiTinh], [MaTrinhDo], [MaChuyenMon], [SoDienThoai]) VALUES (N'DS04', N'Phan Cao', N'abc', CAST(N'1991-08-12T00:00:00.000' AS DateTime), N'Nam', N'DH', N'HBT', N'09876553623')
INSERT [dbo].[tDuocSi] ([MaDs], [TenDs], [username], [NgaySinh], [GioiTinh], [MaTrinhDo], [MaChuyenMon], [SoDienThoai]) VALUES (N'DS05', N'Bùi Ngọc', N'abc', CAST(N'1987-03-01T00:00:00.000' AS DateTime), N'Nữ', N'CN', N'HSS', N'02345676543')
INSERT [dbo].[tDuocSi] ([MaDs], [TenDs], [username], [NgaySinh], [GioiTinh], [MaTrinhDo], [MaChuyenMon], [SoDienThoai]) VALUES (N'DS06', N'Nguyễn Hoàn', N'abc', CAST(N'1990-04-04T00:00:00.000' AS DateTime), N'Nam', N'CD', N'HTH', N'09876545667')
INSERT [dbo].[tDuocSi] ([MaDs], [TenDs], [username], [NgaySinh], [GioiTinh], [MaTrinhDo], [MaChuyenMon], [SoDienThoai]) VALUES (N'DS07', N'Nguyễn Hải', N'abc', CAST(N'1994-05-05T00:00:00.000' AS DateTime), N'Nam', N'TS', N'HTHoan', N'09876556723')
INSERT [dbo].[tDuocSi] ([MaDs], [TenDs], [username], [NgaySinh], [GioiTinh], [MaTrinhDo], [MaChuyenMon], [SoDienThoai]) VALUES (N'DS08', N'Đỗ Thảo', N'abc', CAST(N'1996-07-08T00:00:00.000' AS DateTime), N'Nữ', N'DH', N'HBT', N'09876456772')
INSERT [dbo].[tDuocSi] ([MaDs], [TenDs], [username], [NgaySinh], [GioiTinh], [MaTrinhDo], [MaChuyenMon], [SoDienThoai]) VALUES (N'DS09', N'Đỗ Phương Thảo', N'abc', CAST(N'1993-05-09T00:00:00.000' AS DateTime), N'Nữ', N'DH', N'HTK', N'08765431423')
INSERT [dbo].[tDuocSi] ([MaDs], [TenDs], [username], [NgaySinh], [GioiTinh], [MaTrinhDo], [MaChuyenMon], [SoDienThoai]) VALUES (N'DS10', N'Đỗ Huy Long', N'abc', CAST(N'1999-03-06T00:00:00.000' AS DateTime), N'Nam', N'DH', N'HVD', N'05567236783')
GO
INSERT [dbo].[tKhach] ([MaKH], [TenKH], [username], [DiaChi], [SoDienThoai]) VALUES (N'KH01', N'Nguyễn Đình Sơn', N'def', N'Hà Nội', N'0936472839')
INSERT [dbo].[tKhach] ([MaKH], [TenKH], [username], [DiaChi], [SoDienThoai]) VALUES (N'KH02', N'Mai Phương Lan', N'def', N'Hải Phòng', N'0346578234')
INSERT [dbo].[tKhach] ([MaKH], [TenKH], [username], [DiaChi], [SoDienThoai]) VALUES (N'KH03', N'Đỗ Văn Bắc', N'def', N'Bắc Ninh', N'0237812937')
INSERT [dbo].[tKhach] ([MaKH], [TenKH], [username], [DiaChi], [SoDienThoai]) VALUES (N'KH04', N'Lê Thanh Ngát', N'def', N'Nam Định', N'0283746782')
INSERT [dbo].[tKhach] ([MaKH], [TenKH], [username], [DiaChi], [SoDienThoai]) VALUES (N'KH05', N'Nguyễn Văn Thạch', N'def', N'Nam Định', N'0348912373')
INSERT [dbo].[tKhach] ([MaKH], [TenKH], [username], [DiaChi], [SoDienThoai]) VALUES (N'KH06', N'Nguyễn Vũ Thành', N'def', N'Bắc Giang', N'0293871232')
INSERT [dbo].[tKhach] ([MaKH], [TenKH], [username], [DiaChi], [SoDienThoai]) VALUES (N'KH07', N'Đặng Văn Công', N'def', N'Nam Định', N'0234778282')
INSERT [dbo].[tKhach] ([MaKH], [TenKH], [username], [DiaChi], [SoDienThoai]) VALUES (N'KH08', N'Lê Hồng Quân', N'def', N'Phú Thọ', N'0238198712')
INSERT [dbo].[tKhach] ([MaKH], [TenKH], [username], [DiaChi], [SoDienThoai]) VALUES (N'KH09', N'Lê Thanh Hải', N'def', N'Hải Dương', N'0123479373')
INSERT [dbo].[tKhach] ([MaKH], [TenKH], [username], [DiaChi], [SoDienThoai]) VALUES (N'KH10', N'Nguyễn Thu Hằng', N'def', N'Hà Nội', N'0287678291')
GO
INSERT [dbo].[tLoaiThuoc] ([MaLoai], [TenLoai]) VALUES (N'CSCT', N'Chăm sóc cơ thể')
INSERT [dbo].[tLoaiThuoc] ([MaLoai], [TenLoai]) VALUES (N'CSDM', N'Chăm sóc da mặt')
INSERT [dbo].[tLoaiThuoc] ([MaLoai], [TenLoai]) VALUES (N'CSRM', N'Chăm sóc răng miệng')
INSERT [dbo].[tLoaiThuoc] ([MaLoai], [TenLoai]) VALUES (N'CST', N'Chăm sóc tóc-da đầu')
INSERT [dbo].[tLoaiThuoc] ([MaLoai], [TenLoai]) VALUES (N'CTTCCN', N'Cải thiện tăng cường chức năng ')
INSERT [dbo].[tLoaiThuoc] ([MaLoai], [TenLoai]) VALUES (N'DCYT', N'Dụng cụ y tế')
INSERT [dbo].[tLoaiThuoc] ([MaLoai], [TenLoai]) VALUES (N'HTTH', N'Hỗ trợ tiêu hóa')
INSERT [dbo].[tLoaiThuoc] ([MaLoai], [TenLoai]) VALUES (N'NTT', N'Sinh lý - Nội tiết tố')
INSERT [dbo].[tLoaiThuoc] ([MaLoai], [TenLoai]) VALUES (N'SKTM', N'Sức khỏe tim mạnh')
INSERT [dbo].[tLoaiThuoc] ([MaLoai], [TenLoai]) VALUES (N'TKN', N'Thần kinh não')
INSERT [dbo].[tLoaiThuoc] ([MaLoai], [TenLoai]) VALUES (N'VSCN', N'Vệ sinh cá nhân')
GO
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (N'NCC01', N'Công ty TNHH Mediphar USA', N'Hà Nội ', N'0983674838')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (N'NCC02', N'Công ty cổ phần Traphaco (TRA)', N'Hà Nội', N'0234738364')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (N'NCC03', N'Công ty cổ phần dược Hậu Giang (DHG)', N'Hậu Giang', N'0876437223')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (N'NCC04', N'Công ty cổ phần dược phẩm Hà Tây', N'Hà Nội', N'0981283782')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (N'NCC05', N'ông ty cổ phần hóa dược phẩm Mekophar', N'Đà Nẵng', N'0987463728')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (N'NCC06', N'Công Ty TNHH Lê Hào', N'TP Hồ Chí Minh', N'0123478182')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (N'NCC07', N'Công Ty Cổ Phần Neemtree', N'TP Hồ Chí Minh', N'0128998737')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (N'NCC08', N'Công Ty TNHH Mỹ Phẩm EV Princess', N'TP Hồ Chí Minh', N'0987273723')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (N'NCC09', N'Công Ty CP Nông Nghiệp Công Nghệ Cao Thăng Long', N'Hà Nội', N'0283789229')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (N'NCC10', N'Công Ty CP Dược Phẩm Yên Bái - Ypharco', N'Yên Bái', N'0391237433')
GO
INSERT [dbo].[tNuocSanXuat] ([MaNuocSX], [TenNuocSX]) VALUES (N'CPC', N'Campuchia')
INSERT [dbo].[tNuocSanXuat] ([MaNuocSX], [TenNuocSX]) VALUES (N'HQ', N'Hàn Quốc')
INSERT [dbo].[tNuocSanXuat] ([MaNuocSX], [TenNuocSX]) VALUES (N'JP', N'Nhật Bản')
INSERT [dbo].[tNuocSanXuat] ([MaNuocSX], [TenNuocSX]) VALUES (N'Lao', N'Lào')
INSERT [dbo].[tNuocSanXuat] ([MaNuocSX], [TenNuocSX]) VALUES (N'TL', N'Thái Lan')
INSERT [dbo].[tNuocSanXuat] ([MaNuocSX], [TenNuocSX]) VALUES (N'TQ', N'Trung Quốc')
INSERT [dbo].[tNuocSanXuat] ([MaNuocSX], [TenNuocSX]) VALUES (N'TT', N'Triều Tiên')
INSERT [dbo].[tNuocSanXuat] ([MaNuocSX], [TenNuocSX]) VALUES (N'UK', N'Mỹ')
INSERT [dbo].[tNuocSanXuat] ([MaNuocSX], [TenNuocSX]) VALUES (N'US', N'Anh')
INSERT [dbo].[tNuocSanXuat] ([MaNuocSX], [TenNuocSX]) VALUES (N'VN', N'Việt Nam')
GO
INSERT [dbo].[tTrinhDo] ([MaTrinhDo], [TenTrinhDo]) VALUES (N'CD', N'Cao đẳng')
INSERT [dbo].[tTrinhDo] ([MaTrinhDo], [TenTrinhDo]) VALUES (N'CG', N'Chuyên gia')
INSERT [dbo].[tTrinhDo] ([MaTrinhDo], [TenTrinhDo]) VALUES (N'CN', N'Cử nhân')
INSERT [dbo].[tTrinhDo] ([MaTrinhDo], [TenTrinhDo]) VALUES (N'DH', N'Đại học')
INSERT [dbo].[tTrinhDo] ([MaTrinhDo], [TenTrinhDo]) VALUES (N'GS', N'Giáo sư')
INSERT [dbo].[tTrinhDo] ([MaTrinhDo], [TenTrinhDo]) VALUES (N'KS', N'Kĩ sư')
INSERT [dbo].[tTrinhDo] ([MaTrinhDo], [TenTrinhDo]) VALUES (N'PT', N'Phổ thông')
INSERT [dbo].[tTrinhDo] ([MaTrinhDo], [TenTrinhDo]) VALUES (N'TC', N'Trung Cấp')
INSERT [dbo].[tTrinhDo] ([MaTrinhDo], [TenTrinhDo]) VALUES (N'THS', N'Thạc Sĩ')
INSERT [dbo].[tTrinhDo] ([MaTrinhDo], [TenTrinhDo]) VALUES (N'TS', N'Tiến sĩ')
GO
INSERT [dbo].[tUser] ([username], [password], [LoaiUser]) VALUES (N'abc', N'123', N'1')
INSERT [dbo].[tUser] ([username], [password], [LoaiUser]) VALUES (N'def', N'123', N'0')
GO
ALTER TABLE [dbo].[tAnhChiTietSp]  WITH CHECK ADD  CONSTRAINT [FK_tAnhChiTietSp_tChiTietSanPham] FOREIGN KEY([MaChiTietSp])
REFERENCES [dbo].[tChiTietSanPham] ([MaChiTietSp])
GO
ALTER TABLE [dbo].[tAnhChiTietSp] CHECK CONSTRAINT [FK_tAnhChiTietSp_tChiTietSanPham]
GO
ALTER TABLE [dbo].[tAnhSanPham]  WITH CHECK ADD  CONSTRAINT [FK_tAnhSanPham_tDanhMucThuoc] FOREIGN KEY([MaThuoc])
REFERENCES [dbo].[tDanhMucThuoc] ([MaThuoc])
GO
ALTER TABLE [dbo].[tAnhSanPham] CHECK CONSTRAINT [FK_tAnhSanPham_tDanhMucThuoc]
GO
ALTER TABLE [dbo].[tChiTietHDB]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietHDB_tChiTietSanPham] FOREIGN KEY([MaChiTietSp])
REFERENCES [dbo].[tChiTietSanPham] ([MaChiTietSp])
GO
ALTER TABLE [dbo].[tChiTietHDB] CHECK CONSTRAINT [FK_tChiTietHDB_tChiTietSanPham]
GO
ALTER TABLE [dbo].[tChiTietHDB]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietHDB_tHoaDonBan] FOREIGN KEY([MaHDB])
REFERENCES [dbo].[tHoaDonBan] ([MaHDB])
GO
ALTER TABLE [dbo].[tChiTietHDB] CHECK CONSTRAINT [FK_tChiTietHDB_tHoaDonBan]
GO
ALTER TABLE [dbo].[tChiTietHDN]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietHDN_tDanhMucThuoc] FOREIGN KEY([MaThuoc])
REFERENCES [dbo].[tDanhMucThuoc] ([MaThuoc])
GO
ALTER TABLE [dbo].[tChiTietHDN] CHECK CONSTRAINT [FK_tChiTietHDN_tDanhMucThuoc]
GO
ALTER TABLE [dbo].[tChiTietHDN]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietHDN_tHoaDonNhap] FOREIGN KEY([MaHDN])
REFERENCES [dbo].[tHoaDonNhap] ([MaHDN])
GO
ALTER TABLE [dbo].[tChiTietHDN] CHECK CONSTRAINT [FK_tChiTietHDN_tHoaDonNhap]
GO
ALTER TABLE [dbo].[tChiTietSanPham]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietSanPham_tDanhMucThuoc] FOREIGN KEY([MaThuoc])
REFERENCES [dbo].[tDanhMucThuoc] ([MaThuoc])
GO
ALTER TABLE [dbo].[tChiTietSanPham] CHECK CONSTRAINT [FK_tChiTietSanPham_tDanhMucThuoc]
GO
ALTER TABLE [dbo].[tDanhMucThuoc]  WITH CHECK ADD  CONSTRAINT [FK_tDanhMucThuoc_tDonViTinh] FOREIGN KEY([MaDVT])
REFERENCES [dbo].[tDonViTinh] ([MaDVT])
GO
ALTER TABLE [dbo].[tDanhMucThuoc] CHECK CONSTRAINT [FK_tDanhMucThuoc_tDonViTinh]
GO
ALTER TABLE [dbo].[tDanhMucThuoc]  WITH CHECK ADD  CONSTRAINT [FK_tDanhMucThuoc_tLoaiThuoc] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[tLoaiThuoc] ([MaLoai])
GO
ALTER TABLE [dbo].[tDanhMucThuoc] CHECK CONSTRAINT [FK_tDanhMucThuoc_tLoaiThuoc]
GO
ALTER TABLE [dbo].[tDanhMucThuoc]  WITH CHECK ADD  CONSTRAINT [FK_tDanhMucThuoc_tNuocSanXuat] FOREIGN KEY([MaNuocSX])
REFERENCES [dbo].[tNuocSanXuat] ([MaNuocSX])
GO
ALTER TABLE [dbo].[tDanhMucThuoc] CHECK CONSTRAINT [FK_tDanhMucThuoc_tNuocSanXuat]
GO
ALTER TABLE [dbo].[tDuocSi]  WITH CHECK ADD  CONSTRAINT [FK_tDuocSi_tChuyenMon] FOREIGN KEY([MaChuyenMon])
REFERENCES [dbo].[tChuyenMon] ([MaChuyenMon])
GO
ALTER TABLE [dbo].[tDuocSi] CHECK CONSTRAINT [FK_tDuocSi_tChuyenMon]
GO
ALTER TABLE [dbo].[tDuocSi]  WITH CHECK ADD  CONSTRAINT [FK_tDuocSi_tTrinhDo] FOREIGN KEY([MaTrinhDo])
REFERENCES [dbo].[tTrinhDo] ([MaTrinhDo])
GO
ALTER TABLE [dbo].[tDuocSi] CHECK CONSTRAINT [FK_tDuocSi_tTrinhDo]
GO
ALTER TABLE [dbo].[tDuocSi]  WITH CHECK ADD  CONSTRAINT [FK_tDuocSi_tUser] FOREIGN KEY([username])
REFERENCES [dbo].[tUser] ([username])
GO
ALTER TABLE [dbo].[tDuocSi] CHECK CONSTRAINT [FK_tDuocSi_tUser]
GO
ALTER TABLE [dbo].[tHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_tHoaDonBan_tDuocSi] FOREIGN KEY([MaDS])
REFERENCES [dbo].[tDuocSi] ([MaDs])
GO
ALTER TABLE [dbo].[tHoaDonBan] CHECK CONSTRAINT [FK_tHoaDonBan_tDuocSi]
GO
ALTER TABLE [dbo].[tHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_tHoaDonBan_tKhach] FOREIGN KEY([MaKH])
REFERENCES [dbo].[tKhach] ([MaKH])
GO
ALTER TABLE [dbo].[tHoaDonBan] CHECK CONSTRAINT [FK_tHoaDonBan_tKhach]
GO
ALTER TABLE [dbo].[tHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_tHoaDonNhap_tDuocSi] FOREIGN KEY([MaDS])
REFERENCES [dbo].[tDuocSi] ([MaDs])
GO
ALTER TABLE [dbo].[tHoaDonNhap] CHECK CONSTRAINT [FK_tHoaDonNhap_tDuocSi]
GO
ALTER TABLE [dbo].[tHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_tHoaDonNhap_tNhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[tNhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[tHoaDonNhap] CHECK CONSTRAINT [FK_tHoaDonNhap_tNhaCungCap]
GO
ALTER TABLE [dbo].[tKhach]  WITH CHECK ADD  CONSTRAINT [FK_tKhach_tUser] FOREIGN KEY([username])
REFERENCES [dbo].[tUser] ([username])
GO
ALTER TABLE [dbo].[tKhach] CHECK CONSTRAINT [FK_tKhach_tUser]
GO
