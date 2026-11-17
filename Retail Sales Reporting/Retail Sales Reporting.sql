create database retailsales;

use retailsales;

create table customers (
    customerid int primary key,
    firstname varchar(50),
    lastname varchar(50),
    city varchar(50)
);

create table products (
    productid int primary key,
    productname varchar(100),
    category varchar(50),
    price decimal(10,2)
);

create table orders (
    orderid int primary key,
    customerid int,
    orderdate date,
    paymentstatus varchar(30),
    foreign key (customerid) references customers(customerid)
);

create table orderitems (
    itemid int primary key,
    orderid int,
    productid int,
    quantity int,
    unitprice decimal(10,2),
    foreign key (orderid) references orders(orderid),
    foreign key (productid) references products(productid)
);

insert into customers values
(1, 'sona', 'kumar', 'chennai'),
(2, 'riya', 'sharma', 'bangalore'),
(3, 'arun', 'kumar', 'chennai'),
(4, 'priya', 'raj', 'mumbai'),
(5, 'rahul', 'verma', 'bangalore'),
(6, 'divya', 'sri', 'hyderabad'),
(7, 'kavin', 'raj', 'chennai'),
(8, 'meena', 'devi', 'mumbai'),
(9, 'ajay', 'kumar', 'hyderabad'),
(10, 'karthik', 'ram', 'delhi');

insert into products values
(101, 'laptop', 'electronics', 50000),
(102, 'mobile', 'electronics', 20000),
(103, 'keyboard', 'accessories', 1000),
(104, 'mouse', 'accessories', 500),
(105, 'chair', 'furniture', 5000),
(106, 'table', 'furniture', 8000),
(107, 'headphones', 'electronics', 2500),
(108, 'notebook', 'stationery', 100);

insert into orders values
(1001, 1, '2026-01-05', 'paid'),
(1002, 1, '2026-01-10', 'paid'),
(1003, 1, '2026-02-05', 'paid'),
(1004, 1, '2026-02-15', 'paid'),
(1005, 2, '2026-01-12', 'paid'),
(1006, 2, '2026-02-18', 'paid'),
(1007, 3, '2026-03-02', null),
(1008, 3, '2026-03-05', 'paid'),
(1009, 4, '2026-03-10', 'paid'),
(1010, 5, '2026-03-12', null),
(1011, 6, '2026-04-01', 'paid'),
(1012, 7, '2026-04-05', 'paid'),
(1013, 8, '2026-04-10', 'paid'),
(1014, 9, '2026-04-15', 'paid'),
(1015, 2, '2026-04-20', 'paid');

insert into orderitems values
(1, 1001, 101, 1, 50000),
(2, 1001, 103, 2, 1000),
(3, 1002, 102, 1, 20000),
(4, 1002, 104, 2, 500),
(5, 1003, 105, 2, 5000),
(6, 1004, 106, 1, 8000),
(7, 1005, 101, 1, 50000),
(8, 1005, 107, 2, 2500),
(9, 1006, 102, 2, 20000),
(10, 1007, 103, 5, 1000),
(11, 1008, 104, 4, 500),
(12, 1009, 105, 3, 5000),
(13, 1010, 106, 2, 8000),
(14, 1011, 107, 3, 2500),
(15, 1012, 108, 20, 100),
(16, 1013, 101, 2, 50000),
(17, 1014, 102, 1, 20000),
(18, 1015, 103, 10, 1000);

-- TASK 1
-- 1. top 5 products by revenue
select p.productid, p.productname,
  sum(oi.quantity * oi.unitprice) as totalrevenue
from products p
inner join orderitems oi on p.productid = oi.productid
group by p.productid, p.productname
order by totalrevenue desc
limit 5;

-- 2. month-wise sales
select date_format(o.orderdate, '%Y-%m') as salesmonth,
  sum(oi.quantity * oi.unitprice) as totalsales
from orders o
inner join orderitems oi on o.orderid = oi.orderid
group by date_format(o.orderdate, '%Y-%m')
order by salesmonth;

-- 3. customers with more than 3 orders
select c.customerid,
       concat(c.firstname, ' ', c.lastname) as customername,
       count(o.orderid) as totalorders
from customers c
inner join orders o on c.customerid = o.customerid
group by c.customerid, c.firstname, c.lastname
having count(o.orderid) > 3;

-- 4. average basket value by city
select c.city,
       avg(oi.ordertotal) as averagebasketvalue
from customers c
inner join orders o on c.customerid = o.customerid
inner join (
    select orderid, sum(quantity * unitprice) as ordertotal
    from orderitems
    group by orderid
) oi on o.orderid = oi.orderid
group by c.city;

-- 5. orders without payment
select o.orderid, o.orderdate, o.paymentstatus
from orders o
left join orderitems oi on o.orderid = oi.orderid
where o.paymentstatus is null;

-- 6. customers with no orders
select c.customerid,
concat(c.firstname, ' ', c.lastname) as customername,
c.city
from customers c
left join orders o on c.customerid = o.customerid
where o.orderid is null;

-- 7. product-category revenue share
select p.category,
       sum(oi.quantity * oi.unitprice) as categoryrevenue,
       sum(oi.quantity * oi.unitprice) * 100 /
       (select sum(quantity * unitprice) from orderitems) as revenuepercentage
from products p
inner join orderitems oi on p.productid = oi.productid
group by p.category;

-- 8. day with the highest sales
select o.orderdate,
  sum(oi.quantity * oi.unitprice) as totalsales
from orders o
inner join orderitems oi on o.orderid = oi.orderid
group by o.orderdate
order by totalsales desc
limit 1;

-- TASK 2

select upper(firstname) as customername
from customers;

select concat(firstname, ' ', lastname) as fullname
from customers;

select orderid, orderdate,
datediff(curdate(), orderdate) as daysago
from orders;

select orderid,
date_format(orderdate, '%d-%m-%Y') as formatteddate
from orders;

select productname, round(price, 2) as roundedprice
from products;

-- TASK 3

select count(*) as totalrows
from orders;

select count(paymentstatus) as totalpayments
from orders;

select sum(quantity) as totalquantity
from orderitems;

select avg(quantity) as averagequantity
from orderitems;

-- TASK 4

-- WHERE : Filters individual rows, Used before GROUP BY.

select * from orders
where customerid = 1;

-- HAVING : Filters grouped records, Used after GROUP BY.

select customerid, count(orderid) as totalorders
from orders
group by customerid
having count(orderid) > 3;