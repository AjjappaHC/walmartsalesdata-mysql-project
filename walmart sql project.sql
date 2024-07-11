use salesdatawalmart;
create table if not exists sales( 

INVOICE_ID VARCHAR(30) NOT NULL PRIMARY KEY,
BRANCH VARCHAR(30) NOT NULL,
CITY VARCHAR(30) NOT NULL,
CUSTOMER_TYPE VARCHAR(30) NOT NULL,
GENDER VARCHAR(30) NOT NULL,
PRODUCT_LINE VARCHAR(100) NOT NULL,
UNIT_PRICE DECIMAL(10,4) NOT NULL,
QUANTITY INT NOT NULL,
VAT FLOAT(10,4) NOT NULL,
TOTAL DECIMAL(10,4),
date datetime NOT NULL,
time TIME NOT NULL,
PAYMENT VARCHAR(30) NOT NULL,
COGS DECIMAL(10,4) NOT NULL,
GROSS_MARGIN_PERCENTAGE FLOAT(10,4) NOT NULL,
GROSS_INCOME DECIMAL(10,4),
RATING FLOAT(2,1)
);
select * from sales;


-- ------------------------------------------------------------------------------------------------------------------------------
-- --------------------------------------------FEATURE ENGINEERING----------------------------------------------------------------

-- --TIME OF THE DAY

USE salesdatawalmart;
SELECT TIME,
(CASE
WHEN 'TIME' BETWEEN "00:00:" AND "12:00:00" THEN "MORNING"
WHEN 'TIME' BETWEEN "12:00:" AND "16:00:00" THEN "AFTERNOON"
ELSE "EVENING"
END) AS TIME_OF_DATE
from sales;

ALTER TABLE SALES ADD COLUMN TIME_OF_DATE VARCHAR(30);
UPDATE sales
SET TIME_OF_DATE = 
(CASE
WHEN 'TIME' BETWEEN "00:00:" AND "12:00:00" THEN "MORNING"
WHEN 'TIME' BETWEEN "12:00:" AND "16:00:00" THEN "AFTERNOON"
ELSE "EVENING"
END);

-- ----- DAY NAME

SELECT DATE,
dayname(DATE) AS DAY_NAME
FROM SALES;

ALTER TABLE SALES ADD COLUMN DAY_NAME VARCHAR(30);
UPDATE sales 
SET DAY_NAME = dayname(DATE);

-- ---- MONTH NAME

SELECT DATE,
monthname(DATE) AS MONTH_NAME
FROM SALES;

ALTER TABLE SALES ADD COLUMN MONTH_NAME VARCHAR(30);
UPDATE sales
SET MONTH_NAME = monthname(DATE);

-- -----------------------------------------------------------------------------------------------------------------------------
-- -----------GENERIC--------------------------------------------------------------------------------------------------------------

-- -- HOW MANY UNIQUE CITIES DOES DATA HAVE..?

SELECT DISTINCT CITY FROM SALES;

-- IN WHICH CITY EACH BRANCH IS ----

SELECT DISTINCT CITY, BRANCH FROM SALES;

-- ---------------------------------------------------------------------------------------------------------------------------------
-- -------------------PRODUCT -----------------------------------------------------------------------------------------------

-- HOW MANY UNIQUE PRODUCT LINE DOES THE DATA HAVE..?

SELECT COUNT( DISTINCT (PRODUCT_LINE)) FROM SALES; 

-- WHAT IS THE MOST COMMON PAYMNET METHOD..?

SELECT
 PAYMENT, COUNT(PAYMENT) AS COUNT
 FROM SALES 
 group by PAYMENT 
 order by COUNT DESC;
 
 -- -- WHAT IS THE MOST SELLING PRODUCT LINE..?
 
SELECT PRODUCT_LINE, COUNT(PRODUCT_LINE) COUNT FROM SALES GROUP BY PRODUCT_LINE
order by COUNT DESC ;

-- -------WHAT IS THE TOTAL REVENUE BY MONTH..?

SELECT month_name as month, SUM(total) as total_revenue from SALES
group by month
order by total_revenue desc;

-- -----which month has the largest COGS..?

SELECT month_NAME AS MONTH,SUM(COGS) AS COGS_ FROM SALES group by MONTH
ORDER BY COGS_ DESC ;

-- ------------- WHICH PRODUCT LINE HAS THE LARGEST REVENUE..?

SELECT PRODUCT_LINE, SUM(TOTAL) AS REVENUE FROM SALES
 GROUP BY PRODUCT_LINE 
 ORDER BY REVENUE DESC; 
 
 -- --------- WHAT IS THE CITY WITH THE LARGEST REVENUE..?
 
  SELECT CITY, BRANCH, SUM(TOTAL) AS REVENUE FROM SALES
  GROUP BY CITY,BRANCH 
  ORDER BY REVENUE DESC;
  
  -- -------WHAT PRODUCT LINE HAS THE LARGEST VAT..?
  
  SELECT PRODUCT_LINE, AVG(VAT) AS VAT FROM SALES 
  GROUP BY PRODUCT_LINE
  ORDER BY VAT DESC;
  
  -- -----WHICH BRANCH SOLD MORE PRODUCTS THAN THE AVERAGE SALES..?
  
  SELECT 
  BRANCH, sum(QUANTITY) AS QTY
  FROM SALES 
  GROUP BY BRANCH
  HAVING SUM(QUANTITY)>(SELECT AVG(QUANTITY) FROM SALES);
  
  -- ---WHAT IS THE MOST PRODUCT LINE BY GENDER..?
  
  SELECT PRODUCT_LINE,GENDER,COUNT(GENDER) AS CNT FROM SALES
  GROUP BY GENDER,PRODUCT_LINE
  ORDER BY CNT DESC;
  
  -- ------WHAT IS THE AVERAGE RATING OF EACH PRODUCT LINE..?
  
  SELECT PRODUCT_LINE, ROUND(AVG(RATING),2) AS RATING FROM SALES GROUP BY PRODUCT_LINE;
  
  -- --------- FETCH EACH PRODUCT LINE AND ADD A COLUMN TO THOSE PRODUCT LINE SHOWING GOOD OR BAD. GOOD IF IT'S GREATER THAN AVERAGE SALES.
  
   SELECT 
product_line,
ROUND(AVG(total),2) AS avg_sales,
(CASE
WHEN AVG(total) > (SELECT AVG(total) FROM sales) THEN "Good"
ELSE "Bad"
END)
AS Remarks
FROM sales
GROUP BY product_line;

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------SALES-----------------------------------------------------------------------------------------------------------------

-- ---------WHICH OF THE CUSTOMER BRINGS MOST REVENUE..?

SELECT CUSTOMER_TYPE, SUM(TOTAL) AS TOTAL_SALES
FROM SALES
GROUP BY CUSTOMER_TYPE
ORDER BY TOTAL_SALES DESC;


-- ----WHICH CITY HAS THE LARGEST TAX PERCENT/VAT..?

SELECT CITY,AVG(VAT)AS TOTAL_VAT FROM sales
GROUP BY CITY
ORDER BY TOTAL_VAT DESC;

-- ------ WHICH CUSTOMER TYPE PAYS MORE TAX..?

SELECT CUSTOMER_TYPE, AVG(VAT)AS TAX FROM SALES
GROUP BY CUSTOMER_TYPE
ORDER BY TAX DESC;

 -- ---------------------------------------------------------------------------------------------------------------------------------------------------
 -- ------------------------------CUSTOMER------------------------------------------------------------------------------------------------------------
 
 -- --------------HOW MANY UNIQUE CUSTOMER DOES THE DATA HAVE..?
 
 SELECT  DISTINCT(CUSTOMER_TYPE) FROM SALES;
