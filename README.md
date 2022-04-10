# 16_BigData_Amazon_Vine_Analysis

## Relevant Folders and/or Files
-	Folder - Challenge
 -	Amazon_Reviews_ETL.ipynb
 -	Vine_Analysis_Colab.ipynb
 -	Vine_Analysis_pandas.ipynb
 -	challenge_schema.sql

## Project Overview
### Purpose

The purpose of this challenge was to explore AWS RDS, Google Colab, and PySpark to help Jennifer from “SellBy” perform the ETL process to extract, transform and load an Amazon Vine Review data into pgAdmin.  We were also tasked with determining if there is any bias toward favorable reviews from Vine members in your dataset.

### Data Analyzed
-	Amazon Vine Review data for Furniture: https://s3.amazonaws.com/amazon-reviews-pds/tsv/amazon_reviews_us_Furniture_v1_00.tsv.gz

### Deliverables 
The deliverables for this assignment were:
-	Deliverable 1: Perform ETL on Amazon Product Reviews 
-	Deliverable 2: Determine Bias of Vine Reviews 

## Results
For this analysis, I used both Pandas and PySpark to determine number of total of *helpful* reviews, number of *helpful* 5-star reviews, and percentage of *helpful* 5-star reviews characterized by their Vine subsciption status: paid or nonpaid. 
 
-	Total Reviews: 18,155; Vine Reviews: 136; Non-Vine Reviews: 18,019
-	Total 5-star Reviews: 8,556; Vine 5-Star Reviews: 74, Non-Vine 5-Star Reviews: 8,482
-	% 5-star for Total Reviews: 47.13%; % 5-star for Vine Reviews: 54.41%, % 5-star for Non-Vine Reviews: 47.07%

### Code Snippets from Pandas Analysis

![image](https://user-images.githubusercontent.com/92705556/162636031-74dc2653-d300-4200-a20f-7040d6ac1be2.png)

Screenshot 1: Initial Vine DataFrame for Furniture Reviews
 
![image](https://user-images.githubusercontent.com/92705556/162636041-7dd9db2a-8572-49f5-b181-f20e90f5f468.png)


Screenshot 2: Total Reviews (with votes >= 20)
 
 ![image](https://user-images.githubusercontent.com/92705556/162636047-ecff40c9-3e71-4dba-a832-539bd3a12692.png)


Screenshot 3: Helpful Reviews (helpful votes/total votes greater than 50%)

 ![image](https://user-images.githubusercontent.com/92705556/162636051-d403052a-da42-4ae3-b651-446e259f9770.png)
 

Screenshot 4: Paid Helpful Reviews (Vine Subscribers)
 
![image](https://user-images.githubusercontent.com/92705556/162636060-d0933590-3dae-4abd-a691-42a1f4887a08.png)


Screenshot 5: NonPaid Helpful Reviews (Not Vine Subscribers)
 
![image](https://user-images.githubusercontent.com/92705556/162636068-7bdcc138-c9bb-4041-b88c-fd4964ad9254.png)


Calculation Screenshots
 ![image](https://user-images.githubusercontent.com/92705556/162636078-9a3df07d-5104-48df-9278-fd262c6dc79f.png)
 ![image](https://user-images.githubusercontent.com/92705556/162636089-567322fd-4471-4b9f-b882-c7227f438dc5.png)

 
## Summary Conclusions on Positivity Bias

Vine Subscribers do tend to have a higher percentage of 5-star reviews than non-Vine reviews (54% vs 47%).  However, because there are only 136 paid-Vine reviews out of 18,155 helpful reviews, it suggests that not many Vine reviewers are providing helpful reviews. 

To better understand the impact of Vine reviews compared to non-Vine reviews, I suggest that SellBy runs an additional analysis of all Vine-Reviews vs all Non-Vine Reviews from the entire 792,113 row dataset.  By looking at this info, SellBy could determine if the Vine reviews are helpful but not ranking high in the “total votes” if there are not getting enough Vine reviews to justify the cost of paying for the Amazon service.
