select c.customer_id,COUNT(*) as order_count from Orders as o 
join Customers as c on 
o.customer_id = c.customer_id group by c.customer_id order by c.customer_id 


select * from Customers
select * from Orderss
select * from order_items
select * from products


select c.customer_id,c.name as customer_name,SUM(o.total_amount) as total_order_amount from Customers as c
join Orderss as o on 
c.customer_id = o.customer_id 
group by c.customer_id, c.name;


select d.dep_id,Count(*) as count_per_dep from Department as d 
join Employees as e on 
d.dep_id = e.dep_id 
group by d.dep_id


select p.product_id, Count(*) as product_count from products as p
join order_items as ot 
on p.product_id = ot.product_id group by p.product_id



select d.dep_id,sum(e.salary) as total from Employees as e 
join Department as d on 
e.dep_id = d.dep_id group by d.dep_id