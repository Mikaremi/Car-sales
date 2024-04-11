CREATE DATABASE Cars
USE Cars
SELECT * FROM [Cars Mock Data]

--Updating the New_Car column
UPDATE [Cars Mock Data]
SET New_Car = CASE 
				WHEN New_Car = 0
THEN 'True'
				ELSE 'False'
			END
WHERE New_Car IN (0,1)

--The Total Number of Sales By Make
SELECT Make, COUNT(*) AS Tota
l_Sales
FROM [Cars Mock Data]
GROUP BY Make
ORDER BY Total_Sales DESC

--Average Sales Price by Make and Model
SELECT Make, Model, AVG(Sale_Price) AS avg_sales
FROM [Cars Mock Data]
Group by Make, Model 
Order by avg_sales DESC

--Top 5 Buzzwords used in the car_listing
SELECT Top(5) Buzzword, COUNT(*) AS Frequency
FROM [Cars Mock Data]
Group by Buzzword
Order by Frequency DESC

--Average disount by country
SELECT Country, AVG(Discount) AS AVGdiscount
FROM [Cars Mock Data]
Group by Country 
Order by AVGdiscount DESC

--Number of sales by buyer gender and age group
SELECT 
    CASE
        WHEN Buyer_Age BETWEEN 21 AND 30 THEN '21-30'
        WHEN Buyer_Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Buyer_Age BETWEEN 41 AND 50 THEN '41-50'
        WHEN Buyer_Age BETWEEN 51 AND 60 THEN '51-60'
        WHEN Buyer_Age BETWEEN 61 AND 70 THEN '61-70'
        WHEN Buyer_Age BETWEEN 71 AND 80 THEN '71-80'
        ELSE 'Unknown'
    END AS AgeGroup,
	Buyer_Gender, 
	COUNT(*) AS TOTAL_SALES
FROM [Cars Mock Data]
GROUP BY CASE
        WHEN Buyer_Age BETWEEN 21 AND 30 THEN '21-30'
        WHEN Buyer_Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Buyer_Age BETWEEN 41 AND 50 THEN '41-50'
        WHEN Buyer_Age BETWEEN 51 AND 60 THEN '51-60'
        WHEN Buyer_Age BETWEEN 61 AND 70 THEN '61-70'
        WHEN Buyer_Age BETWEEN 71 AND 80 THEN '71-80'
        ELSE 'Unknown'
    END,
	Buyer_Gender
ORDER BY AgeGroup,Buyer_Gender DESC

--Total 5 year depreciation by make and model
SELECT Make, Model, count(_5_yr_Depreciation) AS TOTAL_Depreciation
FROM [Cars Mock Data]
Group by Make, Model
Order by TOTAL_Depreciation DESC

--Total sales value by color
SELECT Color, SUM(Sale_Price) AS TotalSalesValue
FROM [Cars Mock Data]
Group by Color
Order by TotalSalesValue DESC

--Number of cars sold with top speed of over 200kmh/hr and 0-60 time under 5 seconds
SELECT COUNT(*) AS TOTALSALES
FROM [Cars Mock Data]
WHERE Top_Speed > 200 AND _0_60_Time < 5

--Most popular color by make
SELECT Make, Color, COUNT(*) AS Totalsales
FROM [Cars Mock Data]
Group by Make, Color
Order by Totalsales DESC

--Average sell price and resell price difference by make and model
SELECT Make, Model, AVG(Sale_Price - Resell_Price) AS AVGprice_difference
FROM [Cars Mock Data]
Group by Make, Model
Order by AVGprice_difference DESC

    
