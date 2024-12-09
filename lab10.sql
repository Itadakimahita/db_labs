--1
START TRANSACTION;

INSERT INTO Orders (order_id, book_id, customer_id, order_date, quantity)
VALUES (1, 1, 101, CURDATE(), 2);

UPDATE Books
SET quantity = quantity - 2
WHERE book_id = 1;

COMMIT;


--2
START TRANSACTION;

INSERT INTO Orders (order_id, book_id, customer_id, order_date, quantity)
VALUES (2, 3, 102, CURDATE(), 10);

IF (SELECT quantity FROM Books WHERE book_id = 3) < 10 THEN
    ROLLBACK;
ELSE
    UPDATE Books
    SET quantity = quantity - 10
    WHERE book_id = 3;
    COMMIT;
END IF;

--3
--sess1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;

UPDATE Books  
SET price = 42.00
WHERE book_id = 1;

--sess2
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;

SELECT price FROM Books WHERE book_id = 1;

COMMIT;


--4
START TRANSACTION;


UPDATE Customers
SET email = 'newemail@example.com'
WHERE customer_id = 101;

COMMIT;

SELECT * FROM Customers WHERE customer_id = 101;
