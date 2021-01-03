CREATE DATABASE Hafiz_M_Huzaifa_Khalid_215_BSCS_18
use Hafiz_M_Huzaifa_Khalid_215_BSCS_18

--Catageory
CREATE TABLE CATEGORY( 
CATEGORY_ID varchar(50) not null, 
CATEGORY_NAME varchar(50) unique NOT NULL, 
[DESCRIPTION] VARCHAR(50) NOT NULL
PRIMARY KEY (CATEGORY_ID)
);

ALTER TABLE CATEGORY
ADD Is_Deleted BIT;
ALTER TABLE CATEGORY
ADD CATEGORY_NO int NOT NULL identity(1,1);

--product
CREATE TABLE PRODUCT( 
PRODUCT_ID varchar(50) not null, 
PRODUCT_NAME varchar(50) unique NOT NULL, 
PRICE int NOT NULL, 
product_Description varchar(50) not null, 
CATEGORY_ID varchar(50) NOT NULL
Primary key (PRODUCT_ID),
FOREIGN KEY(CATEGORY_ID) REFERENCES CATEGORY(CATEGORY_ID)
);

--adding more attributes in table after making the table

ALTER TABLE Product
ADD Is_Deleted BIT;
ALTER TABLE PRODUCT
ADD PRODUCT_NO int NOT NULL identity(1,1);

--insert data in category table

insert into CATEGORY values('G875-1','PEANTS','Have multiple quality of Peants ',0);
insert into CATEGORY values('G875-0','SHRITS','Have multiple quality of Shirts ',0);


--insert data in product table

insert into PRODUCT values('J-100','jeans',1000,'good Quality Jeans in all size','G875-1',0);
insert into PRODUCT values('J-101','Black Jeans',2000,'good Quality Balck jeans in all size','G875-1',0);
insert into PRODUCT values('J-102','Blue Jeans',1050,'good Quality Blue Jeans in all size','G875-1',0);
insert into PRODUCT values('S-101','red Shirt',900,'good Quality Shrit in all size','G875-0',0);

--DROP TABLE CATEGORY
--DROP TABLE PRODUCT
SELECT* FROM PRODUCT
SELECT* FROM CATEGORY

create table CART(
CART_ID varchar(50) not null
PRIMARY KEY(CART_ID),
PRODUCT_ID varchar(50) NOT NULL,
QUANTITY int not null identity(1,1),
FOREIGN KEY(PRODUCT_ID) REFERENCES PRODUCT(PRODUCT_ID)
);
declare @QUANTITY int =1;


--insert into the Cart 
insert into CART values('C-100','J-100');
insert into CART values('C-101','J-101');
insert into CART values('C-102','J-100');

-- Count Cart Quantity hiw much data is in Cart
create procedure Cart_Quantity
As
select Count(CART_ID) as' Cart Quantity'from CART
Go;

-- drop a procedure
DROP PROCEDURE IF EXISTS [cart_quantity];

-- Testing Quries
SELECT* FROM PRODUCT
SELECT* FROM CATEGORY
SELECT* FROM CART
select *from CART as A left join Product as B on A.PRODUCT_ID=B.product_id;
EXEC cart_quantity;
select *from PRODUCT where PRODUCT_ID in( select PRODUCT_ID from CARt where CART_ID='C-100'); 

--delte procedure
create procedure delete_product_from_cart @product_id varchar(50)
	As
		delete from CART where (product_id=@product_id);

DROP PROCEDURE IF EXISTS [delete_product_from_cart];
-- calling
EXEC delete_product_from_cart  @product_id ='J-100';


-- update 
create procedure Update_Cart @cart_id varchar(50),@new_cart_id varchar(50)
As
update CART set CART_ID=@new_cart_id where (CART_ID=@cart_id)

EXEC Update_Cart @cart_id='C-1000',@new_Cart_ID='C-100';

-- customer table
 CREATE TABLE Customers
    (
        Customer_email VARCHAR(50) NOT NULL,
        Customer_Name VARCHAR(50) NOT NULL,
        Customer_Address VARCHAR(50) NOT NULL,
        Phone_number numeric(11) NOT NULL,
		Country varchar(50),
		Primary key (Customer_email),

    );
	drop table Customers
	insert into Customers values('hu75495@gmail.com','Huzaifa Khalid','15/A Multan road Lahore','01234565697','Pakistan');
	insert into Customers values('jhon75495@gmail.com','Jhon elia','124 street New York','+1012654781','America');
	insert into Customers values('ellon75495@gmail.com','Ellon','195 street Houston','+1011047895','America');

	-- order table
	   CREATE TABLE [ORDER]
    (
		Order_id VARCHAR(7) NOT NULL,
        Customer_name varchar(50) NOT NULL,
		Customer_email varchar(50) not null,
        Date_and_time datetime NOT NULL,
        order_total_price int NOT NULL,
		product_id varchar(50) not null,
		Order_status varchar(50) not null,
		Primary key (Order_id),
		FOREIGN KEY (Product_id) REFERENCES Product(product_id), 
		FOREIGN KEY (Customer_email) References Customers(Customer_email)
		
    );
	insert into [ORDER] values('O-100','huzaifa khalid','hu75495@gmail.com','2021-12-30 12:20:30',5000,'J-100','InProgress');
	insert into [ORDER] values('O-101','jhon elia','jhon75495@gmail.com','2021-11-30 1:20:30',6000,'J-102','Delivered');
	select  *from [Order] as A left join Customers as B on A.Customer_name=B.Customer_Name;  

	-- product list
	create table order_product_list(
	Order_id VARCHAR(7) not null,
	product_id varchar(50) not null,
	FOREIGN KEY (Product_id) REFERENCES Product(product_id),
	FOREIGN KEY (Order_id) REFERENCES [Order](order_id),
	);

	insert into order_product_list values('O-100','J-100');
	insert into order_product_list values('O-101','J-102');

	select *from order_product_list as A left join Product As B on A.product_id=B.PRODUCT_ID;
	select*from Product
	
-- last task of queries
--1
	update Product set Is_Deleted=1 where product_id='J-100';
--2 
	select *from Product where Is_Deleted=0 ;
--3
	create procedure Update_Name @name varchar(50),@newname varchar(50)
	As
	update Product set product_name = @newname where product_name = @name;
Exec Update_Name @name='Jeans',@newname='Cotton Peant';

--4
-- Constrains
	ALTER TABLE Product
	DROP CONSTRAINT [FK__PRODUCT__CATEGOR__286302EC];
--table 
	drop table [tabe_name];
--5
	CREATE TABLE PRODUCT( 
	PRODUCT_ID varchar(50) not null, 
	PRODUCT_NAME varchar(50) unique NOT NULL, 
	PRICE varchar(50) NOT NULL, 
	CATEGORY_ID varchar(50) NOT NULL
	FOREIGN KEY(CATEGORY_ID) REFERENCES CATEGORY(CATEGORY_ID)
	);
	ALTER TABLE Product
	ADD PRIMARY KEY (product_id);

--6
	CREATE TABLE PRODUCT1( 
	PRODUCT_ID varchar(50) not null, 
	PRODUCT_NAME varchar(50) unique NOT NULL, 
	PRICE varchar(50) NOT NULL, 
	CATEGORY_ID varchar(50) NOT NULL
	);
	ALTER Product1
	ADD FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID);
--7
	CREATE TABLE Persons (
		ID int NOT NULL UNIQUE,
		LastName varchar(255) NOT NULL,
		FirstName varchar(255),
		Age int
	);
	ALTER TABLE Persons
	ADD UNIQUE (ID);
--8
	select *from Product where product_name like '_a%';
--9
	select *from Product where product_name like '%a_';
--10
	select *from Product where product_name like '_a___';
--11
	select *from Product where product_name like '%a';
--12
select Customer_name,Order_status,Date_and_time from [Order];
--13
;
--14
	select Customer_name,Date_and_time from [Order] As A 
--15
	select Order_status,order_id from [Order] where Order_status='Cancelled';
--16
	select Order_status,order_id,Customer_name from [Order] where Order_status='Cancelled';
--17
	SELECT DISTINCT Product_Name FROM Product WHERE price > (SELECT avg(PRICE) FROM Product);
--18
	select COUNT(PRODUCT_ID) from PRODUCT;
--19
	SELECT* FROM PRODUCT
	SELECT* FROM CATEGORY
--20
	create View order_details 
	As
	select Customer_name,order_id,product_id, order_total_price from [Order] ;

	SELECT * FROM [order_details];

--21
	create view Product_details 
	As
	select PRODUCT_NAME,PRICE,product_Description,CATEGORY_ID from PRODUCT;

	SELECT * FROM [Product_details];

--22
--for product

create procedure get_list_product
As 
select *from PRODUCT;

create procedure get_by_id_product @id varchar(50)
As
select *from PRODUCT where @id=PRODUCT_ID;

create procedure Update_by_id_product @new_id varchar(50),@old_id varchar(50)
As
update PRODUCT set PRODUCT_ID=@new_id where PRODUCT_ID=@old_id;

create procedure delete_product @product_id varchar(50)
	As
delete from Product where (product_id=@product_id);

create procedure Insert_product @id varchar(50),@product_name varchar(50),@price int,@description varchar(50),@catageory_id varchar(50)
As
insert into Product values(@id,@product_name,@price,@description,@catageory_id,0)

-- catageory
create procedure get_list_catageory
As 
select *from CATEGORY;

create procedure get_by_id_CATEGORY @id varchar(50)
As
select *from CATEGORY where @id=CATEGORY_ID;

create procedure Update_by_id_CATEGORY @id varchar(50),@old_id varchar(50)
As
update CATEGORY set CATEGORY_ID=@id where CATEGORY_ID=@old_id;

create procedure delete_CATEGORY @product_id varchar(50)
	As
delete from CATEGORY where (CATEGORY_id=@product_id);

create procedure Insert_CATEGORY @id varchar(50),@CATEGORY_name varchar(50),@description varchar(50)
As
insert into CATEGORY values(@id,@CATEGORY_name,@description,0);



	
		

