CREATE TABLE review_id_table (
  review_id TEXT PRIMARY KEY NOT NULL,
  customer_id INTEGER,
  product_id TEXT,
  product_parent INTEGER,
  review_date DATE -- this should be in the formate yyyy-mm-dd
);

-- This table will contain only unique values
CREATE TABLE products_table (
  product_id TEXT PRIMARY KEY NOT NULL UNIQUE,
  product_title TEXT
);

-- Customer table for first data set
CREATE TABLE customers_table (
  customer_id INT PRIMARY KEY NOT NULL UNIQUE,
  customer_count INT
);

-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

SELECT * from customers_table limit 10;
SELECT * from products_table limit 10;
SELECT * from review_id_table limit 10;
SELECT * from vine_table limit 10;

--Create a table with Total Votes >20
Select 
v.review_id,
v.star_rating,
v.helpful_votes,
v.total_votes,
v.vine,
v.verified_purchase
INTO vine_20
from vine_table as v
Where(v.total_votes > 20);

SELECT * from vine_20 limit 10;

--Create a table with Helpful Votes/Total Votes >50%
Select 
v20.review_id,
v20.star_rating,
v20.helpful_votes,
v20.total_votes,
v20.vine,
v20.verified_purchase
INTO vine_50percent
from vine_20 as v20
WHERE CAST(v20.helpful_votes AS FLOAT)/CAST(v20.total_votes AS FLOAT) >=0.5;


--Create a table with Vine Paid (from H/T Table)
Select 
v50.review_id,
v50.star_rating,
v50.helpful_votes,
v50.total_votes,
v50.vine,
v50.verified_purchase
INTO vine_y
from vine_50percent as v50
WHERE (v50.vine = 'Y');

--Create a table with Vine Not Paid (from H/T Table)
Select 
v50.review_id,
v50.star_rating,
v50.helpful_votes,
v50.total_votes,
v50.vine,
v50.verified_purchase
INTO vine_n
from vine_50percent as v50
WHERE (v50.vine = 'N');

SELECT * from vine_table limit 10;

--Count Total_Votes
Select Count (total_votes) from vine_table;

--Count Total 5-Star Votes
Select Count (total_votes) from vine_table
Where star_rating = 5;

--Create Table all Paid
Select 
v.review_id,
v.star_rating,
v.helpful_votes,
v.total_votes,
v.vine,
v.verified_purchase
INTO vine_p
from vine_table as v
Where(v.vine = 'Y');

Select * from vine_p

--Create Table all Not Paid
Select 
v.review_id,
v.star_rating,
v.helpful_votes,
v.total_votes,
v.vine,
v.verified_purchase
INTO vine_np
from vine_table as v
Where(v.vine = 'N');


Select (Count (star_rating) Having star_rating = 5)/(select count (total_votes) from vine_p) From vine_p



--Percent of 5-Star reviews Paid
Select Count (star_rating) from vine_p
Where (star_rating = 5) 


select count(star_rating),
       avg( (value > 5)::int ) * 100 as percentage_above_5
from t;
								 
Select 
*, (total_votes / Sum(total_votes) Over()) As "% of total"
From
vine_p
Where
star_rating=5
	   
	   