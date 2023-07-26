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

regifter=# CREATE TABLE gifts (id serial, gift TEXT, giver TEXT, value INT, previously_regifted BOOLEAN);

-- 
\echo See details of the table you created
-- 

regifter=# \d gifts;

-- 
\echo Alter the table so that the column price is changed to value 
-- 



-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 

INSERT INTO gifts (giver, value, previously_regifted) VALUES ('Santa', 9, true);

--
\echo Query for all the columns in your gifts table
-- 

SELECT * FROM gifts;

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

regifter=# INSERT INTO gifts (gift, giver, value, previously_regifted)VALUES('spider-man toy', 'Kevin', 198, FALSE), ('phone', 'Casey', 1500, FALSE), ('box of cheese', 'Timmy', 2, FALSE), ('candy pot', 'William', 56, TRUE) ,('a block', 'Barry', 0, TRUE);

--
\echo Query for gifts with a price greater than or equal to 20
--

SELECT * FROM gifts WHERE price >= 20;

--
\echo Query for every gift that has the word candle in it, only show the gift column
--

Query for every gift that has the word candle in it, only show the gift column

--
\echo Query for every gift whose giv er is Santa OR value is greater than 30
--

SELECT gift FROM gifts WHERE giver = 'Santa' OR value > 30;

--
\echo Query for every gift whose giver is NOT Santa
--

SELECT gift FROM gifts WHERE NOT (giver = 'Santa');

--
\echo Update the second gift to have a value of 2999
-- 

UPDATE gifts SET value = 2999 WHERE gift = (SELECT gift FROM gifts ORDER BY gift OFFSET 1 LIMIT 1);

--
\echo Query for the updated item
--


--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--

DELETE FROM gifts WHERE giver = 'Santa' RETURNING gift, value;

--
\echo Query for all the columns in your gifts table one more time
--

SELECT * FROM gifts;

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
