DROP TABLE IF EXISTS walmart;
CREATE TABLE blinkit (
    item_fat_content VARCHAR(20),
    item_identifier VARCHAR(20),
    item_type VARCHAR(50),
    outlet_establishment_year INTEGER,
    outlet_identifier VARCHAR(20),
    outlet_location_type VARCHAR(20),
    outlet_size VARCHAR(20),
    outlet_type VARCHAR(30),
    item_visibility FLOAT,
    item_weight FLOAT,
    sales FLOAT,
    rating FLOAT
);
SELECT * FROM blinkit;
SELECT COUNT(*) FROM blinkit;

UPDATE blinkit
SET item_fat_content = 
CASE
WHEN item_fat_content IN ('LF' , 'low fat') THEN 'Low Fat'
WHEN item_fat_content = 'reg' THEN 'Regular'
ELSE item_fat_content
END

SELECT DISTINCT(item_fat_content) FROM blinkit;

--Total Sales
SELECT SUM(sales) AS Total_Sales FROM blinkit;

--Total Sales in Millions
SELECT CAST(SUM(sales)/1000000 AS DECIMAL(10,2)) AS Total_Sales_Millions 
FROM blinkit;

--Average Sales
SELECT CAST(AVG(sales)AS DECIMAL(10,0)) AS Average_Sales
FROM blinkit;

--Number of items
SELECT COUNT(*) FROM blinkit;

--Average Ratings
SELECT CAST(AVG(rating)AS DECIMAL(10,2)) AS Average_Ratings
FROM blinkit;

--Total Sales by Fat content
SELECT item_fat_content,
   CAST(SUM(sales) AS DECIMAL(10,2)) AS Total_Sales, 
   CAST(AVG(sales) AS DECIMAL(10,2)) AS Avg_Sales,
   CAST(AVG(rating)AS DECIMAL(10,2)) AS Average_Ratings,
   COUNT(*) AS No_of_items
FROM blinkit
GROUP BY item_fat_content
ORDER BY Total_Sales;

-- Top 5 Item Type on Total Sales, Avg_Sales, Avg_Rating, No_of_Items
SELECT item_type,
   CAST(SUM(sales) AS DECIMAL(10,2)) AS Total_Sales, 
   CAST(AVG(sales) AS DECIMAL(10,2)) AS Avg_Sales,
   CAST(AVG(rating)AS DECIMAL(10,2)) AS Average_Ratings,
   COUNT(*) AS No_of_items
FROM blinkit
GROUP BY item_type
ORDER BY Total_Sales DESC
LIMIT 5;


-- Total Sales, Avg_Sales, Avg_Rating, No_of_Items by Outlet_Location_Type,Item_Fat_Content
SELECT outlet_location_type,item_fat_content,
   CAST(SUM(sales) AS DECIMAL(10,2)) AS Total_Sales, 
   CAST(AVG(sales) AS DECIMAL(10,2)) AS Avg_Sales,
   CAST(AVG(rating)AS DECIMAL(10,2)) AS Average_Ratings,
   COUNT(*) AS No_of_items
FROM blinkit
GROUP BY outlet_location_type,item_fat_content
ORDER BY Total_Sales;

















