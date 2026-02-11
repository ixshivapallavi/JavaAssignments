select c.customer_id,COUNT(*) as order_count from Orders as o 
join Customers as c on 
o.customer_id = c.customer_id group by c.customer_id having count(*)>3



select d.dep_id,d.dep_name,count(*) as employees_count from Employees as e 
join Department as d 
on 
e.dep_id = d.dep_id group by d.dep_id,d.dep_name having count(*) >5


select p.product_id,p.product_name,count(*) as order_count from products as p
join order_items as ot on 
p.product_id = ot.product_id group by p.product_id,p.product_name having count(*)>1


select c.customer_id,c.name,sum(o.total_amount) from Customers as c
join Orderss as o on 
c.customer_id = o.customer_id
group by c.customer_id,c.name having sum(o.total_amount) > 2500