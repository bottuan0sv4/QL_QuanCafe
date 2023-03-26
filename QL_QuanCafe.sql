﻿Create database QL_QuanCafe
Go

Use QL_QuanCafe
Go

-- Food
-- Table
-- FoodCategory
-- Account
-- Bill
-- BillInfo


CREATE Table TableFood
(
	id int identity primary key,
	name nvarchar(100) not null default N'Chưa đặt tên',
	status nvarchar(100) not null default N'Trống',	-- Trống \\ Có người

)
GO


Create table Account
(
UserName nvarchar(100) primary key,
	DisplayName nvarchar(100) not null default N'...',
	PassWord nvarchar(1000) not null,
	Type int not null default 0 -- 1:admin && 0:staff
)
Go

Create table FoodCategory
(
	id int identity primary key,
	name nvarchar(100) not null default N'Chua dat ten',
)
Go

Create table Food
(
	id int identity primary key,
	name nvarchar(100) not null default N'Chua dat ten',
	idCategory int not null,
	price float not null default 0

	Foreign key (idCategory) references dbo.FoodCategory(id)
)
Go

Create table Bill
(
	id int identity primary key,
	DateCheckIn Date not null default getdate(),
	DateCheckOut Date,
	idTable Int not null,
	status int not null default 0, -- 1 : da thanh toan && 0: chua thanh toan

	Foreign key (idTable) references dbo.TableFood(id)
)
Go

Create table BillInfo
(
	id int identity primary key,
	idBill int not null,
	idFood int not null,
	count int not null default 0

	Foreign key (idBill) references dbo.Bill(id),
	Foreign key (idFood) references dbo.Food(id)
)
GO

INSERT INTO dbo.Account
(
    UserName,
    DisplayName,
    PassWord,
    Type
)
VALUES
(   N'0sv4', -- UserName - nvarchar(100)
    N'D.A.Tuan', -- DisplayName - nvarchar(100)
    N'1', -- PassWord - nvarchar(1000)
    1    -- Type - int
    )

INSERT INTO dbo.Account
(
    UserName,
    DisplayName,
    PassWord,
    Type
)
VALUES
(   N'staff', -- UserName - nvarchar(100)
    N'staff', -- DisplayName - nvarchar(100)
    N'1', -- PassWord - nvarchar(1000)
    0    -- Type - int
    )
GO


CREATE PROC USP_GetAccountByUserName
@userName nvarchar(100)
AS
BEGIN
	SELECT * FROM dbo.Account WHERE UserName = @userName
END
GO

EXEC dbo.USP_GetAccountByUserName @userName = N'0sv4' -- nvarchar(100)
GO

CREATE PROC  USP_Login
@userName NVARCHAR(100), @passWord NVARCHAR(100)
AS
BEGIN
	SELECT * FROM dbo.Account WHERE UserName = @userName AND PassWord = PassWord
END
GO


DECLARE @i INT = 0
WHILE @i <= 10
BEGIN
	INSERT dbo.TableFood(name)VALUES(N'Bàn ' + CAST(@i AS NVARCHAR(100)))
	SET @i = @i + 1
END
GO


CREATE PROC USP_GetTableList
AS SELECT * FROM dbo.TableFood
GO

EXEC dbo.USP_GetTableList
GO

-- them category
INSERT dbo.FoodCategory
(
    name
)
VALUES
(N'Hải sản' -- name - nvarchar(100)
    )
INSERT dbo.FoodCategory
(
    name
)
VALUES
(N'Nông sản' -- name - nvarchar(100)
    )
INSERT dbo.FoodCategory
(
    name
)
VALUES
(N'Lâm sản' -- name - nvarchar(100)
    )
INSERT dbo.FoodCategory
(
    name
)
VALUES
(N'Nước' -- name - nvarchar(100)
    )

-- Them mon an

INSERT dbo.Food
(
    name,
    idCategory,
    price
)
VALUES
(   N'Mực một nắng nước sa tế', -- name - nvarchar(100)
    1,       -- idCategory - int
    120000  -- price - float
    )

INSERT dbo.Food
(
    name,
    idCategory,
    price
)
VALUES
(   N'Ngêu hấp xả', -- name - nvarchar(100)
    1,       -- idCategory - int
    50000  -- price - float
    )

INSERT dbo.Food
(
    name,
    idCategory,
    price
)
VALUES
(   N'Dê nướng', -- name - nvarchar(100)
    2,       -- idCategory - int
    50000  -- price - float
    )

INSERT dbo.Food
(
    name,
    idCategory,
    price
)
VALUES
(   N'Lợn rừng', -- name - nvarchar(100)
    2,       -- idCategory - int
    50000  -- price - float
    )

INSERT dbo.Food
(
    name,
    idCategory,
    price
)
VALUES
(   N'Nấm', -- name - nvarchar(100)
    3,       -- idCategory - int
    50000  -- price - float
    )

INSERT dbo.Food
(
    name,
    idCategory,
    price
)
VALUES
(   N'Sting', -- name - nvarchar(100)
    4,       -- idCategory - int
    10000  -- price - float
    )

INSERT dbo.Food
(
    name,
    idCategory,
    price
)
VALUES
(   N'Cafe', -- name - nvarchar(100)
    4,       -- idCategory - int
    20000  -- price - float
    )

-- Thêm bill
INSERT dbo.Bill
(
    DateCheckIn,
    DateCheckOut,
    idTable,
    status
)
VALUES
(   DEFAULT, -- DateCheckIn - date
    NULL,    -- DateCheckOut - date
    1,       -- idTable - int
    0  -- status - int
    )

INSERT dbo.Bill
(
    DateCheckIn,
    DateCheckOut,
    idTable,
    status
)
VALUES
(   DEFAULT, -- DateCheckIn - date
    NULL,    -- DateCheckOut - date
    2,       -- idTable - int
    0  -- status - int
    )

INSERT dbo.Bill
(
    DateCheckIn,
    DateCheckOut,
    idTable,
    status
)
VALUES
(   DEFAULT, -- DateCheckIn - date
    DEFAULT,    -- DateCheckOut - date
    2,       -- idTable - int
    0  -- status - int
    )

INSERT dbo.Bill
(
    DateCheckIn,
    DateCheckOut,
    idTable,
    status
)
VALUES
(   GETDATE(), -- DateCheckIn - date
    GETDATE(),    -- DateCheckOut - date
    3,       -- idTable - int
    1  -- status - int
    )


-- thêm bill info

INSERT dbo.BillInfo
(
    idBill,
    idFood,
    count
)
VALUES
(   1,      -- idBill - int
    1,      -- idFood - int
    2 -- count - int
    )

INSERT dbo.BillInfo
(
    idBill,
    idFood,
    count
)
VALUES
(   1,      -- idBill - int
    3,      -- idFood - int
    4 -- count - int
    )

INSERT dbo.BillInfo
(
    idBill,
    idFood,
    count
)
VALUES
(   2,      -- idBill - int
    1,      -- idFood - int
    2 -- count - int
    )

INSERT dbo.BillInfo
(
    idBill,
    idFood,
    count
)
VALUES
(   3,      -- idBill - int
    5,      -- idFood - int
    2 -- count - int
    )

GO
    

CREATE PROC USP_InsertBill
@idTable INT
AS
BEGIN
    INSERT dbo.Bill
    (
        DateCheckIn,
        DateCheckOut,
        idTable,
        status,
		discount
    )
    VALUES
    (   DEFAULT, -- DateCheckIn - date
        NULL,    -- DateCheckOut - date
        @idTable,       -- idTable - int
        DEFAULT,  -- status - int
		0
        )
END
GO


CREATE PROC USP_InsertBillInfo
@idBill INT, @idFood INT ,@count INT
AS
BEGIN

	DECLARE @isExitsBillInfo INT
	DECLARE @foodCount INT = 1

	SELECT @isExitsBillInfo = id, @foodCount = count FROM dbo.BillInfo WHERE idBill = @idBill AND idFood = @idFood


	IF(@isExitsBillInfo > 0)
	BEGIN
		DECLARE @newCount INT = @foodCount + @count
		IF(@newCount > 0)
			UPDATE dbo.BillInfo SET count = @foodCount + @count WHERE idFood = @idFood
		ELSE
			DELETE dbo.BillInfo WHERE idBill = @idBill AND idFood = @idFood
	END
	ELSE
	BEGIN
	    
		INSERT dbo.BillInfo
		(
			idBill,
			idFood,
			count
		)
		VALUES
		(   @idBill,      -- idBill - int
			@idFood,      -- idFood - int
			@count -- count - int
			)
	END

END
GO



CREATE TRIGGER UTG_UpdateBillInfo
ON dbo.BillInfo FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @idBill INT

	SELECT @idBill = idBill FROM Inserted

	DECLARE @idTable INT

	SELECT @idTable = idTable FROM dbo.Bill WHERE id = @idBill AND status = 0


	DECLARE @count INT
	SELECT @count = COUNT(*) FROM dbo.BillInfo WHERE idBill = @idBill

	IF(@count > 0)
		UPDATE dbo.TableFood SET status = N'Co nguoi' WHERE id = @idTable
	ELSE
		UPDATE dbo.TableFood SET status = N'Trong' WHERE id = @idTable
END
GO

CREATE TRIGGER UTG_UpdateBill
ON dbo.Bill FOR UPDATE
AS
BEGIN
	DECLARE @idBill INT
	
	SELECT @idBill = id FROM Inserted

	DECLARE @idTable INT

	SELECT @idTable = idTable FROM dbo.Bill WHERE id = @idBill 

	DECLARE @count int = 0

	SELECT @count = COUNT(*) FROM dbo.Bill WHERE idTable = @idTable AND status = 0

	IF(@count = 0)
		UPDATE dbo.TableFood SET status = N'Trong' WHERE id = @idTable
END
GO


ALTER TABLE dbo.Bill
ADD discount INT

UPDATE dbo.Bill SET discount = 0
GO


CREATE PROC USP_SwitchTable
@idTable1 int, @idTable2 INT
AS
BEGIN
	DECLARE @idFirstBill INT
    DECLARE @idSecondBill INT

	DECLARE @isFirstTablEmty INT = 1
	DECLARE @isSecondTablEmty INT = 1


	SELECT @idFirstBill = id FROM dbo.Bill WHERE idTable = @idTable1 AND status = 0
	SELECT @idSecondBill = id FROM dbo.Bill WHERE idTable = @idTable2 AND status = 0

	IF (@idFirstBill is NULL)
	BEGIN
	    INSERT dbo.Bill
	    (
	        DateCheckIn,
	        DateCheckOut,
	        idTable,
	        status
	    )
	    VALUES
	    (   DEFAULT, -- DateCheckIn - date
	        NULL,    -- DateCheckOut - date
	        @idTable1,       -- idTable - int
	        0  -- status - int
	        )

		SELECT @idFirstBill = MAX(id) FROM dbo.Bill WHERE idTable = @idTable1 AND status = 0

	END

	SELECT @isFirstTablEmty = COUNT(*) FROM dbo.BillInfo WHERE idBill = @idFirstBill

	IF (@idSecondBill IS NULL)
	BEGIN
	    INSERT dbo.Bill
	    (
	        DateCheckIn,
	        DateCheckOut,
	        idTable,
	        status
	    )
	    VALUES
	    (   DEFAULT, -- DateCheckIn - date
	        NULL,    -- DateCheckOut - date
	        @idTable2,       -- idTable - int
	        0  -- status - int
	        )

		SELECT @idSecondBill = MAX(id) FROM dbo.Bill WHERE idTable = @idTable2 AND status = 0

	END

	SELECT @isSecondTablEmty = COUNT(*) FROM dbo.BillInfo WHERE idBill = @idSecondBill


	SELECT id INTO IDBillInfoTable FROM dbo.BillInfo WHERE idBill = @idSecondBill

	UPDATE dbo.BillInfo SET idBill = @idSecondBill WHERE idBill = @idFirstBill

	UPDATE dbo.BillInfo SET idBill = @idFirstBill WHERE id IN (SELECT * FROM dbo.IDBillInfoTable)

	DROP TABLE dbo.IDBillInfoTable

	IF (@isFirstTablEmty = 0)
		UPDATE dbo.TableFood SET status = N'Trong' WHERE id = @idTable2

	IF (@isSecondTablEmty = 0)
		UPDATE dbo.TableFood SET status = N'Trong' WHERE id = @idTable1
END
GO

ALTER TABLE dbo.Bill ADD totalPrice FLOAT
GO


CREATE PROC USP_GetListBillByDate
@checkIn date, @checkOut date
AS
BEGIN
    SELECT t.name AS [Tên bàn], DateCheckIn AS [Ngày vào], DateCheckOut AS [Ngày ra],  discount AS [Giảm giá (%)], b.totalPrice AS [Tổng tiền]
	FROM dbo.Bill AS b, dbo.TableFood AS t
	WHERE DateCheckIn >= @checkIn AND DateCheckOut <= @checkOut AND b.status = 1 AND t.id = b.idTable
END
GO