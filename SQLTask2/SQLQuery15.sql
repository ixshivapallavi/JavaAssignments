select * from Customers
where customer_id in (select customer_id from Orderss)


select * from Customers
where customer_id not in (select customer_id from Orderss)

select * from Products 
where product_id not in (select product_id from Order_Items)

select * from Employees
where dep_id not in (select dep_id from Department)

select * from Orderss as o 
where total_amount > (select AVG(total_amount) from Orderss)

select * from Customers as c
join Orderss as o on 
c.customer_id=o.customer_id
where o.total_amount > (select AVG(total_amount) from Orderss)


select * from Employees as e1
where e1.salary >
(select AVG(e2.salary) from Employees as e2 
where e2.dep_id=e1.dep_id)


select * from Department
where dep_id in (select dep_id from Department)


alter table orders add status varchar(50)

update orderss 
set status ='completed' where order_id in (1,2,3,6,7);

update orderss 
set status ='cancelled' where order_id in (4,5,8,9)

select * from Orderss


select * from Customers 
where customer_id not in (select customer_id from Orders where status ='cancelled')


select * from Employees as e 
join Department as d on 
e.dep_id = d.dep_id and 
e.salary >(select AVG(e2.salary) from Employees as e2 where e2.dep_id=d.dep_id)


select c.customer_id,c.name,t.total_amount
from Customers c join
(select customer_id, SUM(total_amount) AS total_amount from Orders group by customer_id) as t on 
c.customer_id = t.customer_id


select * from Customers as c where exists (select * from Orders as o where o.customer_id=c.customer_id)


select * from Customers as c where not exists (select * from Orders as o where o.customer_id=c.customer_id)



select * from Employees as e
where salary >
(select AVG(salary) from Employees where dep_id = e.dep_id)


select * from Employees as e
join 
(select dep_id,count(*) as employees_total from Employees group by dep_id) as emp_count on
e.dep_id = emp_count.dep_id