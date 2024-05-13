create database librarymanagementsystem;
use librarymanagementsystem;
CREATE TABLE Authors (
AuthorID INT PRIMARY KEY,
Name VARCHAR(255),
Bio TEXT
);

CREATE TABLE Books (
BookID INT PRIMARY KEY,
Title VARCHAR(255),
AuthorID INT,
Publisher VARCHAR(255),
Year INT,
FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE Members (
MemberID INT PRIMARY KEY,
Name VARCHAR(255),
Address VARCHAR(255),
Phone VARCHAR(20)
);


CREATE TABLE Book_Copies (
BookCopyID INT PRIMARY KEY,
BookID INT,
CopyNumber INT,
Status VARCHAR(50),
FOREIGN KEY (BookID) REFERENCES Books(BookID)
);


CREATE TABLE Loans (
LoanID INT PRIMARY KEY,
BookCopyID INT,
MemberID INT,
LoanDate DATE,
DueDate DATE,
FOREIGN KEY (BookCopyID) REFERENCES Book_Copies(BookCopyID),
FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

CREATE TABLE Genres (
GenreID INT PRIMARY KEY,
Name VARCHAR(255)
);


CREATE TABLE Book_Genres (
BookID INT,
GenreID INT,
PRIMARY KEY (BookID, GenreID),
FOREIGN KEY (BookID) REFERENCES Books(BookID),
FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

CREATE TABLE Publishers (
PublisherID INT PRIMARY KEY,
Name VARCHAR(255)
);

CREATE TABLE Book_Publishers (
BookID INT,
PublisherID INT,
PRIMARY KEY (BookID, PublisherID),
FOREIGN KEY (BookID) REFERENCES Books(BookID),
FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID)
);

CREATE TABLE Fines (
FineID INT PRIMARY KEY,
LoanID INT,
Amount DECIMAL(10, 2),
Paid BOOLEAN,
FOREIGN KEY (LoanID) REFERENCES Loans(LoanID)
);

INSERT INTO Authors (AuthorID, Name, Bio) VALUES (1, 'J.K. Rowling', 'British author');

INSERT INTO Books (BookID, Title, AuthorID, Publisher, Year) VALUES (1, 'Harry Potter', 1, 'Bloomsbury', 1997);

INSERT INTO Members (MemberID, Name, Address, Phone) VALUES (1, 'John Doe', '123 Main St', '1234567890');

INSERT INTO Book_Copies (BookCopyID, BookID, CopyNumber, Status) VALUES (1, 1, 1, 'Available');

INSERT INTO Loans (LoanID, BookCopyID, MemberID, LoanDate, DueDate) VALUES (1, 1, 1, '2022-01-01', '2022-01-31');

INSERT INTO Genres (GenreID, Name) VALUES (1, 'Fantasy');

INSERT INTO Book_Genres (BookID, GenreID) VALUES (1, 1);
INSERT INTO Publishers (PublisherID, Name) VALUES (1, 'Bloomsbury');

INSERT INTO Book_Publishers (BookID, PublisherID) VALUES (1, 1);

INSERT INTO Fines (FineID, LoanID, Amount, Paid) VALUES (1, 1, 10.00, 0);

SELECT * FROM Authors;
SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM Book_Copies;
SELECT * FROM Loans;
SELECT * FROM Genres;
SELECT * FROM Book_Genres;
SELECT * FROM Publishers;
SELECT * FROM Book_Publishers;
SELECT * FROM Fines;


