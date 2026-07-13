
CREATE TABLE customers
(
    customer_id int not null,
    store_id int not null,
    first_name character varying not null,
    last_name character varying not null,
    email character varying not null,
    CONSTRAINT customer_id CHECK (customer_id > 4 and customer_id <= 8)
);


CREATE TABLE books
(
    book_id int not null,
    customers_id int not null,
    author character varying not null,
    title character varying not null,
    release_year int not null,
    CONSTRAINT book_id CHECK (book_id > 4 and book_id <= 8)
);


CREATE TABLE stores
(
    store_id bigint not null,
    book_id bigint not null,
    address character varying not null,
    rating int not null,
    CONSTRAINT store_id CHECK (store_id > 4 and store_id <= 8)
);