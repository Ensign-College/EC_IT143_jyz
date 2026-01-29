/*
=========================================================
Author: Justice Yaw Zigah
Course: EC_IT143
Assignment: W3.4 AdventureWorks – Create Answers
Estimated Runtime: < 1 minute
Description:
This script answers eight business and metadata
questions using the AdventureWorks database.
=========================================================
*/

---------------------------------------------------------
-- Q1
-- Business User — Marginal Complexity
-- What is the most sold product based on total quantity sold?
---------------------------------------------------------

SELECT TOP 1
    p.Name AS ProductName,
    SUM(sod.OrderQty) AS TotalQuantitySold
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p
    ON sod.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY TotalQuantitySold DESC;


---------------------------------------------------------
-- Q2
-- Business User — Marginal Complexity
-- What is the least sold product based on total quantity sold?
---------------------------------------------------------

SELECT TOP 1
    p.Name AS ProductName,
    SUM(sod.OrderQty) AS TotalQuantitySold
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p
    ON sod.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY TotalQuantitySold ASC;


---------------------------------------------------------
-- Q3
-- Business User — Moderate Complexity
-- How many units are currently in inventory for the most sold product?
---------------------------------------------------------

SELECT
    p.Name AS ProductName,
    SUM(pi.Quantity) AS UnitsInInventory
FROM Production.ProductInventory pi
JOIN Production.Product p
    ON pi.ProductID = p.ProductID
WHERE p.ProductID = (
    SELECT TOP 1 ProductID
    FROM Sales.SalesOrderDetail
    GROUP BY ProductID
    ORDER BY SUM(OrderQty) DESC
)
GROUP BY p.Name;


---------------------------------------------------------
-- Q4
-- Business User — Moderate Complexity
-- How many units are currently in inventory for the least sold product?
---------------------------------------------------------

SELECT
    p.Name AS ProductName,
    SUM(pi.Quantity) AS UnitsInInventory
FROM Production.ProductInventory pi
JOIN Production.Product p
    ON pi.ProductID = p.ProductID
WHERE p.ProductID = (
    SELECT TOP 1 ProductID
    FROM Sales.SalesOrderDetail
    GROUP BY ProductID
    ORDER BY SUM(OrderQty) ASC
)
GROUP BY p.Name;


---------------------------------------------------------
-- Q5
-- Business User — Increased Complexity
-- Based on total sales amount, who is the best performing salesperson?
---------------------------------------------------------

SELECT TOP 1
    sp.BusinessEntityID,
    p.FirstName + ' ' + p.LastName AS SalespersonName,
    SUM(soh.TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesPerson sp
    ON soh.SalesPersonID = sp.BusinessEntityID
JOIN Person.Person p
    ON sp.BusinessEntityID = p.BusinessEntityID
GROUP BY sp.BusinessEntityID, p.FirstName, p.LastName
ORDER BY TotalSales DESC;


---------------------------------------------------------
-- Q6
-- Business User — Increased Complexity
-- Which salesperson has the lowest total sales performance?
---------------------------------------------------------

SELECT TOP 1
    sp.BusinessEntityID,
    p.FirstName + ' ' + p.LastName AS SalespersonName,
    SUM(soh.TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesPerson sp
    ON soh.SalesPersonID = sp.BusinessEntityID
JOIN Person.Person p
    ON sp.BusinessEntityID = p.BusinessEntityID
GROUP BY sp.BusinessEntityID, p.FirstName, p.LastName
ORDER BY TotalSales ASC;


---------------------------------------------------------
-- Q7 
-- Metadata Question
-- Which tables contain a column named ProductID?
---------------------------------------------------------

SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'ProductID'
ORDER BY TABLE_SCHEMA, TABLE_NAME;


---------------------------------------------------------
-- Q8
-- Metadata Question
-- What columns and data types exist in Sales.SalesOrderHeader?
---------------------------------------------------------

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Sales'
  AND TABLE_NAME = 'SalesOrderHeader'
ORDER BY ORDINAL_POSITION;
