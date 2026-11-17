create database hexaware;
use hexaware;

CREATE TABLE Items (
    Item_ID INT PRIMARY KEY,
    Item_Name VARCHAR(50) NOT NULL,
    Category VARCHAR(30),
    Price DECIMAL(10,2),
    Quantity INT,
    Supplier_Name VARCHAR(50),
    Purchase_Date DATE,
    Status VARCHAR(20)
);

INSERT INTO Items VALUES

(1, 'Laptop', 'Electronics', 55000, 10, 'ABC Traders', '2026-01-10', 'Available'),

(2, 'Mouse', 'Accessories', 500, 50, 'XYZ Suppliers', '2026-01-12', 'Available'),

(3, 'Keyboard', 'Accessories', 1200, 30, 'ABC Traders', '2026-01-15', 'Unavailable'),

(4, 'Printer', 'Electronics', 15000, 5, 'Tech World', '2026-01-18', 'Available'),

(5, 'Chair', 'Furniture', 2500, 20, 'Office Mart', '2026-01-20', 'Out of Stock'),

(6, 'Table', 'Furniture', 4500, 15, 'Home Decor', '2026-02-01', 'Available'),

(7, 'Monitor', 'Electronics', 12000, 12, 'Tech World', '2026-02-05', 'Unavailable'),

(8, 'Headphones', 'Accessories', 1800, 25, 'Sound Hub', '2026-02-08', 'Pending'),

(9, 'Mobile', 'Electronics', 25000, 8, 'ABC Traders', '2026-02-10', 'Available'),

(10, 'USB Cable', 'Accessories', 250, 100, 'XYZ Suppliers', '2026-02-12', 'Out of Stock'),

(11, 'Notebook', 'Stationery', 80, 200, 'Paper House', '2026-02-15', 'Available'),

(12, 'Pen', 'Stationery', 20, 500, 'Paper House', '2026-02-18', 'Unavailable'),

(13, 'Scanner', 'Electronics', 8500, 6, 'Tech World', '2026-03-01', 'Available'),

(14, 'Bookshelf', 'Furniture', 6000, 4, 'Office Mart', '2026-03-05', 'Discontinued'),

(15, 'Webcam', 'Accessories', 2200, 18, 'Sound Hub', '2026-03-08', 'Available'),

(16, 'Tablet', 'Electronics', 30000, 7, 'ABC Traders', '2026-03-10', 'Pending'),

(17, 'Office Desk', 'Furniture', 7500, 9, 'Home Decor', '2026-03-12', 'Available'),

(18, 'Marker', 'Stationery', 50, 150, 'Paper House', '2026-03-15', 'Out of Stock'),

(19, 'Speaker', 'Accessories', 3500, 14, 'Sound Hub', '2026-03-18', 'Discontinued'),

(20, 'Projector', 'Electronics', 40000, 3, 'Tech World', '2026-03-20', 'Available');
 
 select * from Items;
 
 Select Item_Name,Category From Items;
 
Select * from Items where Status = "Available";
 
 Select Item_Name,Category,(Price * Quantity) as totalamount From Items;
 
 Select * from Items where Supplier_Name = "ABC Traders";
 
 Select min(Price) from Items;
 Select max(Price) from Items;
 Select avg(Price) from Items;
 Select count(Price) from Items;
 
 Select count(*) from Items where Status = "Out of Stock";
 
 
 Select * from Items where price >=100 and price<=200 ;
 
 Select * from Items where Status in ('Pending','Available');
 
 Select * from Items where Supplier_Name = "ABC Traders";
 
 Select * from Items where Status = "Available";
 
 Select * from Items where Price = 2500;
 
 Select * from Items where Item_Name = "Electronics" and Price > 10000;
 
 Select * from Items where Category = 'Furniture' or Category = 'Stationery';
  
 Select * from Items where Status = "Unavailable";
 
 Select * from Items where Price > 1000 and Quantity > 10;
 
 Select * from Items where Price  between 1000 and 10000;
 
 Select * from Items where Quantity  between 10 and 50;
 
 Select * from Items where Purchase_Date  between '2026-02-01' and '2026-03-01';
   
 Select * from Items where NOT Price  between 500 and 5000;
 
 Select * from Items where Category IN ('Electronics', 'Furniture', 'Accessories');
 
 Select * from Items where Supplier_Name IN ('ABC Traders', 'Tech World', 'Sound Hub');
 
 Select * from Items where Status IN ('Available', 'Pending', 'Unavailable');
 
 Select * from Items where Category NOT IN ('Electronics', 'Furniture');
 
 Select * from Items where Item_Name like 'M%' ;
 Select * from Items where Item_Name like '%r' ;
 Select * from Items where Item_Name like '%oo%' ;
 Select * from Items where Item_Name like 'S%' ;
 Select * from Items where Supplier_Name like 'A%' ;
 Select * from Items where Item_Name LIKE '_____';
 
 Select * from Items where Supplier_Name IS NULL;
 
 Select * from Items where Status IS NOT NULL;
 
 Select * from Items where Price IS NULL;
 
 Select * from Items where Quantity IS NOT NULL;
 
 Select * from Items Order by Price asc;
 
 Select * from Items Order by Quantity desc; 
 
 Select * from Items where Category = 'Electronics' AND Price BETWEEN 10000 AND 50000;
 
 Select * from Items where Supplier_Name = 'ABC Traders' AND Status = 'Available';
 
 Select * from Items where Item_Name LIKE 'P%' AND Price > 1000;
 
 Select * from Items order by Price DESC LIMIT 5;
 
 Select * from Items order by Purchase_Date DESC;
 
Update Items set Quantity = Quantity + 5 where Item_Name = 'Laptop';
Update Items set Price = Price + 500 where Supplier_Name = 'ABC Traders';
Update Items set Price = Price - 10 where Category = 'Furniture';

Update Items set Price = 60000 where Item_Name = 'Laptop';

Update Items set Quantity = 100 where Item_Name = 'Mouse';

Update Items set Status = 'Available' where Item_Name = 'Keyboard';

Update Items set Supplier_Name = 'ABC Electronics' where Supplier_Name = 'ABC Traders';

Update Items set Price = Price + (Price * 10 / 100);

Delete from Items where Item_ID = 5;

Delete from Items where Status = 'Unavailable';

Delete from Items where Quantity < 10;
 