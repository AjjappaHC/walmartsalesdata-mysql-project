 # walmartsalesdata-mysql-project
 
WalMart_sales_data _analysis/ mysql

ABOUT:

  This project aims to explore the Walmart Sales data to understand top performing branches and products, sales trend of of different products, customer behaviour. The aims is to study 
  how sales strategies can be improved and optimized. The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition.

Purposes Of The Project:

  The major aim of thie project is to gain insight into the sales data of Walmart to understand the different factors that affect sales of the different branches.

About Data:

   The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition. This dataset contains sales transactions from a three different branches of Walmart, respectively 
   located in Mandalay, Yangon and Naypyitaw. The data contains 17 columns and 1000 rows:

![image](https://github.com/AjjappaHC/walmartsalesdata-mysql-project/assets/174999010/43eca288-5e0d-4b58-9ace-ca20ed0cf474)

Analysis List: 

  1.Product Analysis
  
    Conduct analysis on the data to understand the different product lines, the products lines performing best and the product lines that need to be improved.

  2.Sales Analysis
  
    This analysis aims to answer the question of the sales trends of product. The result of this can help use measure the effectiveness of each sales strategy the business applies and 
    what modificatoins are needed to gain more sales.

  3.Customer Analysis
  
    This analysis aims to uncover the different customers segments, purchase trends and the profitability of each customer segment.

Approach Used:

  * Data Wrangling: This is the first step where inspection of data is done to make sure NULL values and missing values are detected and data replacement methods are used to replace, 
                     missing or NULL values.
  
                    1.Build a database

                    2.Create table and insert the data.

                    3.Select columns with null values in them. There are no null values in our database as in creating the tables, we set NOT NULL for each field, hence null values are 
                      filtered out.
  
  * Feature Engineering: This will help us to generate some new columns from existing ones.
  
                     1.Add a new column named time_of_day to give insight of sales in the Morning, Afternoon and Evening. This will help answer the question on which part of the day most 
                       sales are made.

                     2.Add a new column named day_name that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help 
                       answer the question on which week of the day each branch is busiest.

                     3.Add a new column named month_name that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which 
                       month of the year has the most sales and profit.
  
 * Exploratory Data Analysis (EDA): Exploratory data analysis is done to answer the necessary questions and aims of this project.
