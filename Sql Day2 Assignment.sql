---ASSIGNMENT 7----------
---Create a trigger to updates the Stock (quantity) table whenever new order placed in orders tables
CREATE TRIGGER trg_UpdateStockOnNewOrder
ON sales.order_items
AFTER INSERT
AS
BEGIN
declare @store_id int,@product_id int , @quantity int;
select @store_id=so.store_id,
@product_id=inserted.product_id,
@quantity=inserted.quantity
from inserted
inner join sales.orders so
on inserted.order_id=so.order_id;
update production.stocks
set quantity=quantity-@quantity
where store_id=@store_id and product_id=@product_id
end

----ASSIGNMENT 8-----
--Create a trigger to that prevents deletion of a customer if they have existing orders.
CREATE TRIGGER trg_PreventCustomerDeletion
ON sales.customers
INSTEAD OF DELETE
AS
BEGIN
IF EXISTS (
SELECT 1
FROM sales.orders
WHERE sales.orders.customer_id IN (SELECT customer_id FROM deleted))
BEGIN
RAISERROR ('Cannot delete customer with existing orders.', 16, 1);
END
ELSE
BEGIN
DELETE FROM sales.customers
WHERE customer_id IN (SELECT customer_id FROM deleted);
END
END;

---ASSIGNMENT 9
--Create Employee,Employee_Audit  insert some test data
--	b) Create a Trigger that logs changes to the Employee Table into an Employee_Audit Table 
CREATE TABLE Employee2 (
 EmployeeID INT PRIMARY KEY IDENTITY(1,1),
 EmployeeName NVARCHAR(100),
 Salary DECIMAL(10, 2)
);
CREATE TABLE Employee_Audit (
AuditID INT PRIMARY KEY IDENTITY(1,1),
EmployeeID INT,
EmployeeName NVARCHAR(100),
Salary DECIMAL(10, 2),
Type NVARCHAR(10), 
Date DATETIME DEFAULT GETDATE()
);

INSERT INTO Employee2(EmployeeName, Salary)
VALUES 
('Riya', 5000),
('Rahul', 6000),
('Samarth', 5500);

CREATE TRIGGER trg_EmployeeAudit
ON Employee2
AFTER INSERT, UPDATE
AS
BEGIN
IF EXISTS (SELECT * FROM inserted)
BEGIN
INSERT INTO Employee_Audit (EmployeeID, EmployeeName, Salary, Type)
SELECT EmployeeID, EmployeeName, Salary, 'INSERT'
FROM inserted;
END
IF EXISTS (SELECT * FROM deleted)
BEGIN
INSERT INTO Employee_Audit (EmployeeID, EmployeeName, Salary,Type)
SELECT EmployeeID, EmployeeName, Salary, 'DELETE'
FROM deleted;
END
IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
BEGIN
INSERT INTO Employee_Audit (EmployeeID, EmployeeName, Salary,Type)
SELECT EmployeeID, EmployeeName, Salary, 'UPDATE'
FROM inserted;
END
END;

SELECT * FROM Employee_Audit;

----ASSIGNMENT 10 -----
/*create Room Table with below columns
RoomID,RoomType,Availability
create Bookins Table with below columns
BookingID,RoomID,CustomerName,CheckInDate,CheckInDate
 
Insert some test data with both  the tables
Ensure both the tables are having Entity relationship
Write a transaction that books a room for a customer, ensuring the room is marked as unavailable.
has context menu*/

CREATE TABLE Room (
 RoomID INT PRIMARY KEY IDENTITY(1,1),
 RoomType NVARCHAR(50),
 Availability BIT 
);

create table Booking (
BookingID int identity primary key,
RoomID int foreign key references Room(RoomID),
CustomerName varchar(100),
CheckInDate date,
CheckOutDate date
);

INSERT INTO Room (RoomType, Availability)
VALUES 
('Single', 1),
('Double', 1),
('Suite', 1);

insert into Booking (RoomID, CustomerName, CheckInDate, CheckOutDate)
values 
(1, 'Ram', '2024-10-22', '2024-10-25'),
(2, 'Samarth', '2024-11-02', '2024-11-06');

begin transaction
declare @RoomID int = 3, @CustomerName varchar(100) = 'Geetha', 
@CheckInDate date = '2024-11-12', @CheckOutDate date = '2024-11-16';
if exists (select 1 from Room where RoomID = @RoomID and Availability = 1)
begin
insert into Booking (RoomID, CustomerName, CheckInDate, CheckOutDate)
values (@RoomID, @CustomerName, @CheckInDate, @CheckOutDate);
update Room
set Availability = 0
where RoomID = @RoomID;
commit transaction;
print 'Booking successful and room marked as unavailable.';
end
else
begin
rollback transaction;
print 'Room is not available.';
end;
