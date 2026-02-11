insert into Orderss values 
(11,121,26,'2026-01-22',900)

select * from Employees as e 
join Department as d on 
e.dep_id = d.dep_id where e.dep_id is not null