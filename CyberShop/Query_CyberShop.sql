<--Card-->
Select * from Cart
Insert into Cart (CustomerID,ProductID,Quanlity) values ('','','')
Update Cart set Quanlity = '' where ProductID = '' and CustomerID = ''
Delete from Cart where ProductID = '' and CustomerID = ''
Delete from Cart where CustomerID = ''
<--Band-->
Select * from Brand
Insert into Brand (BrandName,ImageURL) values ('','')
Delete from Brand where BrandID = ''
Update Brand set ImageURL = '' , BrandName = '' where BrandID =''
<--Promotion-->
Select * from Promotion where UsedTurn > 0 and EndTime > CURRENT_TIMESTAMP and StartTime < CURRENT_TIMESTAMP
Insert into Promotion (PromoCode,Discount,StartTime,EndTime,UsedTurn) values ('','','','','')
Update Promotion set PromoCode = '' , Discount = '' , StartTime ='' , EndTime = '' ,UsedTurn =''
Delete from Promotion where PromoID = ''
<--Customer-->
Select * from Customer
Insert into Customer (Username,Password,Fullname,Sex,Address,Email,Phone,Token,IsGuest,Status,DateRegistration,DOB) 
values ('','','','','','','','','','','','')
Update Customer set Fullname= '',Sex ='',Address='',Email='',Phone='',DOB='' where CustomerID = ''
Update Customer set Password = '' where CustomerID=''
Update Customer set Status = ''
<--Banner--
Select * from Banner
Insert into Banner (ProductID) values ('')
Delete from Banner where BanerID = ''
<--Category-->
Select * from Category where Type = '1'
Select * from Category where Type = '0'
Insert into Category (CateName,Type) values('','')
Update Category set CateName = '' , Type = '' where CateID =''
Delete from Category where CateID =''
<--Store Information --
Select TOP 1 * from StoreInfomation
Update StoreInfomation set StoreName = '' , Address ='' ,Phone1 ='' ,Phone2 ='' ,Location_X ='',Location_Y = '';
<--Admin table-->
<--Create Admin-->
Insert into Admin (Role, Username, Password, Fullname, Age, Phone, Email, Address, Sex)
values ('Admin', 'kevinz', '123456', 'kevinz nguyen', '22', '0123654789', 'kevinz@gmail', '159/357', 1);

<--Get Admin Profile-->
Select Role,Fullname,Age,Phone,Email,Address,Sex From Admin Where Username = 'thanhloc' AND Password = '123456789'

<--Update Admin Profile-->
Update Admin Set Fullname = 'thanh loc', Age = '23', Phone = '0111111111', Email = 'loc113@gmail.com', Address = 'qtsc9' Where Username = 'thanhloc'

<--Update Admin Password-->
Update Admin Set Password = '881997' Where Username = 'thanhloc'


<--Product table-->
<--Create Product-->
Insert into Product(CategoryID, ProductName, Detail, Price, Quantity,Sell, BrandID)
values ('1', 'gtx', 'this is gtx', 10000, 30, 0, 1);

Select SCOPE_IDENTITY()
Insert into Images(UrlImage, ProductID, MainImage)
values ('url', 2, 0);

<--Get Product by Category-->
Select * From Product pro, Category cat Where cat.CateName = 'Ram' and cat.CateID = pro.CategoryID

<--Get Product by Brand-->
Select * From Product pro, Brand br Where br.BrandID = pro.BrandID and br.BrandName = 'Asus'

<--Disable Product-->
Update Product Set Status = 1 Where ProductID = 1

<--Update Product-->
Update Product Set Detail = '', DownPrice = 1, Quantity = 10 Where ProductID = 1

<--Update Sell-->
Update Product Set Sell = 10 Where ProductID = 1

<--Order-->
<--Insert Order-->
Insert into [Order](CustomerID, PromotionID, ShipAddress, Total, Status, OrderDate, DeliveryFee)
values (1, 1, '123/456', 10000, 0, '4/4/2019', 1000);

Insert into OrderDetail(OrderID, ProductID, Quantity, Price)
values (SCOPE_IDENTITY(), 1, 10, 10000)

<--Set Order Status-->
Update [Order] Set Status = 1 Where OrderID = 1

<--Get all Order-->
Select * From [Order],OrderDetail od Where [Order].OrderID = od.OrderID
Select * From OrderDetail Where OrderDetailID = 1
select * from Product Where ProductID = 1



