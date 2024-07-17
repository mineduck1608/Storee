   CREATE DATABASE prj301_storee
GO
USE prj301_storee
GO

CREATE TABLE [vouchers] (
  [id] varchar(50) PRIMARY KEY NOT NULL,
  [value] int,
  [status] int
)
GO

CREATE TABLE [users] (
  [username] nvarchar(50) PRIMARY KEY NOT NULL,
  [password] nvarchar(50) not null,
  [mail] nvarchar(200) not null,
  [status] int,
)
GO

CREATE TABLE [products](
	[id] nvarchar(255) PRIMARY KEY NOT NULL,
	[name] nvarchar(255),
	[price] int,
	[category] nvarchar(255),
	[amount] decimal(18,0),
	[color] nvarchar(255),
	[type] nvarchar(255),
	[size] nvarchar(255),
	[status] bit,
	[picture] nvarchar(200),
)



CREATE TABLE [orders] (
  [id] varchar(50) PRIMARY KEY NOT NULL,
  [userID] nvarchar(50),
  [address] nvarchar(1000),
  [phone] integer,
  [status] nvarchar(50),
  [voucherID] varchar(50),
  [totalPrice] integer,
  constraint fr_custID FOREIGN KEY ([userID]) REFERENCES [users] ([username]),
  constraint fr_discountID FOREIGN KEY ([voucherID]) REFERENCES [vouchers] ([id])
)
GO

CREATE TABLE [orderDetails] (
  [orderID] varchar(50),
  [productID] nvarchar(255),
  constraint pk_orderDetails PRIMARY KEY ([orderID], [productID]),
  constraint fr_productID FOREIGN KEY ([productID]) REFERENCES [products] ([id]),
  constraint fr_orderID FOREIGN KEY ([orderID]) REFERENCES [orders] ([id])
)
GO

CREATE TABLE [feedback] (
  [id] varchar(50) PRIMARY KEY,
  [orderID] varchar(50),
  [feedback] nvarchar(1000),
  constraint fr_fbOrderID FOREIGN KEY ([orderID]) REFERENCES [orders] ([id])
)
GO
----------------------------------------------------------------------------------------

create trigger confirmOrder on [dbo].[orderDetails]
after insert
as
	begin
		UPDATE [dbo].[products]
		SET [amount] -= 1
		WHERE [id] in 
	   		(select [productID] from inserted)
	end
go




-----------------------------------------------------------------------------------------



-- Insert 10 users including 3 staffs
INSERT INTO users (username, password, mail, status) VALUES
('admin', 'admin', 'admin@gmail.com', 1),
('tester', 'test', 'test@gmail.com', 1),
('user001', 'password001', 'user001@gmail.com', 1),
('user002', 'password002', 'user001@gmail.com', 1),
('user003', 'password003', 'user001@gmail.com', 1),
('user004', 'password004', 'user001@gmail.com', 1),
('user005', 'password005', 'user001@gmail.com', 1),
('user006', 'password006', 'user001@gmail.com', 1),
('user007', 'password007', 'user001@gmail.com', 1),
('user008', 'password008', 'user001@gmail.com', 1),
('user009', 'password009', 'user001@gmail.com', 1),
('user010', 'password010', 'user001@gmail.com', 1);



INSERT INTO [dbo].[products]
           ([id], [name], [price], [category], [amount], [color], [type], [size], [status], [picture])
     VALUES
           ('P001', N'Men’s shirt', 300000, N'Shirt', 15, N'White', N'Shirt ', 'S', 1, N'productpicture/shirtt.png'),
		   ('P002', N'Men’s shirt', 300000, N'Shirt', 15, N'White', N'Shirt ', 'M', 1, N'productpicture/shirtt.png'),
		   ('P003', N'Men’s shirt', 300000, N'Shirt', 15, N'White', N'Shirt ', 'L', 1, N'productpicture/shirtt.png'),
		   ('P004', N'Men’s shirt', 300000, N'Shirt', 15, N'White', N'Shirt ', 'XL', 1, N'productpicture/shirtt.png'),
		   ('P005', N'Men’s shirt', 300000, N'Shirt', 15, N'Black', N'Shirt ', 'S', 1, N'productpicture/shirtt.png'),
		   ('P006', N'Men’s shirt', 300000, N'Shirt', 15, N'Black', N'Shirt ', 'M', 1, N'productpicture/shirtt.png'),
		   ('P007', N'Men’s shirt', 300000, N'Shirt', 15, N'Black', N'Shirt ', 'L', 1, N'productpicture/shirtt.png'),
		   ('P008', N'Men’s shirt', 300000, N'Shirt', 15, N'Black', N'Shirt ', 'XL', 1, N'productpicture/shirtt.png'),
		   ('P011', N'Man’s pants', 450000, N'Pant', 20, N'Black', N'Pant ', 'S', 1, N'productpicture/pantt.png'),
		   ('P012', N'Man’s pants', 450000, N'Pant', 20, N'Black', N'Pant ', 'M', 1, N'productpicture/pantt.png'),
		   ('P013', N'Man’s pants', 450000, N'Pant', 20, N'Black', N'Pant ', 'L', 1, N'productpicture/pantt.png'),
		   ('P014', N'Man’s pants', 450000, N'Pant', 20, N'Black', N'Pant ', 'XL', 1, N'productpicture/pantt.png'),
		   ('P021', N'Polo'       , 350000, N'Shirt', 10, N'White', N'Polo', 'S', 1, N'productpicture/polo.png'),
		   ('P022', N'Polo'       , 350000, N'Shirt', 10, N'White', N'Polo', 'M', 1, N'productpicture/polo.png'),
		   ('P023', N'Polo'       , 350000, N'Shirt', 10, N'White', N'Polo', 'L', 1, N'productpicture/polo.png'),
		   ('P024', N'Polo'       , 350000, N'Shirt', 10, N'White', N'Polo', 'XL', 1, N'productpicture/polo.png'),
		   ('P025', N'Polo'       , 350000, N'Shirt', 10, N'Black', N'Polo', 'S', 1, N'productpicture/polo.png'),
		   ('P026', N'Polo'       , 350000, N'Shirt', 10, N'Black', N'Polo', 'M', 1, N'productpicture/polo.png'),
		   ('P027', N'Polo'       , 350000, N'Shirt', 10, N'Black', N'Polo', 'L', 1, N'productpicture/polo.png'),
		   ('P028', N'Polo'       , 350000, N'Shirt', 10, N'Black', N'Polo', 'XL', 1, N'productpicture/polo.png'),
		   ('P031', N'Short'      , 200000, N'Pant', 25, N'White', N'Pant ', 'S', 1, N'productpicture/shortt.png'),
		   ('P032', N'Short'      , 200000, N'Pant', 25, N'Black', N'Pant ', 'M', 1, N'productpicture/shortt.png'),
		   ('P033', N'Short'      , 200000, N'Pant', 25, N'Yellow', N'Pant ', 'L', 1, N'productpicture/shortt.png'),
		   ('P034', N'Short'      , 200000, N'Pant', 25, N'Blue', N'Pant ', 'XL', 1, N'productpicture/shortt.png'),
		   ('P041', N'Chains'      , 600000, N'Accessory', 5, N'Silver', N'Chain', 'S', 1, N'productpicture/chains.png'),
		   ('P042', N'Chains'     , 600000, N'Accessory', 5, N'Silver', N'Chain', 'M', 1, N'productpicture/chains.png'),
		   ('P043', N'Chains'     , 600000, N'Accessory', 5, N'Silver', N'Chain', 'L', 1, N'productpicture/chains.png'),
		   ('P051', N'Bleu De Chanel', 2990000, N'Perfume', 5, N'Black', N'EDP', 'S', 1, N'productpicture/bleuchanel.png'),
		   ('P052', N'La Nuit De L’Homme', 2070000, N'Perfume', 5, N'Yellow', N'EDT', 'S', 1, N'productpicture/ladenuit.png'),
		   ('P053', N'Acqua Di Gio', 1817000, N'Perfume', 5, N'White', N'EDT', 'S', 1, N'productpicture/aquagio.png'),
		   ('P054', N'Bleu De Chanel', 3611000, N'Perfume', 5, N'Black', N'EDP', 'M', 1, N'productpicture/bleuchanel.png'),
		   ('P055', N'La Nuit De L’Homme', 2530000, N'Perfume', 5, N'Yellow', N'EDT', 'M', 1, N'productpicture/ladenuit.png'),
		   ('P056', N'Acqua Di Gio', 2645000, N'Perfume', 5, N'White', N'EDT', 'M', 1, N'productpicture/aquagio.png'),
		   ('P057', N'Bleu De Chanel', 4370000, N'Perfume', 5, N'Black', N'EDT', 'L', 1, N'productpicture/bleuchanel.png'),
		   ('P058', N'La Nuit De L’Homme', 3795000, N'Perfume', 5, N'Yellow', N'EDT', 'L', 1, N'productpicture/ladenuit.png'),
		   ('P059', N'Acqua Di Gio', 3565000, N'Perfume', 5, N'White', N'EDT', 'L', 1, N'productpicture/aquagio.png'),
		   ('P060', N'Terre d’Hermes', 3565000, N'Perfume', 5, N'Yellow', N'EDT', 'L', 1, N'productpicture/terrehermes.png'),
		   ('P061', N'Apple Watch 9', 3565000, N'Accessory', 5, N'Yellow', N'Watch', 'L', 1, N'productpicture/apple1.png'),
		   ('P062', N'Apple Watch SE', 3565000, N'Accessory', 5, N'Pink', N'Watch', 'L', 1, N'productpicture/apple2.png'),
		   ('P063', N'Apple Watch Ultra', 3565000, N'Accessory', 5, N'Black', N'Watch', 'L', 1, N'productpicture/apple3.png'),
		   ('P064', N'Xerjoff Naxos', 999999, N'Perfume', 5, N'White', N'EDP', 'L', 1, N'productpicture/naxos.png'),
		   ('P101', N'Creed Aventus', 888888, N'Perfume', 5, N'White', N'EDP', 'L', 1, N'productpicture/creed.png'),
		   ('P065', N'Levents Logo 2.0', 2005000, N'Shirt', 5, N'White', N'T-Shirt', 'XL', 1, N'productpicture/levents1.png'),
		   ('P066', N'Levents Popular', 300000, N'Shirt', 5, N'Red', N'T-Shirt', 'XL', 1, N'productpicture/levents2.png'),
		   ('P067', N'Levents Hoodie', 3565000, N'Shirt', 5, N'Black', N'Hoodie', 'XL', 1, N'productpicture/levent3.png'),
		   ('P068', N'Suit Pants', 3565000, N'Pant', 5, N'Gray', N'Pants', 'L', 1, N'productpicture/pant1.png'),
		   ('P069', N'Suit Pants', 3565000, N'Pant', 5, N'Black', N'Pants', 'L', 1, N'productpicture/pant2.png'),
		   ('P070', N'Belt', 75000, N'Accessory', 5, N'Black', N'Belt', 'L', 1, N'productpicture/belt1.png'),
		   ('P071', N'Belt', 75000, N'Accessory', 5, N'Brown', N'Belt', 'L', 1, N'productpicture/belt2.png'),
		   ('P072', N'Cap', 55000, N'Accessory', 5, N'Black', N'Hat', 'L', 1, N'productpicture/cap.png'),
		   ('P073', N'Bucket Hat', 100000, N'Accessory', 5, N'Black', N'Hat', 'L', 1, N'productpicture/bucket.png'),
		   ('P074', N'Bucket Hat', 100000, N'Accessory', 5, N'Brown', N'Hat', 'L', 1, N'productpicture/bucket1.png'),
		   ('P075', N'Louis Vuitton LV California Dream', 150005000, N'Perfume', 5, N'White', N'Niche', 'L', 1, N'productpicture/lv.png'),
		   ('P076', N'Santal 33', 6565000, N'Perfume', 5, N'Yellow', N'Niche', 'L', 1, N'productpicture/santal33.png'),
		   ('P077', N'Killian Angels Share', 5565000, N'Perfume', 5, N'Yellow', N'Niche', 'L', 1, N'productpicture/angelshare.png'),
		   ('P078', N'Versace Eros', 1565000, N'Perfume', 5, N'Blue', N'EDT', 'L', 1, N'productpicture/eros.png'),
		   ('P079', N'Xerjoff Mefisto', 8565000, N'Perfume', 5, N'Blue', N'Niche', 'L', 1, N'productpicture/mefisto.png'),
		   ('P080', N'LV Bag', 1565000, N'Accessory', 5, N'Brown', N'Bag', 'L', 1, N'productpicture/LVBag.png'),
   		   ('P081', N'Balo LV', 13565000, N'Accessory', 5, N'Blue', N'Bag', 'L', 1, N'productpicture/baloLV.png'),
	       ('P082', N'Carhart Jacket', 265000, N'Shirt', 5, N'Yellow', N'Jacket', 'L', 1, N'productpicture/carhartjacket.png'),
		   ('P083', N'Chromeheart Ring', 23565000, N'Accessory', 5, N'Silver', N'Ring', 'S', 1, N'productpicture/chromeheartring1.png'),
		('P084', N'Chromeheart Ring', 23565000, N'Accessory', 5, N'Silver', N'Ring', 'S', 1, N'productpicture/chromeheartring2.png'),
		('P085', N'Chromeheart Ring', 23565000, N'Accessory', 5, N'Silver', N'Ring', 'S', 1, N'productpicture/chromeheartring3.png'),
		('P086', N'Dickies Tee', 565000, N'Shirt', 5, N'Cream', N'Tee', 'L', 1, N'productpicture/dickiestee1.png'),
		('P087', N'Dickies Tee', 465000, N'Shirt', 5, N'Brown', N'Tee', 'L', 1, N'productpicture/dickiestee2.png'),
		('P088', N'Dickies Tee', 565000, N'Shirt', 5, N'White', N'Tee', 'L', 1, N'productpicture/dickiestee3.png'),
		('P089', N'Gentle Monster Glasses', 4565000, N'Accessory', 5, N'Black', N'Glasses', 'M', 1, N'productpicture/gentlemonster1.png'),
		('P090', N'Gentle Monster Glasses', 4565000, N'Accessory', 5, N'White', N'Glasses', 'M', 1, N'productpicture/gentlemonster2.png'),
		('P091', N'Gentle Monster Glasses', 4565000, N'Accessory', 5, N'Black', N'Glasses', 'M', 1, N'productpicture/gentlemonster3.png'),
		('P092', N'Gentle Monster Glasses', 5565000, N'Accessory', 5, N'Black', N'Glasses', 'M', 1, N'productpicture/gentlemonster4.png'),
		('P093', N'Nike Jordan High', 23565000, N'Accessory', 5, N'Blue', N'Shoes', 'L', 1, N'productpicture/nikeblue.png'),
		('P094', N'Nike Jordan', 933565000, N'Accessory', 5, N'Blue', N'Shoes', 'L', 1, N'productpicture/nikejordan.png'),
		('P095', N'Rolex Watch', 96565000, N'Accessory', 5, N'White', N'Watch', 'L', 1, N'productpicture/rolex1.png'),
		('P096', N'Rolex Watch', 95565000, N'Accessory', 5, N'White', N'Watch', 'L', 1, N'productpicture/rolex2.png'),
		('P097', N'Rolex Watch', 94565000, N'Accessory', 5, N'White', N'Watch', 'L', 1, N'productpicture/rolex3.png'),
		('P098', N'Rolex Watch', 93565000, N'Accessory', 5, N'White', N'Watch', 'L', 1, N'productpicture/rolex4.png'),
		('P099', N'LV Chains', 3565000, N'Accessory', 5, N'White', N'Chains', 'L', 1, N'productpicture/vongtayLV.png'),
		('P100', N'Chromeheart Ring', 23565000, N'Accessory', 5, N'Silver', N'Ring', 'S', 1, N'productpicture/chromeheartring2.png'),
		('P185', N'Chromeheart Ring', 23565000, N'Accessory', 5, N'Silver', N'Ring', 'S', 1, N'productpicture/chromeheartring3.png'),
		('P186', N'Dickies Tee', 565000, N'Shirt', 5, N'Cream', N'Tee', 'L', 1, N'productpicture/dickiestee1.png'),
		('P187', N'Dickies Tee', 465000, N'Shirt', 5, N'Brown', N'Tee', 'L', 1, N'productpicture/dickiestee2.png'),
		('P188', N'Dickies Tee', 565000, N'Shirt', 5, N'White', N'Tee', 'L', 1, N'productpicture/dickiestee3.png'),
		('P189', N'Gentle Monster Glasses', 4565000, N'Accessory', 5, N'Black', N'Glasses', 'M', 1, N'productpicture/gentlemonster1.png'),
		('P190', N'Gentle Monster Glasses', 4565000, N'Accessory', 5, N'White', N'Glasses', 'M', 1, N'productpicture/gentlemonster2.png'),
		('P191', N'Gentle Monster Glasses', 4565000, N'Accessory', 5, N'Black', N'Glasses', 'M', 1, N'productpicture/gentlemonster3.png'),
		('P192', N'Gentle Monster Glasses', 5565000, N'Accessory', 5, N'Black', N'Glasses', 'M', 1, N'productpicture/gentlemonster4.png'),
		('P193', N'Nike Jordan High', 23565000, N'Accessory', 5, N'Blue', N'Shoes', 'L', 1, N'productpicture/nikeblue.png'),
		('P194', N'Nike Jordan', 933565000, N'Accessory', 5, N'Blue', N'Shoes', 'L', 1, N'productpicture/nikejordan.png'),
		('P195', N'Rolex Watch', 96565000, N'Accessory', 5, N'White', N'Watch', 'L', 1, N'productpicture/rolex1.png'),
		('P196', N'Rolex Watch', 95565000, N'Accessory', 5, N'White', N'Watch', 'L', 1, N'productpicture/rolex2.png'),
		('P197', N'Rolex Watch', 94565000, N'Accessory', 5, N'White', N'Watch', 'L', 1, N'productpicture/rolex3.png'),
		('P198', N'Rolex Watch', 93565000, N'Accessory', 5, N'White', N'Watch', 'L', 1, N'productpicture/rolex4.png'),
		('P199', N'LV Chains', 3565000, N'Accessory', 5, N'White', N'Chains', 'L', 1, N'productpicture/vongtayLV.png'),
		('P161', N'Apple Watch 9', 3565000, N'Accessory', 5, N'Yellow', N'Watch', 'L', 1, N'productpicture/apple1.png'),
		   ('P262', N'Apple Watch SE', 3565000, N'Accessory', 5, N'Pink', N'Watch', 'L', 1, N'productpicture/apple2.png'),
		   ('P263', N'Apple Watch Ultra', 3565000, N'Accessory', 5, N'Black', N'Watch', 'L', 1, N'productpicture/apple3.png'),
		   ('P264', N'Xerjoff Naxos', 999999, N'Perfume', 5, N'White', N'EDP', 'L', 1, N'productpicture/naxos.png'),
		   ('P201', N'Creed Aventus', 888888, N'Perfume', 5, N'White', N'EDP', 'L', 1, N'productpicture/creed.png'),
		   ('P265', N'Levents Logo 2.0', 2005000, N'Shirt', 5, N'White', N'T-Shirt', 'XL', 1, N'productpicture/levents1.png'),
		   ('P266', N'Levents Popular', 300000, N'Shirt', 5, N'Red', N'T-Shirt', 'XL', 1, N'productpicture/levents2.png'),
		   ('P267', N'Levents Hoodie', 3565000, N'Shirt', 5, N'Black', N'Hoodie', 'XL', 1, N'productpicture/levent3.png'),
		   ('P268', N'Suit Pants', 3565000, N'Pant', 5, N'Gray', N'Pants', 'L', 1, N'productpicture/pant1.png'),
		   ('P269', N'Suit Pants', 3565000, N'Pant', 5, N'Black', N'Pants', 'L', 1, N'productpicture/pant2.png'),
		   ('P270', N'Belt', 75000, N'Accessory', 5, N'Black', N'Belt', 'L', 1, N'productpicture/belt1.png'),
		   ('P271', N'Belt', 75000, N'Accessory', 5, N'Brown', N'Belt', 'L', 1, N'productpicture/belt2.png'),
		   ('P272', N'Cap', 55000, N'Accessory', 5, N'Black', N'Hat', 'L', 1, N'productpicture/cap.png'),
		   ('P273', N'Bucket Hat', 100000, N'Accessory', 5, N'Black', N'Hat', 'L', 1, N'productpicture/bucket.png'),
		   ('P274', N'Bucket Hat', 100000, N'Accessory', 5, N'Brown', N'Hat', 'L', 1, N'productpicture/bucket1.png'),
		   ('P275', N'Louis Vuitton LV California Dream', 150005000, N'Perfume', 5, N'White', N'Niche', 'L', 1, N'productpicture/lv.png'),
		   ('P276', N'Santal 33', 6565000, N'Perfume', 5, N'Yellow', N'Niche', 'L', 1, N'productpicture/santal33.png'),
		   ('P277', N'Killian Angels Share', 5565000, N'Perfume', 5, N'Yellow', N'Niche', 'L', 1, N'productpicture/angelshare.png'),
		   ('P278', N'Versace Eros', 1565000, N'Perfume', 5, N'Blue', N'EDT', 'L', 1, N'productpicture/eros.png'),
		   ('P279', N'Xerjoff Mefisto', 8565000, N'Perfume', 5, N'Blue', N'Niche', 'L', 1, N'productpicture/mefisto.png'),
		   ('P280', N'LV Bag', 1565000, N'Accessory', 5, N'Brown', N'Bag', 'L', 1, N'productpicture/LVBag.png'),
   		   ('P281', N'Balo LV', 13565000, N'Accessory', 5, N'Blue', N'Bag', 'L', 1, N'productpicture/baloLV.png'),
	       ('P282', N'Carhart Jacket', 265000, N'Shirt', 5, N'Yellow', N'Jacket', 'L', 1, N'productpicture/carhartjacket.png'),
		   ('P283', N'Chromeheart Ring', 23565000, N'Accessory', 5, N'Silver', N'Ring', 'S', 1, N'productpicture/chromeheartring1.png')

GO


insert vouchers values (N'no', 0, 1)
insert vouchers values (N'VC-1', 30000, 1)
insert vouchers values (N'VC-2', 30000, 1)
insert vouchers values (N'VC-3', 30000, 1)
insert vouchers values (N'VC-4', 30000, 1)

select * from orders

select * from orderDetails

select * from products
