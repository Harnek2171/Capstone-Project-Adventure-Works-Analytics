CREATE TABLE mytable(
   ProductCategoryKey INTEGER  NOT NULL PRIMARY KEY 
  ,CategoryName       VARCHAR(11) NOT NULL
);
INSERT INTO mytable(ProductCategoryKey,CategoryName) VALUES (1,'Bikes');
INSERT INTO mytable(ProductCategoryKey,CategoryName) VALUES (2,'Components');
INSERT INTO mytable(ProductCategoryKey,CategoryName) VALUES (3,'Clothing');
INSERT INTO mytable(ProductCategoryKey,CategoryName) VALUES (4,'Accessories');
