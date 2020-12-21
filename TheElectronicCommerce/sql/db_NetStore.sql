USE [master]
GO
CREATE DATABASE [db_NetStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = 'db_NetStore', FILENAME = 'F:\asp.net\电子商务网站\TheElectronicCommerce\TheElectronicCommerce\App_Data\db_NetStore.mdf' , SIZE = 9216KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = 'db_NetStore_log', FILENAME = 'F:\asp.net\电子商务网站\TheElectronicCommerce\TheElectronicCommerce\App_Data\db_NetStore_log.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

USE [db_NetStore]
GO
/****** Object:  User [sa]    Script Date: 2019/3/12 9:09:12 ******/
CREATE USER [sa] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO

CREATE TABLE [dbo].[tb_Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[RealName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tb_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tb_BookInfo](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NOT NULL,
	[BookName] [varchar](50) NOT NULL,
	[BookIntroduce] [ntext] NOT NULL,
	[Author] [varchar](50) NOT NULL,
	[Company] [varchar](50) NOT NULL,
	[BookUrl] [varchar](200) NOT NULL,
	[MarketPrice] [float] NOT NULL,
	[HotPrice] [float] NOT NULL,
	[Isrefinement] [bit] NOT NULL,
	[IsHot] [bit] NOT NULL,
	[IsDiscount] [bit] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tb_BookInfo] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tb_Class](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](50) NOT NULL,
	[CategoryUrl] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_Class] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tb_Detail](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[BookID] [int] NOT NULL,
	[Num] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[TotailPrice] [float] NOT NULL,
	[Remark] [varchar](200) NULL,
 CONSTRAINT [PK_tb_BuyInfo] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tb_Image](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [varchar](50) NOT NULL,
	[ImageUrl] [varchar](200) NOT NULL,
 CONSTRAINT [PK_tb_Image] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tb_LeaveWord](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Uid] [nvarchar](50) NOT NULL,
	[Subject] [nvarchar](50) NOT NULL,
	[Content] [ntext] NULL,
	[DateTime] [datetime] NOT NULL,
	[IP] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tb_LeaveWord] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tb_Member](
	[MemberID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[RealName] [varchar](50) NOT NULL,
	[Sex] [bit] NOT NULL,
	[Phonecode] [varchar](20) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Address] [varchar](200) NOT NULL,
	[PostCode] [char](10) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tb_Member] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tb_OrderInfo](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[BooksFee] [float] NOT NULL,
	[ShipFee] [float] NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[ShipType] [varchar](50) NOT NULL,
	[ReceiverName] [varchar](50) NOT NULL,
	[ReceiverPhone] [varchar](20) NOT NULL,
	[ReceiverPostCode] [char](10) NOT NULL,
	[ReceiverAddress] [varchar](200) NOT NULL,
	[ReceiverEmail] [varchar](50) NOT NULL,
	[IsConfirm] [bit] NOT NULL,
	[IsSend] [bit] NOT NULL,
	[IsEnd] [bit] NOT NULL,
	[AdminID] [int] NULL,
	[ConfirmTime] [datetime] NULL,
 CONSTRAINT [PK_tb_OrderInfo] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tb_Reply](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UName] [nvarchar](50) NULL,
	[Content] [ntext] NULL,
	[DateTime] [datetime] NULL,
	[ReplyID] [int] NULL,
	[IP] [nvarchar](20) NULL,
 CONSTRAINT [PK_tb_Reply] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[tb_Admin] ON 

INSERT [dbo].[tb_Admin] ([AdminID], [AdminName], [Password], [RealName], [Email], [LoadDate]) VALUES (1, N'mr', N'mrsoft', N'mr', N'1@126.com', CAST(N'2019-03-24T12:15:30.780' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_Admin] OFF
SET IDENTITY_INSERT [dbo].[tb_BookInfo] ON 

INSERT [dbo].[tb_BookInfo] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [BookUrl], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate]) VALUES (16, 16, N'VC++', N'内容丰富', N'宋坤、李伟明、刘锐宁', N'人民邮电出版社', N'~\images\ftp\精品推荐3.jpg', 52, 52, 0, 1, 0, CAST(N'2019-06-01T09:43:47.000' AS DateTime))
INSERT [dbo].[tb_BookInfo] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [BookUrl], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate]) VALUES (17, 16, N'Delphi开发技术大全', N'内容丰富', N'梁冰、梁水、李方超', N'人民邮电出版社', N'~\images\ftp\热销商品3.jpg', 52, 52, 1, 0, 0, CAST(N'2019-05-31T10:55:19.450' AS DateTime))
INSERT [dbo].[tb_BookInfo] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [BookUrl], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate]) VALUES (18, 16, N'VB数据库系统开发完全手册', N'内容丰富', N'李俊民、高春艳、刘彬彬', N'人民邮电出版社', N'~\images\ftp\热销商品4.jpg', 59, 59, 0, 0, 1, CAST(N'2019-05-31T10:56:20.983' AS DateTime))
INSERT [dbo].[tb_BookInfo] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [BookUrl], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate]) VALUES (19, 16, N'ASP.NET程序开发范例宝典', N'内容丰富', N'张跃廷、王小科', N'人民邮电出版社', N'~\images\ftp\热销商品.jpg', 52, 52, 1, 1, 1, CAST(N'2019-06-01T10:33:16.890' AS DateTime))
INSERT [dbo].[tb_BookInfo] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [BookUrl], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate]) VALUES (20, 2, N'小说', N'很好看的', N'明明', N'*出版社', N'~\images\ftp\小说.jpg', 40, 40, 1, 1, 1, CAST(N'2019-06-01T10:52:29.983' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_BookInfo] OFF
SET IDENTITY_INSERT [dbo].[tb_Class] ON 

INSERT [dbo].[tb_Class] ([ClassID], [ClassName], [CategoryUrl]) VALUES (1, N'文艺', N'~\images\ftp\文艺.jpg')
INSERT [dbo].[tb_Class] ([ClassID], [ClassName], [CategoryUrl]) VALUES (2, N'小说', N'~\images\ftp\小说.jpg')
INSERT [dbo].[tb_Class] ([ClassID], [ClassName], [CategoryUrl]) VALUES (3, N'生活', N'~\images\ftp\生活.jpg')
INSERT [dbo].[tb_Class] ([ClassID], [ClassName], [CategoryUrl]) VALUES (4, N'励志', N'~\images\ftp\励志.jpg')
INSERT [dbo].[tb_Class] ([ClassID], [ClassName], [CategoryUrl]) VALUES (5, N'人文社科', N'~\images\ftp\人文.jpg')
INSERT [dbo].[tb_Class] ([ClassID], [ClassName], [CategoryUrl]) VALUES (6, N'管理', N'~\images\ftp\管理.jpg')
INSERT [dbo].[tb_Class] ([ClassID], [ClassName], [CategoryUrl]) VALUES (7, N'少儿', N'~\images\ftp\少儿.jpg')
INSERT [dbo].[tb_Class] ([ClassID], [ClassName], [CategoryUrl]) VALUES (8, N'科技', N'~\images\ftp\科技.jpg')
INSERT [dbo].[tb_Class] ([ClassID], [ClassName], [CategoryUrl]) VALUES (9, N'教育', N'~\images\ftp\教育.jpg')
INSERT [dbo].[tb_Class] ([ClassID], [ClassName], [CategoryUrl]) VALUES (16, N'本公司图书', N'~\images\ftp\工具书.jpg')
SET IDENTITY_INSERT [dbo].[tb_Class] OFF
SET IDENTITY_INSERT [dbo].[tb_Detail] ON 

INSERT [dbo].[tb_Detail] ([DetailID], [BookID], [Num], [OrderID], [TotailPrice], [Remark]) VALUES (33, 18, 1, 50, 59, N'hh')
INSERT [dbo].[tb_Detail] ([DetailID], [BookID], [Num], [OrderID], [TotailPrice], [Remark]) VALUES (34, 16, 1, 51, 52, N'hh')
SET IDENTITY_INSERT [dbo].[tb_Detail] OFF
SET IDENTITY_INSERT [dbo].[tb_Image] ON 

INSERT [dbo].[tb_Image] ([ImageID], [ImageName], [ImageUrl]) VALUES (23, N'工具书.jpg', N'~\images\ftp\工具书.jpg')
INSERT [dbo].[tb_Image] ([ImageID], [ImageName], [ImageUrl]) VALUES (24, N'管理.jpg', N'~\images\ftp\管理.jpg')
INSERT [dbo].[tb_Image] ([ImageID], [ImageName], [ImageUrl]) VALUES (25, N'教育.jpg', N'~\images\ftp\教育.jpg')
INSERT [dbo].[tb_Image] ([ImageID], [ImageName], [ImageUrl]) VALUES (26, N'科技.jpg', N'~\images\ftp\科技.jpg')
INSERT [dbo].[tb_Image] ([ImageID], [ImageName], [ImageUrl]) VALUES (27, N'励志.jpg', N'~\images\ftp\励志.jpg')
INSERT [dbo].[tb_Image] ([ImageID], [ImageName], [ImageUrl]) VALUES (28, N'人文.jpg', N'~\images\ftp\人文.jpg')
INSERT [dbo].[tb_Image] ([ImageID], [ImageName], [ImageUrl]) VALUES (29, N'少儿.jpg', N'~\images\ftp\少儿.jpg')
INSERT [dbo].[tb_Image] ([ImageID], [ImageName], [ImageUrl]) VALUES (30, N'生活.jpg', N'~\images\ftp\生活.jpg')
INSERT [dbo].[tb_Image] ([ImageID], [ImageName], [ImageUrl]) VALUES (31, N'文艺.jpg', N'~\images\ftp\文艺.jpg')
INSERT [dbo].[tb_Image] ([ImageID], [ImageName], [ImageUrl]) VALUES (32, N'小说.jpg', N'~\images\ftp\小说.jpg')
INSERT [dbo].[tb_Image] ([ImageID], [ImageName], [ImageUrl]) VALUES (34, N'精品推荐3.jpg', N'~\images\ftp\精品推荐3.jpg')
INSERT [dbo].[tb_Image] ([ImageID], [ImageName], [ImageUrl]) VALUES (37, N'热销商品3.jpg', N'~\images\ftp\热销商品3.jpg')
INSERT [dbo].[tb_Image] ([ImageID], [ImageName], [ImageUrl]) VALUES (38, N'热销商品4.jpg', N'~\images\ftp\热销商品4.jpg')
INSERT [dbo].[tb_Image] ([ImageID], [ImageName], [ImageUrl]) VALUES (39, N'热销商品5.jpg', N'~\images\ftp\热销商品5.jpg')
INSERT [dbo].[tb_Image] ([ImageID], [ImageName], [ImageUrl]) VALUES (41, N'热销商品.jpg', N'~\images\ftp\热销商品.jpg')
INSERT [dbo].[tb_Image] ([ImageID], [ImageName], [ImageUrl]) VALUES (42, N'特价商品2.jpg', N'~\images\ftp\特价商品2.jpg')
INSERT [dbo].[tb_Image] ([ImageID], [ImageName], [ImageUrl]) VALUES (43, N'特价商品.jpg', N'~\images\ftp\特价商品.jpg')
INSERT [dbo].[tb_Image] ([ImageID], [ImageName], [ImageUrl]) VALUES (46, N'特价商品4.jpg', N'~\images\ftp\特价商品4.jpg')
INSERT [dbo].[tb_Image] ([ImageID], [ImageName], [ImageUrl]) VALUES (47, N'特价商品3.jpg', N'~\images\ftp\特价商品3.jpg')
INSERT [dbo].[tb_Image] ([ImageID], [ImageName], [ImageUrl]) VALUES (49, N'未标题-1.jpg', N'~\images\ftp\未标题-1.jpg')
SET IDENTITY_INSERT [dbo].[tb_Image] OFF
SET IDENTITY_INSERT [dbo].[tb_Member] ON 

INSERT [dbo].[tb_Member] ([MemberID], [UserName], [Password], [RealName], [Sex], [Phonecode], [Email], [Address], [PostCode], [LoadDate]) VALUES (3, N'00', N'000000', N'00', 0, N'0431-0000***       ', N'www.88@1*3.com', N'长春市', N'000000    ', CAST(N'2019-05-30T16:45:41.340' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_Member] OFF
SET IDENTITY_INSERT [dbo].[tb_OrderInfo] ON 

INSERT [dbo].[tb_OrderInfo] ([OrderID], [OrderDate], [BooksFee], [ShipFee], [TotalPrice], [ShipType], [ReceiverName], [ReceiverPhone], [ReceiverPostCode], [ReceiverAddress], [ReceiverEmail], [IsConfirm], [IsSend], [IsEnd], [AdminID], [ConfirmTime]) VALUES (50, CAST(N'2019-05-31T11:27:37.123' AS DateTime), 59, 10, 69, N'邮局邮寄普通包裹（10元/本）', N'00', N'0431-0000***', N'000000    ', N'长春市', N'www.88@1*3.com', 1, 0, 0, 1, CAST(N'2019-05-31T11:29:30.000' AS DateTime))
INSERT [dbo].[tb_OrderInfo] ([OrderID], [OrderDate], [BooksFee], [ShipFee], [TotalPrice], [ShipType], [ReceiverName], [ReceiverPhone], [ReceiverPostCode], [ReceiverAddress], [ReceiverEmail], [IsConfirm], [IsSend], [IsEnd], [AdminID], [ConfirmTime]) VALUES (51, CAST(N'2019-05-31T11:29:07.373' AS DateTime), 52, 10, 62, N'邮局邮寄普通包裹（10元/本）', N'00', N'0431-0000***', N'000000    ', N'长春市', N'www.88@1*3.com', 1, 1, 0, 1, CAST(N'2019-05-31T11:29:58.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_OrderInfo] OFF
SET IDENTITY_INSERT [dbo].[tb_Reply] ON 

INSERT [dbo].[tb_Reply] ([ID], [UName], [Content], [DateTime], [ReplyID], [IP]) VALUES (49, N'11', N'留言回复信息', CAST(N'2019-06-01T10:07:48.000' AS DateTime), 28, N'127.0.0.1')
SET IDENTITY_INSERT [dbo].[tb_Reply] OFF
ALTER TABLE [dbo].[tb_Admin] ADD  CONSTRAINT [DF_tb_Admin_LoadDate]  DEFAULT (getdate()) FOR [LoadDate]
GO
ALTER TABLE [dbo].[tb_BookInfo] ADD  CONSTRAINT [DF_tb_BookInfo_LoadDate]  DEFAULT (getdate()) FOR [LoadDate]
GO
ALTER TABLE [dbo].[tb_Member] ADD  CONSTRAINT [DF_tb_Member_LoadDate]  DEFAULT (getdate()) FOR [LoadDate]
GO
ALTER TABLE [dbo].[tb_OrderInfo] ADD  CONSTRAINT [DF_tb_OrderInfo_OrderDate]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[tb_OrderInfo] ADD  CONSTRAINT [DF_tb_OrderInfo_IsConfirm]  DEFAULT ((0)) FOR [IsConfirm]
GO
ALTER TABLE [dbo].[tb_OrderInfo] ADD  CONSTRAINT [DF_tb_OrderInfo_SendStatus]  DEFAULT ((0)) FOR [IsSend]
GO
ALTER TABLE [dbo].[tb_OrderInfo] ADD  CONSTRAINT [DF_tb_OrderInfo_IsEnd]  DEFAULT ((0)) FOR [IsEnd]
GO
ALTER TABLE [dbo].[tb_BookInfo]  WITH CHECK ADD  CONSTRAINT [FK_tb_BookInfo_tb_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[tb_Class] ([ClassID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_BookInfo] CHECK CONSTRAINT [FK_tb_BookInfo_tb_Class]
GO
ALTER TABLE [dbo].[tb_Detail]  WITH CHECK ADD  CONSTRAINT [FK_tb_Detail_tb_BookInfo] FOREIGN KEY([BookID])
REFERENCES [dbo].[tb_BookInfo] ([BookID])
GO
ALTER TABLE [dbo].[tb_Detail] CHECK CONSTRAINT [FK_tb_Detail_tb_BookInfo]
GO
ALTER TABLE [dbo].[tb_Detail]  WITH CHECK ADD  CONSTRAINT [FK_tb_Detail_tb_OrderInfo] FOREIGN KEY([OrderID])
REFERENCES [dbo].[tb_OrderInfo] ([OrderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_Detail] CHECK CONSTRAINT [FK_tb_Detail_tb_OrderInfo]
GO

Create proc [dbo].[Proc_AddCategory]
(
@ClassName varchar(50),
@CategoryUrl Varchar(50)
)
as
if exists(select * from tb_Class where ClassName=@ClassName )
	begin
		return -100
	end
else
	begin
		insert tb_Class(ClassName,categoryUrl)
		values(@ClassName,@categoryUrl)
	end
GO

Create proc [dbo].[Proc_AddGoodsInfo]
(
  @ClassID bigint,
  @GoodsName varchar(50),
  @GoodsIntroduce ntext,
  @GoodsBrand varchar(50),
  @GoodsUnit varchar(10),
  @GoodsWeight float,
  @GoodsUrl varchar(50),
  @MarketPrice float,
  @MemberPrice float,
  @Isrefinement bit,
  @IsHot bit,
  @IsDisCount bit
  
)
as
if exists(select * from tb_GoodsInfo where GoodsName=@GoodsName)
  begin
   return -100
  end
else
  begin
    insert tb_GoodsInfo
    (ClassID,GoodsName,GoodsIntroduce,GoodsBrand,GoodsUnit,GoodsWeight,GoodsUrl,MarketPrice,MemberPrice,Isrefinement,IsHot,IsDiscount)
    Values (@ClassID,@GoodsName,@GoodsIntroduce,@GoodsBrand,@GoodsUnit,@GoodsWeight,@GoodsUrl,@MarketPrice,@MemberPrice,@Isrefinement,@IsHot,@IsDiscount)

  end
GO

create proc [dbo].[proc_AddODetail]
(
@BookID int,
@Num int,
@OrderID int,
@TotailPrice float,
@Remark varchar(200)
)
as
Insert into tb_Detail
(BookID,Num,OrderID,TotailPrice,Remark)
values
(@BookID,@Num,@OrderID,@TotailPrice,@Remark)
GO

create proc [dbo].[proc_AddOI]
(
@BooksFee float,
@ShipFee float,
@ShipType varchar(50),
@Name varchar(50),
@Phone varchar(20),
@PostCode char(10),
@Address varchar(200),
@Email varchar(50),
@OrderID int output
)
as
Insert into tb_OrderInfo
(BooksFee,ShipFee,TotalPrice,ShipType,ReceiverName,ReceiverPhone,ReceiverPostCode,ReceiverAddress,ReceiverEmail)
values
(@BooksFee,@ShipFee,(@BooksFee+@ShipFee),@ShipType,@Name,@Phone,@PostCode,@Address,@Email)
select @OrderID=@@identity
GO

Create proc [dbo].[proc_AddUser]
(
	@UserName varchar(50),
	@Password varchar(50),
	@RealName varchar(50),
	@Sex bit,
	@Phonecode char(20),
	@Email varchar(50),
	@Address varchar(200),
	@PostCode char(10)
)
as
if Exists(select * from tb_Member where UserName=@UserName)
	return -100
else
	begin
		Insert tb_Member(UserName,Password,RealName,Sex,Phonecode,Email,Address,PostCode)
		values(@UserName,@Password,@RealName,@Sex,@Phonecode,@Email,@Address,@PostCode)
		return 100
	end
GO

Create proc [dbo].[Proc_DeleteAdminInfo]
(
@AdminID bigint
)
as
delete from tb_Admin
where AdminID=@AdminID
GO

Create proc [dbo].[Proc_DeleteAreaInfo]
(
@AreaID bigint
)
as
delete from tb_Area
where AreaID=@AreaID
GO

Create Proc [dbo].[Proc_DeleteCategory]
(
 @ClassID bigint
)
as
delete from tb_Class where ClassID=@ClassID
GO

Create proc [dbo].[Proc_DeleteGoodsInfo]
(
@GoodsID bigint
)
as
Delete from tb_GoodsInfo
where GoodsID=@GoodsID
GO

Create proc [dbo].[Proc_DeleteImageInfo]
(
@ImageID bigint
)
as
delete from tb_Image
where ImageID=@ImageID
GO

Create proc [dbo].[Proc_DeleteMemberInfo]
(
@MemberID bigint
)
as
delete from tb_Member 
where MemberID=@MemberID
GO

Create Proc [dbo].[Proc_DeleteOrderInfo]
(
@OrderID bigint
)
as
delete from tb_OrderInfo
where OrderID=@OrderID
GO

Create proc [dbo].[Proc_DeletePayInfo]
(
@PayID bigint
)
as
delete from tb_PayType
where PayID=@PayID
GO

create proc [dbo].[Proc_DeleteSC]
(
@MemberID bigint
)
as
delete from tb_ShopCart
where MemberID=@MemberID
GO

Create proc [dbo].[Proc_DeleteSCByID]
(
@MemberID bigint,
@CartID bigint
)
as
delete from tb_ShopCart
where MemberID=@MemberID and CartID=@CartID
GO

Create proc [dbo].[Proc_DeleteShipInfo]
(
@ShipID bigint
)
as
delete from tb_ShipType
where ShipID=@ShipID
GO

Create proc [dbo].[Proc_DeleteShopCart]
(
@MemberID bigint
)
as
delete from tb_ShopCart
where MemberID=@MemberID
GO

--当@Deplay=1时,从数据表tb_BookInfo中，查询Isrefinement(精品推出)字段为1的商品信息
--当@Deplay=2时,从数据表tb_BookInfo中，查询IsDiscount(特价商品)字段为1的商品信息
--当@Deplay=3时,从数据表tb_BookInfo中，查询IsHot(热销商品)字段为1的商品信息
Create proc [dbo].[proc_DeplayGI]
(
	@Deplay int
)
as
if(@Deplay=1)--精品推出
	begin
		select top 3 * from tb_BookInfo
		where Isrefinement=1 
	end		
else if(@Deplay=2)--特价商品
	begin
		 select top 6 * from tb_BookInfo
		 where  IsDiscount=1
	end
else if(@Deplay=3)--热销商品
	begin
		 select top 6 * from tb_BookInfo
		 where IsHot=1 
	end
GO

Create proc [dbo].[Proc_DeplayGIByC]
(
@ClassID bigint
)
as

	select * from tb_GoodsInfo
	where ClassID=@ClassID 
	
GO

Create proc [dbo].[Proc_DeplayGInfo]
(
@Deplay int
)
as
if(@Deplay=1)
	begin
		 select top 4 * from tb_GoodsInfo
		 where Isrefinement=1 
	end
else if(@Deplay=2)
	begin
		 select top 4 * from tb_GoodsInfo
		 where IsHot=1 
	end
else if(@Deplay=3)
	begin
		 select top 4 * from tb_GoodsInfo
		 where  IsDiscount=1
	end
GO

create proc [dbo].[proc_GCN]
(
	@ClassID int
)
as
if exists(select * from tb_Class where ClassID=@ClassID)
	begin
		select ClassName from tb_Class 
		where ClassID=@ClassID
	end
GO

Create proc [dbo].[Proc_GetAdminInfo]
as
select * from tb_Admin
GO

Create proc [dbo].[Proc_GetAllUserInfo]
as
select * from tb_Member
GO

Create Proc [dbo].[Proc_GetAreaInfo]
as
select * from tb_Area
GO

Create proc [dbo].[Proc_GetAreaInfoByID]
(
@AreaID bigint
)
as
select * from tb_Area
where AreaID=@AreaID
GO

Create Proc [dbo].[Proc_GetCategory]
as
select * from tb_Class
GO

Create proc [dbo].[Proc_GetClassName]
(
@ClassID bigint
)
as
select ClassName from tb_Class
where ClassID=@ClassID
GO

Create Proc [dbo].[Proc_GetGIByOID]
(
@OrderID bigint
)
as
select g.GoodsID,g.GoodsName,b.Num,g.MemberPrice,b.SumPrice,(case IsDisCount when '1' then '是' when '0' then '否' end) as IsDisCount 
from tb_GoodsInfo g,tb_BuyInfo b,tb_OrderInfo o
where g.GoodsID=b.GoodsID and b.OrderID=o.OrderID and o.OrderID=@OrderID
GO

Create proc [dbo].[Proc_GetGoodsInfo]
as
select * from tb_GoodsInfo
GO

Create proc [dbo].[Proc_GetGoodsInfoByID]
(
@GoodsID bigint
)
as
select * from tb_GoodsInfo
where GoodsID=@GoodsID
GO

create Proc [dbo].[Proc_GetImageInfo]
as
select * from tb_Image
GO

Create proc [dbo].[Proc_GetNMI]
as
if exists(select * from tb_Member where DATEDIFF(day, LoadDate, getdate()) < 1)
	begin
		select * from tb_Member where DATEDIFF(day, LoadDate, getdate()) < 1
	end
else
	return -100
GO

Create proc [dbo].[Proc_GetNOI]
as
if exists(select * from tb_OrderInfo where  DATEDIFF(day, OrderDate, getdate()) < 1
)
   begin
		select * from tb_OrderInfo where DATEDIFF(day, OrderDate, getdate()) < 1
   end
else
   return -100
GO

Create Proc [dbo].[Proc_GetOdIf]
(
 @OrderID bigint
)
as
select * from tb_OrderInfo
where OrderID=@OrderID
GO

Create Proc [dbo].[Proc_GetPayInfo]
as
select * from tb_PayType
GO

Create proc [dbo].[Proc_GetPayInfoByID]
(
@PayID bigint
)
as
select * from tb_PayType
where PayID=@PayID
GO

Create Proc [dbo].[Proc_GetPayWay]
(
@PayType int
)
as
select PayWay from tb_PayType where PayID=@PayType
GO

Create proc [dbo].[Proc_GetSCI]
(
@MemberID bigint
)
as
select *
from tb_ShopCart
where MemberID=@MemberID
GO

Create Proc [dbo].[Proc_GetShipInfo]
as
select * from tb_ShipType
GO

Create proc [dbo].[Proc_GetShipInfoByID]
(
@ShipID bigint
)
as
select * from tb_ShipType
where ShipID=@ShipID
GO

Create Proc [dbo].[Proc_GetShipWay]
(
@ShipType int
)
as
select ShipWay from tb_ShipType where ShipID=@ShipType
GO

Create proc [dbo].[Proc_GetShopCart]
(
@MemberID bigint
)
as
select CartID,GoodsName,MarketPrice,MemberPrice,Num,SumPrice,MemberID
from tb_ShopCart b,tb_GoodsInfo i
where b.GoodsID=i.GoodsID and MemberID=@MemberID
GO

Create proc [dbo].[proc_GetUI]
(
	@MemberID int 
)
as
if exists(select * from tb_Member where MemberID=@MemberID)
	begin
		select * from tb_Member 
		where  MemberID=@MemberID
	end
GO

Create proc [dbo].[Proc_GetUIByID]
(
@MemberID bigint
)
as 
   select * from tb_Member where MemberID=@MemberID
GO

Create proc [dbo].[proc_GIList]
(
	@ClassID int,
	@Deplay int
)
as
if (@ClassID=0)
	begin
		if(@Deplay=1) --最新商品
			begin
	            select * from tb_BookInfo
				where DATEDIFF(day, LoadDate, getdate()) < 7
			end	
		else if(@Deplay=2)	--精品推荐
			begin 
				select * from tb_BookInfo		
				where Isrefinement=1 
			end		
		else if(@Deplay=3)--特价商品
			begin
				 select  * from tb_BookInfo
				 where  IsDiscount=1
			end	
		else if(@Deplay=4)--热销商品
			begin
				 select  * from tb_BookInfo
				 where IsHot=1 
			end	
	end
else
	begin
		select * from tb_BookInfo
		where ClassID=@ClassID
	end	
GO

create Proc [dbo].[Proc_GSF]
(
@GoodsID bigint,
@ShipWay varchar(50)
)
as
if exists(select ShipFee
from tb_ShipType
where shipWay=@shipWay and 
ClassID=
(
select ClassID
from tb_GoodsInfo
where GoodsID=@GoodsID
)
)
begin
select ShipFee
from tb_ShipType
where shipWay=@shipWay and 
ClassID=
(
select ClassID
from tb_GoodsInfo
where GoodsID=@GoodsID
)
end
else
return 100
GO

Create proc [dbo].[Proc_InsertAreaInfo]
(
@AreaName varchar(50),
@AreaKM   int
)
as
if exists(select * from tb_Area where AreaName=@AreaName and AreaKM=@AreaKM)
	begin
		return
	end
else
	begin
		insert into tb_Area(AreaName,AreaKM)
		values (@AreaName,@AreaKM)
	end

GO

Create proc [dbo].[Proc_InsertBuy]
(
@GoodsID bigint,
@Num int,
@OrderID bigint,
@SumPrice float, 
@MemberID bigint
)
as
insert into tb_BuyInfo(GoodsID,Num,OrderID,SumPrice, MemberID)
values (@GoodsID,@Num,@OrderID,@SumPrice, @MemberID)
GO

Create Proc [dbo].[Proc_InsertImageInfo]
(
@ImageName varchar(50),
@ImageUrl varchar(200)
)
as
insert into tb_Image(ImageName,ImageUrl)
values(@ImageName,@ImageUrl)
GO

Create proc [dbo].[Proc_InsertPayInfo]
(
@PayWay varchar(50)
)
as
if exists(select * from tb_PayType where PayWay=@PayWay)
	begin
		return
	end
else
	begin
		insert into tb_PayType(PayWay)
		values (@PayWay)
	end

GO

Create proc [dbo].[Proc_InsertShipInfo]
(
@ShipWay varchar(50),
@ShipFee float,
@ClassID bigint
)
as
if exists(select * from tb_ShipType where ShipWay=@ShipWay and ShipFee=@ShipFee  and ClassID=@ClassID)
	begin
		return
	end
else
begin
	insert into tb_ShipType(ShipWay,ShipFee,ClassID)
	values (@ShipWay,@ShipFee,@ClassID)
end

GO

Create proc [dbo].[Proc_InsertShopCart]
(
@GoodsID bigint,
@MemberPrice float,
@MemberID bigint,
@GoodsWeight float
)
as
if exists(select * from tb_ShopCart where GoodsID=@GoodsID and MemberID=@MemberID)
	begin
		update tb_ShopCart
		set Num=(Num+1),
			SumPrice=(SumPrice+@MemberPrice),
            GoodsWeight=(GoodsWeight+@GoodsWeight)
        where GoodsID=@GoodsID and MemberID=@MemberID
	end
else
	begin
		Insert into tb_ShopCart(GoodsID,Num,SumPrice,MemberID,GoodsWeight)
		values(@GoodsID,1,@MemberPrice,@MemberID,@GoodsWeight)
	end	
GO

Create proc [dbo].[proc_ModifyUser]
(
	@UserName varchar(50),
	@Password varchar(50),
	@RealName varchar(50),
	@Sex bit,
	@Phonecode char(20),
	@Email varchar(50),
	@Address varchar(200),
	@PostCode char(10),
	@MemberID int 
)
as
update tb_Member
set UserName=@UserName,
	Password=@Password,
    RealName=@RealName,
    Sex=@Sex,
	Phonecode=@Phonecode,
	Email=@Email,
	Address=@Address,
	PostCode=@PostCode
   
 where MemberID=@MemberID
GO

CREATE proc [dbo].[proc_NewGoods]
as
select * from tb_BookInfo
where DATEDIFF(day, LoadDate, getdate()) < 7

GO

Create proc [dbo].[proc_SearchGI]
(
@keywords varchar(50)
)
as
declare
@sql nvarchar(1024)
set @sql='select * from tb_BookInfo b, tb_Class c 
          where b.ClassID=c.ClassID 
          and 
			(BookID like ''%'+CONVERT(NVARCHAR(50),@keywords)+'%'' 
			or BookName like ''%'+CONVERT(NVARCHAR(50),@keywords)+'%'' 
			or ClassName like''%'+CONVERT(NVARCHAR(50),@keywords)+'%''
			or Author like''%'+CONVERT(NVARCHAR(50),@keywords)+'%''
			or Company like''%'+CONVERT(NVARCHAR(50),@keywords)+'%''
			or HotPrice like ''%'+CONVERT(NVARCHAR(50),@keywords)
			+'%'')'
exec(@sql)
GO

Create proc [dbo].[Proc_SearchGoodsInfo]
(
@keywords varchar(50)
)
as
declare
@sql nvarchar(1024)
set @sql='select * from tb_GoodsInfo g, tb_Class c 
          where g.ClassID=c.ClassID 
          and 
			(GoodsID like ''%'+CONVERT(NVARCHAR(50),@keywords)
		+'%'' or GoodsName like ''%'+CONVERT(NVARCHAR(50),@keywords)
		+'%'' or ClassName like''%'+CONVERT(NVARCHAR(50),@keywords)
		+'%''or MemberPrice like ''%'+CONVERT(NVARCHAR(50),@keywords)
		+'%'')'
exec(@sql)
GO

Create proc [dbo].[Proc_SearchOI]
(
 @OrderID int,
 @NF int,
 @Name varchar(50),
 @IsConfirm int,
 @IsSend int,
 @IsEnd int
)
as
declare
            @Msql varchar(1024)
			set @Msql='select * from tb_OrderInfo where IsConfirm='+Convert(varchar(20),@IsConfirm)+' and IsSend='+Convert(varchar(20),@IsSend)+' and IsEnd='+Convert(varchar(20),@IsEnd)+''
            if @OrderID>0
				begin
				set @Msql=@Msql+'and OrderID='+ convert(varchar(20),@OrderID)
				end
			if @NF>0
				begin
				set @Msql=@Msql+'and ReceiverName='''+convert(varchar(50),@Name)+''''
                end
           exec(@Msql)
GO

Create proc [dbo].[Proc_TotalInfo]
(
@MemberID bigint
)
as
select * from tb_ShopCart
select Sum(SumPrice),Sum(GoodsWeight),Sum(Num)
from tb_ShopCart
where MemberID=@MemberID
GO

Create proc [dbo].[Proc_UpdateAreaInfo]
(
@AreaID bigint,
@AreaName varchar(50),
@AreaKM   int
)
as
update tb_Area
set AreaName=@AreaName,
    AreaKM=@AreaKM
where AreaID=@AreaID
GO

Create proc [dbo].[Proc_UpdateGoodsInfo]
(
 @ClassID bigint,
  @GoodsName varchar(50),
  @GoodsIntroduce ntext,
  @GoodsBrand varchar(50),
  @GoodsUnit varchar(10),
  @GoodsWeight float,
  @GoodsUrl varchar(50),
  @MarketPrice float,
  @MemberPrice float,
  @Isrefinement bit,
  @IsHot bit,
  @IsDisCount bit,
  @GoodsID int
)
as
update tb_GoodsInfo
set ClassID=@ClassID,
	GoodsName=@GoodsName,
	GoodsIntroduce=@GoodsIntroduce,
	GoodsBrand=@GoodsBrand,
	GoodsUnit=@GoodsUnit,
	GoodsWeight=@GoodsWeight,
	GoodsUrl=@GoodsUrl,
	MarketPrice=@MarketPrice,
	MemberPrice=@MemberPrice,
	Isrefinement=@Isrefinement,
	IsHot=@IsHot,
	IsDiscount=@IsDiscount,
    AddDate=GetDate()
where GoodsID=@GoodsID
GO

Create proc [dbo].[Proc_UpdatePayInfo]
(
@PayID bigint,
@PayWay varchar(50)
)
as
update tb_PayType
set PayWay=@PayWay  
where PayID=@PayID
GO

Create Proc [dbo].[Proc_UpdateSC]
(
@CartID bigint,
@Num int,
@MemberID bigint
)
as
update tb_ShopCart
set Num=@Num,
    SumPrice=(@Num*(
				Select MemberPrice 
				from tb_GoodsInfo 
				where GoodsID=
				(
				select GoodsId
				from tb_ShopCart
				where CartID=@CartID
				)
			)),
   GoodsWeight=(@Num*(
				Select GoodsWeight 
				from tb_GoodsInfo 
				where GoodsID=
				(
				select GoodsId
				from tb_ShopCart
				where CartID=@CartID
				)
			))
where MemberID=@MemberID and CartID=@CartID
GO

Create proc [dbo].[Proc_UpdateShipInfo]
(
@ShipID bigint,
@ShipWay varchar(50),
@ShipFee float,
@ClassID bigint
)
as
update tb_ShipType
set ShipWay=@ShipWay,
    ShipFee=@ShipFee,
    ClassID=@ClassID
where ShipID=@ShipID
GO

Create proc [dbo].[proc_UserLogin]
(
	@UserName varchar(50),
	@Password varchar(50)
)
as
if exists(select * from tb_Member where UserName=@UserName and Password=@Password)
	begin
		select * from tb_Member 
		where UserName=@UserName and Password=@Password
	end
GO
