USE [master]
GO

CREATE DATABASE db_sales_tshirt_webapp
GO

USE db_sales_tshirt_webapp
GO

-- ----------------------------
-- Table structure for [roles]
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[roles]') AND type IN ('U'))
	DROP TABLE [dbo].[roles]
GO

CREATE TABLE [dbo].[roles] (
    [name] NVARCHAR(50) PRIMARY KEY 
)
GO

INSERT INTO [dbo].[roles] ([name]) VALUES ('ADMIN'), ('MANAGER'), ('USER');



-- ----------------------------
-- Table structure for [accounts]
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[accounts]') AND type IN ('U'))
	DROP TABLE [dbo].[accounts]
GO

CREATE TABLE [dbo].[accounts] (
  [id] int  IDENTITY(1,1) primary key NOT NULL,
  [username] varchar(255) NOT NULL,
  [password] varchar(255) NOT NULL,
  [role] varchar(50) DEFAULT 'USER' NOT NULL CHECK ([role] IN ('ADMIN', 'MANAGER', 'USER')),
  [status] int DEFAULT 1 NULL
)
GO

INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('admin@gmail.com', '$2a$10$pwfwTpjwl8PHLM6iOqZmmOgdgnHh0nvJihT1yWw2G52GLzFY6.uOy', 'ADMIN', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('hayes7@gmail.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('hokyaulo11@outlook.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('fuji@gmail.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('fumomoe@yahoo.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('wu1111@gmail.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('samcole8@gmail.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('warren503@mail.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('liaoll727@gmail.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('dziy6@icloud.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('misaksait1@gmail.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('ksuzuki1943@gmail.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('kywong@gmail.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('daiyama@gmail.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('elainperry72@mail.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('huihy@gmail.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('ayatsasaki@yahoo.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('xiuyit@gmail.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('hikarufujita2@icloud.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('clifford110@icloud.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('saky8@hotmail.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('hosauman@mail.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('song04@gmail.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('elizabethcastro1018@outlook.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('wfy617@gmail.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('daicw@icloud.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('wadait@gmail.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('euw@gmail.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('zhou422@gmail.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('jiangzh@icloud.com', '123456', 'MANAGER', 1);
INSERT INTO [dbo].[accounts] ([username], [password], [role], [status]) VALUES ('guzhennan@mail.com', '123456', 'MANAGER', 1);


-- ----------------------------
-- Table structure for HoaDon
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[HoaDon]') AND type IN ('U'))
	DROP TABLE [dbo].[HoaDon]
GO

CREATE TABLE [dbo].[HoaDon] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [IdKH] int  NULL,
  [IdNV] int  NULL,
  [NgayMuaHang] date  NOT NULL,
  [TrangThai] int DEFAULT 1 NOT NULL
)
GO

ALTER TABLE [dbo].[HoaDon] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of HoaDon
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[HoaDon] ON
GO

INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (1, 22, 30, N'2022-01-15', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (2, 22, 27, N'2023-04-15', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (3, 79, 8, N'2021-05-27', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (4, 79, 6, N'2024-03-14', 0);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (5, 42, 20, N'2023-11-16', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (6, 77, 7, N'2022-10-30', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (7, 18, 7, N'2022-12-23', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (8, 16, 30, N'2023-07-24', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (9, 77, 1, N'2022-09-08', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (10, 56, 13, N'2024-05-12', 0);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (11, 32, 15, N'2023-07-26', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (12, 31, 7, N'2023-06-17', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (13, 62, 19, N'2021-11-02', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (14, 3, 30, N'2023-05-24', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (15, 71, 32, N'2023-07-27', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (16, 6, 13, N'2021-05-01', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (17, 17, 12, N'2021-07-15', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (18, 96, 5, N'2023-10-01', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (19, 26, 11, N'2022-09-13', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (20, 86, 1, N'2022-06-26', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (21, 91, 1, N'2021-06-28', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (22, 77, 1, N'2021-07-18', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (23, 9, 5, N'2022-08-17', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (24, 12, 3, N'2021-06-17', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (25, 78, 25, N'2021-08-29', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (26, 86, 1, N'2021-01-25', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (27, 36, 2, N'2023-02-22', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (28, 16, 3, N'2022-05-01', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (29, 83, 4, N'2021-09-27', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (30, 51, 30, N'2023-05-02', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (31, 18, 16, N'2022-10-24', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (32, 21, 7, N'2021-10-27', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (33, 37, 16, N'2021-01-26', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (34, 39, 16, N'2023-09-17', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (35, 92, 1, N'2022-01-04', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (36, 14, 22, N'2021-11-28', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (37, 50, 1, N'2022-09-22', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (38, 80, 1, N'2021-02-27', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (39, 44, 1, N'2023-02-23', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (40, 88, 10, N'2022-09-16', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (41, 42, 15, N'2023-05-10', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (42, 49, 4, N'2021-04-05', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (43, 50, 1, N'2023-02-22', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (44, 30, 22, N'2023-05-05', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (45, 27, 1, N'2023-05-14', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (46, 11, 1, N'2023-07-19', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (47, 5, 32, N'2021-07-21', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (48, 59, 5, N'2021-05-30', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (49, 59, 1, N'2023-03-27', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (50, 25, 5, N'2021-02-03', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (51, 51, 32, N'2022-06-26', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (52, 43, 9, N'2022-07-25', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (53, 17, 30, N'2023-06-09', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (54, 9, 26, N'2022-01-28', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (55, 9, 1, N'2021-01-23', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (56, 10, 6, N'2021-06-15', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (57, 17, 17, N'2021-10-03', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (58, 78, 30, N'2021-08-15', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (59, 33, 21, N'2022-01-21', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (60, 33, 6, N'2022-03-31', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (61, 93, 3, N'2023-08-14', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (62, 84, 2, N'2021-10-17', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (63, 74, 30, N'2023-05-21', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (64, 33, 1, N'2022-08-29', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (65, 84, 20, N'2021-04-09', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (66, 11, 30, N'2023-10-30', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (67, 99, 1, N'2021-10-06', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (68, 17, 16, N'2021-01-27', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (69, 34, 8, N'2021-03-24', 1);
INSERT INTO [dbo].[HoaDon] ([id], [IdKH], [IdNV], [NgayMuaHang], [TrangThai]) VALUES (70, 44, 1, N'2023-08-03', 1);

SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for HoaDonChiTiet
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[HoaDonChiTiet]') AND type IN ('U'))
	DROP TABLE [dbo].[HoaDonChiTiet]
GO

CREATE TABLE [dbo].[HoaDonChiTiet] (
  [id] int IDENTITY(1,1) NOT NULL,
  [IdHoaDon] int  NOT NULL,
  [IdSPCT] int  NOT NULL,
  [SoLuong] int  NOT NULL,
  [DonGia] float(53)  NOT NULL,
  [ThoiGian] datetime ,
  [TrangThai] int DEFAULT 1 NOT NULL
)
GO

ALTER TABLE [dbo].[HoaDonChiTiet] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of HoaDonChiTiet
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[HoaDonChiTiet] ON
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'1', N'2', N'651', N'2', N'309664', N'2021-12-31 06:58:03.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'2', N'31', N'257', N'2', N'682119', N'2021-09-28 17:32:16.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'3', N'10', N'308', N'3', N'853226', N'2023-10-20 23:26:21.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'4', N'19', N'108', N'9', N'840112', N'2021-08-27 14:34:32.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'5', N'61', N'512', N'2', N'363260', N'2021-12-30 04:39:45.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'6', N'62', N'365', N'10', N'987022', N'2021-10-29 04:20:07.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'7', N'15', N'395', N'9', N'486550', N'2022-05-05 07:15:53.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'8', N'60', N'612', N'7', N'623901', N'2022-10-20 16:35:32.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'9', N'50', N'920', N'2', N'185616', N'2021-05-13 22:43:21.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'10', N'47', N'479', N'2', N'598322', N'2021-07-04 09:21:37.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'11', N'4', N'860', N'5', N'187087', N'2021-05-18 19:13:45.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'12', N'14', N'19', N'3', N'955277', N'2022-09-16 14:35:00.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'13', N'34', N'638', N'5', N'284557', N'2022-10-20 00:51:10.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'14', N'34', N'557', N'3', N'492143', N'2021-11-16 23:38:31.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'15', N'2', N'257', N'6', N'572106', N'2023-09-27 13:16:27.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'16', N'21', N'596', N'2', N'902685', N'2023-03-04 03:44:51.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'17', N'5', N'244', N'5', N'747904', N'2022-04-11 12:39:58.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'18', N'65', N'516', N'8', N'670446', N'2021-07-17 10:05:59.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'19', N'30', N'269', N'7', N'696476', N'2021-09-06 15:41:30.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'20', N'14', N'868', N'10', N'370907', N'2023-10-21 03:20:30.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'21', N'45', N'715', N'3', N'675275', N'2022-12-14 12:20:08.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'22', N'58', N'548', N'6', N'335807', N'2021-06-09 21:00:17.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'23', N'6', N'202', N'2', N'582406', N'2022-09-19 03:27:05.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'24', N'46', N'739', N'7', N'447524', N'2022-11-21 02:18:05.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'25', N'6', N'355', N'4', N'393670', N'2021-07-27 00:07:59.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'26', N'66', N'594', N'5', N'468249', N'2021-08-27 10:26:23.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'27', N'51', N'459', N'8', N'589650', N'2023-05-17 13:44:57.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'28', N'33', N'633', N'4', N'544113', N'2021-06-08 08:34:48.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'29', N'37', N'361', N'7', N'486791', N'2021-10-07 11:29:46.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'30', N'70', N'621', N'6', N'532778', N'2022-05-12 06:05:05.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'31', N'23', N'103', N'1', N'943047', N'2023-06-13 00:15:11.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'32', N'68', N'171', N'4', N'823757', N'2023-02-14 20:18:52.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'33', N'24', N'580', N'5', N'164285', N'2022-11-27 23:17:26.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'34', N'48', N'549', N'7', N'332166', N'2023-03-20 17:22:51.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'35', N'21', N'469', N'4', N'857561', N'2021-05-18 01:48:52.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'36', N'6', N'115', N'7', N'520127', N'2021-06-25 05:44:59.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'37', N'57', N'192', N'8', N'205336', N'2023-04-15 01:34:40.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'38', N'29', N'671', N'8', N'660187', N'2021-03-10 13:06:10.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'39', N'46', N'878', N'10', N'906009', N'2021-01-15 06:27:08.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'40', N'59', N'9', N'5', N'548189', N'2022-03-04 09:48:23.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'41', N'62', N'263', N'1', N'977543', N'2022-07-21 05:31:12.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'42', N'61', N'18', N'9', N'808511', N'2023-04-22 05:44:42.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'43', N'18', N'468', N'8', N'850678', N'2022-06-03 01:20:35.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'44', N'49', N'951', N'3', N'410037', N'2022-07-15 05:45:56.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'45', N'44', N'579', N'4', N'185054', N'2023-07-08 23:11:42.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'46', N'67', N'762', N'8', N'497056', N'2022-09-09 12:00:24.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'47', N'56', N'521', N'8', N'459030', N'2022-06-14 14:10:12.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'48', N'21', N'729', N'6', N'155430', N'2021-06-04 23:25:58.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'49', N'52', N'297', N'6', N'430854', N'2022-09-09 13:18:29.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'50', N'24', N'495', N'1', N'269505', N'2022-07-01 06:57:19.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'51', N'45', N'904', N'10', N'541689', N'2021-10-31 04:30:39.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'52', N'13', N'838', N'7', N'755894', N'2022-05-05 11:18:51.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'53', N'69', N'400', N'2', N'277867', N'2023-03-24 14:05:36.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'54', N'52', N'333', N'8', N'942095', N'2021-06-21 17:02:45.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'55', N'64', N'794', N'1', N'183299', N'2023-01-22 10:15:37.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'56', N'12', N'672', N'4', N'379450', N'2023-06-25 02:36:57.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'57', N'47', N'962', N'2', N'444130', N'2023-04-28 00:08:48.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'58', N'26', N'658', N'1', N'368499', N'2021-11-25 09:31:47.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'59', N'16', N'490', N'5', N'554390', N'2021-03-06 11:16:17.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'60', N'26', N'365', N'5', N'387735', N'2021-05-10 02:28:53.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'61', N'11', N'611', N'10', N'467582', N'2023-07-22 22:37:26.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'62', N'36', N'898', N'3', N'706158', N'2023-07-15 08:32:06.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'63', N'49', N'546', N'6', N'127934', N'2022-12-07 04:53:23.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'64', N'43', N'338', N'10', N'392576', N'2021-10-23 13:27:39.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'65', N'41', N'592', N'3', N'873541', N'2022-08-11 15:23:56.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'66', N'54', N'870', N'9', N'882540', N'2023-01-18 18:53:54.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'67', N'20', N'50', N'9', N'969460', N'2021-05-26 03:18:19.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'68', N'20', N'652', N'8', N'281574', N'2023-06-13 14:14:56.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'69', N'25', N'368', N'9', N'799685', N'2022-11-08 18:48:39.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'70', N'1', N'651', N'9', N'134084', N'2023-09-29 16:30:47.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'71', N'33', N'712', N'9', N'322424', N'2023-02-25 13:03:53.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'72', N'11', N'642', N'6', N'202383', N'2023-06-12 21:41:14.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'73', N'6', N'243', N'5', N'124884', N'2021-12-12 04:43:34.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'74', N'24', N'62', N'4', N'731443', N'2023-04-03 03:30:08.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'75', N'39', N'321', N'6', N'463788', N'2023-10-14 22:50:37.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'76', N'53', N'778', N'3', N'816894', N'2021-05-15 00:24:08.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'77', N'18', N'163', N'8', N'797926', N'2022-04-25 12:49:05.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'78', N'16', N'51', N'6', N'387025', N'2022-12-14 21:46:59.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'79', N'9', N'935', N'6', N'699411', N'2021-06-19 19:58:19.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'80', N'68', N'545', N'3', N'450181', N'2022-09-16 13:52:13.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'81', N'49', N'708', N'5', N'260914', N'2022-02-17 11:42:09.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'82', N'15', N'591', N'1', N'606656', N'2023-10-24 00:06:25.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'83', N'21', N'783', N'4', N'520714', N'2021-11-08 10:29:10.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'84', N'54', N'499', N'6', N'468856', N'2023-03-15 19:39:11.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'85', N'21', N'593', N'8', N'281243', N'2023-07-24 00:44:30.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'86', N'2', N'691', N'6', N'877866', N'2021-10-03 18:53:11.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'87', N'22', N'436', N'5', N'519891', N'2021-11-19 13:25:27.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'88', N'9', N'999', N'6', N'932807', N'2021-04-03 06:33:16.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'89', N'67', N'452', N'6', N'899835', N'2021-11-05 14:36:36.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'90', N'56', N'318', N'9', N'251432', N'2021-02-15 03:14:49.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'91', N'61', N'682', N'3', N'122384', N'2023-04-02 16:26:00.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'92', N'47', N'891', N'10', N'345443', N'2023-05-21 16:48:19.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'93', N'4', N'792', N'7', N'437833', N'2021-05-17 00:46:46.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'94', N'58', N'952', N'2', N'764668', N'2023-03-28 20:24:51.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'95', N'44', N'710', N'5', N'167558', N'2023-07-26 00:47:55.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'96', N'28', N'358', N'7', N'810607', N'2023-03-06 18:14:56.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'97', N'42', N'698', N'9', N'648798', N'2022-03-17 19:19:04.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'98', N'57', N'450', N'3', N'349536', N'2022-04-12 21:10:18.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'99', N'56', N'535', N'7', N'649238', N'2021-07-01 17:03:23.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'100', N'65', N'254', N'4', N'175141', N'2021-10-05 06:10:50.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'101', N'31', N'970', N'9', N'407353', N'2022-01-24 10:40:37.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'102', N'8', N'7', N'7', N'943962', N'2021-03-03 15:24:10.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'103', N'11', N'579', N'8', N'396275', N'2022-03-21 20:57:40.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'104', N'28', N'192', N'9', N'433705', N'2021-12-20 14:22:08.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'105', N'1', N'333', N'2', N'957937', N'2022-08-24 18:51:05.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'106', N'37', N'488', N'6', N'770809', N'2023-04-23 05:31:23.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'107', N'24', N'449', N'3', N'607456', N'2021-09-01 20:54:41.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'108', N'42', N'322', N'2', N'849531', N'2022-03-26 12:16:00.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'109', N'42', N'108', N'7', N'627469', N'2023-03-02 16:00:09.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'110', N'40', N'360', N'2', N'468732', N'2023-11-03 21:30:04.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'111', N'2', N'304', N'5', N'596168', N'2023-07-13 18:46:27.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'112', N'1', N'285', N'10', N'979516', N'2022-01-03 04:52:13.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'113', N'54', N'142', N'5', N'136561', N'2023-01-18 14:14:57.000', N'2')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'114', N'66', N'353', N'7', N'671514', N'2022-10-01 07:05:55.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'115', N'64', N'542', N'9', N'305447', N'2023-11-15 14:37:11.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'116', N'47', N'431', N'6', N'231110', N'2021-09-10 07:37:52.000', N'0')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'117', N'24', N'948', N'3', N'467687', N'2022-05-25 17:39:56.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'118', N'39', N'205', N'2', N'948151', N'2023-09-06 03:40:53.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'119', N'24', N'451', N'5', N'608813', N'2023-06-03 23:43:21.000', N'1')
GO

INSERT INTO [dbo].[HoaDonChiTiet] ([id], [IdHoaDon], [IdSPCT], [SoLuong], [DonGia], [ThoiGian], [TrangThai]) VALUES (N'120', N'43', N'535', N'10', N'686610', N'2023-01-16 07:58:01.000', N'1')
GO

SET IDENTITY_INSERT [dbo].[HoaDonChiTiet] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for KhachHang
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[KhachHang]') AND type IN ('U'))
	DROP TABLE [dbo].[KhachHang]
GO

CREATE TABLE [dbo].[KhachHang] (
  [id] int IDENTITY(1,1) NOT NULL,
  [Ma] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Ten] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [SDT] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [account_id] int default NULL,
  [TrangThai] int DEFAULT 1 NOT NULL
)
GO

ALTER TABLE [dbo].[KhachHang] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of KhachHang
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[KhachHang] ON
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'1', N'LP11935', N'Deng Jialun', N'0966374181', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'2', N'CH49552', N'Fujita Mio', N'0996963664', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'3', N'QC04206', N'Lu Lan', N'0982197557', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'4', N'VA90976', N'Harry Wallace', N'0913808547', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'5', N'DX87555', N'Yuen Wing Fat', N'0976979223', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'6', N'EW69909', N'Yuan Zhiyuan', N'0981655876', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'7', N'SU95005', N'Clara Hicks', N'0908400539', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'8', N'YA19105', N'Xue Zhiyuan', N'0940288561', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'9', N'TN80570', N'Siu Ka Fai', N'0906759300', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'10', N'CS65413', N'Kong Hiu Tung', N'0966080232', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'11', N'IP73020', N'Paula Wright', N'0908459986', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'12', N'VY50531', N'Chung Tak Wah', N'0931314295', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'13', N'YP74544', N'Han Tin Lok', N'0980810496', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'14', N'LP64456', N'Fujiwara Hikaru', N'0976080987', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'15', N'GV87859', N'Murata Daichi', N'0979761190', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'16', N'CL97001', N'Ku Ting Fung', N'0957947528', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'17', N'WK19118', N'Ying Wai Yee', N'0955075551', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'18', N'OV59803', N'Tse Ka Ling', N'0946894468', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'19', N'AR24117', N'Du Anqi', N'0971396293', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'20', N'ZS36062', N'Aoki Hana', N'0908404228', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'21', N'TQ81071', N'Chen Yuning', N'0924279091', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'22', N'AG62568', N'Mao Lu', N'0980440785', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'23', N'AE90140', N'Tse Ting Fung', N'0925065299', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'24', N'GM50811', N'Vincent Martin', N'0910263349', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'25', N'TU59144', N'Morita Tsubasa', N'0921513156', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'26', N'NC84542', N'Yamazaki Nanami', N'0906546499', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'27', N'IZ64630', N'Chung Yun Fat', N'0921214140', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'28', N'TZ70882', N'Jin Zhiyuan', N'0940305921', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'29', N'JI59162', N'Mao Jialun', N'0976571141', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'30', N'RB63174', N'Terry Hayes', N'0948954593', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'31', N'AU82200', N'Louise Wright', N'0959560188', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'32', N'UC38182', N'Janice Tran', N'0950098251', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'33', N'JW23883', N'Dai Sze Yu', N'0917451068', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'34', N'EI43458', N'Francis Jimenez', N'0926866369', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'35', N'AM77603', N'Alexander Dunn', N'0982668719', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'36', N'CY30106', N'Choi Hui Mei', N'0917603227', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'37', N'PL22666', N'Tan Xiaoming', N'0966899661', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'38', N'NQ41402', N'Cynthia Washington', N'0998929403', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'39', N'OB44305', N'Koo Ka Keung', N'0940067663', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'40', N'KU35126', N'James Reed', N'0968038449', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'41', N'VE76953', N'Wu Ho Yin', N'0934544969', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'42', N'PE81460', N'Deng Anqi', N'0993704437', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'43', N'TO35743', N'Kato Momoka', N'0927270964', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'44', N'WQ88520', N'Travis Gomez', N'0959587231', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'45', N'VV14020', N'Miyamoto Yuito', N'0993491557', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'46', N'JE06761', N'Alexander Gordon', N'0991895767', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'47', N'MJ05340', N'Ryan Chavez', N'0906392715', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'48', N'NQ94920', N'Wang Jialun', N'0996744945', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'49', N'ON54841', N'Takahashi Takuya', N'0963940307', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'50', N'ZT87212', N'Koyama Daichi', N'0903271058', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'51', N'CT40934', N'Tao Ka Ling', N'0990837296', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'52', N'BG00361', N'Hao Xiuying', N'0928732191', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'53', N'NG20118', N'Lin Zhennan', N'0972585116', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'54', N'AC08193', N'Carlos Perez', N'0984550052', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'55', N'GW55390', N'Nakamori Miu', N'0969224827', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'56', N'EL01179', N'Fujii Mio', N'0951312660', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'57', N'NS24122', N'Murakami Ayano', N'0996275923', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'58', N'DK84509', N'Chiang Chiu Wai', N'0968812785', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'59', N'TU64701', N'Shibata Shino', N'0982584481', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'60', N'SG40558', N'Barry Chavez', N'0931976518', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'61', N'IO78174', N'Raymond Morales', N'0987249587', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'62', N'YJ33784', N'Yang Jiehong', N'0906250793', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'63', N'UZ37207', N'Guo Rui', N'0901579203', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'64', N'NR21023', N'Arthur Kennedy', N'0971600128', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'65', N'PK40700', N'Pan Lan', N'0954737613', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'66', N'IS65182', N'Arimura Yota', N'0984806580', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'67', N'JL97076', N'Zhao Ziyi', N'0918903668', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'68', N'BT09636', N'Imai Ryota', N'0961023235', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'69', N'WI79980', N'Lau Sze Kwan', N'0930113352', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'70', N'ZP80965', N'Wu Zitao', N'0982178984', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'71', N'TM14539', N'Liao Lik Sun', N'0958334963', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'72', N'TZ60319', N'Chan Wai Lam', N'0936030614', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'73', N'NE43261', N'Chang Sze Yu', N'0919997440', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'74', N'DI53172', N'Iwasaki Yamato', N'0952781088', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'75', N'QM10958', N'Alexander Jenkins', N'0905980101', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'76', N'JR00407', N'Murakami Mitsuki', N'0990393548', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'77', N'KU24334', N'Xiao Jiehong', N'0942032500', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'78', N'VW63241', N'Ito Kasumi', N'0962932873', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'79', N'TN83974', N'Wong Chi Ming', N'0956212442', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'80', N'JQ09341', N'Ren Zhiyuan', N'0940023025', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'81', N'EY73351', N'Saito Shino', N'0936614616', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'82', N'EO64355', N'Shing Kwok Yin', N'0949173526', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'83', N'MJ19226', N'Tao Yuning', N'0958400891', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'84', N'KK88386', N'Zhu Xiuying', N'0909850444', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'85', N'JZ56172', N'Sean Cole', N'0961232402', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'86', N'VK88081', N'Sugawara Riku', N'0960961369', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'87', N'BX78750', N'Xiao Xiaoming', N'0949676443', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'88', N'MA80944', N'Long Zitao', N'0983612340', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'89', N'VQ73086', N'Chin On Kay', N'0988267933', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'90', N'TK33334', N'Juan Nelson', N'0985271855', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'91', N'UK31996', N'Yuen Ka Man', N'0956915896', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'92', N'DY41283', N'Sasaki Hana', N'0914195190', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'93', N'CY31001', N'Zeng Jiehong', N'0994911370', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'94', N'KH63135', N'Xu Lu', N'0949225895', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'95', N'IG29426', N'Watanabe Ayano', N'0981953033', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'96', N'VW42544', N'Duan Shihan', N'0987732311', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'97', N'AW65010', N'Curtis Hunter', N'0918429162', default, N'1')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'98', N'WA52570', N'Watanabe Yota', N'0990080622', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'99', N'OV07945', N'Ishikawa Momoe', N'0962840110', default, N'0')
GO

INSERT INTO [dbo].[KhachHang] ([id], [Ma], [Ten], [SDT], [account_id], [TrangThai]) VALUES (N'100', N'GN89300', N'Johnny Bell', N'0907858952', default, N'1')
GO

SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for KichThuoc
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[KichThuoc]') AND type IN ('U'))
	DROP TABLE [dbo].[KichThuoc]
GO

CREATE TABLE [dbo].[KichThuoc] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [Ma] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Ten] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [TrangThai] int DEFAULT 1 NOT NULL
)
GO

ALTER TABLE [dbo].[KichThuoc] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of KichThuoc
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[KichThuoc] ON
GO

INSERT INTO [dbo].[KichThuoc] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'1', N'JQY121', N'L', N'0')
GO

INSERT INTO [dbo].[KichThuoc] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'2', N'QMN828', N'S', N'0')
GO

INSERT INTO [dbo].[KichThuoc] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'3', N'YWC986', N'XS', N'1')
GO

INSERT INTO [dbo].[KichThuoc] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'4', N'DTN039', N'XL', N'1')
GO

INSERT INTO [dbo].[KichThuoc] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'5', N'BZD546', N'S', N'1')
GO

INSERT INTO [dbo].[KichThuoc] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'6', N'KSD519', N'XXL', N'0')
GO

INSERT INTO [dbo].[KichThuoc] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'7', N'LLD460', N'L', N'1')
GO

INSERT INTO [dbo].[KichThuoc] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'8', N'NER442', N'XL', N'1')
GO

INSERT INTO [dbo].[KichThuoc] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'9', N'FKV503', N'L', N'1')
GO

INSERT INTO [dbo].[KichThuoc] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'10', N'UEE313', N'XS', N'1')
GO

SET IDENTITY_INSERT [dbo].[KichThuoc] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for MauSac
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[MauSac]') AND type IN ('U'))
	DROP TABLE [dbo].[MauSac]
GO

CREATE TABLE [dbo].[MauSac] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [Ma] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Ten] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [TrangThai] int DEFAULT 1 NOT NULL
)
GO

ALTER TABLE [dbo].[MauSac] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of MauSac
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[MauSac] ON
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'1', N'FSI478', N'Gray', N'1')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'2', N'BBY357', N'Salmon', N'1')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'3', N'VOX834', N'Silver', N'1')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'4', N'YER731', N'Gold', N'0')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'5', N'GDO788', N'Peach', N'0')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'6', N'JJY732', N'Brown', N'0')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'7', N'RFB197', N'Bronze', N'0')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'8', N'WGA839', N'Indian Red', N'1')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'9', N'GIY629', N'Dim Gray', N'1')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'10', N'UCT704', N'Bronze', N'0')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'11', N'NNB306', N'Bronze', N'0')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'12', N'FOQ262', N'Bronze', N'0')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'13', N'KJU407', N'Lime', N'1')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'14', N'AXW557', N'Snow', N'1')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'15', N'YRY112', N'Lime', N'0')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'16', N'ZWZ082', N'Dark Red', N'1')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'17', N'DVX961', N'Silver', N'1')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'18', N'JWC427', N'Olive', N'0')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'19', N'ANV718', N'Jasmine', N'0')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'20', N'XVJ152', N'Dark Red', N'1')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'21', N'ZPY776', N'Lime', N'1')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'22', N'OOG949', N'Light Gray', N'0')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'23', N'AQR063', N'Indian Red', N'1')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'24', N'KCZ790', N'Gold', N'1')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'25', N'KBG381', N'Mustard', N'0')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'26', N'CVG385', N'Tangerine', N'0')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'27', N'OMB256', N'Khaki', N'1')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'28', N'DJO751', N'Brown', N'0')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'29', N'SYB201', N'Apricot', N'1')
GO

INSERT INTO [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'30', N'ROK057', N'Silver', N'0')
GO

SET IDENTITY_INSERT [dbo].[MauSac] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for NhanVien
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[NhanVien]') AND type IN ('U'))
	DROP TABLE [dbo].[NhanVien]
GO

CREATE TABLE [dbo].[NhanVien] (
  [id] int IDENTITY(1,1) NOT NULL,
  [Ten] varchar(255) NOT NULL,
  [Ma] varchar(255) NOT NULL,
  [Email] varchar(255) NOT NULL,
  [account_id] int default NULL,
  [TrangThai] int DEFAULT 1 NOT NULL
)
GO

ALTER TABLE [dbo].[NhanVien] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of NhanVien
-- ----------------------------



INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES (N'Admin', N'AD00000', N'admin@gmail.com', 1, 0);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES (N'Jesse Hayes', N'YD22074', N'hayes7@gmail.com', 1, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES (N'Lo Hok Yau', N'NF76341', N'hokyaulo11@outlook.com', 1, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES (N'Fujita Itsuki', N'JH54876', N'fuji@gmail.com', 0, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES (N'Fujita Momoe', N'PD56863', N'fumomoe@yahoo.com', 1, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES (N'Wu Anqi', N'WU13215', N'wu1111@gmail.com', 1, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES (N'Samuel Cole', N'SC77371', N'samcole8@gmail.com', 1, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES (N'Edith Warren', N'XU66033', N'warren503@mail.com', 1, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES (N'Liao Ling Ling', N'NF50735', N'liaoll727@gmail.com', 1, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES (N'Deng Ziyi', N'JS96955', N'dziy6@icloud.com', 1, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES ( N'Saito Misaki', N'HX18057', N'misaksait1@gmail.com', 1, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES ( N'Suzuki Kazuma', N'WU70995', N'ksuzuki1943@gmail.com', 0, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES ( N'Wong Kar Yan', N'IZ27862', N'kywong@gmail.com', 1, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES ( N'Yamaguchi Daisuke', N'CJ42441', N'daiyama@gmail.com', 1, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES ( N'Elaine Perry', N'VE23388', N'elainperry72@mail.com', 1, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES ( N'Hui Ho Yin', N'AV38414', N'huihy@gmail.com', 1, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES ( N'Sasaki Ayato', N'HF92907', N'ayatsasaki@yahoo.com', 0, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES ( N'Tian Xiuying', N'SV12636', N'xiuyit@gmail.com', 0, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES ( N'Fujita Hikaru', N'BQ93674', N'hikarufujita2@icloud.com', 1, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES ( N'Clifford Hernandez', N'JD64356', N'clifford110@icloud.com', 0, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES ( N'Yamamoto Sakura', N'ZO12383', N'saky8@hotmail.com', 1, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES ( N'Ho Sau Man', N'XT45818', N'hosauman@mail.com', 1, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES ( N'Song Shihan', N'EK31409', N'song04@gmail.com', 1, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES ( N'Elizabeth Castro', N'BC22752', N'elizabethcastro1018@outlook.com', 0, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES ( N'Yip Wing Fat', N'QA64414', N'wfy617@gmail.com', 0, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES ( N'Dai Chiu Wai', N'PE16338', N'daicw@icloud.com', 0, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES ( N'Wada Itsuki', N'WH15821', N'wadait@gmail.com', 1, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES ( N'Eugene Williams', N'MG01566', N'euw@gmail.com', 1, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES ( N'Zhou Lu', N'MV11405', N'zhou422@gmail.com', 1, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES ( N'Jiang Zhennan', N'RF87965', N'jiangzh@icloud.com', 1, 1);
INSERT INTO [dbo].[NhanVien] (Ten, Ma, Email, TrangThai, [account_id]) VALUES ( N'Guo Zhennan', N'QX31356', N'guzhennan@mail.com', 0, 1);

-- ----------------------------
-- Table structure for SanPham
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[SanPham]') AND type IN ('U'))
	DROP TABLE [dbo].[SanPham]
GO

CREATE TABLE [dbo].[SanPham] (
  [id] int IDENTITY(1,1) NOT NULL,
  [Ma] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Ten] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [TrangThai] int DEFAULT 1 NOT NULL
)
GO

ALTER TABLE [dbo].[SanPham] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of SanPham
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[SanPham] ON
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'1', N'KCQIO4UP6Z', N'Kiwi', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'2', N'ICO81ULZEX', N'Raspderry', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'3', N'BZRYMA70WX', N'Grape', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'4', N'JM1WBG77FG', N'Cherry', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'5', N'LL1C8CIRK4', N'Masgo se', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'6', N'44BUFIS8Z4', N'Rambuhan air', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'7', N'J7DVY30WOK', N'Cherey', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'8', N'12SFE6M4IR', N'cherry', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'9', N'BLEI5HYWNA', N'Raspberry pro', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'10', N'GOU1D362C4', N'Strawberry air', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'11', N'C9BRN9U4Z7', N'Raspbemry premium', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'12', N'ABUHDH7ULW', N'xApple', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'13', N'47EPIWCZIU', N'uherry', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'14', N'B1T3ZKXH0J', N'Rambutan', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'15', N'Z10718B621', N'Mafgo se', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'16', N'OATE2IWS8F', N'siwi air', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'17', N'QN9QWLK55E', N'Apple', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'18', N'0A748RK3AA', N'Orarge', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'19', N'QSEP2EEBQO', N'Pluots core', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'20', N'1XJ00KQKM3', N'Rasyberry', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'21', N'LL2KF68HUE', N'Pluots plus', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'22', N'CSKE0WP249', N'Apple', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'23', N'RCSA1IUO72', N'Cherry', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'24', N'PHU7JQF368', N'Cherry', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'25', N'SKUVYPEHMI', N'Rambutan', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'26', N'3TC59B7MU3', N'Cherry', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'27', N'HRSKZMVI9R', N'Strawberry', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'28', N'TTHRLNH8AR', N'Orange', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'29', N'2X0UO3GPBT', N'Pluats mini', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'30', N'3RC6Y624AU', N'Ajple', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'31', N'8V5DBFK27D', N'Pluots', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'32', N'9YXHLXM5YO', N'Strawberry', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'33', N'NOTN8DBMN5', N'Strawberry core', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'34', N'R9H2KDHU8A', N'wluots', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'35', N'KECDXRSHMG', N'hango', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'36', N'I3RP06Q481', N'hluots', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'37', N'ZBRKYPKX4F', N'Pluots', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'38', N'79FP0GS9JB', N'Mango', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'39', N'WIRWO6S63N', N'tango', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'40', N'YKP636XCYU', N'Oraoge', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'41', N'5B2CRK8QB5', N'Rambutan plus', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'42', N'YNKF3P9KDS', N'Raspberry', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'43', N'WNY75EGX30', N'Kiwi elite', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'44', N'P4LUDUZKPJ', N'Apple premium', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'45', N'MSW9PMA5AC', N'Ramvutan premium', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'46', N'3PNBWKAZZM', N'Mingo', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'47', N'0QYO1NT6OS', N'Stragberry', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'48', N'L4O4BKSA3N', N'ttrawberry pro', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'49', N'YLU5JGRNZK', N'Apple', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'50', N'DLHIQ2ZOQG', N'xApple', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'51', N'4NPN0DXAW7', N'Rambuxan', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'52', N'BZE0EOP7VP', N'Apple', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'53', N'5RHQCMEG31', N'Kiwi pi', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'54', N'TTR9PTMWPJ', N'Rambutan', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'55', N'T3QDUIPOU3', N'Rambutan', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'56', N'8CD4CVITH9', N'xApple', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'57', N'O59STP6XGA', N'Appge', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'58', N'AF07GO6QMS', N'Strawmerry air', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'59', N'1YHWSIAAD0', N'Rqspberry pi', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'60', N'H6MLVAYU5J', N'Msngo', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'61', N'52V8AJX1W1', N'Kiwi', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'62', N'GUPMAE4VV9', N'ultra-Grape', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'63', N'8PR74V1TO0', N'cango', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'64', N'MBH1RFQYN7', N'ittrawberry', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'65', N'TFAQ2H6AAG', N'Raspbehry mini', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'66', N'KS77ZUUO95', N'Kowi pro', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'67', N'70BI1US2VR', N'Chfrry', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'68', N'05G85E6SPR', N'Kiwi', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'69', N'AZO3RHBMCH', N'omni-Chzrry', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'70', N'0P991Z5DOQ', N'Kiwi', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'71', N'X0T7T44OBJ', N'ytrawberry', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'72', N'B00I8AGP04', N'zrange', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'73', N'PNUX8Q57N3', N'aango', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'74', N'GOSN42BXMS', N'Kifi', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'75', N'ZATTIGFVCP', N'Rambutan core', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'76', N'J5Q9USMUDE', N'Orange', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'77', N'FU88KF8GAW', N'iRaspberry', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'78', N'3VFRI8P5GN', N'Grace core', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'79', N'M3U45C5LU1', N'Grape pi', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'80', N'U8GV66Q6AS', N'fherry', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'81', N'JP1SRU84SC', N'Kiwi', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'82', N'WPXF73YE06', N'Orange', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'83', N'510U3OB3EW', N'Psuots', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'84', N'DPD0P34JFW', N'Cherry', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'85', N'TISCVS5XW3', N'Raspberry', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'86', N'SE7K0666WW', N'Apple pro', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'87', N'3R48V8A6CN', N'ultra-Mango', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'88', N'845STX1P9J', N'Stracberry', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'89', N'78VWLGVHV7', N'Apple', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'90', N'TLX7ECIU3V', N'Cherry', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'91', N'OKPOO9SEFK', N'ambi-Pluots', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'92', N'NYBDHXHYW7', N'Maneo', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'93', N'I7LQQ1T6ND', N'xambutan', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'94', N'U8ZEU8IRUT', N'Rrmbutan se', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'95', N'NU3AUQWW1S', N'Mango se', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'96', N'IJVK2TNTAE', N'Kiwi', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'97', N'EL9D9H58AB', N'arape core', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'98', N'E6MBZYG2I2', N'Apple', N'0')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'99', N'2P5VSTPKSD', N'rango mini', N'1')
GO

INSERT INTO [dbo].[SanPham] ([id], [Ma], [Ten], [TrangThai]) VALUES (N'100', N'L6XRI9QLR4', N'Strawberry elite', N'0')
GO

SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for SanPhamChiTiet
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[SanPhamChiTiet]') AND type IN ('U'))
	DROP TABLE [dbo].[SanPhamChiTiet]
GO

CREATE TABLE [dbo].[SanPhamChiTiet] (
  [id] int IDENTITY(1,1) NOT NULL,
  [IdMauSac] int,
  [IdKichThuoc] int,
  [IdSanPham] int  NOT NULL,
  [MaSPCT] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [SoLuong] int DEFAULT 0 NOT NULL,
  [DonGia] float(53) DEFAULT 0 NOT NULL,
  [TrangThai] int DEFAULT 1 NOT NULL
)
GO

ALTER TABLE [dbo].[SanPhamChiTiet] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of SanPhamChiTiet
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[SanPhamChiTiet] ON
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'1', N'16', N'4', N'35', N'EC3AY4GOZH', N'57', N'597555', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'2', N'10', N'2', N'99', N'158Q34I2WW', N'89', N'693015', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'3', N'8', N'2', N'59', N'OPMV0W67U8', N'62', N'893106', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'4', N'2', N'3', N'74', N'FE0KQPL3SY', N'1', N'691600', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'5', N'2', N'2', N'96', N'TT53JXGB8D', N'38', N'481911', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'6', N'29', N'4', N'93', N'IF3Q6VE8NZ', N'51', N'128253', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'7', N'26', N'1', N'72', N'ZO2RBXV29V', N'76', N'391888', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'8', N'17', N'10', N'32', N'97J36K9ONU', N'83', N'207814', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'9', N'22', N'6', N'31', N'Y1RTGE2384', N'61', N'677151', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'10', N'26', N'10', N'87', N'47TJYQTLWN', N'61', N'354542', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'11', N'11', N'9', N'97', N'P3C4OZGG48', N'43', N'917618', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'12', N'2', N'10', N'86', N'DDPVMCF44Q', N'63', N'983512', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'13', N'28', N'5', N'98', N'BBT4TVJCXM', N'64', N'360676', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'14', N'6', N'3', N'55', N'KKH21GEO5Q', N'66', N'291170', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'15', N'5', N'9', N'29', N'4LV39K8FG4', N'48', N'528132', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'16', N'13', N'1', N'94', N'J36RY3LYS7', N'54', N'264755', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'17', N'9', N'6', N'12', N'HPDYQHA1P9', N'24', N'789348', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'18', N'12', N'5', N'31', N'E8ZP8IX70E', N'19', N'609219', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'19', N'11', N'9', N'43', N'ECOB0RYR3W', N'83', N'615787', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'20', N'20', N'7', N'3', N'0ZBADVFMRI', N'52', N'672629', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'21', N'11', N'3', N'74', N'OPL9FVZBGC', N'49', N'346602', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'22', N'10', N'10', N'7', N'MESMEM3NY0', N'69', N'969409', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'23', N'1', N'10', N'53', N'DV0PB9QM2T', N'77', N'456458', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'24', N'8', N'4', N'73', N'C979AZTKL2', N'5', N'121916', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'25', N'30', N'10', N'81', N'J5FT0RVSRD', N'73', N'163512', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'26', N'5', N'9', N'1', N'TZQIZNVS1I', N'24', N'792112', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'27', N'15', N'1', N'29', N'QPS6L56NRO', N'52', N'956696', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'28', N'26', N'3', N'8', N'82GD43RW3J', N'90', N'998168', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'29', N'27', N'9', N'38', N'HGHKIHYYS4', N'57', N'637568', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'30', N'2', N'7', N'14', N'XOYXHNL63U', N'46', N'785495', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'31', N'2', N'7', N'8', N'7LZVGUPD7O', N'86', N'445415', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'32', N'20', N'9', N'40', N'TUWTDWNLDS', N'20', N'422180', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'33', N'27', N'1', N'55', N'MXMRE4XY4W', N'79', N'861720', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'34', N'7', N'6', N'6', N'KS5BX22O3Q', N'89', N'880352', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'35', N'17', N'4', N'74', N'10WP4OK3QL', N'75', N'773299', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'36', N'5', N'2', N'41', N'VF83O6FYF8', N'76', N'447752', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'37', N'13', N'9', N'3', N'30KR9C4KTB', N'99', N'832013', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'38', N'6', N'1', N'41', N'JL13C6OHQW', N'28', N'675331', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'39', N'23', N'3', N'64', N'6PRXYOLY8I', N'2', N'695789', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'40', N'1', N'1', N'67', N'I8DVMQJAHP', N'89', N'416582', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'41', N'7', N'4', N'49', N'K0UJHR9JLL', N'68', N'648691', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'42', N'7', N'2', N'70', N'9F3EDC3X9V', N'31', N'996697', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'43', N'11', N'9', N'68', N'CA7J5YUZ21', N'90', N'514212', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'44', N'28', N'9', N'81', N'9VFGDKGL1J', N'34', N'694704', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'45', N'29', N'3', N'73', N'J6JBP9ZPAD', N'100', N'607629', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'46', N'30', N'5', N'32', N'8BCVSXYOE9', N'97', N'152974', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'47', N'7', N'7', N'10', N'BUAYS3K16C', N'6', N'192093', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'48', N'11', N'1', N'73', N'C47C28IJ24', N'50', N'745390', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'49', N'17', N'2', N'94', N'D2TOOB333O', N'14', N'803553', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'50', N'12', N'1', N'75', N'FHEP1ILGQU', N'43', N'808302', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'51', N'2', N'1', N'91', N'ZH67ZOZQN3', N'36', N'641860', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'52', N'5', N'7', N'43', N'SZBQOEIFWA', N'9', N'457123', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'53', N'17', N'9', N'57', N'B8WDBDQ1BQ', N'61', N'408545', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'54', N'23', N'8', N'80', N'OVA45255YI', N'64', N'664174', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'55', N'5', N'4', N'85', N'ETX2YQHW1N', N'29', N'458588', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'56', N'1', N'9', N'68', N'NKS57HJ3QY', N'89', N'899997', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'57', N'12', N'6', N'5', N'IN96WJGDQK', N'11', N'202833', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'58', N'15', N'4', N'68', N'ZZQICUDDNR', N'96', N'297901', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'59', N'8', N'3', N'60', N'FC78EMT7YC', N'90', N'709703', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'60', N'1', N'3', N'76', N'CIKBXF1KO1', N'10', N'634434', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'61', N'18', N'4', N'59', N'FG3H7EKDAD', N'54', N'817301', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'62', N'26', N'1', N'57', N'V4CMCPSDHP', N'59', N'121753', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'63', N'28', N'7', N'52', N'9SQZIW5XV8', N'85', N'758658', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'64', N'23', N'1', N'24', N'Q8IEI8B3FZ', N'85', N'598577', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'65', N'16', N'9', N'16', N'BE70N275XR', N'50', N'318789', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'66', N'19', N'2', N'40', N'OE6H0HR0UZ', N'10', N'146671', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'67', N'9', N'2', N'17', N'O38S20DM2E', N'68', N'543501', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'68', N'25', N'2', N'20', N'XE14070U88', N'48', N'790234', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'69', N'12', N'2', N'50', N'8R0KPHGZUA', N'2', N'751341', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'70', N'22', N'3', N'32', N'904U8XRKIP', N'99', N'512950', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'71', N'20', N'10', N'17', N'2LI462FGO5', N'63', N'457776', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'72', N'14', N'8', N'94', N'JDBKZRVCGT', N'52', N'578455', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'73', N'17', N'5', N'33', N'FVMP6TRLQ8', N'70', N'769653', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'74', N'19', N'3', N'88', N'ZWDRHQJXD9', N'92', N'699158', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'75', N'15', N'7', N'26', N'XLJPLZQ45P', N'44', N'102137', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'76', N'10', N'8', N'43', N'UN007OP955', N'87', N'907664', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'77', N'13', N'3', N'38', N'XGLWMJHVVM', N'48', N'758978', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'78', N'24', N'4', N'78', N'KOZE1S4VLD', N'100', N'925729', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'79', N'29', N'1', N'89', N'MXOSRH6DMF', N'82', N'193733', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'80', N'25', N'10', N'51', N'4BHQO1DWM6', N'69', N'594488', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'81', N'3', N'7', N'44', N'123HYJOD43', N'82', N'254082', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'82', N'10', N'8', N'34', N'FYETHW16VB', N'77', N'892922', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'83', N'21', N'2', N'78', N'U26MFXP7YV', N'66', N'614958', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'84', N'3', N'7', N'94', N'EYL4DV9JKN', N'30', N'671345', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'85', N'29', N'9', N'47', N'3GBC9KLCLG', N'89', N'358152', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'86', N'1', N'3', N'36', N'KFQRHWSN2O', N'59', N'144790', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'87', N'29', N'5', N'41', N'B8PLISSNZR', N'84', N'212243', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'88', N'19', N'4', N'51', N'WNZO72FHM7', N'41', N'398561', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'89', N'15', N'1', N'94', N'0CP9T8GEV9', N'56', N'493427', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'90', N'7', N'9', N'98', N'YXHLI6HXGK', N'34', N'816766', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'91', N'27', N'3', N'80', N'UO4FDUF5Y9', N'76', N'192169', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'92', N'15', N'6', N'49', N'4H8TOW59QN', N'54', N'554639', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'93', N'10', N'8', N'25', N'36ZTZL9SCF', N'65', N'653940', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'94', N'16', N'9', N'88', N'FH1P3SOQGL', N'95', N'314624', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'95', N'27', N'4', N'43', N'T04SADUGCC', N'73', N'685145', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'96', N'12', N'2', N'93', N'C3M612NAPE', N'38', N'521041', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'97', N'26', N'5', N'83', N'8VR4FHK318', N'62', N'903098', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'98', N'9', N'4', N'59', N'UEB5CKE0NU', N'79', N'943029', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'99', N'24', N'1', N'25', N'YT0G9TFRYB', N'35', N'746399', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'100', N'28', N'7', N'36', N'YPHYBBI0VC', N'26', N'226997', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'101', N'19', N'10', N'21', N'NB4UYZ991H', N'93', N'936504', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'102', N'28', N'7', N'16', N'EGSLUY3T1E', N'68', N'636730', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'103', N'4', N'1', N'37', N'11B35Y1TX5', N'77', N'283712', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'104', N'20', N'7', N'16', N'XDVEXVM4ZQ', N'38', N'877319', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'105', N'4', N'9', N'48', N'958BBX6KG6', N'1', N'137109', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'106', N'17', N'7', N'85', N'QTXKW0XVDD', N'87', N'883074', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'107', N'20', N'9', N'63', N'4MXR171S3M', N'4', N'432790', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'108', N'3', N'5', N'29', N'9WPKH4UHEP', N'63', N'241260', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'109', N'7', N'5', N'31', N'UM3LPWOF05', N'11', N'481366', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'110', N'10', N'9', N'74', N'3DTUSR18O8', N'12', N'222274', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'111', N'17', N'6', N'69', N'DUYA7WXTWL', N'23', N'777988', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'112', N'3', N'1', N'77', N'9VLIID6UFD', N'88', N'337698', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'113', N'29', N'7', N'65', N'YZRZRACHBP', N'65', N'116257', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'114', N'4', N'3', N'62', N'4K5OC219PT', N'52', N'336329', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'115', N'2', N'8', N'46', N'K11CQSGBAX', N'23', N'176076', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'116', N'29', N'1', N'24', N'FGZW26V2KN', N'8', N'258807', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'117', N'4', N'7', N'42', N'1WS0UBLCKR', N'91', N'472387', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'118', N'30', N'2', N'45', N'2ANSR7I9H5', N'58', N'605814', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'119', N'14', N'5', N'43', N'BRIS4GEFSF', N'62', N'957516', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'120', N'29', N'9', N'45', N'G8DGJR2MDC', N'62', N'272053', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'121', N'15', N'7', N'54', N'6BWPGZ78ZO', N'16', N'330904', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'122', N'17', N'1', N'46', N'HK8URHVG0F', N'48', N'807649', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'123', N'1', N'2', N'4', N'IQYW3XPIGS', N'39', N'507421', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'124', N'17', N'4', N'85', N'Q9SYIHYB7C', N'32', N'722680', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'125', N'17', N'4', N'61', N'JV2KRUNLED', N'11', N'221017', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'126', N'28', N'10', N'19', N'32Q4337WQH', N'95', N'347920', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'127', N'30', N'3', N'44', N'1W9EBYJ42B', N'100', N'807432', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'128', N'25', N'1', N'53', N'8VHR3OMESK', N'64', N'171660', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'129', N'11', N'1', N'6', N'5760ZMN24T', N'45', N'231549', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'130', N'16', N'7', N'66', N'XTCH0MHLCA', N'9', N'835914', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'131', N'27', N'1', N'61', N'HFPLQ3AYDM', N'15', N'576022', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'132', N'7', N'7', N'1', N'ULNHOUP7EY', N'74', N'583652', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'133', N'11', N'1', N'39', N'6LEBQJ758S', N'33', N'994689', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'134', N'25', N'9', N'53', N'UMZ69O1G2R', N'93', N'474864', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'135', N'24', N'2', N'30', N'YKFVRYW984', N'54', N'569896', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'136', N'26', N'3', N'74', N'SD487K8TMS', N'73', N'452490', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'137', N'27', N'4', N'24', N'C0BFG2CPM1', N'61', N'661456', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'138', N'16', N'7', N'67', N'YS99MSSKP4', N'96', N'328173', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'139', N'19', N'3', N'45', N'7PE8V0IGEG', N'78', N'814777', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'140', N'6', N'10', N'79', N'8FR5D7VS1Q', N'37', N'292940', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'141', N'11', N'8', N'16', N'MEMGYZE07P', N'72', N'931223', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'142', N'20', N'4', N'92', N'GT0I0V3IQ5', N'66', N'158503', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'143', N'19', N'6', N'56', N'RF1TQYBTLA', N'96', N'122251', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'144', N'5', N'1', N'36', N'JM3OOWKPEL', N'62', N'884610', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'145', N'1', N'9', N'22', N'1UJOKEXIH3', N'32', N'101540', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'146', N'15', N'1', N'16', N'F0YYQ89XEV', N'25', N'369856', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'147', N'17', N'4', N'23', N'JBAVYUA3NF', N'91', N'130517', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'148', N'17', N'8', N'72', N'Z0ZJ8SYGBE', N'66', N'272999', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'149', N'9', N'9', N'39', N'ATB11X5BRE', N'33', N'657453', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'150', N'23', N'5', N'41', N'WTFRT6FF3X', N'16', N'869183', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'151', N'12', N'1', N'1', N'1QQA1T7CFK', N'34', N'487002', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'152', N'11', N'2', N'23', N'YP5AB32744', N'43', N'699578', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'153', N'28', N'6', N'53', N'12C2K530SW', N'5', N'163292', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'154', N'13', N'4', N'62', N'622IKDDORM', N'63', N'716053', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'155', N'16', N'2', N'36', N'E0CM9ZDRUV', N'21', N'141633', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'156', N'7', N'5', N'30', N'1M7WBKVP3V', N'80', N'153866', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'157', N'29', N'6', N'43', N'Y346KR1DYU', N'26', N'616003', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'158', N'28', N'6', N'25', N'AWNSK2IOVU', N'42', N'298366', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'159', N'29', N'6', N'26', N'VJIJCDVW3A', N'27', N'897878', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'160', N'9', N'7', N'61', N'REKD82VRJ8', N'91', N'236708', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'161', N'18', N'1', N'44', N'6YRHR8R0XK', N'21', N'792291', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'162', N'2', N'7', N'96', N'TUL04KZ02O', N'37', N'953970', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'163', N'14', N'3', N'68', N'HXI2TH09Z6', N'10', N'766281', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'164', N'9', N'1', N'66', N'IWCBN9KILH', N'18', N'997010', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'165', N'25', N'3', N'64', N'QAUJEVJ6G9', N'76', N'237611', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'166', N'19', N'3', N'71', N'O7V1ZU66CQ', N'1', N'624656', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'167', N'21', N'6', N'28', N'MHXWYPC2C4', N'33', N'373102', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'168', N'24', N'1', N'44', N'E35R48V18U', N'59', N'240350', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'169', N'15', N'6', N'49', N'ZH6BI0ASN8', N'54', N'505831', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'170', N'29', N'9', N'91', N'V68OKOFM29', N'32', N'193486', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'171', N'7', N'1', N'38', N'HN6T1CADS3', N'85', N'186993', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'172', N'10', N'9', N'31', N'L2BOCUR8NP', N'92', N'246046', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'173', N'28', N'3', N'59', N'MIVLB0YX8F', N'59', N'548522', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'174', N'1', N'3', N'63', N'4TIKWQ7J5I', N'53', N'428796', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'175', N'10', N'2', N'69', N'0OOXE6ZYSO', N'91', N'222355', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'176', N'17', N'4', N'49', N'4ZXSYSMOL2', N'63', N'238767', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'177', N'21', N'8', N'68', N'P45HH2JFF9', N'40', N'533559', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'178', N'2', N'4', N'93', N'344WO52X0H', N'65', N'414813', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'179', N'22', N'1', N'12', N'EDBYPHUV9L', N'67', N'369217', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'180', N'17', N'1', N'43', N'8UQS8G2RBB', N'29', N'702899', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'181', N'1', N'6', N'79', N'P173SHDKA4', N'47', N'683095', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'182', N'15', N'4', N'14', N'SKS740GVH9', N'72', N'701667', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'183', N'19', N'7', N'46', N'DZGZJ60U6S', N'92', N'511630', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'184', N'20', N'8', N'22', N'9V98S5V7TD', N'48', N'674656', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'185', N'26', N'8', N'85', N'Y1PKI4PDNG', N'61', N'851169', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'186', N'19', N'9', N'43', N'RQY8UZ37PT', N'50', N'557867', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'187', N'14', N'4', N'25', N'NC4IFE4VWM', N'9', N'229858', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'188', N'21', N'10', N'10', N'X4CO0UGJGX', N'100', N'130269', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'189', N'30', N'6', N'10', N'IB0RGN169W', N'51', N'306032', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'190', N'17', N'1', N'6', N'HLVVXEPQQ9', N'42', N'943048', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'191', N'30', N'2', N'8', N'U9GF7VB62R', N'17', N'450242', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'192', N'10', N'1', N'44', N'T4XH4M2U2C', N'35', N'929900', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'193', N'29', N'10', N'47', N'DZFMVA6BQO', N'66', N'808087', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'194', N'15', N'1', N'21', N'ECKV5DE9P2', N'87', N'359410', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'195', N'15', N'8', N'70', N'NLXYWSAJBA', N'35', N'731642', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'196', N'1', N'2', N'87', N'CWKNWNX2SI', N'47', N'957692', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'197', N'17', N'9', N'85', N'1PIN86ZRJH', N'69', N'158699', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'198', N'28', N'9', N'68', N'0FC5IKEHSP', N'38', N'856106', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'199', N'20', N'3', N'51', N'6QCXMBTSX8', N'58', N'749172', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'200', N'12', N'8', N'67', N'YOHU09UBNL', N'32', N'748005', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'201', N'29', N'5', N'84', N'95973DICEQ', N'15', N'511159', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'202', N'23', N'2', N'91', N'BIMCOZQ1JS', N'66', N'283930', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'203', N'22', N'9', N'54', N'K30OGBHSE7', N'81', N'496719', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'204', N'30', N'9', N'15', N'VJNAZRHUVA', N'2', N'930034', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'205', N'23', N'8', N'54', N'19IJGQ9222', N'45', N'198960', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'206', N'3', N'2', N'17', N'QFU61LVUEI', N'4', N'740186', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'207', N'22', N'7', N'83', N'61NLI0VXQF', N'18', N'422213', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'208', N'3', N'1', N'94', N'RAXU82KQGB', N'81', N'166473', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'209', N'6', N'2', N'20', N'DKK05JBO9C', N'74', N'895734', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'210', N'12', N'10', N'95', N'NEB7Y75HER', N'10', N'948720', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'211', N'16', N'7', N'43', N'GEHCCFFAHR', N'73', N'391717', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'212', N'26', N'1', N'58', N'GPHNQ0YOKZ', N'47', N'808997', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'213', N'24', N'1', N'67', N'AFC93U72P6', N'8', N'839779', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'214', N'9', N'3', N'29', N'ZERGRD7V33', N'9', N'174826', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'215', N'8', N'6', N'15', N'NN0JDQQYIO', N'5', N'392461', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'216', N'23', N'2', N'89', N'AZU4R0OESF', N'31', N'963815', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'217', N'14', N'9', N'86', N'313CTACQ88', N'66', N'993141', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'218', N'10', N'6', N'7', N'KFXP9BQHF0', N'1', N'645422', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'219', N'22', N'2', N'69', N'DG2JS2H7CV', N'56', N'884977', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'220', N'21', N'1', N'73', N'O0J3914A34', N'4', N'646594', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'221', N'17', N'2', N'89', N'9TJG8D8OVG', N'3', N'538193', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'222', N'19', N'7', N'89', N'QK5F26SFX0', N'37', N'979146', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'223', N'21', N'3', N'47', N'GNF87G0M8W', N'88', N'318388', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'224', N'8', N'5', N'89', N'FUTIFOPTRN', N'95', N'730340', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'225', N'9', N'4', N'93', N'KB3O1MMFCG', N'49', N'348424', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'226', N'27', N'4', N'91', N'A36W77SIIR', N'73', N'728285', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'227', N'25', N'3', N'69', N'CYFSLT36LK', N'57', N'477736', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'228', N'17', N'5', N'27', N'VC39MR855J', N'9', N'615734', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'229', N'11', N'4', N'44', N'CJTIVHMWE1', N'3', N'909748', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'230', N'9', N'2', N'17', N'9Y23QSA64T', N'53', N'493360', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'231', N'24', N'1', N'10', N'06AJSH0PFG', N'98', N'638055', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'232', N'26', N'2', N'63', N'9QBY6NDJ0U', N'5', N'303829', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'233', N'16', N'9', N'2', N'ZLAZHGRXS6', N'80', N'715203', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'234', N'9', N'6', N'87', N'V5XF2G3YZO', N'86', N'686489', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'235', N'26', N'1', N'47', N'HN30RTVJ3V', N'56', N'687259', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'236', N'10', N'5', N'18', N'UZKIY3IZW3', N'49', N'416975', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'237', N'13', N'5', N'94', N'O1QE0T4C9D', N'72', N'547097', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'238', N'3', N'6', N'62', N'3YA37G5T5S', N'10', N'840624', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'239', N'21', N'4', N'28', N'FCA3LQCZE9', N'88', N'647906', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'240', N'20', N'7', N'42', N'6SQJFD3X9W', N'3', N'586964', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'241', N'15', N'2', N'85', N'OWRDZH9HAS', N'49', N'567950', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'242', N'19', N'9', N'16', N'8BNYSM9XUN', N'17', N'238833', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'243', N'29', N'3', N'97', N'0HQYZVB09H', N'67', N'449191', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'244', N'1', N'2', N'37', N'LYXGKS2UEP', N'83', N'605924', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'245', N'1', N'3', N'29', N'53T85QGZ3E', N'66', N'849865', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'246', N'28', N'3', N'79', N'5OZZOZAEXL', N'16', N'443622', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'247', N'30', N'2', N'82', N'E1N474CF88', N'7', N'652822', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'248', N'4', N'3', N'32', N'Y7VRV73UC3', N'75', N'543845', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'249', N'16', N'2', N'86', N'TBPXMRFKPZ', N'37', N'375430', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'250', N'30', N'6', N'74', N'3T97RLYSOR', N'75', N'721597', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'251', N'23', N'4', N'56', N'LEIM6WR6CE', N'21', N'280517', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'252', N'5', N'5', N'84', N'TOR5IMSMD5', N'53', N'874656', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'253', N'4', N'3', N'17', N'X8EKVFVEPW', N'68', N'220701', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'254', N'26', N'7', N'28', N'GY0CTZTWUS', N'36', N'152661', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'255', N'15', N'1', N'56', N'0XB8VWQ8N3', N'3', N'213682', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'256', N'5', N'7', N'30', N'U7HYUE8LMB', N'15', N'770469', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'257', N'2', N'5', N'87', N'U9083O26HF', N'23', N'154943', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'258', N'2', N'3', N'31', N'0OEK8Q77KP', N'72', N'160576', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'259', N'14', N'6', N'35', N'0235HUGUAK', N'26', N'259139', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'260', N'14', N'10', N'77', N'P9WYE0Q98K', N'6', N'869198', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'261', N'27', N'1', N'59', N'OO7S6KEN0V', N'4', N'393680', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'262', N'18', N'1', N'68', N'ZTCCA3Z4MO', N'33', N'899031', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'263', N'30', N'1', N'78', N'LZRRW3OUEQ', N'48', N'503806', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'264', N'12', N'4', N'70', N'1JGC91DM8M', N'43', N'889628', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'265', N'3', N'6', N'20', N'3DXQ4FXD91', N'25', N'995294', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'266', N'1', N'7', N'87', N'VTJ66XTQKY', N'81', N'641024', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'267', N'21', N'1', N'8', N'NHXZDVO0XP', N'15', N'270458', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'268', N'29', N'5', N'33', N'WG8UWE4WRF', N'87', N'450996', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'269', N'12', N'9', N'59', N'JJCUDZK7UO', N'59', N'920928', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'270', N'21', N'9', N'100', N'V8V35TQF4L', N'72', N'369714', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'271', N'4', N'7', N'59', N'Y0SFXEQLGX', N'9', N'603461', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'272', N'21', N'9', N'10', N'8WIRLIDENK', N'48', N'668368', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'273', N'6', N'5', N'29', N'IJ7SYJXGLY', N'78', N'292177', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'274', N'13', N'8', N'94', N'EW782009ND', N'27', N'557374', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'275', N'24', N'10', N'41', N'IAXD2ZZJ93', N'79', N'725521', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'276', N'20', N'2', N'55', N'LJ9C21OY4O', N'60', N'490427', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'277', N'24', N'9', N'38', N'V9LPWW3E4A', N'30', N'504047', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'278', N'2', N'9', N'92', N'XTWIU3WXFC', N'62', N'328302', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'279', N'7', N'9', N'96', N'NH6SN9SYM3', N'24', N'145853', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'280', N'13', N'7', N'95', N'C15QF0XW2F', N'78', N'321396', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'281', N'26', N'4', N'83', N'8DSMS315CP', N'44', N'636168', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'282', N'12', N'4', N'5', N'UUB6O56G3N', N'25', N'935507', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'283', N'2', N'8', N'31', N'2P0THRM0PK', N'46', N'537270', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'284', N'25', N'3', N'14', N'WERADOTU0H', N'69', N'174440', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'285', N'17', N'2', N'33', N'G8EDMJFPME', N'11', N'434975', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'286', N'2', N'2', N'11', N'7ARACSM5GE', N'90', N'878455', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'287', N'2', N'7', N'53', N'T9DF3B29L0', N'71', N'259049', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'288', N'8', N'5', N'29', N'886WHM84PO', N'19', N'555339', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'289', N'23', N'5', N'39', N'W2KURA2U8C', N'59', N'419194', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'290', N'13', N'5', N'20', N'7WAFM8J0A8', N'35', N'303014', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'291', N'8', N'8', N'63', N'QZKRYITP8X', N'84', N'487898', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'292', N'27', N'10', N'33', N'0PX0631OQR', N'31', N'204388', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'293', N'7', N'1', N'99', N'YI4X597KD2', N'53', N'630428', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'294', N'10', N'9', N'63', N'6IRXE5B1Z0', N'69', N'407003', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'295', N'12', N'7', N'47', N'7M2E1ZW71O', N'7', N'270533', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'296', N'13', N'8', N'55', N'LPVVIYHMN2', N'69', N'466043', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'297', N'19', N'8', N'18', N'GJPLTZ1H9T', N'20', N'954704', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'298', N'2', N'8', N'25', N'C5FVTX6XNU', N'63', N'938211', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'299', N'9', N'7', N'2', N'QEU9L5XB8H', N'61', N'469987', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'300', N'8', N'9', N'11', N'56BFHKOX3W', N'54', N'125484', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'301', N'1', N'8', N'39', N'6Y6WR0SS6K', N'83', N'588840', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'302', N'4', N'7', N'75', N'KJUA3ZB8QY', N'51', N'442392', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'303', N'7', N'1', N'46', N'ABAO9G9F50', N'46', N'949075', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'304', N'1', N'9', N'94', N'IHBGRYQ4UU', N'54', N'740364', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'305', N'9', N'1', N'75', N'TXCRM3W1MQ', N'8', N'672085', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'306', N'7', N'6', N'57', N'UDKVAKC4O1', N'66', N'910038', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'307', N'1', N'4', N'7', N'NFBZDFUUJQ', N'96', N'149458', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'308', N'23', N'1', N'11', N'WA66KRT7GY', N'27', N'599641', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'309', N'14', N'4', N'41', N'8V5C1TVYS9', N'3', N'415630', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'310', N'12', N'7', N'65', N'NQYZKH5XYT', N'7', N'981403', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'311', N'21', N'5', N'5', N'PQXMD91447', N'57', N'555691', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'312', N'13', N'7', N'42', N'XGP834EB2L', N'56', N'361281', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'313', N'23', N'3', N'18', N'9D0SOILQXS', N'60', N'333999', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'314', N'15', N'3', N'46', N'12I42ZTBJ4', N'61', N'136655', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'315', N'8', N'10', N'88', N'UBBDEESOZ5', N'51', N'142515', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'316', N'21', N'9', N'44', N'ORATZSQRU4', N'70', N'315248', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'317', N'6', N'3', N'5', N'Y52OAZ13EP', N'19', N'653027', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'318', N'23', N'1', N'31', N'HSMPFQLIAG', N'78', N'329773', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'319', N'27', N'7', N'95', N'LWRMA4RUM7', N'26', N'203929', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'320', N'8', N'5', N'73', N'P9TCRVDHPH', N'53', N'712622', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'321', N'20', N'8', N'57', N'NNCXQ9DHKL', N'22', N'461982', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'322', N'26', N'3', N'44', N'ZKTRNPXS0N', N'3', N'980922', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'323', N'17', N'1', N'9', N'30QOSACH35', N'16', N'193709', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'324', N'14', N'3', N'16', N'4V5XC8WD6R', N'18', N'746070', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'325', N'19', N'3', N'5', N'JKTYT056IJ', N'55', N'922502', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'326', N'15', N'1', N'92', N'6BSB617B0E', N'29', N'807288', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'327', N'9', N'4', N'68', N'AI5R3B73C3', N'30', N'560101', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'328', N'13', N'4', N'39', N'YS7T5OMGZG', N'95', N'779836', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'329', N'22', N'6', N'34', N'D49BNSPZ5X', N'72', N'402162', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'330', N'7', N'10', N'68', N'Z3FWUOBY6Y', N'35', N'283976', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'331', N'26', N'3', N'76', N'798DFT51LO', N'91', N'331077', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'332', N'23', N'4', N'32', N'O8LQCEYNTR', N'94', N'829632', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'333', N'15', N'7', N'84', N'FEX1U78T95', N'70', N'821116', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'334', N'20', N'7', N'86', N'8YV5S0D23I', N'48', N'841296', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'335', N'23', N'3', N'52', N'HAQ2OIX8VX', N'96', N'639973', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'336', N'30', N'2', N'3', N'2AIQ4V8C9A', N'59', N'127758', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'337', N'19', N'1', N'30', N'9J47BKA8AW', N'17', N'496083', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'338', N'16', N'3', N'72', N'5OQW521L03', N'58', N'191925', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'339', N'22', N'5', N'75', N'ESMGCWR70L', N'22', N'375977', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'340', N'6', N'9', N'7', N'3JXXPUCOSW', N'7', N'667256', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'341', N'17', N'8', N'86', N'5M86MSJFMM', N'60', N'358177', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'342', N'8', N'6', N'88', N'1MVDFOU3LF', N'98', N'962886', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'343', N'17', N'9', N'59', N'6AGNCANFQ0', N'30', N'437208', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'344', N'23', N'7', N'35', N'SQT6ZW69ME', N'70', N'532151', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'345', N'10', N'6', N'83', N'88WUKOYF2Z', N'79', N'783714', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'346', N'12', N'1', N'53', N'LLRNJYW745', N'7', N'270199', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'347', N'17', N'1', N'40', N'SR1IMSUU7G', N'89', N'789173', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'348', N'7', N'5', N'80', N'L87N6LBJXA', N'86', N'863230', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'349', N'8', N'3', N'5', N'MAT2GEAKCD', N'23', N'691728', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'350', N'24', N'4', N'53', N'XFRHI5BG67', N'12', N'206944', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'351', N'5', N'7', N'46', N'WMYZGOL58X', N'86', N'917386', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'352', N'20', N'7', N'38', N'CY3Z21RFMG', N'94', N'709840', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'353', N'19', N'1', N'82', N'NDXQAB924V', N'14', N'419185', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'354', N'18', N'6', N'94', N'7C47KYYGVU', N'92', N'733806', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'355', N'15', N'2', N'55', N'7EIWDZ8ER3', N'82', N'685073', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'356', N'16', N'8', N'53', N'W1I7Y5H0MU', N'19', N'108430', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'357', N'18', N'10', N'43', N'G0BQWEX3X4', N'75', N'822605', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'358', N'26', N'3', N'70', N'VMEDW7MLIH', N'52', N'430145', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'359', N'13', N'6', N'80', N'P9V850DJK3', N'75', N'255484', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'360', N'23', N'7', N'15', N'J7I7MI39ZQ', N'9', N'366020', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'361', N'26', N'10', N'15', N'ACNUMFRC32', N'2', N'371130', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'362', N'29', N'1', N'54', N'DUOEPMVL53', N'57', N'884681', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'363', N'21', N'1', N'6', N'QEM581TTJW', N'84', N'949781', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'364', N'30', N'4', N'63', N'TDJ6AFP8IP', N'4', N'152795', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'365', N'8', N'9', N'57', N'TALKOJGQ14', N'48', N'796177', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'366', N'15', N'1', N'93', N'GBMOWUO8PB', N'2', N'941316', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'367', N'9', N'4', N'19', N'PH2BU7OJBO', N'16', N'482487', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'368', N'15', N'9', N'74', N'E01ZQB9LVL', N'79', N'250634', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'369', N'16', N'9', N'3', N'H3QNCLYUH1', N'60', N'562728', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'370', N'17', N'6', N'35', N'Z9D4Q3Z4RJ', N'10', N'122656', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'371', N'25', N'2', N'46', N'M3WSPKWMUF', N'28', N'265380', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'372', N'12', N'8', N'56', N'7MQOYLWLYX', N'45', N'132233', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'373', N'16', N'2', N'1', N'M5K23892FV', N'73', N'766997', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'374', N'19', N'5', N'90', N'K8IRLJUPVL', N'55', N'365815', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'375', N'11', N'4', N'79', N'2B2W4AJTQL', N'64', N'768836', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'376', N'6', N'9', N'58', N'X0V4PI142Q', N'80', N'904214', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'377', N'23', N'1', N'95', N'Y8VFVQIJKC', N'49', N'493662', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'378', N'15', N'8', N'46', N'DTVEFFMVTO', N'54', N'217426', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'379', N'20', N'2', N'82', N'JZU0Z0OUXZ', N'96', N'106503', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'380', N'3', N'5', N'66', N'AORKW6GWMF', N'78', N'853004', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'381', N'9', N'2', N'49', N'TXNPZ1YOGU', N'51', N'764616', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'382', N'18', N'8', N'43', N'8CDSEODVCL', N'42', N'631249', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'383', N'27', N'8', N'60', N'U5F5T0QPHG', N'12', N'872464', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'384', N'11', N'9', N'31', N'UDCFX2WW5Z', N'91', N'828676', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'385', N'18', N'1', N'51', N'FUQWFT2ZMT', N'13', N'861305', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'386', N'25', N'7', N'43', N'GMHJ1A3A9J', N'69', N'154477', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'387', N'18', N'2', N'77', N'DIDC0CM5WO', N'18', N'473003', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'388', N'1', N'6', N'97', N'4STOQRIBUO', N'44', N'775700', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'389', N'22', N'2', N'15', N'THWMYZM5EM', N'12', N'596440', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'390', N'19', N'9', N'26', N'7F2L3DF87A', N'92', N'514478', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'391', N'4', N'1', N'17', N'T66VD8TZUY', N'29', N'212322', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'392', N'11', N'9', N'65', N'HO3SG8I5TA', N'54', N'784940', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'393', N'24', N'2', N'38', N'7YN205K6VG', N'13', N'898039', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'394', N'4', N'4', N'13', N'3HCXXJYX5Z', N'30', N'793512', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'395', N'22', N'8', N'78', N'9KU1EPX8CF', N'84', N'875174', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'396', N'22', N'1', N'88', N'FSQBXG3JPM', N'76', N'393350', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'397', N'10', N'8', N'44', N'3XWUK2LY8N', N'58', N'402601', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'398', N'9', N'5', N'16', N'Z25XSA0PFZ', N'8', N'210328', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'399', N'10', N'1', N'91', N'K484GQ97VI', N'60', N'308616', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'400', N'17', N'10', N'91', N'5NFEUT0XTT', N'36', N'442991', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'401', N'22', N'6', N'61', N'OJIWFG403R', N'56', N'965427', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'402', N'15', N'10', N'94', N'YOSSNY1OVQ', N'19', N'350340', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'403', N'27', N'2', N'51', N'U5YQ2X30G3', N'70', N'997130', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'404', N'15', N'1', N'67', N'21U1G9N2WH', N'96', N'662830', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'405', N'10', N'2', N'49', N'MT5DL7T1YH', N'70', N'569619', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'406', N'24', N'9', N'63', N'9LTIFVJAJT', N'79', N'247557', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'407', N'22', N'1', N'72', N'8MBJPJZ0W3', N'89', N'462272', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'408', N'9', N'9', N'13', N'LUWT7SO5KL', N'18', N'170823', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'409', N'10', N'8', N'95', N'2V1XC959GW', N'63', N'624912', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'410', N'7', N'6', N'69', N'I60BND8Y8A', N'48', N'539234', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'411', N'4', N'1', N'3', N'H2VCN170SU', N'53', N'807167', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'412', N'3', N'9', N'17', N'VWCHVJDGJI', N'87', N'957876', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'413', N'27', N'7', N'17', N'MHT3RNN152', N'51', N'323010', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'414', N'21', N'2', N'36', N'AJGE9876N8', N'83', N'752587', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'415', N'29', N'4', N'73', N'C18A4BBGJ6', N'81', N'795349', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'416', N'30', N'5', N'98', N'R59K7MY90S', N'22', N'469779', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'417', N'8', N'2', N'55', N'29YEXW2ID5', N'15', N'286705', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'418', N'9', N'1', N'19', N'K871NOKWRH', N'38', N'140091', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'419', N'20', N'9', N'73', N'OAOJQSVGBH', N'88', N'677052', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'420', N'23', N'9', N'33', N'N5ZY1LDCYD', N'6', N'186778', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'421', N'22', N'4', N'66', N'98ZNA1IJAQ', N'71', N'951541', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'422', N'24', N'6', N'3', N'MRMH5WS4VA', N'41', N'911234', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'423', N'11', N'1', N'12', N'INR6OKW1AO', N'54', N'496736', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'424', N'1', N'10', N'72', N'3KK7VVBZHL', N'1', N'794999', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'425', N'15', N'6', N'86', N'RPTW42VB7P', N'40', N'815667', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'426', N'17', N'8', N'68', N'GI3RMA9GYB', N'41', N'914045', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'427', N'26', N'5', N'46', N'2ZOTLY02L3', N'79', N'757331', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'428', N'4', N'6', N'96', N'2HK6L0J1IV', N'52', N'153445', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'429', N'29', N'8', N'25', N'5RD6FYXGVZ', N'91', N'211472', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'430', N'21', N'3', N'25', N'QPVVWW9P9X', N'90', N'394284', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'431', N'18', N'4', N'56', N'IP6I2QT4QC', N'64', N'763613', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'432', N'17', N'9', N'98', N'2MAUG4GB3H', N'66', N'745141', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'433', N'20', N'5', N'88', N'LF33ZNEZ6C', N'60', N'406514', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'434', N'4', N'8', N'48', N'6ZINWFZSBB', N'96', N'731104', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'435', N'15', N'7', N'37', N'J6VG08MDNG', N'28', N'784590', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'436', N'24', N'7', N'21', N'HUG5G9FEBC', N'1', N'913704', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'437', N'18', N'2', N'46', N'5VT5A3M8FM', N'93', N'902974', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'438', N'20', N'7', N'37', N'BZVG9XDM0D', N'33', N'177086', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'439', N'14', N'1', N'10', N'97ME3L9VEO', N'47', N'278950', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'440', N'10', N'10', N'85', N'HOCWRO8EWD', N'73', N'110409', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'441', N'1', N'8', N'2', N'IY9J48OBZ2', N'82', N'786695', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'442', N'26', N'9', N'53', N'W1W7J2ZXCO', N'63', N'287368', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'443', N'6', N'4', N'88', N'TK4OFVKELL', N'37', N'697641', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'444', N'4', N'10', N'57', N'QF3D01UCDP', N'30', N'421607', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'445', N'12', N'1', N'25', N'LVFCPD0XGL', N'84', N'723895', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'446', N'1', N'8', N'48', N'9NIZPPIWHH', N'49', N'785416', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'447', N'27', N'1', N'26', N'T3REOXN665', N'30', N'313012', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'448', N'17', N'8', N'69', N'FF5SFYAI3F', N'25', N'597816', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'449', N'16', N'1', N'86', N'BD486IHHLJ', N'16', N'206058', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'450', N'21', N'3', N'39', N'X2YWPCULI2', N'67', N'348398', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'451', N'11', N'6', N'42', N'7ZWPV7TGDH', N'1', N'618731', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'452', N'14', N'8', N'87', N'PUILF7HCOA', N'99', N'692137', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'453', N'26', N'5', N'65', N'IUQ69XVVRN', N'8', N'703185', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'454', N'29', N'3', N'43', N'WQ3H2Z82V3', N'23', N'874894', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'455', N'12', N'5', N'38', N'VYKDQ3J8O3', N'53', N'329121', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'456', N'22', N'5', N'48', N'CJW6O8UN6E', N'41', N'244496', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'457', N'19', N'1', N'20', N'0EN9HM9NBW', N'37', N'554623', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'458', N'21', N'6', N'12', N'2ZQ2UIOTTI', N'32', N'966043', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'459', N'16', N'5', N'84', N'55SP7G760T', N'77', N'801509', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'460', N'1', N'8', N'57', N'NX8U2I8S7U', N'49', N'241021', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'461', N'29', N'4', N'68', N'2PZSLXM0D9', N'22', N'235822', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'462', N'21', N'10', N'30', N'2H4ISB9N8J', N'59', N'795636', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'463', N'7', N'2', N'30', N'UW6GXTD4GM', N'25', N'119001', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'464', N'16', N'8', N'11', N'R3XGSZGG6E', N'6', N'351422', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'465', N'16', N'7', N'41', N'7N2XSXO1F4', N'5', N'142052', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'466', N'9', N'2', N'4', N'H6VIT3EJSG', N'5', N'404848', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'467', N'21', N'4', N'53', N'4PZWLZS4ER', N'55', N'626794', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'468', N'1', N'9', N'40', N'MTY6CLP5DM', N'4', N'576273', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'469', N'1', N'8', N'87', N'KJX7CXVB3J', N'25', N'140881', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'470', N'23', N'3', N'73', N'RA9H30R7TR', N'24', N'645127', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'471', N'14', N'1', N'13', N'46VSQZ8S1B', N'83', N'964599', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'472', N'13', N'4', N'41', N'Y4SVS6C6CS', N'57', N'368063', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'473', N'16', N'1', N'14', N'57J9GOGTFI', N'91', N'818197', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'474', N'14', N'9', N'90', N'ULHGQA9YDM', N'15', N'438393', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'475', N'2', N'5', N'91', N'ECO3LZEI52', N'36', N'317414', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'476', N'24', N'6', N'19', N'74CWQ93R31', N'34', N'518968', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'477', N'11', N'1', N'94', N'2K1I8E7AK2', N'90', N'562574', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'478', N'26', N'2', N'24', N'TVPN6BTV6M', N'60', N'576326', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'479', N'10', N'7', N'46', N'5IA5W1NLHS', N'9', N'773846', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'480', N'29', N'7', N'79', N'QRG3YGHZFC', N'33', N'864144', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'481', N'1', N'2', N'87', N'O0MZFI2R8B', N'14', N'679817', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'482', N'13', N'2', N'11', N'HHW3DMXGFW', N'52', N'105919', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'483', N'15', N'2', N'98', N'NNZ3MTJUFU', N'79', N'831242', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'484', N'30', N'4', N'48', N'EQWP5UQEPP', N'52', N'863842', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'485', N'10', N'7', N'60', N'40LMYBB1SM', N'58', N'580328', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'486', N'19', N'5', N'87', N'A3CA1MSTMB', N'66', N'102399', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'487', N'16', N'10', N'25', N'YWTJGXPQQ9', N'34', N'150844', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'488', N'23', N'2', N'94', N'5JNQ8128YD', N'19', N'355935', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'489', N'16', N'8', N'71', N'D51GS16ANP', N'3', N'815307', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'490', N'24', N'5', N'1', N'DE08S2QG2X', N'44', N'540997', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'491', N'24', N'4', N'22', N'PFSKZUKD1X', N'80', N'711461', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'492', N'30', N'5', N'25', N'VBW0FJRRLT', N'75', N'139056', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'493', N'27', N'8', N'76', N'OEA5981HHK', N'100', N'264405', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'494', N'4', N'9', N'66', N'FCMQN6N6GO', N'23', N'614087', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'495', N'18', N'8', N'33', N'Q73FUNQG1T', N'72', N'519366', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'496', N'15', N'7', N'77', N'U04I00V7T1', N'42', N'916240', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'497', N'4', N'6', N'89', N'6ZUSU7KOZV', N'95', N'815057', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'498', N'8', N'2', N'84', N'EIVY88PKG5', N'47', N'194024', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'499', N'26', N'5', N'88', N'OYF8JXTJN7', N'85', N'325760', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'500', N'25', N'6', N'46', N'8IWHYI7XET', N'9', N'517184', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'501', N'10', N'6', N'65', N'ZBK5XDZ0PA', N'95', N'978277', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'502', N'29', N'8', N'2', N'BJUTS9QP8B', N'75', N'777496', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'503', N'5', N'10', N'92', N'BBBRKX2R6X', N'32', N'565725', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'504', N'12', N'6', N'33', N'6XIMV2MW3D', N'12', N'176682', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'505', N'19', N'6', N'72', N'AM2O1E89CV', N'31', N'382013', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'506', N'30', N'1', N'79', N'UYHK1UX4HI', N'42', N'350839', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'507', N'19', N'7', N'82', N'FEGWZJ7C82', N'72', N'235215', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'508', N'23', N'1', N'58', N'0439LL858N', N'71', N'528717', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'509', N'2', N'7', N'56', N'JW61V6IUP7', N'16', N'324676', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'510', N'17', N'6', N'72', N'0VRW98TEMI', N'95', N'699650', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'511', N'18', N'1', N'69', N'AST71NRMAU', N'92', N'590468', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'512', N'13', N'9', N'73', N'YBN918D4WK', N'59', N'830550', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'513', N'26', N'1', N'52', N'LJY0RIV7LB', N'91', N'462081', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'514', N'24', N'7', N'14', N'RFW9DBUG53', N'13', N'663923', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'515', N'8', N'5', N'46', N'2WI3WDS95I', N'91', N'271442', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'516', N'3', N'2', N'72', N'TD7RCR1313', N'58', N'484899', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'517', N'20', N'3', N'38', N'JCLYPPEHM9', N'16', N'566825', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'518', N'17', N'6', N'59', N'HVMGEDAGBG', N'95', N'519732', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'519', N'21', N'5', N'86', N'SXEZQZ01RK', N'86', N'647109', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'520', N'21', N'8', N'19', N'6450QB3EML', N'62', N'847427', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'521', N'30', N'1', N'29', N'0KQ0V13DEB', N'34', N'179856', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'522', N'17', N'1', N'8', N'CTGM93E5SE', N'55', N'136450', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'523', N'10', N'1', N'8', N'R4XNUL7HXJ', N'6', N'747036', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'524', N'4', N'3', N'75', N'UDBC18SMQZ', N'23', N'642278', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'525', N'17', N'7', N'84', N'WEHHWHELR5', N'59', N'793074', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'526', N'3', N'1', N'59', N'AK9EZJEIAI', N'52', N'795137', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'527', N'21', N'9', N'83', N'LHGFRFUDHP', N'99', N'789701', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'528', N'10', N'1', N'92', N'ICYETO5X1I', N'71', N'756194', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'529', N'16', N'9', N'30', N'5FMPHIZHDW', N'11', N'975884', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'530', N'26', N'6', N'82', N'8V9A3K60FQ', N'14', N'715256', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'531', N'4', N'10', N'47', N'BNV1TYLEBZ', N'79', N'706808', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'532', N'4', N'10', N'14', N'ON033FP8U2', N'85', N'459573', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'533', N'12', N'9', N'9', N'T7758M8H5T', N'33', N'301575', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'534', N'19', N'1', N'84', N'9K0O1SWM7E', N'20', N'455874', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'535', N'9', N'8', N'92', N'53YRGOIHDF', N'46', N'574527', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'536', N'9', N'9', N'15', N'K0WP1G5NIK', N'60', N'658014', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'537', N'20', N'7', N'89', N'EAOSZ9VY98', N'36', N'185299', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'538', N'2', N'8', N'18', N'FUTXN44TZQ', N'78', N'489773', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'539', N'4', N'8', N'7', N'UTW9Q049PU', N'81', N'847745', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'540', N'3', N'6', N'37', N'CSM5ZLKJQQ', N'36', N'335627', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'541', N'25', N'6', N'97', N'YINHCNNWYT', N'47', N'548160', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'542', N'12', N'3', N'58', N'VVTNJUHPLM', N'48', N'577301', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'543', N'27', N'8', N'62', N'UPA6S1LA25', N'70', N'769365', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'544', N'6', N'1', N'46', N'H1F3W17Z0K', N'58', N'665610', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'545', N'10', N'4', N'72', N'XLB7NCV1EV', N'61', N'974336', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'546', N'25', N'4', N'27', N'91O7TTTUTN', N'19', N'149468', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'547', N'26', N'1', N'78', N'1LITMVQLOC', N'75', N'891197', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'548', N'10', N'7', N'74', N'HA3YEL9GXM', N'19', N'609377', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'549', N'26', N'2', N'97', N'GLPLT762FL', N'93', N'563317', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'550', N'12', N'2', N'71', N'90TKSYN9VB', N'74', N'906267', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'551', N'9', N'4', N'29', N'IPALS2883A', N'30', N'597242', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'552', N'4', N'6', N'67', N'B95LWE91IA', N'15', N'131731', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'553', N'8', N'9', N'39', N'UQSC32BYS1', N'80', N'122235', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'554', N'7', N'9', N'93', N'4UB8VR8234', N'78', N'542608', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'555', N'11', N'1', N'47', N'7RLP76CPBA', N'85', N'721760', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'556', N'2', N'8', N'61', N'4ORME4QCS3', N'6', N'410467', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'557', N'25', N'6', N'95', N'AKY6E8S7BW', N'47', N'568858', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'558', N'11', N'8', N'75', N'OXHPOOMJ97', N'69', N'917580', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'559', N'9', N'4', N'63', N'U05WOPTRZG', N'8', N'379395', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'560', N'5', N'6', N'44', N'BZJACDAQD4', N'32', N'663445', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'561', N'12', N'1', N'88', N'M3GO4T6L4A', N'3', N'124590', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'562', N'14', N'8', N'50', N'UCRGY09799', N'13', N'923248', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'563', N'29', N'3', N'20', N'OXVCPVMQ41', N'50', N'469560', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'564', N'20', N'9', N'55', N'X25G894UME', N'100', N'555503', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'565', N'13', N'1', N'76', N'Z529APHNZY', N'1', N'431246', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'566', N'3', N'8', N'40', N'B4Y6LNP17C', N'87', N'638603', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'567', N'3', N'1', N'83', N'HN4ZWFUUOJ', N'94', N'346594', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'568', N'5', N'1', N'11', N'37LBCBU7TS', N'35', N'787040', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'569', N'30', N'8', N'10', N'GLC5CHB12A', N'50', N'167399', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'570', N'13', N'5', N'35', N'2OWASJQM4U', N'35', N'783617', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'571', N'1', N'7', N'50', N'O0KS41IV3R', N'24', N'921399', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'572', N'5', N'6', N'91', N'ZSKLONWTPQ', N'29', N'522808', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'573', N'28', N'4', N'2', N'V6JPA9MF9K', N'58', N'666621', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'574', N'4', N'10', N'87', N'W1N1JV6FMV', N'37', N'533416', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'575', N'5', N'4', N'37', N'WR0CIIX6K1', N'47', N'601549', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'576', N'27', N'1', N'74', N'T9BIWWR6ZI', N'57', N'626928', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'577', N'1', N'10', N'67', N'4MIQ6G0ZRP', N'39', N'522744', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'578', N'12', N'2', N'55', N'BP42CLLJR9', N'64', N'469709', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'579', N'27', N'1', N'98', N'7B99TMT0EM', N'18', N'386734', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'580', N'10', N'8', N'1', N'FKL7QI3A2E', N'7', N'678676', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'581', N'6', N'4', N'36', N'LWQEP7NIU1', N'72', N'482772', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'582', N'23', N'1', N'30', N'JL9RBSXIGT', N'82', N'192822', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'583', N'16', N'4', N'8', N'078JDS765A', N'80', N'603106', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'584', N'24', N'3', N'52', N'E7ZL34N3CM', N'40', N'882743', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'585', N'5', N'9', N'24', N'BCVRQ0J6L6', N'91', N'639663', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'586', N'25', N'3', N'71', N'YWDM3V0TUP', N'59', N'220619', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'587', N'24', N'3', N'15', N'63DGJ5ZC4F', N'88', N'630342', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'588', N'30', N'9', N'82', N'HHOKMRNHTT', N'86', N'233315', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'589', N'16', N'8', N'56', N'WWNF9F47N0', N'83', N'335657', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'590', N'1', N'4', N'27', N'VDNX4GGMIG', N'59', N'820785', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'591', N'24', N'8', N'76', N'GMFI4JZASK', N'49', N'701112', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'592', N'18', N'4', N'34', N'F73DQWOIBW', N'15', N'271781', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'593', N'1', N'1', N'93', N'8QX8SS2SFI', N'69', N'442640', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'594', N'23', N'6', N'32', N'A6TTQKBEVZ', N'60', N'676669', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'595', N'29', N'8', N'83', N'WXBORFVKCN', N'57', N'146619', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'596', N'1', N'6', N'27', N'IXOOS660AH', N'4', N'389797', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'597', N'30', N'6', N'28', N'TEUUWIA5VD', N'10', N'623349', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'598', N'11', N'5', N'10', N'KNM5B7TQZ8', N'80', N'338518', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'599', N'21', N'4', N'32', N'L64IQ0OS4M', N'58', N'779522', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'600', N'13', N'7', N'35', N'Q6AZCRPQP4', N'34', N'678021', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'601', N'1', N'6', N'35', N'GMAOVDZ8IU', N'36', N'269504', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'602', N'8', N'7', N'94', N'S5M7IYXMDL', N'99', N'147591', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'603', N'15', N'3', N'45', N'2R5HN6GI8X', N'64', N'333195', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'604', N'7', N'1', N'81', N'I8VK6J8H4D', N'14', N'517915', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'605', N'3', N'3', N'31', N'6PL1FHIQO0', N'88', N'670470', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'606', N'27', N'8', N'43', N'WNI2UQRPI5', N'37', N'418936', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'607', N'12', N'4', N'90', N'2UCXSS3UH5', N'89', N'593758', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'608', N'26', N'2', N'43', N'4TO36HJJZF', N'52', N'670600', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'609', N'18', N'8', N'13', N'11IXETWMR9', N'11', N'886580', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'610', N'12', N'7', N'27', N'EQJ7FXEZ4G', N'50', N'311701', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'611', N'24', N'4', N'96', N'GQONHPL3XK', N'73', N'552523', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'612', N'1', N'9', N'76', N'XV127ZJ45G', N'16', N'240437', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'613', N'12', N'7', N'89', N'WFONF3PM4Q', N'28', N'660421', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'614', N'2', N'10', N'15', N'RXT419Z0QM', N'38', N'768232', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'615', N'26', N'8', N'60', N'STWX06HJ8F', N'89', N'290226', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'616', N'28', N'4', N'53', N'F9IGBHLMOE', N'60', N'630671', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'617', N'25', N'1', N'69', N'SV8Z4SIVNS', N'12', N'201983', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'618', N'17', N'8', N'57', N'OJT5UVWKUZ', N'31', N'765036', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'619', N'19', N'4', N'7', N'XNXMFGKFBP', N'99', N'663211', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'620', N'11', N'8', N'13', N'91086LRPI6', N'57', N'440526', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'621', N'17', N'7', N'24', N'GQ6WSV4H34', N'12', N'128246', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'622', N'23', N'2', N'65', N'0KI06209PU', N'69', N'545214', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'623', N'15', N'8', N'99', N'WBHMJGW608', N'40', N'533522', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'624', N'18', N'2', N'61', N'18HJRDIPQ0', N'52', N'565288', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'625', N'26', N'2', N'46', N'BKKK9UUKLT', N'1', N'678111', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'626', N'14', N'3', N'99', N'BIGT6C0G8S', N'30', N'796657', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'627', N'6', N'1', N'46', N'F3LMJLNDJ9', N'83', N'436229', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'628', N'6', N'1', N'49', N'TFLIUGERH3', N'43', N'131542', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'629', N'21', N'3', N'45', N'EWNBDCNX7G', N'27', N'588340', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'630', N'1', N'1', N'46', N'RY7LC4JY3X', N'62', N'624227', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'631', N'1', N'2', N'77', N'YSO7ZO8A5X', N'47', N'895937', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'632', N'14', N'1', N'88', N'YCKZO2AD7N', N'79', N'768561', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'633', N'29', N'1', N'22', N'UDTNEN55WG', N'72', N'467938', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'634', N'28', N'9', N'13', N'P5EFEUGBPW', N'60', N'275606', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'635', N'25', N'4', N'28', N'ODJ7BYGNA6', N'91', N'506157', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'636', N'18', N'4', N'66', N'CYL1RHI8OJ', N'75', N'654288', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'637', N'8', N'5', N'36', N'L5ZKMXEUG7', N'40', N'554734', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'638', N'12', N'4', N'29', N'C7S97XXR2S', N'4', N'283268', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'639', N'22', N'9', N'1', N'E6CF0UTUF4', N'81', N'114074', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'640', N'4', N'2', N'11', N'DP3X9ZRODM', N'47', N'822447', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'641', N'2', N'7', N'8', N'VGYE7OYQ7G', N'27', N'264151', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'642', N'30', N'9', N'53', N'69ZVOVQILZ', N'76', N'617449', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'643', N'22', N'3', N'13', N'8DK148UAV7', N'65', N'235501', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'644', N'24', N'6', N'12', N'M4NJXZ32MC', N'85', N'101283', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'645', N'12', N'5', N'4', N'SDMNLUQIAT', N'30', N'374091', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'646', N'28', N'1', N'45', N'1TZMB51355', N'32', N'372956', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'647', N'2', N'5', N'90', N'OJNUB6YSPA', N'9', N'842783', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'648', N'30', N'2', N'70', N'31RGO1FILD', N'21', N'316111', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'649', N'23', N'9', N'20', N'GKE7P5B1J0', N'34', N'391978', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'650', N'15', N'3', N'24', N'WTR9FXIQVS', N'62', N'829964', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'651', N'6', N'2', N'14', N'EQ75LZ4OTK', N'8', N'359751', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'652', N'7', N'9', N'46', N'PEN4TTU4ID', N'53', N'162583', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'653', N'10', N'5', N'26', N'QYCA1ZPQRO', N'39', N'556373', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'654', N'17', N'2', N'74', N'3JW7NGVITF', N'17', N'838820', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'655', N'13', N'10', N'81', N'XTF6EHWR4N', N'28', N'646659', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'656', N'28', N'3', N'53', N'H5FQL1XAO1', N'7', N'205352', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'657', N'16', N'5', N'95', N'COY7V40P3N', N'73', N'294108', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'658', N'22', N'5', N'17', N'6I2343CZ1H', N'37', N'947743', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'659', N'13', N'10', N'76', N'S43ZO0IMDS', N'8', N'658548', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'660', N'1', N'3', N'22', N'TYCEG5OGG0', N'34', N'154576', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'661', N'22', N'1', N'16', N'F2LMJ2LFL7', N'6', N'100091', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'662', N'22', N'2', N'51', N'HKJ0DII88G', N'57', N'787806', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'663', N'1', N'8', N'59', N'ZCF4DTC1GJ', N'26', N'965490', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'664', N'10', N'7', N'14', N'BH1RX0J8V9', N'84', N'390262', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'665', N'26', N'6', N'97', N'265Y5TBTOK', N'93', N'319836', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'666', N'4', N'6', N'45', N'XSTR9HRKT7', N'74', N'313582', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'667', N'11', N'2', N'50', N'9VP6QRO9ZU', N'52', N'404942', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'668', N'11', N'1', N'70', N'5HA3CRCKPE', N'16', N'610992', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'669', N'17', N'3', N'14', N'LPDNA455IS', N'94', N'117039', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'670', N'1', N'2', N'5', N'Y4FA8KNQCQ', N'79', N'568412', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'671', N'24', N'1', N'9', N'8HANYGB53R', N'61', N'866403', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'672', N'10', N'2', N'10', N'UX1D867UES', N'88', N'685794', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'673', N'27', N'4', N'36', N'E3W67XZKF0', N'33', N'722885', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'674', N'16', N'5', N'60', N'3ZI4C4F15D', N'39', N'912451', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'675', N'24', N'7', N'31', N'GW7BSEEM71', N'64', N'211484', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'676', N'19', N'5', N'75', N'EWMFN7G325', N'44', N'688383', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'677', N'18', N'8', N'98', N'SKIF97ZDRS', N'74', N'236097', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'678', N'21', N'4', N'48', N'BG1ZBA6IKI', N'18', N'554894', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'679', N'1', N'4', N'97', N'CUCLVV0KM8', N'28', N'478586', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'680', N'10', N'1', N'49', N'2DIOEFXH5T', N'68', N'734945', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'681', N'21', N'7', N'21', N'A0YJL3TTZ3', N'92', N'394663', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'682', N'5', N'3', N'72', N'X87MLGR767', N'62', N'718194', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'683', N'12', N'3', N'8', N'F7LYYZ1VJK', N'36', N'690497', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'684', N'22', N'1', N'68', N'IEEA7U3JAR', N'98', N'374362', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'685', N'8', N'7', N'9', N'LJG22EAIDB', N'76', N'517707', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'686', N'25', N'1', N'58', N'L2VVBH599V', N'63', N'111088', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'687', N'14', N'6', N'25', N'AHVM3HMY4P', N'48', N'331044', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'688', N'12', N'8', N'54', N'BBH6MFEJ60', N'74', N'906931', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'689', N'26', N'1', N'4', N'QK76LDU4A8', N'57', N'285767', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'690', N'26', N'3', N'89', N'2GTOFHU11A', N'19', N'779259', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'691', N'5', N'4', N'3', N'CFAZALEEBV', N'75', N'285865', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'692', N'14', N'9', N'68', N'6PK437VD2L', N'84', N'714425', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'693', N'29', N'1', N'93', N'I0WGJV4GE8', N'65', N'732583', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'694', N'6', N'3', N'83', N'9NV45N8ZZ5', N'4', N'643114', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'695', N'26', N'2', N'2', N'RMXOCGAHK1', N'89', N'501866', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'696', N'27', N'10', N'69', N'KSNWGFXRTZ', N'13', N'259242', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'697', N'18', N'2', N'56', N'K44WR6FL6A', N'21', N'735829', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'698', N'4', N'4', N'79', N'H9PK129ARA', N'43', N'729481', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'699', N'13', N'1', N'49', N'9DLPUSLK8H', N'62', N'546313', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'700', N'23', N'1', N'18', N'DK5L2HSE2M', N'20', N'109823', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'701', N'9', N'7', N'16', N'5NV06QYR6K', N'98', N'232450', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'702', N'1', N'3', N'99', N'FA3O8OHLJ7', N'44', N'536707', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'703', N'6', N'7', N'77', N'GC81D2JY05', N'76', N'488101', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'704', N'22', N'3', N'98', N'QM8RAJCBBE', N'21', N'817035', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'705', N'21', N'1', N'52', N'DJUBCA89VJ', N'57', N'988789', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'706', N'29', N'8', N'65', N'DMGRQ5FTIA', N'49', N'344217', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'707', N'25', N'9', N'58', N'RTPLHNGJWB', N'35', N'790341', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'708', N'21', N'4', N'6', N'WR03N4PZAS', N'17', N'483373', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'709', N'12', N'6', N'96', N'Z3QRG3RV3D', N'99', N'477084', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'710', N'19', N'6', N'76', N'5JKS7ZJUPJ', N'19', N'698574', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'711', N'28', N'8', N'78', N'9NT2ADR2EP', N'21', N'984542', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'712', N'1', N'5', N'74', N'GHDIGZCXP5', N'61', N'455432', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'713', N'26', N'3', N'1', N'B1CT4FRFK4', N'43', N'946793', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'714', N'6', N'9', N'72', N'S0W9RP4BNQ', N'69', N'241021', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'715', N'2', N'5', N'74', N'OI4YOH6HES', N'25', N'340955', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'716', N'19', N'3', N'75', N'23XC8Y3OYM', N'68', N'921753', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'717', N'17', N'6', N'1', N'U8ULHK8NCY', N'44', N'936622', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'718', N'14', N'7', N'16', N'MXH2F2BW6H', N'33', N'961563', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'719', N'12', N'8', N'76', N'DZU14TUB5L', N'71', N'325254', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'720', N'2', N'9', N'90', N'JSYB4X3ORA', N'34', N'857629', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'721', N'17', N'2', N'93', N'I03IJJZ30N', N'28', N'529986', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'722', N'23', N'2', N'78', N'A9KOHVFM86', N'11', N'245617', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'723', N'19', N'2', N'21', N'300KLNPC5U', N'88', N'465772', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'724', N'7', N'9', N'65', N'OWE1W4NU0S', N'71', N'704676', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'725', N'7', N'7', N'27', N'RRV9HJ2W4S', N'99', N'301105', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'726', N'21', N'8', N'36', N'G990632UE2', N'46', N'650887', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'727', N'15', N'4', N'54', N'29OHXNEU9K', N'83', N'957661', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'728', N'30', N'7', N'78', N'F7NAQL0QTI', N'89', N'575402', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'729', N'15', N'5', N'91', N'0KUPMHZYCE', N'95', N'274062', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'730', N'13', N'1', N'7', N'L0Y8CCW999', N'68', N'780268', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'731', N'21', N'9', N'87', N'AYR3OMGC64', N'32', N'810945', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'732', N'5', N'7', N'5', N'KY7I0I1XJF', N'83', N'286628', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'733', N'11', N'7', N'70', N'X7T6MEV289', N'76', N'529250', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'734', N'2', N'2', N'95', N'FCBM90W0GT', N'24', N'634077', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'735', N'4', N'5', N'66', N'CAUXPX4QRP', N'63', N'920417', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'736', N'5', N'7', N'5', N'IHS69NBEM8', N'33', N'609800', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'737', N'11', N'5', N'9', N'SF2O8QTQ8X', N'45', N'851032', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'738', N'13', N'1', N'48', N'38I5XEWC6V', N'45', N'889695', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'739', N'22', N'10', N'56', N'WLB4JJ3TXS', N'6', N'267372', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'740', N'1', N'5', N'16', N'IKD7IU3BOA', N'27', N'672540', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'741', N'15', N'9', N'83', N'WQVFBWFEOF', N'66', N'195605', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'742', N'26', N'3', N'17', N'JH3WKPSNVK', N'39', N'999249', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'743', N'22', N'7', N'28', N'6VCLPQBL4O', N'34', N'757539', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'744', N'21', N'1', N'52', N'WKOF7AJBWO', N'27', N'317827', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'745', N'20', N'8', N'70', N'YN3CVM9JIV', N'14', N'581363', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'746', N'30', N'4', N'10', N'022348ZW1Y', N'70', N'536717', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'747', N'3', N'10', N'97', N'Z760OLWK0X', N'46', N'231028', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'748', N'25', N'1', N'56', N'DWA23YBV9H', N'45', N'253228', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'749', N'16', N'5', N'87', N'YNGHF94UAZ', N'95', N'546664', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'750', N'4', N'1', N'1', N'XD8YK9ND7G', N'17', N'667434', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'751', N'1', N'7', N'8', N'C1WAQ9QP7V', N'99', N'700767', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'752', N'21', N'2', N'88', N'M3P4SBNJ19', N'9', N'294068', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'753', N'18', N'2', N'43', N'59UB044743', N'3', N'954807', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'754', N'10', N'6', N'87', N'6OD0SLDY05', N'98', N'155971', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'755', N'7', N'10', N'87', N'5NUQ6I19WQ', N'44', N'556373', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'756', N'11', N'9', N'44', N'CKRF32WDIS', N'2', N'674050', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'757', N'9', N'2', N'76', N'RORAYK72FA', N'91', N'995041', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'758', N'21', N'4', N'69', N'9PRJENXGW0', N'23', N'839011', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'759', N'24', N'2', N'32', N'YK3KZ8GQDT', N'25', N'133387', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'760', N'23', N'7', N'100', N'NOXP7BZYFV', N'97', N'206694', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'761', N'2', N'6', N'32', N'3EFSMM0TUJ', N'94', N'596255', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'762', N'5', N'5', N'53', N'A7AQJB8B2T', N'51', N'881984', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'763', N'16', N'2', N'69', N'A5TV3TOYXW', N'93', N'506208', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'764', N'1', N'4', N'67', N'HL2GX049NS', N'91', N'913980', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'765', N'13', N'7', N'94', N'CJEMR6P0TI', N'96', N'737207', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'766', N'28', N'8', N'58', N'7T2S6CDJA0', N'8', N'415054', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'767', N'15', N'6', N'20', N'5VIGBP4I7S', N'87', N'827726', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'768', N'11', N'9', N'29', N'8GLQDV7NLQ', N'41', N'329713', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'769', N'28', N'3', N'18', N'YASQJ831WB', N'38', N'694443', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'770', N'7', N'6', N'36', N'W8S364C50U', N'74', N'158421', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'771', N'28', N'2', N'66', N'4QSZ2LJ1FV', N'1', N'201491', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'772', N'28', N'2', N'34', N'ZVAPXM9ABC', N'62', N'194845', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'773', N'16', N'5', N'88', N'6B14NEZU4W', N'5', N'265397', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'774', N'1', N'5', N'70', N'WP73RZ7A5R', N'32', N'952932', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'775', N'6', N'6', N'35', N'UOG1NFEO48', N'17', N'905102', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'776', N'25', N'6', N'63', N'L1A4UEH817', N'5', N'665384', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'777', N'24', N'3', N'66', N'KHU6FJUSPZ', N'84', N'804071', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'778', N'26', N'5', N'45', N'80SLC5IL91', N'91', N'969481', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'779', N'25', N'10', N'14', N'36SQN00731', N'35', N'213519', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'780', N'3', N'9', N'81', N'INKNCR0CAG', N'69', N'254009', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'781', N'16', N'5', N'2', N'OKANUQZBT1', N'82', N'784949', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'782', N'26', N'1', N'26', N'8QY6N9S4HI', N'36', N'598554', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'783', N'3', N'6', N'6', N'TA7EQ1GH4O', N'13', N'960174', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'784', N'17', N'4', N'36', N'ZOS6L5P1RC', N'10', N'659968', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'785', N'15', N'1', N'78', N'KXY77XPS75', N'99', N'481961', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'786', N'11', N'1', N'18', N'WYVPQZVJDT', N'25', N'145041', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'787', N'15', N'8', N'84', N'WGILITQ3SD', N'64', N'255379', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'788', N'9', N'4', N'69', N'XQHAJHLFV9', N'51', N'511309', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'789', N'14', N'7', N'62', N'FBZY8FY6B6', N'92', N'928341', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'790', N'16', N'4', N'41', N'2T906UQ6QF', N'34', N'307318', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'791', N'17', N'4', N'93', N'WKS41JUVOA', N'44', N'329148', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'792', N'25', N'5', N'71', N'R2XJ1E3JTH', N'68', N'419688', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'793', N'29', N'5', N'78', N'1Q1JNF0E12', N'31', N'964071', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'794', N'25', N'7', N'69', N'ZOE8LV96A9', N'39', N'292309', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'795', N'23', N'4', N'18', N'6CHJZPKGXL', N'81', N'189786', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'796', N'26', N'8', N'45', N'8ZU1M5FW51', N'56', N'732087', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'797', N'1', N'4', N'18', N'4YON1ZP9HT', N'96', N'100453', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'798', N'12', N'1', N'4', N'J8G1C3QQE3', N'97', N'148779', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'799', N'1', N'9', N'53', N'3VM72MMCFV', N'45', N'487082', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'800', N'14', N'2', N'63', N'4ZMNJY0B2Y', N'53', N'293077', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'801', N'28', N'9', N'67', N'N6Y0LIVSKQ', N'86', N'736153', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'802', N'27', N'4', N'29', N'0HKFYEHMG6', N'98', N'719447', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'803', N'2', N'2', N'95', N'Z1NLD33R9N', N'46', N'219174', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'804', N'23', N'4', N'21', N'9DI9I82SHK', N'90', N'600431', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'805', N'27', N'1', N'55', N'I3NGCMS5J7', N'74', N'541642', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'806', N'1', N'5', N'38', N'PVOPHRORCA', N'21', N'724312', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'807', N'17', N'2', N'77', N'VHCJ2OHMK9', N'20', N'640079', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'808', N'6', N'6', N'56', N'0NVNKEHT2F', N'49', N'507750', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'809', N'21', N'1', N'72', N'6QK70B8HOG', N'87', N'480812', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'810', N'15', N'4', N'89', N'683O4DW9LW', N'81', N'391940', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'811', N'29', N'1', N'84', N'ZM40D3RGRI', N'49', N'731490', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'812', N'22', N'1', N'84', N'4TJXEZP0PK', N'12', N'410473', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'813', N'8', N'5', N'17', N'8A9T12HDDC', N'85', N'898445', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'814', N'29', N'6', N'25', N'6EM46ETAOW', N'84', N'977886', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'815', N'22', N'9', N'25', N'16QHXU6A84', N'73', N'197105', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'816', N'30', N'3', N'91', N'I0Q712S08Z', N'86', N'836206', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'817', N'29', N'5', N'19', N'61BAO1QTBJ', N'68', N'301165', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'818', N'12', N'1', N'78', N'BHSWZ0Z9JW', N'36', N'424491', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'819', N'21', N'7', N'66', N'XW9I68SJ1N', N'84', N'723964', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'820', N'5', N'5', N'19', N'TED8KU2CQ9', N'19', N'690534', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'821', N'2', N'1', N'44', N'WKUI8Q9QVC', N'63', N'136036', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'822', N'13', N'10', N'62', N'124830YWUB', N'33', N'171983', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'823', N'9', N'3', N'72', N'PYCU3F3A56', N'85', N'244806', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'824', N'14', N'2', N'81', N'DC9LZV8S6P', N'17', N'214445', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'825', N'16', N'9', N'37', N'I91SDPPIVA', N'78', N'447706', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'826', N'21', N'9', N'22', N'URSRG24L6O', N'87', N'415160', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'827', N'15', N'8', N'28', N'UXOS8AL2CB', N'86', N'308131', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'828', N'23', N'1', N'63', N'LM3MINGWKU', N'19', N'299278', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'829', N'23', N'1', N'94', N'XOGPM6TV08', N'66', N'515680', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'830', N'8', N'6', N'38', N'EXN5XQ880Y', N'3', N'651412', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'831', N'22', N'1', N'75', N'LKI5JU5E1I', N'54', N'841926', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'832', N'19', N'4', N'8', N'TNAA5I7KBM', N'88', N'981944', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'833', N'26', N'10', N'74', N'N7KXRRMDSA', N'60', N'638773', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'834', N'28', N'1', N'96', N'KV6XM98TOA', N'50', N'857755', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'835', N'9', N'2', N'81', N'TDBFZQZ72K', N'89', N'389711', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'836', N'17', N'1', N'44', N'DHTPDDZ4FQ', N'59', N'802947', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'837', N'10', N'6', N'98', N'NEA7ZUZLFZ', N'37', N'674307', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'838', N'18', N'9', N'45', N'LGSDF2EZZA', N'17', N'365191', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'839', N'15', N'2', N'7', N'SEK58QC2YM', N'42', N'456128', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'840', N'2', N'2', N'76', N'4J3DEGYEXO', N'95', N'666968', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'841', N'28', N'8', N'55', N'OZOPRZHJBB', N'8', N'451864', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'842', N'4', N'1', N'17', N'P6AVUNVSG9', N'6', N'199582', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'843', N'13', N'2', N'75', N'Y8VPNEUL5C', N'99', N'428122', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'844', N'28', N'4', N'50', N'Z8PBKATAGO', N'31', N'942821', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'845', N'10', N'7', N'1', N'FFL2OHIB9W', N'95', N'980559', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'846', N'26', N'9', N'10', N'EEHTD4QXQC', N'58', N'258805', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'847', N'4', N'9', N'19', N'C6QR799FIT', N'58', N'138223', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'848', N'2', N'5', N'69', N'VEN5EXVBZH', N'47', N'251782', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'849', N'19', N'6', N'96', N'RYNBXGHCFD', N'93', N'773669', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'850', N'1', N'9', N'79', N'SN44W28DM3', N'63', N'757613', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'851', N'19', N'3', N'73', N'LIWZ3CY1QJ', N'54', N'885948', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'852', N'23', N'7', N'95', N'4LG0NTLKAP', N'47', N'559606', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'853', N'28', N'1', N'67', N'3UZ35MSIAP', N'83', N'829784', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'854', N'23', N'7', N'39', N'56OUB0M2EK', N'32', N'956115', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'855', N'18', N'6', N'76', N'2JGGZPZFPP', N'5', N'562088', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'856', N'8', N'2', N'25', N'1EEL0DKS00', N'60', N'269377', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'857', N'3', N'10', N'93', N'TFKUCJIZ8C', N'24', N'163089', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'858', N'5', N'4', N'71', N'QAR5PYAG3N', N'56', N'968854', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'859', N'17', N'1', N'93', N'U6Q8LDM582', N'98', N'531713', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'860', N'12', N'3', N'61', N'CGAA7MQAPZ', N'86', N'613509', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'861', N'20', N'4', N'70', N'S9KPNL9F8B', N'85', N'485810', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'862', N'24', N'1', N'62', N'HEU2V8QJWC', N'22', N'737757', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'863', N'1', N'1', N'89', N'WKX76JDPVG', N'5', N'729308', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'864', N'19', N'6', N'100', N'HVUSGXG9YJ', N'76', N'620427', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'865', N'16', N'5', N'65', N'DDZVFTN7XL', N'4', N'750525', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'866', N'2', N'5', N'83', N'TPVEK2LPBX', N'11', N'904796', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'867', N'13', N'8', N'92', N'ABZTP8ZNZI', N'21', N'758192', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'868', N'29', N'7', N'71', N'K83AGWVH5X', N'35', N'660649', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'869', N'14', N'7', N'1', N'028USB040L', N'28', N'461826', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'870', N'1', N'6', N'38', N'XCO22WRSBD', N'37', N'902430', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'871', N'27', N'6', N'52', N'DPAWD7WCSN', N'42', N'183074', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'872', N'17', N'7', N'60', N'YC82EBEON4', N'27', N'392932', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'873', N'21', N'10', N'96', N'4HVFOPANCB', N'85', N'455626', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'874', N'5', N'1', N'4', N'PQ3SYU3R3V', N'23', N'135906', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'875', N'28', N'3', N'97', N'R9E8QTC233', N'51', N'444532', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'876', N'27', N'1', N'51', N'FSQYDY581W', N'18', N'890635', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'877', N'12', N'9', N'86', N'ACHSQEG3YQ', N'23', N'684425', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'878', N'20', N'6', N'88', N'E0TDB2JPU6', N'56', N'260915', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'879', N'4', N'8', N'87', N'R2S73KOT8B', N'41', N'718961', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'880', N'24', N'8', N'40', N'V4B9JCVD0F', N'95', N'114573', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'881', N'6', N'8', N'53', N'KMNR77RCUS', N'37', N'539143', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'882', N'11', N'3', N'46', N'Q7UP2QC2LX', N'22', N'435391', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'883', N'4', N'2', N'42', N'Y17ZKS2G86', N'76', N'356803', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'884', N'1', N'7', N'29', N'RIO9M9WHTV', N'13', N'834127', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'885', N'22', N'7', N'20', N'TVJTGEATX7', N'52', N'923120', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'886', N'27', N'9', N'62', N'MULCZ9BHPF', N'11', N'418109', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'887', N'24', N'1', N'74', N'RNPM1ER31E', N'39', N'343475', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'888', N'23', N'3', N'59', N'VKG3RNP2M2', N'88', N'340350', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'889', N'20', N'3', N'1', N'0UZ0I6H0OO', N'73', N'132761', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'890', N'19', N'1', N'26', N'40KHAXQHDW', N'45', N'429623', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'891', N'30', N'1', N'60', N'PJP83WCAHC', N'23', N'536797', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'892', N'11', N'1', N'40', N'MJRFAV4K7S', N'49', N'993047', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'893', N'24', N'9', N'27', N'N008HVOZ7F', N'17', N'651489', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'894', N'20', N'6', N'91', N'WSWMEAITKI', N'18', N'432266', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'895', N'20', N'9', N'97', N'NG31HEQ6Y5', N'24', N'708739', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'896', N'8', N'7', N'1', N'Y35Q51V1KM', N'66', N'629890', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'897', N'26', N'6', N'86', N'SX3KHJK8LM', N'51', N'269301', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'898', N'3', N'8', N'25', N'0CYGNSVKNE', N'47', N'195265', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'899', N'18', N'6', N'12', N'8HLCD661T7', N'52', N'920549', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'900', N'13', N'7', N'68', N'8IB9MX1T97', N'58', N'537531', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'901', N'21', N'1', N'39', N'2YZUUBRATV', N'82', N'824729', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'902', N'14', N'1', N'67', N'H1D0438Y6L', N'93', N'875545', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'903', N'11', N'8', N'73', N'C93WIK28N0', N'25', N'690843', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'904', N'19', N'9', N'57', N'MG0WZI6WWJ', N'78', N'909852', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'905', N'8', N'8', N'85', N'647A0CGLZ2', N'54', N'732358', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'906', N'9', N'1', N'24', N'AZM0OY4MVA', N'80', N'331562', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'907', N'28', N'4', N'50', N'KOURYU02RG', N'66', N'256615', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'908', N'21', N'2', N'49', N'JD200TENL1', N'87', N'860660', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'909', N'9', N'4', N'11', N'FBJ56PXCGM', N'45', N'847006', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'910', N'12', N'5', N'31', N'PYXMAUEOD3', N'62', N'600764', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'911', N'2', N'1', N'17', N'UMKAZ1NE1O', N'100', N'185028', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'912', N'1', N'9', N'68', N'PYFKJV31AF', N'1', N'105585', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'913', N'24', N'2', N'76', N'TB4G2UWADP', N'49', N'983740', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'914', N'22', N'8', N'82', N'C0JG0VLDBB', N'59', N'740342', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'915', N'25', N'7', N'10', N'7ME2E8F0M8', N'6', N'884202', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'916', N'28', N'7', N'93', N'T85AZS11B2', N'20', N'364703', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'917', N'4', N'2', N'3', N'ESJJGEPZAX', N'14', N'835976', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'918', N'21', N'6', N'57', N'AB6F7W4TC3', N'58', N'943585', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'919', N'13', N'7', N'75', N'W1Y0GKG30J', N'54', N'276261', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'920', N'21', N'2', N'4', N'GI1SXI918I', N'89', N'825324', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'921', N'9', N'3', N'89', N'SOMZ5CGRDI', N'19', N'489957', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'922', N'20', N'1', N'68', N'6VQOIS9FMC', N'71', N'752216', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'923', N'12', N'1', N'46', N'OMVX0YRZZ7', N'69', N'180777', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'924', N'2', N'1', N'6', N'GFMZ0EAZ94', N'62', N'951044', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'925', N'20', N'9', N'47', N'NC57L66S9Y', N'25', N'951720', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'926', N'2', N'1', N'47', N'5L3860ZBMO', N'44', N'842859', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'927', N'7', N'3', N'73', N'7DCXS5CUUU', N'9', N'245293', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'928', N'4', N'4', N'12', N'K3JYQSQOYS', N'94', N'900225', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'929', N'13', N'1', N'83', N'O6C0Z9PWS6', N'52', N'334219', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'930', N'20', N'6', N'84', N'CT73YGMYZ7', N'52', N'932771', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'931', N'18', N'7', N'70', N'D3OU6PE7S0', N'45', N'522030', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'932', N'16', N'9', N'53', N'QHXIFDLGVJ', N'85', N'613552', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'933', N'17', N'3', N'17', N'9R1O2DTQEU', N'18', N'616271', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'934', N'3', N'5', N'80', N'QSOPVQ6JAS', N'93', N'988155', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'935', N'17', N'4', N'71', N'YH3JXHNNPO', N'23', N'957660', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'936', N'30', N'3', N'51', N'TR5RB30916', N'78', N'764901', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'937', N'21', N'1', N'11', N'OIDQNKDPJM', N'98', N'101118', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'938', N'16', N'2', N'49', N'CIQF0G98A6', N'50', N'399234', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'939', N'16', N'9', N'27', N'9WZLLKIZY5', N'1', N'251217', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'940', N'5', N'10', N'12', N'1EYQ11WOVI', N'90', N'717019', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'941', N'16', N'7', N'67', N'W36I0MCVB9', N'81', N'928629', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'942', N'5', N'6', N'34', N'CS3MTKWK0Q', N'36', N'339893', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'943', N'26', N'8', N'58', N'MT5VFYM0V9', N'26', N'472488', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'944', N'16', N'1', N'70', N'OF4HXDJIN2', N'58', N'814981', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'945', N'12', N'5', N'81', N'B0TNH29VHJ', N'90', N'136296', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'946', N'5', N'6', N'69', N'6Z5TAS4OUO', N'15', N'946539', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'947', N'11', N'9', N'96', N'W36ZKTH14L', N'76', N'790894', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'948', N'18', N'2', N'43', N'SZDFZKPF48', N'5', N'258619', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'949', N'6', N'2', N'81', N'CIIVT13TID', N'2', N'118831', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'950', N'15', N'9', N'25', N'CF5VYFQL0T', N'17', N'455446', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'951', N'16', N'1', N'36', N'O884UQ5D5K', N'9', N'640805', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'952', N'9', N'5', N'12', N'FPQ9N66LD8', N'8', N'460300', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'953', N'8', N'1', N'8', N'X5CBLIMOV2', N'91', N'896836', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'954', N'4', N'2', N'32', N'EVWHUJX8KW', N'24', N'909504', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'955', N'16', N'9', N'5', N'13EE48C2DQ', N'87', N'480437', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'956', N'10', N'7', N'20', N'OOFTUJKBWU', N'9', N'775581', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'957', N'5', N'9', N'58', N'7WBM0KOMH0', N'9', N'426229', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'958', N'5', N'8', N'98', N'8P69AZVDM3', N'70', N'815756', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'959', N'25', N'2', N'18', N'DSSU0CIJSX', N'37', N'836889', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'960', N'25', N'5', N'22', N'WY9XK7L1BK', N'75', N'337153', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'961', N'24', N'9', N'52', N'NLWE9FQKCF', N'32', N'449309', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'962', N'23', N'5', N'65', N'IL3ZAB30ET', N'68', N'184540', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'963', N'11', N'5', N'72', N'KN2A55WP13', N'64', N'672310', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'964', N'7', N'9', N'88', N'ANZ9F6UHQU', N'4', N'451692', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'965', N'17', N'2', N'11', N'AJKD44YCBM', N'4', N'933849', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'966', N'28', N'6', N'90', N'PQUJRRE3AQ', N'75', N'623559', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'967', N'26', N'7', N'54', N'XHG5E42VBY', N'85', N'331309', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'968', N'20', N'3', N'30', N'4H6OZXNDI2', N'10', N'378575', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'969', N'23', N'6', N'88', N'BMY8801IFX', N'65', N'399510', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'970', N'11', N'4', N'17', N'1VD89H95L8', N'20', N'156507', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'971', N'16', N'7', N'83', N'8E5V9G4DJ4', N'75', N'223945', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'972', N'6', N'7', N'39', N'4VLUFCQV7V', N'85', N'120571', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'973', N'9', N'3', N'20', N'WY7512330D', N'89', N'272059', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'974', N'29', N'2', N'88', N'1O9NHYWYIC', N'58', N'643483', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'975', N'15', N'1', N'83', N'I1QQXAVU8M', N'53', N'264221', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'976', N'1', N'1', N'6', N'81IZQ5RMAP', N'61', N'793490', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'977', N'15', N'5', N'93', N'1GN93KDJWB', N'76', N'406464', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'978', N'4', N'1', N'45', N'XR69AWGWPG', N'26', N'332306', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'979', N'9', N'3', N'47', N'DT06O6PGN3', N'16', N'333082', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'980', N'6', N'4', N'11', N'IPIHN9Z3JN', N'50', N'434136', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'981', N'25', N'3', N'88', N'KXUF0AJHUS', N'8', N'327829', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'982', N'25', N'7', N'38', N'3VB9O602K3', N'83', N'406004', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'983', N'8', N'5', N'58', N'CYX37M2T5Q', N'61', N'707058', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'984', N'21', N'5', N'78', N'7BIC6ME66D', N'51', N'136933', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'985', N'20', N'8', N'85', N'8K082W1GJX', N'3', N'796481', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'986', N'9', N'9', N'33', N'XSQDWPFIWU', N'98', N'142851', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'987', N'28', N'6', N'37', N'D4RM8RTH9N', N'58', N'991124', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'988', N'11', N'4', N'37', N'0F4PT2LE9P', N'44', N'875332', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'989', N'12', N'7', N'56', N'65Q194QJ3J', N'69', N'496362', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'990', N'25', N'10', N'9', N'0W9MXFEP9T', N'31', N'317371', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'991', N'7', N'8', N'67', N'R1191BD6X4', N'43', N'881520', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'992', N'8', N'8', N'67', N'PAO4R9A9UX', N'1', N'627482', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'993', N'22', N'5', N'93', N'Q24YEDXPLD', N'93', N'807815', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'994', N'8', N'10', N'62', N'NR293O7VFV', N'17', N'887294', N'0')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'995', N'21', N'6', N'15', N'067W12YWUX', N'35', N'794940', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'996', N'22', N'7', N'86', N'MSYFWSOREH', N'85', N'752860', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'997', N'28', N'7', N'11', N'CJI28S8Q99', N'35', N'963963', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'998', N'27', N'6', N'95', N'HMYUT1IIB0', N'93', N'914634', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'999', N'6', N'6', N'26', N'FQFKY3A3AS', N'23', N'147055', N'1')
GO

INSERT INTO [dbo].[SanPhamChiTiet] ([id], [IdMauSac], [IdKichThuoc], [IdSanPham], [MaSPCT], [SoLuong], [DonGia], [TrangThai]) VALUES (N'1000', N'18', N'2', N'88', N'S2XBR6KBHC', N'31', N'353442', N'0')
GO

SET IDENTITY_INSERT [dbo].[SanPhamChiTiet] OFF
GO

COMMIT
GO


-- ----------------------------
-- Primary Key structure for table HoaDon
-- ----------------------------
ALTER TABLE [dbo].[HoaDon] ADD CONSTRAINT [PK__HoaDon__3214EC27EA23F87C] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table HoaDonChiTiet
-- ----------------------------
ALTER TABLE [dbo].[HoaDonChiTiet] ADD CONSTRAINT [PK__HoaDonCh__3214EC278F14FF91] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table KhachHang
-- ----------------------------
ALTER TABLE [dbo].[KhachHang] ADD CONSTRAINT [PK__KhachHan__3214EC27886203F4] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for KichThuoc
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[KichThuoc]', RESEED, 10)
GO


-- ----------------------------
-- Primary Key structure for table KichThuoc
-- ----------------------------
ALTER TABLE [dbo].[KichThuoc] ADD CONSTRAINT [PK__KichThuo__3214EC272A187BEF] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for MauSac
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[MauSac]', RESEED, 30)
GO


-- ----------------------------
-- Primary Key structure for table MauSac
-- ----------------------------
ALTER TABLE [dbo].[MauSac] ADD CONSTRAINT [PK__MauSac__3214EC277CD5B85E] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table NhanVien
-- ----------------------------
ALTER TABLE [dbo].[NhanVien] ADD CONSTRAINT [PK__NhanVien__3214EC27943DC82C] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for SanPham
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[SanPham]', RESEED, 100)
GO


-- ----------------------------
-- Primary Key structure for table SanPham
-- ----------------------------
ALTER TABLE [dbo].[SanPham] ADD CONSTRAINT [PK__SanPham__3214EC275BEEB21E] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for SanPhamChiTiet
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[SanPhamChiTiet]', RESEED, 1000)
GO


-- ----------------------------
-- Primary Key structure for table SanPhamChiTiet
-- ----------------------------
ALTER TABLE [dbo].[SanPhamChiTiet] ADD CONSTRAINT [PK__SanPhamC__3214EC27D0B4303A] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

