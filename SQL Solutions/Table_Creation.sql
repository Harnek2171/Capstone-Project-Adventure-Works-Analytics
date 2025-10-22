-- create database AdventureWorks;

# TABLE ALTER - Sales Table

ALTER TABLE sales
CHANGE OrderDate OrderDate DATE;

ALTER TABLE sales
CHANGE StockDate StockDate DATE;


# TABLE ALTER - Product_SubCategory

ALTER TABLE Product_SubCategory
CHANGE ProductCategoryKey ProductCategoryKey INT;


# TABLE ALTER - Returns Table

ALTER TABLE returns
CHANGE ReturnDate ReturnDate DATE;
