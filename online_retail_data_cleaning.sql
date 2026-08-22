-- Online Retail Data Cleaning Project
-- Author: Maha Abdallah
-- Purpose: Data cleaning and standardization using SQL

-- Check for duplicate values.
WITH Check_Duplicate AS
(
SELECT * ,
ROW_NUMBER() OVER(PARTITION BY invoice , stock_code, `description` , quantity , price , customer_id , country , invoice_date_new ) AS row_num
FROM online_retail_work
)
SELECT * FROM Check_Duplicate
WHERE row_num > 1;

-- Create a new table with a column that contains the duplicate row numbers.
CREATE TABLE online_retail_work1
LIKE online_retail_work;

ALTER TABLE online_retail_work1
ADD COLUMN row_num INT;

INSERT INTO online_retail_work1
SELECT * ,
ROW_NUMBER() OVER(PARTITION BY invoice , stock_code, `description` , quantity , price , customer_id , country , invoice_date_new) AS row_num
FROM online_retail_work;

-- Delete the duplicates by filtering the new row_num column.
DELETE FROM online_retail_work1
WHERE row_num > 1;

-- Check for and handle NULL and empty values.
SELECT *
FROM online_retail_work1
WHERE invoice IS NULL OR invoice = ''
OR stock_code IS NULL OR stock_code = ''
OR  `description` IS NULL OR `description` = ''
OR quantity IS NULL
OR price IS NULL
OR customer_id IS NULL
OR country IS NULL OR country = ''
OR invoice_date_new IS NULL;
-- No NULL or empty values were found in this dataset.

-- Standardize our data.
-- Get rid of white spaces and periods at the end of some values.
UPDATE online_retail_work1
SET
stock_code =  trim(TRAILING '.' FROM trim(stock_code)),
`description` =  trim(TRAILING '.' FROM trim(`description`)),
country =  trim(TRAILING '.' FROM trim(country));

-- Make sure all country names are consistent. Use the full name instead of an abbreviation.
SELECT DISTINCT(country) FROM online_retail_work1;
UPDATE online_retail_work1
SET country = 'United States of America'
WHERE country = 'USA';

-- Update the description column to lowercase to make it more readable.
UPDATE online_retail_work1
SET  `description` = lower(`description`);

-- Standardize some records to make them consistent.
-- Update examples: set/, s/, set 3, set3, s3 , set of three to set of 3.
UPDATE online_retail_work1
SET  `description` = REPLACE(`description`, 'set/', 'set of ')
WHERE `description` LIKE 'set/%';

UPDATE online_retail_work1
SET  `description` = REPLACE(`description`, 's/', 'set of ')
where `description` like 's/%';

update online_retail_work1
set `description` = REGEXP_REPLACE(`description`,'^set ?','set of ')
WHERE `description` REGEXP  '^set ?[0-9]+';

update online_retail_work1
set `description` = REPLACE(`description`,'set of three','set of 3')
where `description` like 'set of three%';

-- Change some column names to follow the same naming style and drop unnecessary columns.
alter table online_retail_work1
rename column invoice_date_new to Invoice_Date,
drop column row_num;

select * from online_retail_work1;