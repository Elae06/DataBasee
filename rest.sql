
USE library;

SELECT * FROM categories;

SELECT * FROM authors;

SELECT * FROM books;

SELECT * FROM members;

SELECT * FROM loans;

SELECT
    books.title,
    authors.first_name,
    authors.last_name
FROM books
JOIN authors ON books.author_id = authors.id;

SELECT
    books.title,
    categories.name AS category
FROM books
JOIN categories ON books.category_id = categories.id;

SELECT
    books.id,
    books.title,
    books.isbn,
    books.publication_year,
    books.available,
    authors.first_name AS author_first_name,
    authors.last_name AS author_last_name,
    categories.name AS category
FROM books
JOIN authors ON books.author_id = authors.id
JOIN categories ON books.category_id = categories.id;

SELECT
    loans.id,
    members.first_name,
    members.last_name,
    books.title,
    loans.loan_date
FROM loans
JOIN members ON loans.member_id = members.id
JOIN books ON loans.book_id = books.id
WHERE loans.return_date IS NULL;

SELECT
    members.first_name,
    members.last_name,
    books.title,
    loans.loan_date,
    loans.return_date
FROM loans
JOIN members ON loans.member_id = members.id
JOIN books ON loans.book_id = books.id
WHERE loans.return_date IS NOT NULL;

SELECT *
FROM books
WHERE title LIKE '%Code%';

SELECT *
FROM authors
WHERE last_name LIKE '%Martin%';

SELECT *
FROM books
WHERE available = TRUE;

SELECT *
FROM books
WHERE available = FALSE;

SELECT COUNT(*) AS total_books
FROM books;

SELECT COUNT(*) AS total_members
FROM members;

SELECT
    categories.name AS category,
    COUNT(books.id) AS number_of_books
FROM categories
LEFT JOIN books ON categories.id = books.category_id
GROUP BY categories.id, categories.name;

SELECT
    authors.first_name,
    authors.last_name,
    COUNT(books.id) AS number_of_books
FROM authors
LEFT JOIN books ON authors.id = books.author_id
GROUP BY authors.id, authors.first_name, authors.last_name;

SELECT
    members.first_name,
    members.last_name,
    COUNT(loans.id) AS number_of_loans
FROM members
LEFT JOIN loans ON members.id = loans.member_id
GROUP BY members.id, members.first_name, members.last_name;

INSERT INTO members
(first_name, last_name, email, registration_date)
VALUES
('Ali', 'Haddad', 'ali@example.com', '2026-10-02');

INSERT INTO authors
(first_name, last_name, nationality)
VALUES
('Antoine', 'De Saint-Exupery', 'French');

INSERT INTO categories
(name, description)
VALUES
('Romance', 'Books focused on romantic relationships');

UPDATE members
SET email = 'ahmed.benali@example.com'
WHERE id = 1;

UPDATE books
SET publication_year = 1950
WHERE id = 1;

INSERT INTO loans
(member_id, book_id, loan_date, return_date)
VALUES
(1, 2, '2026-10-02', NULL);

UPDATE books
SET available = FALSE
WHERE id = 2;

UPDATE loans
SET return_date = '2026-10-02'
WHERE member_id = 2
AND book_id = 2
AND return_date IS NULL;

UPDATE books
SET available = TRUE
WHERE id = 2;

SELECT
    members.first_name,
    members.last_name,
    books.title,
    loans.loan_date,
    loans.return_date
FROM loans
JOIN members ON loans.member_id = members.id
JOIN books ON loans.book_id = books.id
WHERE members.id = 1;

SELECT *
FROM books
WHERE publication_year > 2000;

SELECT *
FROM books
ORDER BY title ASC;

SELECT *
FROM books
ORDER BY publication_year DESC;

