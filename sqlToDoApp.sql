﻿USE [ToDoApp]
GO

--Tạo bảng Job
CREATE TABLE [dbo].[Job] (
    [ID] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [NameJob] NVARCHAR(200) NULL,
    [ToDate] DATETIME NULL,
    [FromDate] DATETIME NULL,
    [Status] INT NULL,
    [Category] NVARCHAR(100) NULL,
    [LevelJob] INT NULL,
    [Notes] NVARCHAR(1000) NULL
);

--Tạo bảng JobChild
CREATE TABLE [dbo].[JobChild] (
    [ID] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [Name] NVARCHAR(200) NULL,
    [Status] INT NULL,
    [JobID] INT NOT NULL,
);

--Thủ tục lấy tất cả dữ liệu bảng Job
CREATE PROCEDURE [dbo].[Job_GetAll]
AS
SELECT * FROM Job

--Thủ tục lấy tất cả dữ liệu bảng JobChild
CREATE PROCEDURE [dbo].[JobChild_GetAll]
AS
SELECT * FROM JobChild


--Thủ tục Insert, Update, Delete từ bảng Job
Create PROCEDURE [dbo].[Job_InsertUpdateDelete]
 @ID int output, -- Biến ID tự tăng, khi thêm xong phải lấy ra
 @NameJob nvarchar(200),
 @ToDate DateTime,
 @FromDate DateTime,
 @Status int,
 @Category nvarchar(100),
 @LevelJob Int,
 @Notes nvarchar(1000),
 @Action int -- Biến cho biết thêm, xóa, hay sửa
AS
-- Nếu Action = 0, thực hiện thêm dữ liệu
IF @Action = 0
BEGIN
INSERT INTO Job (NameJob,ToDate,FromDate, [Status],Category,LevelJob,Notes)
VALUES (@NameJob, @ToDate,@FromDate, @Status,@Category,@LevelJob,@Notes)
SET @ID = @@identity -- Thiết lập ID tự tăng
END
-- Nếu Action = 1, thực hiện cập nhật dữ liệu
ELSE IF @Action = 1
BEGIN
UPDATE Job SET NameJob = @NameJob, ToDate =@ToDate,
		FromDate =@FromDate,[Status] =@Status,Category =@Category,
		LevelJob = @LevelJob, Notes = @Notes
WHERE [ID] = @ID
END
-- Nếu Action = 2, thực hiện xóa dữ liệu
ELSE IF @Action = 2
BEGIN
DELETE FROM Job WHERE [ID] = @ID
END


--Thủ tục Insert, Update, Delete từ bảng JobChild
Create PROCEDURE [dbo].[JobChild_InsertUpdateDelete]
 @ID int output, -- Biến ID tự tăng, khi thêm xong phải lấy ra
 @Name nvarchar(200),
 @Status int,
 @JobID Int,
 @Action int -- Biến cho biết thêm, xóa, hay sửa
AS
-- Nếu Action = 0, thực hiện thêm dữ liệu
IF @Action = 0
BEGIN
INSERT INTO JobChild ([Name], [Status],JobID)
VALUES (@Name, @Status, @JobID)
SET @ID = @@identity -- Thiết lập ID tự tăng
END
-- Nếu Action = 1, thực hiện cập nhật dữ liệu
ELSE IF @Action = 1
BEGIN
UPDATE JobChild SET [Name] = @Name,[Status] =@Status,JobID =@JobID
WHERE [ID] = @ID
END
-- Nếu Action = 2, thực hiện xóa dữ liệu
ELSE IF @Action = 2
BEGIN
DELETE FROM JobChild WHERE [ID] = @ID
END


DROP TABLE IF EXISTS [dbo].[Job]; -- Xóa bảng nếu tồn tại



