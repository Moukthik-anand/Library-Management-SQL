create database Bookstore

use Bookstore

-- Creating books table to show all the books that are there in the library

create table books
(BOOK_ID int Primary key , TITLE varchar(255) , AUTHOR varchar(255) , GENRE varchar(255) ,
PUBLISHED_YEAR int , TOTAL_COPIES int , AVAILABLE_COPIES int , SHELF_NO varchar(255))

insert books(BOOK_ID,TITLE,AUTHOR,GENRE,PUBLISHED_YEAR,TOTAL_COPIES,AVAILABLE_COPIES,SHELF_no) values
(12,'The Girl on the train','Paula Hawkins','Thriller',2015,5,5,'A1'),
(28,'The Hobbit','J.R.R.Tolkien','Fantasy',1937,6,6,'B1'),(16,'To Kill a Mockingbird','Harper lee','Drama',1960,4,4,'D1'),
(57,'The Silent Patient','Alex Michaelids','Thriller',2019,8,8,'A1'),(22,'The Golden Compass','Philip Pullman','Fantasy',1995,5,5,'B1'),
(34,'A Game of Thrones','George R.R.Martin','Fantasy',1996,3,3,'B1'),
(41,'Gone Girl','Gillian Flynn','Thriller',2012,7,7,'A1'),(11,'Dune','Frank Herbet','Sci-Fi',1965,5,5,'C1'),
(27,'Me Before You','Jojo Moyes','Drama',2012,8,8,'D1'),(65,'The Martin','Andy Weir','Sci-Fi',2011,6,6,'C1'),
(59,'And There Were None','Agatha Christie','Mystery',1934,9,9,'A1'),(75,'Angels & Demons','Dan Brown','Thriller',2000,7,7,'A1'),
(64,'It','Stephen King','Horror',1986,7,7,'A2'),(86,'Atomic Habits','James Clear','Productivity',2018,11,11,'E1'),
(49,'Room','Emma Donoghue','Drama',2010,7,7,'D1'),(33,'The Crucible','Arthur Miller','Drama',1953,4,4,'D1'),
(69,'Jane Eyre','Charlotte Bronte','Fiction',1847,5,5,'C2'),(88,'Hyperion','Dan Simmons','Sci-Fi',1989,4,4,'C1'),
(26,'Dracula','Bram Stoker','Horror',1897,7,7,'A2'),(71,'Frankenstein','Mary Shelly','Sci-Fi',1818,6,6,'C1')

select * from books 

-- Creating members table to save the data of members joined

create table members(SNo INT, MEMBER_ID INT primary key ,NAME VARCHAR(255), MAIL VARCHAR(255), PHONEno VARCHAR(15),JOIN_DATE date )

insert members values  (1,5450,'Aarav Mehta','	aarav.mehta@example.com','9876543210'	,'2024-05-28'	) ,             
                     (2,5451,'Priya Sharma	','	priya.sharma@example.com','9823456789	'	,'2024-06-10'),  
                     (3,5452,'Rohan Gupta	','	rohan.gupta@example.com','9845671234	',   '2024-07-21'),      
					 (4,5453,'Ananya Iyer	','	ananya.iyer@example.com	','9911223344	'	,'2024-07-28'	),       
					 (5,5454,'Karan Patel	','	karan.patel@example.com	','9765432109	'	,'2024-08-05'	),        
					 (6,5455,'Neha Reddy	','	neha.reddy@example.com	','9988776655'	,'2024-08-19'	),         
					 (7,5456,'Arjun Verma	','	arjun.verma@example.com	','9876512345	'	,'2024-08-20'	),    
					 (8,5457,'Sneha Nair	','	sneha.nair@example.com	','9833445566'	,'2024-09-02'	),       
					 (9,5458,'Vishal Kumar	','	vishal.kumar@example.com	','9922334455	'	,'2024-09-24'	),     
					 (10,5459,'Isha Singh	','	isha.singh@example.com	','9812345678	'	,'2024-10-01'	),     
					 (11,5460,'Rahul Joshi	','	rahul.joshi@example.com	','9797979797'	,'2024-10-16'	),     
					 (12,5461,'Meera Das	','	meera.das@example.com	','9753124680	'	,'2024-10-29'	),      
					 (13,5462,'Devansh Chauhan	','	devansh.ch@example.com	','9888888888	'	,'2024-12-15'	),      
                     (14,5463,'Tanya Bansal	','	tanya.bansal@example.com	','9827623456	'	,'2025-01-07'	),     
					 (15,5464,'Aditya Mishra	','	aditya.mishra@example.com	','9762812345	',	'2025-01-25'	),     
					 (16,5465,'Riya Jain	','	riya.jain@example.com	','9944112233	'	,'2025-02-16'	),     
					 (17,5466,'Nikhil Yadav	','	nikhil.yadav@example.com	','9834567890	'	,'2025-03-03'	),     
					 (18,5467,'Shruti Kaur	','	shruti.kaur@example.com	','9819898989	'	,'2025-03-19'	),      
					 (19,5468,'Manav Deshmukh	','	manav.deshmukh@example.com	','9900112233	'	,'2025-04-06'	),     
		             (20,5469,'Aishwarya Pillai	','	aishwarya.p@example.com	','9786123456	'	,'2025-04-15'	)

select * from members

-- Creating librarians table to maintain the employees data

create table librarians(SNo int , NAME varchar(255),PHONEno bigint, SHIFTS char(30),SALARY int )

insert librarians values 
(1,'Henry',6304807476,'Day',22000),(2,'Samuel',9396338131,'Evening',19000),(3,'Robin',6305495789,'Day',20000),
(4,'James',630549654,'Evening',18000),(5,'Daniel',9396395789,'Evening',19000)

select * from librarians

-- Creating records table to keep track of the persons and the books being borrowed by them

create table records(SNO int primary key , LOAN_ID int , BOOKS int , BOOK_ID varchar(20) , MEMBER_ID int , BORROW_DATE date,
RETURN_DATE date , BOOKS_RETURNED int ,LIBRARIAN varchar(15), PENDING int , foreign key(member_id) references 
members(member_id))

select * from records

alter table records add constraint book_check check ( books between 1 and 5 ) -- Only 5 books can be borrowed by a person at a time

insert into records values
(1,101,1,'41',5450,'2024-11-18','2024-12-05',1,'Henry',0),(2,102,2,'57,11',5451,'2024-12-12','2025-01-06',2,'Daniel',0),
(3,103,1,'59',5465,'2025-02-11','2025-03-02',1,'Samuel',0),(4,104,3,'75,22,28',5469,'2025-04-21',NULL,0,'Henry',3),
(5,105,2,'27,86',5461,'2025-03-07','2025-03-20',2,'Robin',0),(6,106,4,'64,71,49,11',5459,'2025-03-15','2025-04-15',3,'James',1),
(7,107,1,'33',5456,'2025-04-12','2025-03-04',1,'Samuel',0),(8,108,3,'57,41,57,88',5462,'2025-04-16','2025-05-02',2,'Daniel',1),
(9,109,3,'11,16,41',5458,'2025-05-10','2025-05-24',1,'Samuel',2),(10,110,5,'41,59,33,26,71',5466,'2025-05-16',NULL,0,'Henry',5)

select * from records  
 
 -- Creating a junction table for pending books

 create table record_books(RECORD_SNo int , BOOK_ID int , foreign key(record_sno) references records(sno) , foreign key (book_id) references books(book_id)) 

 insert into record_books values
 (4,75),(4,22),(4,28),(6,11),(9,16),(9,41),(10,41),(10,59),(10,33),(10,26),(10,71)

 select * from record_books

-- Joining record_books , members , and records table so that we can show the pending books name and person who borrowed it

select r.sno as RecordSNo , m.Name as MEMBER_NAME , b.TITLE as BOOK_TITLE , r.borrow_date , r.librarian from records r
join record_books rb on r.sno=rb.record_sno join books b on rb.book_id = b.book_id join members m on r.member_id=m.member_id order by R.sno

-- Joining members table and records table to check the records of all members

select  m.member_id,m.name, r.[LOAN_ID], r.BOOKS, r.[BOOK_ID], r.[MEMBER_ID], r.[BORROW_DATE], 
r.[RETURN_DATE], r.[BOOKS_RETURNED] , r.PENDING from members m
full join records r on m.MEMBER_ID = r.MEMBER_ID

-- Manual update to sync available copies with record_books table to create a trigger basing on it
update books
set available_copies = total_copies - ( select count(*) from record_books rb where rb.book_id = books.book_id)

-- Optional: for books never borrowed
update books
set available_copies = total_copies
where book_id not in (select distinct book_id from record_books)

-- Creating a trigger that automatically updates where books are borrowed and returned 

create trigger trg_updateAvailableCopies
on record_books
after Insert , Delete
as
begin
update books set available_copies=total_copies - (select count(*) from record_books rb where rb.book_id = books.book_id)  --To reduce avialble copies from books that are borrowed 
where book_ID in ( select distinct book_id from record_books)
update books
set available_copies=total_copies where book_ID not in ( select distinct book_id from record_books) -- For books that no longer have any pendings
End

select * from  books

-- Updating records and pending books whenever books are returned to check if the trigger works

update records set pending=3 where sno=10
update records set books_returned=2 where sno=10
update records set return_date='2025-06-03' where sno=10

delete from record_books where record_sno = 10 and book_id in (59,26,71)

/* Creating a trigger that automatically updates pending status in records whenever book is returned in record_books table but we"ll have to 
update book_returned manually in record table since its not included in trigger */

create trigger trg_updatependingcount
on record_books
after insert, delete
as
begin
-- Increase pending count when new rows are inserted
if exists (select 1 from inserted)
begin
update r set r.pending = r.pending + i.count_inserted from records r inner join ( select record_sno, count(*) as count_inserted from inserted group by record_sno)
i on r.sno = i.record_sno
end
-- Decrease pending count when rows are deleted
if exists (select 1 from deleted)
begin
update r set r.pending = r.pending - d.count_deleted from records r inner join 
(select record_sno, count(*) as count_deleted from deleted group by record_sno ) d on r.sno = d.record_sno end
end

-- To check id the trigger is working

select pending from records where sno = 10

-- Insert a new pending book

insert into record_books values (10, 88)  -- pending should increase by 1

select * from records
select * from books

-- Delete a pending book
delete from record_books where record_sno = 10 and book_id = 88  -- pending should decrease by 1


--Simple queries basing on the library data

--Total books in library

select sum(total_copies) as [Total books in library] from books 

-- To see books that aren't submitted yet

select * from records where pending > 0   

-- To see how many books were borrowed during that librarian's time from library 

select librarian , count(*) as Count from records group by librarian order by count desc

-- List all overdue records (where return_date is NULL and borrow date > 20 days ago)

select * from records where return_date is null and borrow_date < dateadd(day, -20, getdate())

-- Get top 5 most borrowed books by frequency

select top (5) b.title, count(*) as Times_borrowed from record_books rb join books b on rb.book_id = b.book_id
group by b.title order by times_borrowed desc

-- Get member(s) who borrowed the highest number of books

select top (1) m.name as Name, sum(r.books) as Total_borrowed from members m join records r on m.member_id = r.member_id
group by m.name order by total_borrowed desc

-- Get current availability of all books (sorted by least available)

select title, available_copies, total_copies from books order by available_copies asc

