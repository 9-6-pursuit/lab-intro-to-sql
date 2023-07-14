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
CREATE TABLE gifts ( id serial, gift TEXT, giver TEXT, value INT, prev_gifted BOOLEAN);

-- 
\echo See details of the table you created
-- 
\d gifts
Table "public.gifts"
   Column    |  Type   | Collation | Nullable |              Default
-------------+---------+-----------+----------+-----------------------------------
 id          | integer |           | not null | nextval('gifts_id_seq'::regclass)
 gift        | text    |           |          |
 giver       | text    |           |          |
 value       | integer |           |          |
 prev_gifted | boolean |           |          |

-- 
\echo Alter the table so that the column price is changed to value 
-- 
ALTER TABLE gifts RENAME value TO price;

-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 
INSERT INTO gifts (gift, giver, value, prev_gifted)
VALUES ('peach candle', 'Santa', 9, TRUE);

--
\echo Query for all the columns in your gifts table
-- 
SELECT * FROM gifts;
id |     gift     | giver | price | prev_gifted
----+--------------+-------+-------+-------------
  1 | peach candle | Santa |     9 | t
(1 row)

--
\echo Uncomment below to insert 5 more gifts
-- 

 SELECT * FROM gifts;
 id |      gift       |      giver       | price | prev_gifted
----+-----------------+------------------+-------+-------------
  1 | peach candle    | Santa            |     9 | t
  2 | peach candle    | Santa            |     9 | t
  3 | cinnamon candle | Nick             |    19 | t
  4 | soap on a rope  | Rudolf           |    29 | f
  5 | potpurri        | Elf on the Shelf |    39 | t
  6 | mango candle    | The Boss         |    49 | f
(6 rows)

-- 
\echo Insert 5 more gifts of your own choosing,  include 1 more candle
--
SELECT * FROM gifts;
 id |        gift         |      giver       | price | prev_gifted
----+---------------------+------------------+-------+-------------
  1 | peach candle        | Santa            |     9 | t
  2 | peach candle        | Santa            |     9 | t
  3 | cinnamon candle     | Nick             |    19 | t
  4 | soap on a rope      | Rudolf           |    29 | f
  5 | potpurri            | Elf on the Shelf |    39 | t
  6 | mango candle        | The Boss         |    49 | f
  7 | cotton-cloud candle | Tashawnee        |     5 | f
  8 | spy glasses         | Shaunte          |    30 | f
  9 | stuffed Santa       | Doran            |    20 | t
 10 | gold ring           | K-dog            |   600 | f
 11 | foot-spa            | Gina             |    40 | t
(11 rows)



--
\echo Query for gifts with a price greater than or equal to 20
--
SELECT * FROM gifts WHERE price >= 20;
id |      gift      |      giver       | price | prev_gifted
----+----------------+------------------+-------+-------------
  4 | soap on a rope | Rudolf           |    29 | f
  5 | potpurri       | Elf on the Shelf |    39 | t
  6 | mango candle   | The Boss         |    49 | f
  8 | spy glasses    | Shaunte          |    30 | f
  9 | stuffed Santa  | Doran            |    20 | t
 10 | gold ring      | K-dog            |   600 | f
 11 | foot-spa       | Gina             |    40 | t
(7 rows)
--
\echo Query for every gift that has the word candle in it, only show the gift column
--
SELECT * FROM gifts WHERE gift LIKE '%candle%';
 id |        gift         |   giver   | price | prev_gifted
----+---------------------+-----------+-------+-------------
  1 | peach candle        | Santa     |     9 | t
  2 | peach candle        | Santa     |     9 | t
  3 | cinnamon candle     | Nick      |    19 | t
  6 | mango candle        | The Boss  |    49 | f
  7 | cotton-cloud candle | Tashawnee |     5 | f
(5 rows)

--
\echo Query for every gift whose giver is Santa OR value is greater than 30
--
SELECT * FROM gifts WHERE giver = 'Santa' OR price > 30;
 id |     gift     |      giver       | price | prev_gifted
----+--------------+------------------+-------+-------------
  1 | peach candle | Santa            |     9 | t
  2 | peach candle | Santa            |     9 | t
  5 | potpurri     | Elf on the Shelf |    39 | t
  6 | mango candle | The Boss         |    49 | f
 10 | gold ring    | K-dog            |   600 | f
 11 | foot-spa     | Gina             |    40 | t
(6 rows)

--
\echo Query for every gift whose giver is NOT Santa
--
SELECT * FROM gifts WHERE giver != 'Santa';
 id |        gift         |      giver       | price | prev_gifted
----+---------------------+------------------+-------+-------------
  3 | cinnamon candle     | Nick             |    19 | t
  4 | soap on a rope      | Rudolf           |    29 | f
  5 | potpurri            | Elf on the Shelf |    39 | t
  6 | mango candle        | The Boss         |    49 | f
  7 | cotton-cloud candle | Tashawnee        |     5 | f
  8 | spy glasses         | Shaunte          |    30 | f
  9 | stuffed Santa       | Doran            |    20 | t
 10 | gold ring           | K-dog            |   600 | f
 11 | foot-spa            | Gina             |    40 | t
(9 rows)

--
\echo Update the second gift to have a value of 2999
-- 
UPDATE gifts SET price = 2999 WHERE id = 2;
UPDATE 1

--
\echo Query for the updated item
--
 SELECT * FROM gifts;
 id |        gift         |      giver       | price | prev_gifted
----+---------------------+------------------+-------+-------------
  1 | peach candle        | Santa            |     9 | t
  3 | cinnamon candle     | Nick             |    19 | t
  4 | soap on a rope      | Rudolf           |    29 | f
  5 | potpurri            | Elf on the Shelf |    39 | t
  6 | mango candle        | The Boss         |    49 | f
  7 | cotton-cloud candle | Tashawnee        |     5 | f
  8 | spy glasses         | Shaunte          |    30 | f
  9 | stuffed Santa       | Doran            |    20 | t
 10 | gold ring           | K-dog            |   600 | f
 11 | foot-spa            | Gina             |    40 | t
  2 | peach candle        | Santa            |  2999 | t
(11 rows)

--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--
DELETE FROM gifts WHERE giver = 'Santa' RETURNING price, gift;
 price |     gift
-------+--------------
     9 | peach candle
  2999 | peach candle
(2 rows)


--
\echo Query for all the columns in your gifts table one more time
--
SELECT * FROM gifts;
id |        gift         |      giver       | price | prev_gifted
----+---------------------+------------------+-------+-------------
  3 | cinnamon candle     | Nick             |    19 | t
  4 | soap on a rope      | Rudolf           |    29 | f
  5 | potpurri            | Elf on the Shelf |    39 | t
  6 | mango candle        | The Boss         |    49 | f
  7 | cotton-cloud candle | Tashawnee        |     5 | f
  8 | spy glasses         | Shaunte          |    30 | f
  9 | stuffed Santa       | Doran            |    20 | t
 10 | gold ring           | K-dog            |   600 | f
 11 | foot-spa            | Gina             |    40 | t
(9 rows)


-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 
SELECT COUNT(*) AS total_gifts_with_candle
FROM gifts
WHERE gift LIKE '%candle%';
total_gifts_with_candle
-------------------------
                       3
(1 row)


--
\echo Get the AVEREAGE value from all the gifts
--
SELECT AVG(price) AS average_value
FROM gifts;
 average_value
---------------------
 92.3333333333333333
(1 row)

-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--
SELECT *
FROM gifts
ORDER BY price DESC
LIMIT 3 OFFSET 2;
id |    gift     |      giver       | price | prev_gifted
----+-------------+------------------+-------+-------------
 11 | foot-spa    | Gina             |    40 | t
  5 | potpurri    | Elf on the Shelf |    39 | t
  8 | spy glasses | Shaunte          |    30 | f
(3 rows)
--
-- finish
--
DROP TABLE IF EXISTS gifts;
DROP TABLE
SELECT * FROM gifts;
ERROR: relation "gifts" does not exist

