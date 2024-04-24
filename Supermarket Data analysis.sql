-- 1. Display the first 5 rows from the dataset.
select * from supermarket limit 5;

-- 2. Display the last 5 rows from the dataset.
select * from supermarket order by `Invoice ID` desc limit 5;

-- 3. Display random 5 rows from the dataset.
select * from supermarket order by rand() limit 5;

-- 4. Display count, min, max, avg, and std values for a column in the dataset.

-- Rename the column name so that there is no space in between; rename Product line -> Product_line   

select count(gross_income),
min(gross_income),
max(gross_income),
avg(gross_income),
std(gross_income)

from supermarket;


-- 5. Find the number of missing values.
select count(*) from supermarket where Branch is null;

-- 6. Count the number of occurrences of each city.
select City,count(City) as NoOfOccurance from supermarket group by City;

-- 7. Find the most frequently used payment method.
select Payment,count(*) as times_used from supermarket group by Payment 
order by count(*) desc;

-- 8. Does The Cost of Goods Sold Affect The Ratings That The Customers Provide? 
select Rating,cogs from supermarket;

-- 9. Find the most profitable branch as per gross income.
select Branch,round(sum(gross_income),2) as sum_gross_income 
from supermarket group by Branch order by sum_gross_income desc;

select City,Branch,sum(gross_income) from supermarket group by City,Branch;

-- 10.  Find the most used payment method city-wise.

select city,
   sum(case when Payment="Cash" then 1 else 0 end) as "Cash",
   sum(case when Payment="Ewallet" then 1 else 0 end) as "Ewallet",
   sum(case when Payment="Credit card" then 1 else 0 end) as "Credit card"
from supermarket group by City;

-- 11. Find the product line purchased in the highest quantity.
select Product_line,sum(Quantity) as Total_Qty from supermarket
group by Product_line order by Total_Qty desc;

-- 12. Display the daily sales by day of the week.
select * from supermarket;
update supermarket SET date = str_to_date(Date,'%m/%d/%Y');
select * from supermarket;

select dayname(date),dayofweek(date),sum(Total) from supermarket group by  dayname(date),dayofweek(date)
order by sum(Total) desc;

-- 13. Find the month with the highest sales.
select monthname(date) as month_name,month(date) as month_no,sum(Total) as total from supermarket
group by month_name,month_no order by total desc;


-- 14. Find the time at which sales are highest.
select * from supermarket;

select hour(Time) as hour, sum(Total) as total from supermarket
group by hour order by total desc;

-- 15. Which gender spends more on average?
select Gender,avg(gross_income) from supermarket group by Gender;
