SELECT * FROM cars;
SELECT * FROM sales;
SELECT * FROM salespersons;

-- 1. What are the details of all cars purchased in the year 2022?
select c.*,year(s.purchase_date) as purchase_year from cars c
join sales s
using (car_id);

-- 2. What is the total number of cars sold by each salesperson?
SELECT sp.name,count(c.car_id) sold_car FROM cars c
join sales s using(car_id)
join salespersons sp using(salesman_id)
group by sp.name;

-- 3. What is the total revenue generated by each salesperson?
SELECT sp.name,sum(c.cost_$) sold_car FROM cars c
join sales s using(car_id)
join salespersons sp using(salesman_id)
group by sp.name;

-- 4. What are the details of the cars sold by each salesperson?
SELECT c.*,s.purchase_date FROM cars c
join sales s using(car_id)
join salespersons sp using(salesman_id);

-- 5. What is the total revenue generated by each car type?
SELECT type,sum(c.cost_$) FROM cars c
group by type;

-- 6. What are the details of the cars sold in the year 2021 by salesperson 'Emily Wong'?
SELECT c.*,year(s.purchase_date) as purchase_year,sp.name FROM cars c
join sales s using(car_id)
join salespersons sp using(salesman_id)
where year(s.purchase_date)=2021 and sp.name = "Emily Wong" ;

-- 7. What is the total revenue generated by the sales of hatchback cars?
select style,sum(cost_$) revenue from cars
where style = "Hatchback"
group by style;

-- 8. What is the total revenue generated by the sales of SUV cars in the year 2022?
select c.style,sum(cost_$) as revenue from cars c
join sales s
using (car_id)
where year(s.purchase_date)=2022 and c.style = "SUV"
group by c.style;

-- 9. What is the name and city of the salesperson who sold the most number of cars in the year 2023?
SELECT sp.name, sp.city,year(s.purchase_date) as year,count(car_id) total_car_sold FROM cars c
join sales s using(car_id)
join salespersons sp using(salesman_id)
where year(s.purchase_date)=2023
group by sp.name, sp.city,year(s.purchase_date)
order by total_car_sold desc limit 1;

-- 10. What is the name and age of the salesperson who generated the highest revenue in the year 2022?
SELECT sp.name,sp.age,year(s.purchase_date) as year,sum(cost_$) revenue FROM cars c
join sales s using(car_id)
join salespersons sp using(salesman_id)
where year(s.purchase_date)=2022
group by sp.name,sp.age ,year(s.purchase_date)
order by revenue desc limit 1;