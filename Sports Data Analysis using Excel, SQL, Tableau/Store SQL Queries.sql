--1. KPI's for total_revenue,total_profit, total_orders, profit_margin
select sum(revenue) as total_revenue,
	   sum(profit) as total_profit,
	   count(*) as total_orders,
	   sum(profit)/sum(revenue) *100.0 as profit_margin
	   from orders

--2. KPI's for total_revenue,total_profit, total_orders, profit_margin with each sport
select sport,
	   Round(sum(revenue),2) as total_revenue,
	   Round(sum(profit),2) as total_profit,
	   count(*) as total_orders,
	   sum(profit)/sum(revenue) *100.0 as profit_margin
	   from orders
	   group by sport
	   order by profit_margin desc



	   select* from orders
--3. no of customer rating and the averag rating

select(
select count(*) from orders where rating is not null) as number_of_rating ,
avg(rating) as average_rating
from orders

-- 4. number of people for each rating and its revenue, profit margin 

select rating,
	   sum(revenue) as total_revenue,
	   sum(profit) as total_profit,
	   sum(profit)/sum(revenue) *100.0 as profit_margin
from orders
where rating is not null
group by rating
order by rating desc


--5. total revenue, proft and profit margin by each state

select * from orders
select c.state,
	   row_number() over (order by sum(o.revenue) desc) as revenue_rank,
	   sum(o.revenue) as total_revenue,
	   row_number() over (order by sum(o.profit) desc) as profit_rank,
	   sum(o.profit) as total_profit,
	   row_number() over (order by sum(o.profit)/sum(o.revenue) *100.0 desc) as margin_rank,
	   sum(o.profit)/sum(o.revenue) *100.0 as profit_margin
from orders o
join customers c on o.customer_id = c.customer_id
group by c.State
order by profit_margin desc

-- 6. monthly profit from the store
with monthly_profit as (
select month(date) as month,
sum(profit) as total_profit
from orders
where month(date) is not null
group by month(date))


select month, total_profit,
lag(total_profit) over (order by month) as previous_month_profit,
total_profit - lag(total_profit) over (order by month) as prfot_difference
from monthly_profit
order by month



