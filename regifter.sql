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

CREATE TABLE gifts ( id SERIAL PRIMARY KEY, gift TEXT, giver TEXT, value INT, previously_regifted BOOLEAN )
-- 
\echo See details of the table you created
-- 
\d gifts

-- 
\echo Alter the table so that the column price is changed to value 
-- 
Was already value.

-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 
INSERT INTO gifts ( gift, giver, value, previously_regifted) VALUES ('peach candle', 'Santa', 9, TRUE);
INSERT 0 1

--
\echo Query for all the columns in your gifts table
-- 

SELECT * FROM gifts;

id |     gift     | giver | value | previously_regifted
----+--------------+-------+-------+---------------------
  1 | peach candle | Santa |     9 | t
(1 row)



\d gifts

        Column        |  Type   | Collation | Nullable |              Default
---------------------+---------+-----------+----------+-----------------------------------
 id                  | integer |           | not null | nextval('gifts_id_seq'::regclass)
 gift                | text    |           |          |
 giver               | text    |           |          |
 value               | integer |           |          |
 previously_regifted | boolean |           |          |
Indexes:
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
\echo Insert 5 more gifts of your own choosing,  include 1 more candle
--
INSERT INTO gifts (gift, giver, value, previously_regifted)
VALUES
('coconut candle', 'Paradise', '39', FALSE),
('plaid pajamas', 'Adam', '19', TRUE),
('crockpot', 'Mary', '59', FALSE),
('Mistletoe', 'Doctor Of Love', '19', FALSE),
('Birkin', 'Big Boss', '199999', FALSE)
;


--
\echo Query for gifts with a price greater than or equal to 20
--

regifter=# SELECT * FROM gifts WHERE value >= 20 ;
 id |      gift      |      giver       | value  | previously_regifted
----+----------------+------------------+--------+---------------------
  4 | soap on a rope | Rudolf           |     29 | f
  5 | potpurri       | Elf on the Shelf |     39 | t
  6 | mango candle   | The Boss         |     49 | f
  7 | coconut candle | Paradise         |     39 | f
  9 | crockpot       | Mary             |     59 | f
 11 | Birkin         | Big Boss         | 199999 | f
(6 rows)
--
\echo Query for every gift that has the word candle in it, only show the gift column
--
regifter=# SELECT * FROM gifts WHERE gift LIKE '%candle%';
 id |      gift       |  giver   | value | previously_regifted
----+-----------------+----------+-------+---------------------
  1 | peach candle    | Santa    |     9 | t
  2 | peach candle    | Santa    |     9 | t
  3 | cinnamon candle | Nick     |    19 | t
  6 | mango candle    | The Boss |    49 | f
  7 | coconut candle  | Paradise |    39 | f
(5 rows)

--
\echo Query for every gift whose giver is Santa OR value is greater than 30
--
regifter=# SELECT * FROM gifts WHERE giver ='Santa' OR value > 30 ;
 id |      gift      |      giver       | value  | previously_regifted
----+----------------+------------------+--------+---------------------
  1 | peach candle   | Santa            |      9 | t
  2 | peach candle   | Santa            |      9 | t
  5 | potpurri       | Elf on the Shelf |     39 | t
  6 | mango candle   | The Boss         |     49 | f
  7 | coconut candle | Paradise         |     39 | f
  9 | crockpot       | Mary             |     59 | f
 11 | Birkin         | Big Boss         | 199999 | f
(7 rows)

--
\echo Query for every gift whose giver is NOT Santa
--

regifter=# SELECT * FROM gifts WHERE giver !='Santa'
regifter-# ;
 id |      gift       |      giver       | value  | previously_regifted
----+-----------------+------------------+--------+---------------------
  3 | cinnamon candle | Nick             |     19 | t
  4 | soap on a rope  | Rudolf           |     29 | f
  5 | potpurri        | Elf on the Shelf |     39 | t
  6 | mango candle    | The Boss         |     49 | f
  7 | coconut candle  | Paradise         |     39 | f
  8 | plaid pajamas   | Adam             |     19 | t
  9 | crockpot        | Mary             |     59 | f
 10 | Mistletoe       | Doctor Of Love   |     19 | f
 11 | Birkin          | Big Boss         | 199999 | f
--
\echo Update the second gift to have a value of 2999
-- 
regifter=# UPDATE gifts SET value = 2999 WHERE id = 2 RETURNING *;
 id |     gift     | giver | value | previously_regifted
----+--------------+-------+-------+---------------------
  2 | peach candle | Santa |  2999 | t
(1 row)
--
\echo Query for the updated item
--
I did it in the previous one with (RETURNING *)

--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--
regifter=# DELETE FROM gifts WHERE giver = 'Santa' RETURNING value, gift;
 value |     gift
-------+--------------
     9 | peach candle
  2999 | peach candle
(2 rows)

DELETE 2
--
\echo Query for all the columns in your gifts table one more time
--
regifter=# SELECT * FROM gifts;
 id |      gift       |      giver       | value  | previously_regifted
----+-----------------+------------------+--------+---------------------
  3 | cinnamon candle | Nick             |     19 | t
  4 | soap on a rope  | Rudolf           |     29 | f
  5 | potpurri        | Elf on the Shelf |     39 | t
  6 | mango candle    | The Boss         |     49 | f
  7 | coconut candle  | Paradise         |     39 | f
  8 | plaid pajamas   | Adam             |     19 | t
  9 | crockpot        | Mary             |     59 | f
 10 | Mistletoe       | Doctor Of Love   |     19 | f
 11 | Birkin          | Big Boss         | 199999 | f
(9 rows)


-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 
regifter=# SELECT COUNT(*) FROM gifts WHERE gift LIKE '%candle%';
 count
-------
     3
(1 row)
--
\echo Get the AVERAGE value from all the gifts
--
regifter=# SELECT AVG(value) FROM gifts ;
        avg
--------------------
 22252.333333333333
(1 row)
-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--
regifter=# SELECT * FROM gifts ORDER BY value DESC LIMIT 3 OFFSET 2 ;
 id |      gift      |      giver       | value | previously_regifted
----+----------------+------------------+-------+---------------------
  6 | mango candle   | The Boss         |    49 | f
  7 | coconut candle | Paradise         |    39 | f
  5 | potpurri       | Elf on the Shelf |    39 | t
(3 rows)--
-- finish
--
DROP TABLE IF EXISTS gifts;
