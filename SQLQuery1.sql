--Project: 
--You are building a database for the library management system. The 
--database will store information about books, members, transactions, 
--and authors. Your task is to create the necessary tables, insert data, and 
--run several queries to analyze and report on various aspects of the library 
--management system. 
--The library management system consists of the following entities: 
--• Books: Information about the books available in the library. 
--• Members: Information about library members. 
--• Transactions: Records of books borrowed or returned by 
--members. 
--• Authors: Information about authors who wrote the books. 
--Task 1: C`reate the Database and Tables. 
create database library_system
create table books(
	bk_id int primary key ,
	genre varchar(30) not null,
	bk_name varchar(30) not null,
	quantity int,
	price float not null,
	publish_year date not null);

create table members(
	id int primary key ,
	f_name varchar(30) not null,
	l_name varchar(30) not null,
	age int not null,
	join_date date not null);

create table transactions(
	transaction_id int primary key ,
	transaction_type varchar(30) not null,
	id int foreign key references members(id) not null,
	bk_id int not null foreign key references books(bk_id),
	transaction_date date not null);

create table Author(
	author_id int primary key ,
	Authored int not null foreign key references books(bk_id),
	dob date not null,
	f_name varchar(30) not null,
	l_name varchar(30) not null);

--Task 2: Insert Data into the Tables.
-- Insert records into the books table
INSERT INTO books (bk_id, genre, bk_name, quantity, price, publish_year)
VALUES 
(1, 'Fiction', 'Book One', 10, 15.99, '2020-01-01'),
(2, 'Science', 'Book Two', 5, 25.99, '2019-06-15'),
(3, 'History', 'Book Three', 8, 18.50, '2018-03-21'),
(4, 'Fantasy', 'Book Four', 20, 12.75, '2021-07-10'),
(5, 'Biography', 'Book Five', 15, 22.30, '2017-11-05'),
(6, 'Mystery', 'Book Six', 12, 14.99, '2022-04-18'),
(7, 'Technology', 'Book Seven', 7, 30.99, '2016-02-28'),
(8, 'Self-Help', 'Book Eight', 10, 16.25, '2023-08-12'),
(9, 'Romance', 'Book Nine', 9, 19.80, '2021-12-25'),
(10, 'Adventure', 'Book Ten', 11, 17.45, '2020-10-30');

-- Insert records into the members table
INSERT INTO members (id, f_name, l_name, age, join_date)
VALUES 
(1, 'John', 'Doe', 25, '2023-01-15'),
(2, 'Jane', 'Smith', 30, '2022-03-10'),
(3, 'Mike', 'Brown', 22, '2021-05-20'),
(4, 'Sarah', 'Johnson', 28, '2020-07-11'),
(5, 'Chris', 'Davis', 35, '2019-09-30'),
(6, 'Anna', 'Wilson', 27, '2023-04-22'),
(7, 'Tom', 'Moore', 29, '2021-11-05'),
(8, 'Laura', 'Taylor', 24, '2022-08-15'),
(9, 'Paul', 'Anderson', 33, '2020-12-20'),
(10, 'Emma', 'Lee', 26, '2021-02-18');

-- Insert records into the transactions table
INSERT INTO transactions (transaction_id, transaction_type, id, bk_id, transaction_date)
VALUES 
(1, 'Borrow', 1, 1, '2023-05-15'),
(2, 'Return', 2, 2, '2023-06-10'),
(3, 'Borrow', 3, 3, '2023-07-20'),
(4, 'Borrow', 4, 4, '2023-08-11'),
(5, 'Return', 5, 5, '2023-09-30'),
(6, 'Borrow', 6, 6, '2023-10-22'),
(7, 'Borrow', 7, 7, '2023-11-05'),
(8, 'Return', 8, 8, '2023-12-15'),
(9, 'Borrow', 9, 9, '2023-01-10'),
(10, 'Return', 10, 10, '2023-02-25');

-- Insert records into the Author table
INSERT INTO Author (author_id, Authored, dob, f_name, l_name)
VALUES 
(1, 1, '1980-01-01', 'Alice', 'Walker'),
(2, 2, '1975-05-15', 'Bob', 'Martin'),
(3, 3, '1982-09-10', 'Cathy', 'Johnson'),
(4, 4, '1990-03-20', 'Daniel', 'Smith'),
(5, 5, '1985-07-25', 'Emily', 'Brown'),
(6, 6, '1978-11-10', 'Frank', 'Taylor'),
(7, 7, '1983-02-14', 'Grace', 'Moore'),
(8, 8, '1992-08-30', 'Henry', 'Anderson'),
(9, 9, '1988-04-05', 'Ivy', 'Lee'),
(10, 10, '1995-12-22', 'Jack', 'Davis');
--Task 3: 
--Task 4: 
--1. Get all the books available in the library along with their stock 
--quantity. 
select quantity,bk_name from books
--2. Get the details of members who joined after 2024-01-01. 
select * from members 
where join_date >'01-01-2024'
--3. Get all transactions where a book was borrowed.
select * from transactions where transaction_type = 'Borrow'
--4. Get the details of the books that are out of stock 
--(StockQuantity = 0). 
select * from books where quantity = 0
--5. Get the list of authors along with their date of birth. 
select f_name, l_name, dob from Author 
--6. Find all books published in or after 2000. 
select bk_name,publish_year from books where publish_year = '01-01-2000' or  publish_year >'01-01-2000' 
--1. Find the total number of books available in the library. 
select count(bk_name) from books where quantity != 0
--2. Find the average price of all books in the library. 
select AVG(price) from books
--3. Find the total number of books borrowed in the library. 
select COUNT(transaction_type) from transactions where transaction_type = 'Borrow'
--4. Find the total number of books of each genre. 
select count(genre),genre from books group by genre 
--5. Find the total number of transactions made by each member.
select count(transaction_id) as transaction_count, id as member_id from transactions group by id
--6. Find the highest price of a book in the library. 
select MAX(price) from books
--7. Find the total number of books borrowed by each member. 
select count(id) from transactions where transaction_type = 'Borrow' group by id
--8. Find the total value of all books currently in stock. 
select sum(quantity)  from books