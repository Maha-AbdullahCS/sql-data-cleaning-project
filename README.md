# sql-data-cleaning-project
A SQL data cleaning project focused on transforming raw and inconsistent data into a clean, structured, and analysis-ready dataset through systematic data cleaning and transformation techniques.

## Dataset Source

The dataset used in this project is **Online Retail II**.

**Source:** UCI Machine Learning Repository

**Dataset:** Online Retail II

**Dataset URL:** https://archive.ics.uci.edu/dataset/502/online+retail+ii

The dataset contains two years of transaction data from a UK-based, registered, non-store online retailer, covering transactions from December 1, 2009 to December 9, 2011.

## Project Objective

The objective of this project is to clean and standardize the Online Retail II dataset using SQL. The cleaning process focuses on identifying and removing duplicate records, checking for missing and empty values, standardizing inconsistent data formats and values, and improving the consistency and readability of the dataset.

The final result is a clean and structured dataset that is ready for further analysis.

## Data Cleaning Process

The dataset was cleaned and standardized through the following steps:

1. **Duplicate Removal**
   - Identified duplicate records using `ROW_NUMBER()` and removed duplicate rows.

2. **Missing Value Check**
   - Checked for `NULL` and empty values across the relevant columns.

3. **Whitespace and Character Cleaning**
   - Removed unnecessary leading and trailing whitespace.
   - Removed periods from the end of selected values.

4. **Data Standardization**
   - Standardized country names and other inconsistent values.
   - Converted product descriptions to lowercase for consistency.
   - Standardized different formats of product set descriptions.

5. **Column Organization**
   - Renamed columns to follow a consistent naming style.
   - Removed the temporary `row_num` column used during duplicate removal.

     ## SQL Techniques Used

- `CREATE TABLE` for creating tables from the imported dataset
- `INSERT INTO ... SELECT` for populating the working table
- `ROW_NUMBER()` and `PARTITION BY` for identifying duplicate records
- Common Table Expressions (`CTE`) for duplicate checking
- `DISTINCT` for inspecting unique values and identifying inconsistencies
- `TRIM()` for removing unnecessary whitespace
- `REPLACE()` for standardizing inconsistent text values
- `REGEXP_REPLACE()` for pattern-based text cleaning
- `LOWER()` for standardizing text case
- `IS NULL` and empty-string checks for identifying missing values
- `UPDATE` for modifying and standardizing data
- `DELETE` for removing duplicate records
- `ALTER TABLE` for renaming and removing columns

## Files in This Repository

- **online_retail_II_raw.xlsx** — The original dataset before any cleaning or transformation.
- **Online_Retail_Cleaned.csv** — The final dataset after applying the SQL cleaning and standardization process.
- **online_retail_data_cleaning.sql** — Contains the SQL queries used to create the working dataset, identify and remove duplicates, check for missing values, clean and standardize the data, and prepare the final dataset.

## Results

The raw dataset was transformed into a cleaner and more consistent dataset by:

- Removing duplicate records.
- Checking for missing and empty values.
- Removing unnecessary whitespace and trailing periods.
- Standardizing country names.
- Standardizing the format and capitalization of product descriptions.
- Renaming columns and removing temporary columns used during the cleaning process.

The resulting dataset is structured and ready for further analysis.
