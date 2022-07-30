-- 1. MEMBUAT TABEL

-- Tabel Books
CREATE TABLE Books (BookID char(5) Not Null, BookTitle varchar(50) Not Null, BookAuthor varchar(50) Not Null, PublicationYear varchar(5)
CONSTRAINT PK1 PRIMARY KEY (BookID));

-- Tabel Borrows
CREATE TABLE Borrows (BorrowID char(5) Not Null, BookID char(5) Not Null, MemberID char(5) Not Null, BorrowDate date Not Null, 
DueDate date Not Null, ReturnDate date
CONSTRAINT PK2 PRIMARY KEY (BorrowID));

-- Tabel Members
CREATE TABLE Members (MemberID char(5) Not Null, MemberName varchar(50) Not Null, MemberPhone varchar(15) Not Null, 
MemberAddress varchar(100) Not Null, MemberEmail varchar(25) Not Null
CONSTRAINT PK3 PRIMARY KEY (MemberID));

-- 2. MENAMBAHKAN KOLOM
ALTER TABLE Books ADD BookEdition varchar(20);

-- 3. INSERT DATA

-- Tabel Books
INSERT INTO Books (BookID, BookTitle, BookAuthor, PublicationYear, BookEdition) 
VALUES ('BK000','Algoritma dan Pemrograman','Alisa Carmella','2020','Edisi Keempat');
INSERT INTO Books (BookID, BookTitle, BookAuthor, PublicationYear, BookEdition) 
VALUES ('BK001','Object-Oriented Programming','Budi Haryanto','2019','Edisi Ketiga');
INSERT INTO Books (BookID, BookTitle, BookAuthor, PublicationYear, BookEdition) 
VALUES ('BK002','Database Systems','Clarissa Gabriella Susanto','2021','Edisi Kedua');
INSERT INTO Books (BookID, BookTitle, BookAuthor, PublicationYear, BookEdition) 
VALUES ('BK003','Sistem Jaringan','Gian Regiansyah Ibrahim','2021','Edisi Kelima');

-- Tabel Borrows
INSERT INTO Borrows (BorrowID, BookID, MemberID, BorrowDate, DueDate, ReturnDate)
VALUES ('BW000','BK001','MB002','2021/07/11','2021/07/18','2021/07/17');
INSERT INTO Borrows(BorrowID, BookID, MemberID, BorrowDate, DueDate, ReturnDate)
VALUES ('BW001','BK002','MB000','2021/07/11','2021/07/18','2021/07/21');
INSERT INTO Borrows(BorrowID, BookID, MemberID, BorrowDate, DueDate, ReturnDate)
VALUES ('BW002','BK003','MB004','2021/07/12','2021/07/19','2021/07/16');
INSERT INTO Borrows(BorrowID, BookID, MemberID, BorrowDate, DueDate, ReturnDate)
VALUES ('BW003','BK002','MB003','2021/07/12','2021/07/19','2021/07/25');
INSERT INTO Borrows(BorrowID, BookID, MemberID, BorrowDate, DueDate, ReturnDate)
VALUES ('BW004','BK000','MB001','2021/07/14','2021/07/21','2021/07/19');

-- Tabel Members
INSERT INTO Members (MemberID, MemberName, MemberPhone, MemberAddress, MemberEmail)
VALUES ('MB000','Sunny Larosa','081298764321','Sudirman Street No. 26','sunnyrosa@email.com');
INSERT INTO Members (MemberID, MemberName, MemberPhone, MemberAddress, MemberEmail)
VALUES ('MB001','Michelle Belinda','088153467908','Beringin Street No. 81','mbelinda@email.com');
INSERT INTO Members (MemberID, MemberName, MemberPhone, MemberAddress, MemberEmail)
VALUES ('MB002','Gilbert Christopher','085691283746','Palmerah Street No. 57','gilbert.c@email.com');
INSERT INTO Members (MemberID, MemberName, MemberPhone, MemberAddress, MemberEmail)
VALUES ('MB003','Diarick Novaldo','081919452812','Grand Palem Street No. 99','novaldo.diarick@email.com');
INSERT INTO Members (MemberID, MemberName, MemberPhone, MemberAddress, MemberEmail)
VALUES ('MB004','Timothy Julian','081261279485','Gading Street No. 2','timothyjulian@email.com');

-- 4. MENGUBAH MemberPhone DI TABEL Members
UPDATE Members SET MemberPhone = STUFF(MemberPhone, 1, 2, '+628');

-- 5. MENGHITUNG DENDA
SELECT a.BorrowID, b.MemberName, c.BookTitle, a.DueDate, a.ReturnDate,
'Rp. '+CAST(DATEDIFF(DAY,a.DueDate,a.ReturnDate)*5000 AS varchar) AS Fine 
FROM Borrows AS a
JOIN Members AS b ON a.MemberID = b.MemberID 
JOIN Books AS c ON a.BookID = c.BookID
WHERE DATEDIFF(DAY,a.DueDate,a.ReturnDate) > 1;