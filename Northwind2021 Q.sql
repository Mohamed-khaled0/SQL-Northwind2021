--1-Display a list of all customers
SELECT * FROM Customer;

--2-Display a list of customer id , name and city
SELECT Id AS "Customer ID",City
FROM Customer;

--3-For customers who live in 'Mexico' , display a list of their full name and phone.
SELECT FirstName+' '+LastName AS "customer name",phone
FROM Customer
WHERE Country='Mexico';

/* 
4-For products with prices over 50$ , display the product name , package and price after Taxes.
Note : taxes = %15 
*/ 
SELECT ProductName,Package ,UnitPrice*1.15 AS "Price After Taxes"
FROM Product
WHERE UnitPrice>50  ;

--5-For suppliers, outside 'USA' and 'UK', display a list of company name, city and phone.
SELECT CompanyName,City,Phone
FROM Supplier
WHERE Country not in ('USA' ,'UK');

/*
6-For suppliers located in 'USA’, display a list of company name, product names and unitPrice sorted
Alphabetically
*/
SELECT CompanyName,ProductName,UnitPrice
FROM dbo.Supplier S join dbo.Product P
ON S.ID =P.SupplierId
WHERE Country='USA'
ORDER BY CompanyName;


/*
7-For each customer, display a list of qustomer full name and how many orders he made and how much he totally
paid
*/
SELECT FirstName+' '+LastName AS "customer name" , COUNT(*) AS "No of Orders" ,SUM(totalamount) AS "Total Amount"
FROM dbo.Customer C join dbo.Orders O
ON C.Id = O.CustomerId
GROUP BY FirstName,LastName;


/*
8-For suppliers, who supplied more than 3 products, display a list of company name and how m any products it
supplied, sorted by the number of products in descending order
*/
SELECT CompanyName ,count (*) AS "No of products"
FROM dbo.Supplier S join dbo.Product P
ON S.Id = P.SupplierId
GROUP BY CompanyName
HAVING count(*)>=4
ORDER BY count(*) DESC;

--9- Display a top 5 list of the most expensive products.
SELECT TOP 5 ProductName,UnitPrice
FROM Product
ORDER BY UnitPrice DESC;

--10- Display a list of the top 3 best-selling products.
SELECT TOP 3 ProductId, COUNT(*) AS "Top 3 Best Selling"
FROM OrderItem
GROUP BY ProductId
ORDER BY COUNT(*) DESC;



--11- Display a list,of products with prices more than the average price.

SELECT *FROM Product 
WHERE UnitPrice>(SELECT AVG (UnitPrice) FROM Product);

