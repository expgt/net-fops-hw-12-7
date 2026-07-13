INSERT INTO customers (customer_id, store_id, first_name, last_name, email)
VALUES (1, 1, 'first_name1', 'last_name1', 'email1'),
       (2, 2, 'first_name2', 'last_name2', 'email2'),
       (3, 3, 'first_name3', 'last_name3', 'email3'),
       (4, 4, 'first_name4', 'last_name4', 'email4'),
       (5, 5, 'first_name5', 'last_name5', 'email5'),
       (6, 6, 'first_name6', 'last_name6', 'email6'),
       (7, 7, 'first_name7', 'last_name7', 'email7'),
       (8, 8, 'first_name8', 'last_name8', 'email8'),
       (9, 9, 'first_name9', 'last_name9', 'email9'),
       (10, 10, 'first_name10', 'last_name10', 'email10');


INSERT INTO books (book_id, customers_id, author, title, release_year)
VALUES (1, 1, 'Author1', 'book1', 1980),
       (2, 2, 'Author2', 'book2', 1997),
       (3, 3, 'Author3', 'book3', 2005),
       (4, 4, 'Author4', 'book4', 2005),
       (5, 5, 'Author5', 'book5', 2005),
       (6, 6, 'Author6', 'book6', 2001),
       (7, 7, 'Author7', 'book7', 1917),
       (8, 8, 'Author8', 'book8', 1956),
       (9, 9, 'Author9', 'book9', 1972),
       (10, 10, 'Author10', 'book10', 1993);


INSERT INTO stores (store_id, book_id, address, rating)
VALUES (1, 1, 'address1', 101),
       (2, 2, 'address2', 102),
       (3, 3, 'address3', 103),
       (4, 4, 'address4', 104),
       (5, 5, 'address5', 105),
       (6, 6, 'address6', 106),
       (7, 7, 'address7', 107),
       (8, 8, 'address8', 108),
       (9, 9, 'address9', 109),
       (10, 10, 'address10', 110);