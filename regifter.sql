-- Getting started, do not update
DROP DATABASE IF EXISTS regifter;
CREATE DATABASE regifter;
\c regifter
-- End getting started code

--
-- Write your code below each prompt

--
\echo Create a table called gifts
-- with the following columns
-- id serial primary KEY
-- gift - string
-- giver - string
-- value - integer
-- previously_regifted boolean

CREATE TABLE gifts ( id SERIAL PRIMARY KEY, gift TEXT, giver TEXT, value INT, previously_regifted BOOLEAN );

-- 
\echo See details of the table you created
-- 

 Table "public.gifts"
       Column        |  Type   | Collation | Nullable |              Default              
---------------------+---------+-----------+----------+-----------------------------------
 id                  | integer |           | not null | nextval('gifts_id_seq'::regclass)
 gift                | text    |           |          | 
 giver               | text    |           |          | 
 value               | integer |           |          | 
 previously_regifted | boolean |           |          | 
Indexes:
    "gifts_pkey" PRIMARY KEY, btree (id)

-- 
\echo Alter the table so that the column price is changed to value 
-- SKIP THIS AS PER AHMAD


-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 

INSERT INTO gifts ( gift, giver, value, previously_regifted) VALUES ('peach candle', 'santa', '9', TRUE);

--
\echo Query for all the columns in your gifts table
-- 

SELECT * FROM gifts;
 id |     gift     | giver | value | previously_regifted 
----+--------------+-------+-------+---------------------
  1 | peach candle | santa |     9 | t
(1 row)

--
\echo Uncomment below to insert 5 more gifts
-- 

INSERT INTO gifts (gift, giver, value, previously_regifted)
VALUES
('peach candle', 'Santa', '9', TRUE),
('cinnamon candle', 'Nick', '19', TRUE),
('soap on a rope', 'Rudolf', '29', FALSE),
('potpurri', 'Elf on the Shelf', '39', TRUE),
('mango candle', 'The Boss', '49', FALSE)
;

-- 
\echo Insert 5 more gifts of your own choosing, include 1 more candle
--
INSERT INTO gifts ( gift, giver, value, previously_regifted )
VALUES
('strawberry candle', 'Alli', '10', TRUE),
('starburst', 'Teemo', '12', FALSE),
('PS5', 'Ziggs', '15', FALSE),
('Mug', 'Elf on the Shelf', '21', TRUE),
('coal', 'The Boss', '35', TRUE);


--
\echo Query for gifts with a price greater than or equal to 20
--
SELECT * FROM gifts;
 id |       gift        |      giver       | value | previously_regifted 
----+-------------------+------------------+-------+---------------------
  1 | peach candle      | santa            |     9 | t
  2 | peach candle      | Santa            |     9 | t
  3 | cinnamon candle   | Nick             |    19 | t
  4 | soap on a rope    | Rudolf           |    29 | f
  5 | potpurri          | Elf on the Shelf |    39 | t
  6 | mango candle      | The Boss         |    49 | f
  7 | strawberry candle | Alli             |    10 | t
  8 | starburst         | Teemo            |    12 | f
  9 | PS5               | Ziggs            |    15 | f
 10 | Mug               | Elf on the Shelf |    21 | t
 11 | coal              | The Boss         |    35 | t
(11 rows)
--
\echo Query for every gift that has the word candle in it, only show the gift column
--

regifter=# SELECT * FROM gifts WHERE gift LIKE '%candle%'
regifter-# ;
 id |       gift        |  giver   | value | previously_regifted 
----+-------------------+----------+-------+---------------------
  1 | peach candle      | santa    |     9 | t
  2 | peach candle      | Santa    |     9 | t
  3 | cinnamon candle   | Nick     |    19 | t
  6 | mango candle      | The Boss |    49 | f
  7 | strawberry candle | Alli     |    10 | t
(5 rows)

--
\echo Query for every gift whose giver is Santa OR value is greater than 30
--

SELECT * FROM gifts WHERE giver = 'Santa' OR value >= 30;
 id |     gift     |      giver       | value | previously_regifted 
----+--------------+------------------+-------+---------------------
  2 | peach candle | Santa            |     9 | t
  5 | potpurri     | Elf on the Shelf |    39 | t
  6 | mango candle | The Boss         |    49 | f
 11 | coal         | The Boss         |    35 | t
(4 rows)

--
\echo Query for every gift whose giver is NOT Santa
--

SELECT * FROM gifts WHERE giver != 'Santa'

--
\echo Update the second gift to have a value of 2999
-- 

UPDATE gifts SET value = 2999 WHERE id = 2;

--
\echo Query for the updated item
--

 id |       gift        |      giver       | value | previously_regifted 
----+-------------------+------------------+-------+---------------------
  1 | peach candle      | santa            |     9 | t
  3 | cinnamon candle   | Nick             |    19 | t
  4 | soap on a rope    | Rudolf           |    29 | f
  5 | potpurri          | Elf on the Shelf |    39 | t
  6 | mango candle      | The Boss         |    49 | f
  7 | strawberry candle | Alli             |    10 | t
  8 | starburst         | Teemo            |    12 | f
  9 | PS5               | Ziggs            |    15 | f
 10 | Mug               | Elf on the Shelf |    21 | t
 11 | coal              | The Boss         |    35 | t
  2 | peach candle      | Santa            |  2999 | t
(11 rows)

--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--

DELETE FROM gifts WHERE giver = 'Santa' RETURNING value, gift;

 value |     gift     
-------+--------------
  2999 | peach candle
(1 row)

DELETE 1

--
\echo Query for all the columns in your gifts table one more time
--

SELECT * FROM gifts;

 id |       gift        |      giver       | value | previously_regifted 
----+-------------------+------------------+-------+---------------------
  1 | peach candle      | santa            |     9 | t
  3 | cinnamon candle   | Nick             |    19 | t
  4 | soap on a rope    | Rudolf           |    29 | f
  5 | potpurri          | Elf on the Shelf |    39 | t
  6 | mango candle      | The Boss         |    49 | f
  7 | strawberry candle | Alli             |    10 | t
  8 | starburst         | Teemo            |    12 | f
  9 | PS5               | Ziggs            |    15 | f
 10 | Mug               | Elf on the Shelf |    21 | t
 11 | coal              | The Boss         |    35 | t
(10 rows)


-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 


--
\echo Get the AVEREAGE value from all the gifts
--


-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--

--
-- finish
--
DROP TABLE IF EXISTS gifts;
