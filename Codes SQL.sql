##---------------------Import CSV TO sql, it will read data (In Powershell Prompt<black notepad> )----------------##
cd(enter)
cd(folder name)
csvsql --dialect mysql --snifflimit 100000 order.csv > output_order.sql

##-------------------------- To off SAfe Mode -----------------------------##
set SQL_SAFE_UPDATES=0;

##------------------to ignor( , ) value from data ,becos sql not take , values .ex(values=1,234 or 119,sewadal...)----##
set session sql_mode = ' ';

##------------to increase the size of File----1MB = 1048576----20mb then*1048576----------------##
set global max_allowed_packed = 1048576; 
 
## -------------------------TO LOAD DATA---------------------------------- ##
load data infile 'D:/Customer.csv'
into table customer
fields terminated by "," 
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

##--------------Update------Date(varchar) To Date(date)----------------imp-------------------##
alter table sales_data_final
add column order_date_new date after order_date;

select 

update sales_data_final
set order_date_new = str_to_date(order_date,"%m/%d/%Y");

##------------------------Autocommit-------------------------------------------###
#--autocommit is also known as autosave
#--rollback is used as undo it will take on !st step from where we started--
#--Truncate function wll delete the info fron the table ad give only blank table
#--Delete function will delete line by line all information

##------------To Find Duplicate------------------------------------------------##
select name, email, count(name)
from student_contacts
group by name
having count(name) > 1 ;

##------------------------------To Delete Duplicate--------------------------##
delete S1 from student_contacts as S1
inner join student_contacts as S2
where S1.id < S2.id and S1.email = S2.email ;

## -----------------IMP------ Inner joinS---------------Two Tables-------------##
select `order`.OrderID,customer.CustomerName,`order`.OrderDate
from `order`
inner join customer on `order`.CustomerID=customer.CustomerID;

##---------------------------------------For--------Three Tables-----------##
select `order`.OrderID,customer.CustomerName,`order`.OrderDate
from ((`order`
inner join customer on `order`.CustomerID=customer.CustomerID)
inner join Shippers on `order`.ShipperID=Shippers.ShipperID);

##------------------IMP---------Left Joins----------------------------##
select Customer.CustomerName,`order`.OrderDate
from Customer
left join `order` on Customer.CustomerID = `order`.CustomerID
order by Customer.CustomerName;      ##----(if we want in order)----##

##------------------IMP------------Right Join-------------------------##
select `Order`.OrderID,Employees.LastName,Employee.FirstName
from`Order`
right join Employees on `Order`.EmployeeID = Employees.EmployeeID
order by `Order`.OrderID;

##------------------------------Self Join------(Same Table)------------------##
select A.CustomerName AS CustomerName1, B.CustomerName as CustomerName2, A.city
from Customer A, Customer B
where A.CustomerID <> B.CustomerID       #--(<> not eqal)--(= equal)
and A.City = B.City 
order by A.city; 

##--------------------------Outer Join / Cross Join-----------------------------##
select Customer.CustomerName, `Order`.OrderID



##---------------------------------Having Clause---------------------------------##
##---Where we want to put condition then we will use `Having` not Where---------##
select avg(balance),age
from bank_details
group by age
having avg(balance)>100;

#------------------------------- Union Clause ------------------------------------##
select  
alter table employee
add column phone bigint after email;

##-------------------------------------------Group By-----------------------------##
select avg(balance),age
from bank_details
group by age
having avg(balance)>100; 

##-----------------------it will give unique value----exact variation in job, age, education
select distinct(age) from bank_details;

alter table employee
drop column phone;

alter table employee
add column ph_no bigint;

alter table employee
rename column ph_no to contact;

select * from citybank.bank_details where marital = 'single';

select count(*)  from citybank.bank_details where marital = 'single';

select * from citybank.bank_details where age > 40 ;
select count(*) from citybank.bank_details where age = 60 ;

select * from citybank.bank_details order by age ;

select * from citybank.bank_details order by age desc ;

select sum(balance) from citybank.bank_details ;

select avg(balance) from citybank.bank_details ;

select min(balance) from citybank.bank_details ;

select age,avg(balance) from citybank.bank_details group by age order by age;

select * from citybank.bank_details where balance = (select min(balance) from citybank.bank_details);

select * from citybank.bank_details where balance = (select max(balance) from citybank.bank_details);

##----------to find by 1st, last, middle letter-----------------------  ###----------------------------------##
 select * from bank_details where job like 'm%';
 
  select * from bank_details where job like '%n';

 select * from bank_details where job like '%ag%';

 select * from bank_details where job like '_a%';

  select * from bank_details where job like 't%n';
 
 select * from bank_details where loan like 'y_%';
