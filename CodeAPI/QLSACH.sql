create database QLSach
USE [QLSach]
GO
/****** Object:  Table [dbo].[tNXB]    Script Date: 3/27/2023 3:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tNXB](
	[MaNXB] [nvarchar](50) NOT NULL,
	[TenNXB] [nvarchar](50) NULL,
 CONSTRAINT [PK_tNXB] PRIMARY KEY CLUSTERED 
(
	[MaNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tSach]    Script Date: 3/27/2023 3:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tSach](
	[MaSach] [nvarchar](50) NOT NULL,
	[TenSach] [nvarchar](100) NULL,
	[TacGia] [nvarchar](50) NULL,
	[SoTrang] [int] NULL,
	[SoLuong] [int] NULL,
	[MaTheLoai] [nvarchar](50) NULL,
	[MaNXB] [nvarchar](50) NULL,
	[TrongLuong] [nvarchar](50) NULL,
 CONSTRAINT [PK_tSach] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tTheLoai]    Script Date: 3/27/2023 3:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tTheLoai](
	[MaTheLoai] [nvarchar](50) NOT NULL,
	[TenTheLoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_tTheLoai] PRIMARY KEY CLUSTERED 
(
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tNXB] ([MaNXB], [TenNXB]) VALUES (N'NXB01', N'KimDong')
INSERT [dbo].[tNXB] ([MaNXB], [TenNXB]) VALUES (N'NXB02', N'Tre')
INSERT [dbo].[tNXB] ([MaNXB], [TenNXB]) VALUES (N'NXB03', N'ThangLong')
INSERT [dbo].[tNXB] ([MaNXB], [TenNXB]) VALUES (N'NXB04', N'NhaNam')
INSERT [dbo].[tNXB] ([MaNXB], [TenNXB]) VALUES (N'NXB05', N'GiaoDuc')
INSERT [dbo].[tNXB] ([MaNXB], [TenNXB]) VALUES (N'NXB06', N'PhuongNam')
INSERT [dbo].[tNXB] ([MaNXB], [TenNXB]) VALUES (N'NXB07', N'UTC')
INSERT [dbo].[tNXB] ([MaNXB], [TenNXB]) VALUES (N'NXB08', N'HN')
GO
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [SoTrang], [SoLuong], [MaTheLoai], [MaNXB], [TrongLuong]) VALUES (N'S01', N'Sống và khát vọng', N'Trần Đăng Khoa', 1000, 500, N'TL01', N'NXB01', N'5')
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [SoTrang], [SoLuong], [MaTheLoai], [MaNXB], [TrongLuong]) VALUES (N'S02', N'Đừng bao giờ đii ăn 1 mình', N'Adam', 2000, 1000, N'TL01', N'NXB08', N'4')
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [SoTrang], [SoLuong], [MaTheLoai], [MaNXB], [TrongLuong]) VALUES (N'S03', N'Ngày xưa có 1 con bò', N'Odin', 1500, 400, N'TL02', N'NXB05', N'3')
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [SoTrang], [SoLuong], [MaTheLoai], [MaNXB], [TrongLuong]) VALUES (N'S04', N'Tôi thấy hoa vàng trên cỏ vàng', N'Nguyễn Nhật Ánh', 1100, 600, N'TL05', N'NXB02', N'1')
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [SoTrang], [SoLuong], [MaTheLoai], [MaNXB], [TrongLuong]) VALUES (N'S05', N'Anh sẽ yêu em mãi chứ', N'Gào', 500, 200, N'TL04', N'NXB03', N'2')
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [SoTrang], [SoLuong], [MaTheLoai], [MaNXB], [TrongLuong]) VALUES (N'S06', N'Thao túng tâm lý', N'Lukas', 600, 300, N'TL03', N'NXB02', N'2')
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [SoTrang], [SoLuong], [MaTheLoai], [MaNXB], [TrongLuong]) VALUES (N'S07', N'Khởi nghiệp', N'Phàm Vũ', 600, 350, N'TL01', N'NXB01', N'1')
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [SoTrang], [SoLuong], [MaTheLoai], [MaNXB], [TrongLuong]) VALUES (N'S08', N'Tự Học', N'Vô danh', 800, 500, N'TL04', N'NXB04', N'2')
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [SoTrang], [SoLuong], [MaTheLoai], [MaNXB], [TrongLuong]) VALUES (N'S09', N'Tiếng Việt Lớp 1', N'Bộ giáo dục', 50, 2000, N'TL05', N'NXB03', N'1')
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [SoTrang], [SoLuong], [MaTheLoai], [MaNXB], [TrongLuong]) VALUES (N'S10', N'Tắt đèn', N'Ngô Tất Tố', 60, 200, N'TL03', N'NXB07', N'1')
GO
INSERT [dbo].[tTheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL01', N'Bí quyết cuộc sống')
INSERT [dbo].[tTheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL02', N'Sách tin học')
INSERT [dbo].[tTheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL03', N'Thể thao du lịch')
INSERT [dbo].[tTheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL04', N'Văn hóa nghệ thuật')
INSERT [dbo].[tTheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL05', N'Sách kinh doanh')
INSERT [dbo].[tTheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL06', N'Sách khuyến mãi')
GO
ALTER TABLE [dbo].[tSach]  WITH CHECK ADD  CONSTRAINT [FK_tSach_tNXB] FOREIGN KEY([MaNXB])
REFERENCES [dbo].[tNXB] ([MaNXB])
GO
ALTER TABLE [dbo].[tSach] CHECK CONSTRAINT [FK_tSach_tNXB]
GO
ALTER TABLE [dbo].[tSach]  WITH CHECK ADD  CONSTRAINT [FK_tSach_tTheLoai] FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[tTheLoai] ([MaTheLoai])
GO
ALTER TABLE [dbo].[tSach] CHECK CONSTRAINT [FK_tSach_tTheLoai]
GO
