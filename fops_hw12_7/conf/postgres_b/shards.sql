CREATE EXTENSION postgres_fdw;


/* SHARD 1 */

CREATE SERVER server1
    FOREIGN DATA WRAPPER postgres_fdw
    OPTIONS (host 'postgres_b1', port '5432', dbname 'db_hw');

CREATE USER MAPPING FOR "postgres"
    SERVER server1
    OPTIONS (user 'postgres', password 'postgres');

CREATE FOREIGN TABLE customers_1
(
    customer_id int not null,
    store_id int not null,
    first_name character varying not null,
    last_name character varying not null,
    email character varying not null
) SERVER server1
  OPTIONS (schema_name 'public', table_name 'customers');

CREATE FOREIGN TABLE books_1
(
    book_id int not null,
    customers_id int not null,
    author character varying not null,
    title character varying not null,
    release_year int not null
) SERVER server1
  OPTIONS (schema_name 'public', table_name 'books');

CREATE FOREIGN TABLE stores_1
(
    store_id int not null,
    book_id int not null,
    address character varying not null,
    rating int not null
) SERVER server1
  OPTIONS (schema_name 'public', table_name 'stores');


/* SHARD 2 */

CREATE SERVER server2
    FOREIGN DATA WRAPPER postgres_fdw
    OPTIONS (host 'postgres_b2', port '5432', dbname 'db_hw');

CREATE USER MAPPING FOR "postgres"
    SERVER server2
    OPTIONS (user 'postgres', password 'postgres');

CREATE FOREIGN TABLE customers_2
(
    customer_id int not null,
    store_id int not null,
    first_name character varying not null,
    last_name character varying not null,
    email character varying not null
) SERVER server2
  OPTIONS (schema_name 'public', table_name 'customers');

CREATE FOREIGN TABLE books_2
(
    book_id int not null,
    customers_id int not null,
    author character varying not null,
    title character varying not null,
    release_year int not null
) SERVER server2
  OPTIONS (schema_name 'public', table_name 'books');

CREATE FOREIGN TABLE stores_2
(
    store_id int not null,
    book_id int not null,
    address character varying not null,
    rating int not null
) SERVER server2
  OPTIONS (schema_name 'public', table_name 'stores');


/* SHARD 3 */

CREATE SERVER server3
    FOREIGN DATA WRAPPER postgres_fdw
    OPTIONS (host 'postgres_b3', port '5432', dbname 'db_hw');

CREATE USER MAPPING FOR "postgres"
    SERVER server3
    OPTIONS (user 'postgres', password 'postgres');

CREATE FOREIGN TABLE customers_3
(
    customer_id int not null,
    store_id int not null,
    first_name character varying not null,
    last_name character varying not null,
    email character varying not null
) SERVER server3
  OPTIONS (schema_name 'public', table_name 'customers');

CREATE FOREIGN TABLE books_3
(
    book_id int not null,
    customers_id int not null,
    author character varying not null,
    title character varying not null,
    release_year int not null
) SERVER server3
  OPTIONS (schema_name 'public', table_name 'books');

CREATE FOREIGN TABLE stores_3
(
    store_id int not null,
    book_id int not null,
    address character varying not null,
    rating int not null
) SERVER server3
  OPTIONS (schema_name 'public', table_name 'stores');



CREATE VIEW customers AS
SELECT *
FROM customers_1
UNION ALL
SELECT *
FROM customers_2
UNION ALL
SELECT *
FROM customers_3;

CREATE RULE customers_insert AS ON INSERT TO customers
    DO INSTEAD NOTHING;
CREATE RULE customers_update AS ON UPDATE TO customers
    DO INSTEAD NOTHING;
CREATE RULE customers_delete AS ON DELETE TO customers
    DO INSTEAD NOTHING;

CREATE RULE customers_insert_to_1 AS ON INSERT TO customers
    WHERE (customer_id <= 4)
    DO INSTEAD INSERT INTO customers_1
               VALUES (NEW.*);

CREATE RULE customers_insert_to_2 AS ON INSERT TO customers
    WHERE (customer_id > 4 and customer_id <= 8)
    DO INSTEAD INSERT INTO customers_2
               VALUES (NEW.*);

CREATE RULE customers_insert_to_3 AS ON INSERT TO customers
    WHERE (customer_id > 8)
    DO INSTEAD INSERT INTO customers_3
               VALUES (NEW.*);



CREATE VIEW books AS
SELECT *
FROM books_1
UNION ALL
SELECT *
FROM books_2
UNION ALL
SELECT *
FROM books_3;

CREATE RULE books_insert AS ON INSERT TO books
    DO INSTEAD NOTHING;
CREATE RULE books_update AS ON UPDATE TO books
    DO INSTEAD NOTHING;
CREATE RULE books_delete AS ON DELETE TO books
    DO INSTEAD NOTHING;

CREATE RULE books_insert_to_1 AS ON INSERT TO books
    WHERE (book_id <= 4)
    DO INSTEAD INSERT INTO books_1
               VALUES (NEW.*);

CREATE RULE books_insert_to_2 AS ON INSERT TO books
    WHERE (book_id > 4 and book_id <= 8)
    DO INSTEAD INSERT INTO books_2
               VALUES (NEW.*);

CREATE RULE books_insert_to_3 AS ON INSERT TO books
    WHERE (book_id > 8)
    DO INSTEAD INSERT INTO books_3
               VALUES (NEW.*);



CREATE VIEW stores AS
SELECT *
FROM stores_1
UNION ALL
SELECT *
FROM stores_2
UNION ALL
SELECT *
FROM stores_3;

CREATE RULE stores_insert AS ON INSERT TO stores
    DO INSTEAD NOTHING;
CREATE RULE stores_update AS ON UPDATE TO stores
    DO INSTEAD NOTHING;
CREATE RULE stores_delete AS ON DELETE TO stores
    DO INSTEAD NOTHING;

CREATE RULE stores_insert_to_1 AS ON INSERT TO stores
    WHERE (store_id <= 4)
    DO INSTEAD INSERT INTO stores_1
               VALUES (NEW.*);

CREATE RULE stores_insert_to_2 AS ON INSERT TO stores
    WHERE (store_id > 4 and book_id <= 8)
    DO INSTEAD INSERT INTO stores_2
               VALUES (NEW.*);

CREATE RULE stores_insert_to_3 AS ON INSERT TO stores
    WHERE (store_id > 8)
    DO INSTEAD INSERT INTO stores_3
               VALUES (NEW.*);