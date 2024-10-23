create table Employee(
Id int,
Name varchar(50),
Salary INT,
Gender varchar(10),
City varchar(50),
Dept varchar(50)
)
insert into Employee values (3,'Pranaya',4500,'Male','New York','IT')
insert into Employee values (1,'Anurag',2500,'Male','London','IT')
insert into Employee values (4,'Priyanka',5500,'Female','Tokiyo','HR')
insert into Employee values (5,'Sambit',3000,'Male','Toronto','IT')
insert into Employee values (7,'Preety',6500,'Female','Mumbai','HR')
insert into Employee values (6,'Tarun',4000,'Male','Delhi','IT')
insert into Employee values (2,'Hina',5000,'Female','Sydney','HR')
insert into Employee values (8,'John',6500,'Male','Mumbai','HR')
insert into Employee values (10,'Pam',4000,'Female','Delhi','IT')
insert into Employee values (9,'Sara',500,'Female','London','IT')

select * from Employee where Id=8

create index IX_Employee_ID
ON Employee(ID asc)

create clustered index IX_Employee_ID1
on Employee (ID asc)

create table Employee1(
Id int primary key,
Name varchar(50),
Salary INT,
Gender varchar(10),
City varchar(50),
Dept varchar(50)
)

select * from employee1

insert into Employee1 values (3,'Pranaya',4500,'Male','New York','IT')
insert into Employee1 values (1,'Anurag',2500,'Male','London','IT')
insert into Employee1 values (4,'Priyanka',5500,'Female','Tokiyo','HR')
insert into Employee1 values (5,'Sambit',3000,'Male','Toronto','IT')
insert into Employee1 values (7,'Preety',6500,'Female','Mumbai','HR')
insert into Employee1 values (6,'Tarun',4000,'Male','Delhi','IT')
insert into Employee1 values (2,'Hina',5000,'Female','Sydney','HR')
insert into Employee1 values (8,'John',6500,'Male','Mumbai','HR')
insert into Employee1 values (10,'Pam',4000,'Female','Delhi','IT')
insert into Employee1 values (9,'Sara',500,'Female','London','IT')

select * from sales.customers

---example of unique index---
create unique index idx_unique_email
on sales.customers(email)

-- exmaple for clustered index---------
--we can create only one clustered index per table
--if we have primary key in a table automatically it will create clustered index for the table
--suppose when table is not having primary key then only we can create clustered index. 
-- if we can duplicate values exist it will sort and store data  

create clustered index IX_Employee_ID1
on Employee (ID asc)

--example of non clustered index---------
--we can create upto 999 non clustered index per table
create nonclustered index idx_name
on sales.customers(first_name,last_name)
(or)
create index idx_name1
on sales.customers(first_name,last_name)

create table department (
Id int,
Name varchar(100)
)
insert into Department values (1,'HR'),(1,'Admin')

select * from department

create clustered index idx_dept_id
on Department(Id)

insert into department values(2,'IT'),(3,'Transport'),(2,'Information Tech')
 insert into department (Name) values ('Insurance')

------------VIEW-------------
 create table tb1Employee(
 Id int Primary key,
 Name nvarchar(30),
 Salary int,
 Gender nvarchar(10),
 DepartmentId int
 )
 --sql script to create tb1dapartment table
 create table tb1Department(
 DeptId int primary key,
 DeptName nvarchar(20)
 )
 --Insert data to tb1dapartment table
insert into tb1Department values(1,'IT')
insert into tb1Department values(2,'Payroll')
insert into tb1Department values(3,'HR')
insert into tb1Department values(4,'Admin')
 
 --insert data to tb1Employee table
insert into tb1Employee values(1,'John',5000,'Male',3)
insert into tb1Employee values(2,'Mike',3400,'Male',2)
insert into tb1Employee values(3,'Pam',6000,'Female',1)
insert into tb1Employee values(4,'Todd',4800,'Male',4)
insert into tb1Employee values(5,'Sara',3200,'Female',1)
insert into tb1Employee values(6,'Ben',4800,'Male',3)

select Id,Name,salary,Gender,DeptName
from tb1Employee
 join tb1Department
 on tb1Employee.DepartmentId=tb1Department.DeptId


 --Now let's create a view, using the joins query, we have just written   
 
 create view vWEmployeesByDepartment
 as
 select Id,Name,Salary,Gender,DeptName
 from tb1Employee
 join tb1Department
 on tb1Employee.DepartmentId=tb1Department.DeptId

 select * from vWEmployeesByDepartment
 select * from tb1Employee
 update vWEmployeesByDepartment set Name='Geetha' where Id=3

 insert into vWEmployeesByDepartment values(7,'Ron',9000,'Male','IT')

 --view that returns only IT department employee
 create view vWITDepartment_Employee
 as
 select Id,Name,Salary,Gender,DeptName
 from tb1Employee
 join tb1Department
 on tb1Employee.DepartmentId=tb1Department.DeptId
 where tb1Department.DeptName='IT'

 select * from vWITDepartment_Employee

 create view vWEmployeesCountByDepartment
 as
 select DeptName,count(Id) as TotalEmployees
 from tb1Employee
 join tb1Department
 on tb1Employee.DepartmentId=tb1Department.DeptId
 group by DeptName

 select * from vWEmployeesCountByDepartment

 sp_helptext vWEmployeesCountByDepartment

 -------TRIGGER----------
 create table orders(
 order_id int primary key,
 customer_id int,
 order_date  date
 )

 create table order_audit(
 audit_id int identity primary key,
 order_id int,
 customer_id int,
 order_date date,
 audit_date datetime default getdate()
 )
 alter table order_audit add audit_information varchar(max)

 --example for After or For trigger with insert
 select * from orders
 select * from order_audit

 create trigger trgAfterInsertOrder
 on Orders
 After insert
 as
 begin
 declare @auditInfo nvarchar (1000)
 set @auditInfo='Data Inserted'
 insert into order_audit(order_id,customer_id,order_date,audit_information)
 select order_id,customer_id,order_date,@auditInfo
 from inserted
 end

 insert into orders values(1001,31,'8-10-2024')
 insert into orders values(1002,41,'8-8-2024')
 update orders set customer_id=32 where order_id=1
 update orders set customer_id=31 where order_id=1001

--example for alter or for trigger with update
alter trigger trgAfterInsertOrder
on orders
for update 
as
begin
declare @auditInfo nvarchar(1000)
set @auditInfo='Data Changed'
insert into order_audit(order_id,customer_id,order_date,audit_information)
select order_id,customer_id,order_date,@auditInfo
from inserted
end

update orders set customer_id=33,order_date='10-10-2020'
where order_id=1001
update orders set customer_id=32,order_date='10-10-2024'
where order_id=1001

select * from tb1Department
select * from tb1Employee

--example for instead of trigger
create view vwEmployeeDetails
as
select id,name,gender,deptname from tb1Employee e
join tb1Department d
on e.DepartmentId=d.DeptId

select * from vwEmployeeDetails
 
 insert vwEmployeeDetails values (7,'Tina','Female','HR')

 create trigger tr_vwEmployeeDetails_InsteadOfInsert
 on vwEmployeeDetails
 instead of insert
 as
 begin 
 declare @deptId int
 select @deptId = DeptId from tb1Department
 join inserted 
 on inserted.DeptName=tb1Department.DeptName
 if(@deptId is null)
 begin
 raiserror('Invalid Department Name Statement terminated',16,1)
 return 
 end
 insert into tb1Employee(Id,Name,Gender,DepartmentId)
 select Id,Name,Gender,@deptId
 from inserted
 end

 insert vwEmployeeDetails values (7,'Tina','Female','HR')
 insert vwEmployeeDetails values (8,'Yash','Male','Banking')

 ------Transaction-------
 begin transaction
 insert into sales.orders(customer_id,order_status,order_date,
 required_date,shipped_date,store_id,staff_id)
 values (49,4,'20170228','20170301','20170302',2,6);
 insert into sales.order_items(order_id,item_id,product_id,
 quantity,list_price,discount)
 values (93,12,8,2,269.99,0.07);
 if @@ERROR=0
 begin
 commit transaction
 print 'Insertion successful!...'
 end
 else
 begin
 rollback transaction 
 print 'Something went wrong while insertion'
 end

 select * from production.products where product_id=8

 create table Customers(
 customer_id int primary key,
 Name varchar(100),
 active bit
 )
 create table order1(
 order_id int primary key,
 customer_id int foreign key references Customers(customer_id),
 order_status varchar(100))

insert into Customers values (1,'Pam',1),(2,'Kim',1)
insert into order1 values (101,1,'Pending'),(102,2,'Pending')

---TRANSACTION A
begin transaction
update Customers set name='John'
where customer_id=1
waitfor delay '00:00:05';
update order1 set order_status='Processed'
where order_id=101
commit transaction

---TRANSACTION B
begin transaction
update order1 set order_status='shipped'
where order_id=101
waitfor delay '00:00:05';
update Customers set Name='Geetha'
where customer_id=1
commit transaction

