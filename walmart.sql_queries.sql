 -- Creating Database--
 
CREATE DATABASE IF NOT EXISTS walmartdata;

-- Use Database--

Use walmartdata;

-- Create Table--
CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment_method VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);
 
 -- -------------------Feature Engineering----------------------
 
 #time_of_day
Alter table sales add column time_of_day varchar(20);

Update  sales
Set time_of_day = case when time between "00:01:00" and "12:00:00" then "Morning"
				when time between "12:01:00" and "16:00:00" then "Afternoon"
                else "Evening" end;

#day_name 
Alter table sales add column day_name varchar(10);

Update sales
Set day_name = dayname(date);

#month_name
Alter table sales add column month_name varchar(15);

Update sales 
Set month_name = monthname(date);

-- ------------------------------------------------------------------------------------------
-- ---------------------Generic Questions --------------------------

#How many unique cities does the data have?
Select distinct city from sales;

#In which city is each branch?
Select distinct city, branch from sales;

-- ------------------------------------------------------------------------------------------
-- ---------------------Product Questions---------------------------

#How many unique product lines does the data have?
Select count(distinct product_line) from sales;

#What is the most common payment method?
Select payment_method, count(payment_method) as Count from sales
Group by payment_method
Order by Count desc;

#What is the most selling product line?
Select product_line, count(product_line) as Count from sales
Group By product_line
Order By count desc;

#What is the total revenue by months?
Select month_name as Month, sum(total) as Total_revenue from sales
Group by month_name
Order By total_revenue desc;

#What month had the largest COGS?
Select month_name as Month, sum(cogs) as Cogs from sales
Group by month_name 
Order By Cogs desc;

#Which product line had the largest revenue?
Select product_line, sum(total) as Total_revenue from sales
Group By product_line
Order By total_revenue desc;

#Which city had the largest revenue?
Select city, branch,  sum(total) as Total_revenue from sales
Group By city, branch
Order By total_revenue desc;

#What product line had the largest Tax?
Select product_line, avg(tax_pct) as avg_tax from sales
Group by product_line
Order by avg_tax desc;

#Which branch sold more products than average product sold?
Select branch, Sum(quantity) as Qty from sales
Group by branch
Having Qty > Avg(quantity);

#Which product line has the total sales is greater then avg sales. 
Select product_line,
	   (case when sum(total) > avg(total) then "Good" else "Baad" end) as Review 
       From sales
Group By product_line;

#What is the most product line by gender?
Select gender, product_line, count(product_line) as Count from sales
Group By gender, product_line
Order By count desc;

#What is the average rating of each product line
Select product_line, round(avg(rating),2) as Avg_Rating from sales
Group By product_line
Order By avg_rating desc;
-- --------------------------------------------------------------
-- -------------------Sales Questions-----------------------------

#Number of transactions made in each time of the day per weekday.
Select time_of_day, count(*) as Total_transactions from sales
where day_name = "Sunday" 
Group By time_of_day
Order By total_transactions desc;

#Which type of the customer brings the most revenue?
Select customer_type, sum(total) as total_rev from sales
Group By customer_type
Order By total_rev desc;

#Which city had the largest tax percentage?
Select city, round(avg(tax_pct),2) as tax from sales
Group By city
Order By tax desc;

#Which type of customer pays most in tax
Select customer_type, sum(tax_pct) as total_tax from sales
Group By customer_type
Order By total_tax desc;
-- -----------------------------------------------------------
-- ------------------Customer Questions-----------------------

#How many unique customer does the data have?
Select distinct customer_type from sales;

#How many unique payment method does the data have?
Select distinct payment_method from sales;

#What is the most common customer type?
Select customer_type, count(*) as cnt from sales
Group By customer_type;

#What is the gender of most of the customers?
Select Gender, count(*) as gender_cnt from sales
Group By Gender
Order By gender_cnt desc;

#What is the gender distribution per branch?
Select gender, count(*) as gender_cnt from sales
Where branch = "A"
Group by gender
Order by gender_cnt desc;

#Which time of the day do customer gives more rating?
Select time_of_day, round(avg(rating),2) as Avg_Rating from sales
Group By time_of_day
Order By Avg_rating desc;

#Which day of the week has the best average rating?
Select day_name, avg(rating) as avg_rating from sales
Group By day_name
Order By avg_rating desc;

-- -----------------------------------------------------------