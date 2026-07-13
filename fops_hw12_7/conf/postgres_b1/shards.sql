
CREATE TABLE customers
(
    customer_id int not null,
    store_id int not null,
    first_name character varying not null,
    last_name character varying not null,
    email character varying not null,
    CONSTRAINT customer_id_check CHECK (customer_id <= 4)
);


CREATE TABLE books
(
    book_id int not null,
    customers_id int not null,
    author character varying not null,
    title character varying not null,
    release_year int not null,
    CONSTRAINT book_id_check CHECK (book_id <= 4)
);


CREATE TABLE stores
(
    store_id int not null,
    book_id int not null,
    address character varying not null,
    rating int not null,
    CONSTRAINT store_id_check CHECK (store_id <= 4)
);