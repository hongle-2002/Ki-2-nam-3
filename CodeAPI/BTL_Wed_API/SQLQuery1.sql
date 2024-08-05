create database API_Thuoc

use API_Thuoc

CREATE TABLE tNhaSanXuat
(
  MaNSX nvarchar(200) NOT NULL,
  TenNSX nvarchar(200) NOT NULL,
  DiaChi nvarchar(200) NOT NULL,
  SoDT nvarchar(200) NOT NULL,
  Mail nvarchar(200) NOT NULL,
  CONSTRAINT [PK_tNhaSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE tNhomThuoc
(
  MaNhom nvarchar(200) NOT NULL,
  TenNhom nvarchar(200) NOT NULL,
  CONSTRAINT [PK_tNhomThuoc] PRIMARY KEY CLUSTERED 
(
	[MaNhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE tThuoc
(
  MaThuoc nvarchar(200) NOT NULL,
  TenThuoc nvarchar(200) NOT NULL,
  NguonGoc nvarchar(200) NOT NULL,
  SoLuong nvarchar(200) NOT NULL,
  ThanhPhan nvarchar(200) NOT NULL,
  CongDung nvarchar(200) NOT NULL,
  CachDung nvarchar(200) NOT NULL,
  ChuY nvarchar(200) NOT NULL,
  NgaySX date not null,
  HanSD nvarchar(200) NOT NULL,
  BaoQuan nvarchar(200) NOT NULL,
  DangBaoChe nvarchar(200) NOT NULL,
  HamLuong nvarchar(200) NOT NULL,
  MaNSX nvarchar(200) NOT NULL,
  MaNhom nvarchar(200) NOT NULL,
    CONSTRAINT [PK_tThuoc] PRIMARY KEY CLUSTERED 
(
	[MaThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]



GO
ALTER TABLE [dbo].[tThuoc]  WITH CHECK ADD  CONSTRAINT [FK_tThuoc_tNhomThuoc] FOREIGN KEY([MaNhom])
REFERENCES [dbo].[tNhomThuoc] ([MaNhom])
GO
ALTER TABLE [dbo].[tThuoc] CHECK CONSTRAINT [FK_tThuoc_tNhomThuoc]
GO

GO
ALTER TABLE [dbo].[tThuoc]  WITH CHECK ADD  CONSTRAINT [FK_tThuoc_tNhaSanXuat] FOREIGN KEY([MaNSX])
REFERENCES [dbo].[tNhaSanXuat] ([MaNSX])
GO
ALTER TABLE [dbo].[tThuoc] CHECK CONSTRAINT [FK_tThuoc_tNhaSanXuat]
GO