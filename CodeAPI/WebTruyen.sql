use master
go
create database [WEBTRUYEN]
go
USE [WEBTRUYEN]
GO
/****** Object:  Table [dbo].[THELOAI]    Script Date: 3/11/2023 9:33:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THELOAI](
	[IDTheLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenTheLoai] [nvarchar](max) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRUYEN]    Script Date: 3/11/2023 9:33:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRUYEN](
	[IDTruyen] [int] IDENTITY(1,1) NOT NULL,
	[IDTheLoai] [int] NULL,
	[TenTruyen] [nvarchar](max) NULL,
	[UrlAvatar] [nvarchar](max) NULL,
	[LuotXem] [int] NULL,
	[MoTa] [ntext] NULL,
	[NgayCapNhat] [datetime] NULL,
	[NgayTao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDTruyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[THELOAI] ON 

INSERT [dbo].[THELOAI] ([IDTheLoai], [TenTheLoai], [NgayTao], [NgayCapNhat]) VALUES (1, N'Tiên hiệp', CAST(N'2022-04-06T19:47:18.393' AS DateTime), CAST(N'2022-04-06T19:48:19.690' AS DateTime))
INSERT [dbo].[THELOAI] ([IDTheLoai], [TenTheLoai], [NgayTao], [NgayCapNhat]) VALUES (2, N'Kiếm hiệp', CAST(N'2022-04-06T19:47:18.393' AS DateTime), CAST(N'2022-04-06T19:47:14.400' AS DateTime))
INSERT [dbo].[THELOAI] ([IDTheLoai], [TenTheLoai], [NgayTao], [NgayCapNhat]) VALUES (3, N'Hành động', CAST(N'2022-04-06T19:47:18.393' AS DateTime), CAST(N'2022-04-06T19:47:14.400' AS DateTime))
INSERT [dbo].[THELOAI] ([IDTheLoai], [TenTheLoai], [NgayTao], [NgayCapNhat]) VALUES (4, N'Trinh thám', CAST(N'2022-04-06T19:47:18.393' AS DateTime), CAST(N'2022-04-06T19:47:14.400' AS DateTime))
INSERT [dbo].[THELOAI] ([IDTheLoai], [TenTheLoai], [NgayTao], [NgayCapNhat]) VALUES (5, N'Tu tiên', CAST(N'2022-04-06T19:47:18.393' AS DateTime), CAST(N'2022-04-06T19:47:14.400' AS DateTime))
INSERT [dbo].[THELOAI] ([IDTheLoai], [TenTheLoai], [NgayTao], [NgayCapNhat]) VALUES (6, N'Hài hước', CAST(N'2022-04-06T19:47:18.393' AS DateTime), CAST(N'2022-04-06T19:47:14.400' AS DateTime))
INSERT [dbo].[THELOAI] ([IDTheLoai], [TenTheLoai], [NgayTao], [NgayCapNhat]) VALUES (7, N'Fantasy', CAST(N'2022-04-06T19:47:18.393' AS DateTime), CAST(N'2022-04-06T19:47:14.400' AS DateTime))


SET IDENTITY_INSERT [dbo].[THELOAI] OFF
GO
SET IDENTITY_INSERT [dbo].[TRUYEN] ON 

INSERT [dbo].[TRUYEN] ([IDTruyen], [IDTheLoai], [TenTruyen], [UrlAvatar], [LuotXem], [MoTa], [NgayCapNhat], [NgayTao]) VALUES (1, 3, N'Lưỡi gươm diệt quỷ', N'https://st.nettruyenup.com/data/comics/235/thanh-guom-diet-quy.jpg', 154, N'Thanh gươm diệt quỷ – Tanjirou là con cả của gia đình vừa mất cha. Một ngày nọ, Tanjirou đến thăm thị trấn khác để bán than, khi đêm về cậu ở nghỉ tại nhà người khác thay vì về nhà vì lời đồn thổi về ác quỷ luôn rình mò gần núi vào buổi tối. Khi cậu về nhà vào ngày hôm sau, bị kịch đang đợi chờ cậu…', CAST(N'2023-03-11T21:08:50.600' AS DateTime), CAST(N'2023-03-11T21:08:50.600' AS DateTime))
INSERT [dbo].[TRUYEN] ([IDTruyen], [IDTheLoai], [TenTruyen], [UrlAvatar], [LuotXem], [MoTa], [NgayCapNhat], [NgayTao]) VALUES (2, 4, N'Thám tử conan12123', N'https://st.nettruyenup.com/data/comics/30/tham-tu-conan.jpg', 67, N'Mở đầu câu truyện, cậu học sinh trung học 16 tuổi Shinichi Kudo bị biến thành cậu bé Conan Edogawa. Shinichi trong phần đầu của Thám tử lừng danh Conan được miêu tả là một thám tử học đường. Trong một lần đi chơi công viên "Miền Nhiệt đới" với cô bạn từ thuở nhỏ (cũng là bạn gái) Ran Mori , cậu bị dính vào vụ án một hành khách trên Chuyến tàu tốc hành trong công viên, Kishida , bị giết trong một vụ án cắt đầu rùng rợn. Cậu đã làm sáng tỏ vụ án và trên đường về nhà, chứng kiến một vụ làm ăn mờ ám của những người đàn ông mặc toàn đồ đen. Kudo bị phát hiện, bị đánh ngất sau đó những người đàn ông áo đen đã cho cậu uống một thứ thuốc độc chưa qua thử nghiệm là Apotoxin-4869 (APTX4869) với mục đích thủ tiêu cậu. Tuy nhiên chất độc đã không giết chết Kudo. Khi tỉnh lại, cậu bàng hoàng nhận thấy thân thể mình đã bị teo nhỏ trong hình dạng của một cậu học sinh tiểu học....', CAST(N'2023-03-11T21:31:30.327' AS DateTime), CAST(N'2023-03-11T21:08:50.600' AS DateTime))
INSERT [dbo].[TRUYEN] ([IDTruyen], [IDTheLoai], [TenTruyen], [UrlAvatar], [LuotXem], [MoTa], [NgayCapNhat], [NgayTao]) VALUES (3, 3, N'Thăng cấp một mình', N'https://st.nettruyenup.com/data/comics/188/solo-leveling-ss3.jpg', 81, N'Theo chân Sung Jin Woo trên hành trình từ "thợ săn kém cỏi" đến "thợ săn hạng S mạnh nhất thế giới".', CAST(N'2023-03-11T21:08:50.600' AS DateTime), CAST(N'2023-03-11T21:08:50.600' AS DateTime))
INSERT [dbo].[TRUYEN] ([IDTruyen], [IDTheLoai], [TenTruyen], [UrlAvatar], [LuotXem], [MoTa], [NgayCapNhat], [NgayTao]) VALUES (4, 3, N'Đại vương tha mạng', N'https://st.nettruyenup.com/data/comics/131/dai-vuong-tha-mang.jpg', 3, N'Sau khi linh khí hồi phục, mọi người chắt chiu từng tơ linh khí, chỉ có Lữ Thụ, dựa vào hệ thống điểm cảm xúc tiêu cực , oán hận người khác là trở nên mạnh hơn! Cậu ta chỉ muốn bảo vệ em gái, nhưng mà thời kì lũ lụt khó có thể tránh khỏi, chỉ đành..... tiện oán hận người khác , trở nên mạnh hơn! Vậy thì , chuẩn bị xong chưa, Lữ Thụ "Đại Ma Vương " tới đây', CAST(N'2023-03-11T21:08:50.600' AS DateTime), CAST(N'2023-03-11T21:08:50.600' AS DateTime))
INSERT [dbo].[TRUYEN] ([IDTruyen], [IDTheLoai], [TenTruyen], [UrlAvatar], [LuotXem], [MoTa], [NgayCapNhat], [NgayTao]) VALUES (5, 1, N'Vạn Cổ Tối Cường Tông', N'https://st.nettruyenup.com/data/comics/131/dai-vuong-tha-mang.jpg', 0, N'Vạn Cổ Tối Cường Tông của tác giả Giang Hồ Tái Kiến. 
			“Người trẻ tuổi, ta nhìn ngươi có xương cốt cứng rắn,
			sau này ngươi chắc chắn sẽ là thiên tài võ học vạn người mới có một. 
			Ngươi có thể suy nghĩ một chút chuyện gia nhập làm đệ tử Thiết Cốt phái của ta, 
			thành tựu tương lai của ngươi là không thể tưởng tượng được.”. 
			Theo chân Quân Thường Tiếu chiêu mộ đệ tử khắp nơi trong vạn giới', CAST(N'2023-03-11T21:08:50.600' AS DateTime), CAST(N'2023-03-11T21:08:50.600' AS DateTime))
INSERT [dbo].[TRUYEN] ([IDTruyen], [IDTheLoai], [TenTruyen], [UrlAvatar], [LuotXem], [MoTa], [NgayCapNhat], [NgayTao]) VALUES (6, 1, N'Pháp Sư Không Phép Thuật', N'https://st.nettruyenup.com/data/comics/69/black-clover-phap-su-khong-phep-thuat.jpg', 4, N'Aster và Yuno là hai đứa trẻ bị bỏ rơi ở nhà thờ và cùng nhau lớn lên tại đó. Khi còn nhỏ, chúng đã hứa với nhau xem ai sẽ trở thành Ma pháp vương tiếp theo. Thế nhưng, khi cả hai lớn lên, mọi sô chuyện đã thay đổi. Yuno là thiên tài ma pháp với sức mạnh tuyệt đỉnh trong khi Aster lại không thể sử dụng ma pháp và cố gắng bù đắp bằng thể lực. Khi cả hai được nhận sách phép vào tuổi 15, Yuno đã được ban cuốn sách phép cỏ bốn bá (trong khi đa số là cỏ ba lá) mà Aster lại không có cuốn nào. Tuy nhiên, khi Yuno bị đe dọa, sự thật về sức mạnh của Aster đã được giải mã- cậu ta được ban cuốn sách phép cỏ năm lá, cuốn sách phá ma thuật màu đen. Bấy giờ, hai người bạn trẻ đang hướng ra thế giới, cùng chung mục tiêu.', CAST(N'2023-03-11T21:08:50.600' AS DateTime), CAST(N'2023-03-11T21:08:50.600' AS DateTime))
INSERT [dbo].[TRUYEN] ([IDTruyen], [IDTheLoai], [TenTruyen], [UrlAvatar], [LuotXem], [MoTa], [NgayCapNhat], [NgayTao]) VALUES (8, 1, N'Vạn Cổ Thần Đế', N'https://st.nettruyenup.com/data/comics/76/van-co-than-de.jpg', 0, N'800 năm trước, Minh Đế chi tử Trương Nhược Trần, bị vị hôn thê của hắn Trì Dao công chúa giết chết, thiên kiêu một đời, liền như vậy ngã xuống. Tám trăm năm sau, Trương Nhược Trần một lần nữa sống lại, lại phát hiện vị hôn thê đã từng giết chết hắn, đã thống nhất Côn Lôn Giới, mở ra Đệ Nhất Trung Ương đế quốc, được xưng "Trì Dao Nữ Hoàng" .', CAST(N'2023-03-11T21:08:50.600' AS DateTime), CAST(N'2023-03-11T21:08:50.600' AS DateTime))
INSERT [dbo].[TRUYEN] ([IDTruyen], [IDTheLoai], [TenTruyen], [UrlAvatar], [LuotXem], [MoTa], [NgayCapNhat], [NgayTao]) VALUES (9, 1, N'Tối Cường Phản Sáo Lộ Hệ Thống', N'https://st.nettruyenup.com/data/comics/61/toi-cuong-phan-sao-lo-he-thong.jpg', 0, N'"Người trẻ tuổi, năm đó ta bắt đầu Trang Bức thời điểm, các ngươi còn chỉ là một giọt chất lỏng!"
"Tiên tử, theo tại hạ đi một chuyến, bảo đảm mang ngươi Trang Bức mang ngươi bay, mang ngươi đồng thời khà khà khà!"
Người mặc cuồng đồ áo giáp, kiên khiêng nhật viêm đấu bồng.
Tay trái Vô Tẫn Chi Nhận, tay phải Tru Tiên Thần Kiếm.
Quét ngang Tu Tiên Giới không có địch thủ, liền hỏi một tiếng còn có ai?
Trang Bức Như Phong, thường bạn ta thân! Đường dài dài đằng đẵng, Trang Bức làm bạn!
Từ Khuyết bước lên một cái Trang Bức con đường, mỗi ngày không phải ở Trang Bức, chính là ở đi Trang Bức trên đường!', CAST(N'2023-03-11T21:08:50.600' AS DateTime), CAST(N'2023-03-11T21:08:50.600' AS DateTime))
INSERT [dbo].[TRUYEN] ([IDTruyen], [IDTheLoai], [TenTruyen], [UrlAvatar], [LuotXem], [MoTa], [NgayCapNhat], [NgayTao]) VALUES (10, 5, N'Học Sĩ Tái Sinh', N'https://st.nettruyenup.com/data/comics/188/hoc-si-tai-sinh.jpg', 3, N'Tên khác: The Scholars Reincarnation
Câu chuyện về một thằng bá đạo trong Võ lâm, bị Liên minh Võ Lâm dồn ép đến chết - Và quan trọng là anh ta Trùng Sinh lại, làm lại từ đầu, trở thành 1 đứa trẻ với bí kíp võ công đời trước vẫn còn đó Đón xem The Scholars Reincarnation nhé! Đã bá đạo lại còn trùng sinh', CAST(N'2023-03-11T21:08:50.600' AS DateTime), CAST(N'2023-03-11T21:08:50.600' AS DateTime))
INSERT [dbo].[TRUYEN] ([IDTruyen], [IDTheLoai], [TenTruyen], [UrlAvatar], [LuotXem], [MoTa], [NgayCapNhat], [NgayTao]) VALUES (11, 5, N'Tu Tiên Ở Thế Giới Siêu Năng Lực', N'https://st.nettruyenup.com/data/comics/52/tu-tien-o-the-gioi-sieu-nang-luc.jpg', 15, N'Ở thế giới siêu năng lực tu tiên, phải chăng đầu óc ta có bệnh ?', CAST(N'2023-03-11T21:08:50.600' AS DateTime), CAST(N'2023-03-11T21:08:50.600' AS DateTime))
INSERT [dbo].[TRUYEN] ([IDTruyen], [IDTheLoai], [TenTruyen], [UrlAvatar], [LuotXem], [MoTa], [NgayCapNhat], [NgayTao]) VALUES (12, 7, N'Người Chơi Siêu Mạnh', N'https://st.nettruyenup.com/data/comics/70/nguoi-choi-sieu-manh.jpg', 23, N'Lâm Tương, cậu thanh niên trẻ cần mẫn chăm chỉ ngày ngày cày việc với mong muốn trả hết số nợ của bản thân mình. Sau khi nhận ra rằng bản thân không thể trả hết số nợ với những việc đang làm và sớm muộn gì cũng phải bị bọn siết nợ đòi mạng, Lâm Tường đã đánh liều tham gia một trò chơi thực tế ảo bí ẩn. Với kinh nghiệm là một lập trình viên cùng khả năng chơi game thiên phú, Lâm Tương dần mở rộng thế lực và hiểu ra sự thật tàn khốc của trò chơi này. Hành trình tìm ra mục đích và âm mưu của lũ tài phiệt đứng sau trò chơi bí ẩn của Lâm Tường chính thức bắt đầu từ đây!', CAST(N'2023-03-11T21:08:50.600' AS DateTime), CAST(N'2023-03-11T21:08:50.600' AS DateTime))
INSERT [dbo].[TRUYEN] ([IDTruyen], [IDTheLoai], [TenTruyen], [UrlAvatar], [LuotXem], [MoTa], [NgayCapNhat], [NgayTao]) VALUES (13, 3, N'Nhân Trùng Đại Chiến', N'https://st.nettruyenup.com/data/comics/132/nhan-trung-dai-chien.jpg', 0, N'Jung Soo Chan, một nam sinh với vẻ ngoại hình bóng bẩy, tràn đầy tự tin và luôn thu hút sự chú ý của người khác. Cậu luôn nghĩ rằng bản thân luôn là "Vua" của nơi mình đang sống, nhưng sâu bên trong lại là mặc cảm về "biến dị" của bản thân mình. Khi cậu còn nhỏ, sau 1 lần vô tình sử dụng thuốc diệt côn trùng để tiêu diệt một con chuồn chuồn, cậu đã bị đột biến và mang gen của giống loài chuồn chuồn kể từ đó. Ngỡ đâu cuộc sống  của Jung Soo Chan sẽ êm ả trôi đi, thì một ngày cậu lại bị truy sát bởi một kẻ mang đột biến bọ ngựa. Và từ đây cũng cũng nhận ra rằng: Không phải chỉ một mình cậu bị đột biến!!', CAST(N'2023-03-11T21:08:50.600' AS DateTime), CAST(N'2023-03-11T21:08:50.600' AS DateTime))
INSERT [dbo].[TRUYEN] ([IDTruyen], [IDTheLoai], [TenTruyen], [UrlAvatar], [LuotXem], [MoTa], [NgayCapNhat], [NgayTao]) VALUES (14, 5, N'Võ Luyện Đỉnh Phong', N'https://st.nettruyenup.com/data/comics/32/vo-luyen-dinh-phong.jpg', 0, N'Võ đạo đỉnh phong, là cô độc, là tịch mịch, là dài đằng đẵng cầu tác, là cao xử bất thắng hàn
Phát triển trong nghịch cảnh, cầu sinh nơi tuyệt địa, bất khuất không buông tha, mới có thể có thể phá võ chi cực đạo.
Lăng Tiêu các thí luyện đệ tử kiêm quét rác gã sai vặt Dương Khai ngẫu lấy được một bản vô tự hắc thư, từ nay về sau đạp vào dài đằng đẵng võ đạo.', CAST(N'2023-03-11T21:08:50.600' AS DateTime), CAST(N'2023-03-11T21:08:50.600' AS DateTime))
INSERT [dbo].[TRUYEN] ([IDTruyen], [IDTheLoai], [TenTruyen], [UrlAvatar], [LuotXem], [MoTa], [NgayCapNhat], [NgayTao]) VALUES (15, 7, N'MOTO SAIKYOU NO KENSHI WA, ISEKAI MAHOU NI AKOGARERU', N'https://st.nettruyenup.com/data/comics/134/moto-saikyou-no-kenshi-wa-isekai-mahou-n-6045.jpg', 3, N'Anh main nhà ta,kiếm sĩ mạnh nhất tái sinh thành thanh niên vô năng', CAST(N'2023-03-11T21:08:50.600' AS DateTime), CAST(N'2023-03-11T21:08:50.600' AS DateTime))
SET IDENTITY_INSERT [dbo].[TRUYEN] OFF
GO
ALTER TABLE [dbo].[TRUYEN]  WITH CHECK ADD FOREIGN KEY([IDTheLoai])
REFERENCES [dbo].[THELOAI] ([IDTheLoai])
GO
