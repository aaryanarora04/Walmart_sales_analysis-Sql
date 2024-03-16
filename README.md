# Walmart_sales_analysis-Sql <br>
Walmart Sales Data Analysis
About
This project aims to explore the Walmart Sales data to understand top performing branches and products, sales trend of of different products, customer behaviour. The aims is to study how sales strategies can be improved and optimized. The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition.

<h2> Purposes Of The Project </h2> 
The major aim of thie project is to gain insight into the sales data of Walmart to understand the different factors that affect sales of the different branches.

<h2> About Data </h2>
The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition. This dataset contains sales transactions from a three different branches of Walmart, respectively located in Mandalay, Yangon and Naypyitaw. The data contains 17 columns and 1000 rows:
<br>

# Analysis List 
<h3> Product Analysis </h3> 
<h3> Conduct analysis on the data to understand the different product lines, the products lines performing best and the product lines that need to be improved. </h3>
 <h3> Sales Analysis </h3>
This analysis aims to answer the question of the sales trends of product. The result of this can help use measure the effectiveness of each sales strategy the business applies and what modificatoins are needed to gain more sales. <br>
<br>
<h3> Customer Analysis </h3> 
This analysis aims to uncover the different customers segments, purchase trends and the profitability of each customer segment. <br>
<br>

# Approach Used
Data Wrangling: This is the first step where inspection of data is done to make sure NULL values and missing values are detected and data replacement methods are used to replace, missing or NULL values.
Build a database<br>
Create table and insert the data.<br>
Select columns with null values in them. There are no null values in our database as in creating the tables, we set NOT NULL for each field, hence null values are filtered out.
Feature Engineering: This will help use generate some new columns from existing ones. <br>
Add a new column named time_of_day to give insight of sales in the Morning, Afternoon and Evening. This will help answer the question on which part of the day most sales are made.<br>
Add a new column named day_name that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day each branch is busiest.<br>
Add a new column named month_name that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.
Exploratory Data Analysis (EDA): Exploratory data analysis is done to answer the listed questions and aims of this project.

 <h3> Conclusion: </h3> 

Business Questions To Answer<br>
# Generic Question
How many unique cities does the data have?<br>
In which city is each branch?<br>
# Product
How many unique product lines does the data have? <br>
What is the most common payment method? <br>
What is the most selling product line?<br>
What is the total revenue by month?<br>
What month had the largest COGS?<br>
What product line had the largest revenue?<br>
What is the city with the largest revenue?<br>
What product line had the largest VAT?<br>
Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales <br>
Which branch sold more products than average product sold?<br>
What is the most common product line by gender?<br>
What is the average rating of each product line?<br>
# Sales
Number of sales made in each time of the day per weekday<br>
Which of the customer types brings the most revenue?<br>
Which city has the largest tax percent/ VAT (Value Added Tax)?<br>
Which customer type pays the most in VAT?<br>
# Customer 
How many unique customer types does the data have? <br>
How many unique payment methods does the data have?<br>
What is the most common customer type?<br>
Which customer type buys the most?<br>
What is the gender of most of the customers?<br>
What is the gender distribution per branch?<br>
Which time of the day do customers give most ratings?<br>
Which time of the day do customers give most ratings per branch?<br>
Which day fo the week has the best avg ratings?<br>
