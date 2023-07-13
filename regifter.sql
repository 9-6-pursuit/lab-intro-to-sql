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

 CREATE TABLE gifts ( id serial, gift TEXT, giver TEXT, value INT, previously_regifted BOOLEAN );
-- 
\echo See details of the table you created

-- ANSWER 
\d gifts

-- 
\echo Alter the table so that the column price is changed to value 
-- ANSWER
ERROR: the column price does not exist. However, it would be:
ALTER TABLE gifts RENAME price TO value;

-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- ANSWER
INSERT INTO gifts ( gift, giver, value, previously_regifted )
values ( 'peach candle' , 'Santa', 9, true  );

--
\echo Query for all the columns in your gifts table
-- ANSWER
SELECT * FROM gifts

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
-- ANSWER

INSERT INTO gifts (gift, giver, value, previously_regifted)
VALUES
('Yankee candle', 'Jen', '12', FALSE ),
('purse', 'Levyn', '25', TRUE ),
('dates from NV', 'Dad', '150', FALSE ),
('Dr. Pepper', 'Arthur', '24', FALSE ),
('Pokemon card', 'sobrino', '2', TRUE )
;

--
\echo Query for gifts with a price greater than or equal to 20
-- ANSWER
SELECT * FROM gifts WHERE value >= 20;

--
\echo Query for every gift that has the word candle in it, only show the gift column
-- ANSWER
SELECT gift FROM gifts WHERE gift LIKE '%candle%';

--
\echo Query for every gift whose giver is Santa OR value is greater than 30
-- ANSWER
SELECT * FROM gifts WHERE giver='Santa' OR value > 30;

--
\echo Query for every gift whose giver is NOT Santa
-- ANSWER
SELECT * FROM gifts WHERE giver != 'Santa';

--
\echo Update the second gift to have a value of 2999
-- ANSWER
UPDATE gifts SET value = 2999 WHERE id=3;

--
\echo Query for the updated item
--ANSWER
SELECT * FROM gifts WHERE id=3;

--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
-- ANSWER
DELETE FROM gifts WHERE giver = 'Santa' returning value, gift;

--
\echo Query for all the columns in your gifts table one more time
-- ANSWER
\d gifts;


-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- ANSWER
SELECT COUNT (id) FROM gifts WHERE gift LIKE '%candle%';

--
\echo Get the AVEREAGE value from all the gifts
-- ANSWER
SELECT AVG(value) FROM gifts;

-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--ANSWER
SELECT * FROM gifts ORDER BY value DESC LIMIT 3 OFFSET 2;

--
-- finish
--
DROP TABLE IF EXISTS gifts;
