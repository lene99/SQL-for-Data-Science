/******************************************
Name: Jolene Chng 
Course: SQL for Data Science
Title: Peer-graded Assignment
Date: 28th Feb 2022
******************************************/

Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



/******************************************
PART 1 OF PEER-GRADED ASSIGNMENT
******************************************/

/******************************************
 QUESTION 1
******************************************/

1. Profile the data by finding the total number of records for each of the tables below:

General Expression: SELECT COUNT(*) FROM table -- Example: SELECT COUNT(*) FROM attribute

i. attribute table = 10000
ii. business table = 10000
iii. category table = 10000
iv. checkin table = 10000
v. elite_years table = 10000
vi. friend table = 10000
vii. hours table = 10000
viii. photo table = 10000
ix. review table = 10000
x. tip table = 10000
xi. user table = 10000
	
/******************************************
 QUESTION 2 
******************************************/

2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.
-- yellow icon = primary key, red icon = foreign key

General Expression: SELECT COUNT(DISTINCT primary_key) FROM table -- Example: SELECT COUNT(DISTINCT id) FROM business

i. business = 10000 (id)
ii. hours = 1562 (business_id)
iii. category = 2643 (business_id)
iv. attribute = 1115 (business_id)
v. review = 10000(id), 8090 (business_id), 9581 (user_id)
vi. checkin = 493 (business_id)
vii. photo = 10000 (id), 6493 (business_id)
viii. tip = 3979 (business_id), 537 (user_id)
ix. user = 10000 (id)
x. friend = 11 (user_id)
xi. elite_years = 2780 (user_id)

/******************************************
 QUESTION 3
******************************************/

3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: No.
	
	
	SQL code used to arrive at answer:

    SELECT id, name, review_count, yelping_since, useful, funny, cool, fans, average_stars, compliment_hot
                    ,compliment_more, compliment_profile, compliment_cute, compliment_list, compliment_note
                    ,compliment_plain, compliment_cool, compliment_funny, compliment_writer, compliment_photos
    FROM user
    WHERE id IS null
            OR name IS null
            OR review_count IS null
            OR yelping_since IS null
            OR useful IS null
            OR funny IS null
            OR cool IS null
            OR fans IS null
            OR average_stars IS null
            OR compliment_hot IS null
            OR compliment_more IS null
            OR compliment_profile IS null
            OR compliment_cute IS null
            OR compliment_lISt IS null
            OR compliment_note IS null
            OR compliment_plain IS null
            OR compliment_cool IS null
            OR compliment_funny IS null
            OR compliment_writer IS null
            OR compliment_photos IS null
	

/******************************************
 QUESTION 4
******************************************/	

    4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

    General Expression:                -- Example: 
    SELECT MIN(stars)                   -- SELECT MIN(stars)
    ,MAX(stars)                                  -- ,MAX(stars)
    ,AVG(stars)                                   -- ,AVG(stars)
    FROM table                                  -- FROM review

	i. Table: review, Column: Stars
	
		min: 1		max: 5		avg: 3.7082
		
	
	ii. Table: business, Column: Stars
	
		min: 1		max: 5		avg: 3.6549
		
	
	iii. Table: tip, Column: Likes
	
		min: 0		max: 2		avg: 0.0144
		
	
	iv. Table: checkin, Column: Count
	
		min: 1		max: 53		avg: 1.9414
		
	
	v. Table: user, Column: Review_count
	
		min: 0		max: 2000	avg: 24.2995
		

/******************************************
 QUESTION 5
******************************************/

5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
	
        SELECT city
        ,SUM(review_count) AS sumOfReviews 
		FROM business
		GROUP BY city
		ORDER BY sumOfReviews DESC
	
    +-----------------+--------------+
    | city            | sumOfReviews |
    +-----------------+--------------+
    | Las Vegas       |        82854 |
    | Phoenix         |        34503 |
    | Toronto         |        24113 |
    | Scottsdale      |        20614 |
    | Charlotte       |        12523 |
    | Henderson       |        10871 |
    | Tempe           |        10504 |
    | Pittsburgh      |         9798 |
    | Montréal        |         9448 |
    | Chandler        |         8112 |
    | Mesa            |         6875 |
    | Gilbert         |         6380 |
    | Cleveland       |         5593 |
    | Madison         |         5265 |
    | Glendale        |         4406 |
    | Mississauga     |         3814 |
    | Edinburgh       |         2792 |
    | Peoria          |         2624 |
    | North Las Vegas |         2438 |
    | Markham         |         2352 |
    | Champaign       |         2029 |
    | Stuttgart       |         1849 |
    | Surprise        |         1520 |
    | Lakewood        |         1465 |
    | Goodyear        |         1155 |
    +-----------------+--------------+
(Output limit exceeded, 25 of 362 total rows shown)

/******************************************
 QUESTION 6
******************************************/

6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:

    SELECT stars AS StarRating
    ,COUNT(stars) AS count
    FROM business 
    WHERE city = 'Avon'
    GROUP BY stars


    Copy and Paste the Resulting Table Below (2 columns � star rating and count):
    +------------+-------+
    | StarRating | count |
    +------------+-------+
    |        1.5 |     1 |
    |        2.5 |     2 |
    |        3.5 |     3 |
    |        4.0 |     2 |
    |        4.5 |     1 |
    |        5.0 |     1 |
    +------------+-------+

ii. Beachwood

SQL code used to arrive at answer:

    SELECT stars AS StarRating
    ,COUNT(stars) AS count
    FROM business 
    WHERE city = 'Beachwood'
    GROUP BY stars

    Copy and Paste the Resulting Table Below (2 columns � star rating and count):
    +------------+-------+
    | StarRating | count |
    +------------+-------+
    |        2.0 |     1 |
    |        2.5 |     1 |
    |        3.0 |     2 |
    |        3.5 |     2 |
    |        4.0 |     1 |
    |        4.5 |     2 |
    |        5.0 |     5 |
    +------------+-------+

/******************************************
 QUESTION 7
******************************************/

7. Find the top 3 users based on their total number of reviews: -- top 3 so we LIMIT first 3 ppl (in desc order)
		
	SQL code used to arrive at answer:

    SELECT name, review_count 
    FROM user
    ORDER BY review_count DESC
    LIMIT 3
		
    Copy and Paste the Result Below:
    +--------+--------------+
    | name   | review_count |
    +--------+--------------+
    | Gerald |         2000 |
    | Sara   |         1629 |
    | Yuri   |         1339 |
    +--------+--------------+

/******************************************
 QUESTION 8
******************************************/

8. Does posting more reviews correlate with more fans?

    Answer: No, posting more reviews does not correlate with having more fans. 

	Q: Please explain your findings and interpretation of the results:
	
    SQL code: 

    SELECT name, review_count, fans
    FROM user
    ORDER BY fans DESC
    LIMIT 15

    +-----------+--------------+------+
    | name      | review_count | fans |
    +-----------+--------------+------+
    | Amy       |          609 |  503 |
    | Mimi      |          968 |  497 |
    | Harald    |         1153 |  311 |
    | Gerald    |         2000 |  253 |
    | Christine |          930 |  173 |
    | Lisa      |          813 |  159 |
    | Cat       |          377 |  133 |
    | William   |         1215 |  126 |
    | Fran      |          862 |  124 |
    | Lissa     |          834 |  120 |
    | Mark      |          861 |  115 |
    | Tiffany   |          408 |  111 |
    | bernice   |          255 |  105 |
    | Roanna    |         1039 |  104 |
    | Angela    |          694 |  101 |
    +-----------+--------------+------+

    Explanation: As can be seen from the results, Gerald having the highest review_count of 2000 only has 253 fans, whereas Amy with only having 609 review_count has the most number of fans (503) in the table.

/******************************************
 QUESTION 9
******************************************/

9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: There are more reviews with the word "love".

	SQL code used to arrive at answer:

    SELECT (SELECT COUNT(text)
    FROM review
    WHERE text LIKE "%love%") AS  love_count;
    +------------+
    | love_count |
    +------------+
    |       1780 |
    +------------+

    SELECT (SELECT COUNT(text) 
    FROM review
    WHERE text LIKE "%hate%") AS hate_count;
    +------------+
    | hate_count |
    +------------+
    |        232 |
    +------------+

/******************************************
 QUESTION 10
******************************************/	

10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
	
    SELECT name
    ,fans
    FROM user
    ORDER BY fans DESC
    LIMIT 10
	
	Copy and Paste the Result Below:

    +-----------+------+
    | name      | fans |
    +-----------+------+
    | Amy       |  503 |
    | Mimi      |  497 |
    | Harald    |  311 |
    | Gerald    |  253 |
    | Christine |  173 |
    | Lisa      |  159 |
    | Cat       |  133 |
    | William   |  126 |
    | Fran      |  124 |
    | Lissa     |  120 |
    +-----------+------+

	
/******************************************
 PART 2 OF PEER-GRADED ASSIGNMENT 
******************************************/
Part 2: Inferences and Analysis

/******************************************
 QUESTION 1
******************************************/

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.

    Answer: I choose Phoenix and Restaurants category.
	
i. Do the two groups you chose to analyze have a different distribution of hours?

    Answer: No, they do not have a different distribution of hours.  As can be seen from the result, both 2-3 stars and 4-5 stars businesses operate in same distribution of hours. 

    SQL code used for analysis:

    SELECT 
    CASE 
    WHEN stars BETWEEN 4 AND 5 THEN '4-5 stars'
    WHEN stars BETWEEN 2 AND 3 THEN '2-3 stars'
    ELSE 'below 2 stars' 
    END AS Rating,           -- divide the businesses into either 2-3 stars or 4-5 stars                       
    
    COUNT(DISTINCT b.id) AS count,               -- count the distinct number of businesses from the business inner join of the business and hours table
    COUNT(hours) AS open_days_total,             -- count the number of entries in the hours table (grouped by the stars category), which happens to be the total number of days open
    COUNT(hours) / COUNT(DISTINCT b.id)  AS open_days_avg    -- divide the total number days open by the number of distinct businesses in the hours table
    FROM ((business b
    INNER JOIN hours h ON b.id = h.business_id)
    INNER JOIN category c ON b.id = c.business_id)                   
    WHERE city = 'Phoenix' AND c.category = 'Restaurants'      
    GROUP BY Rating 

    Result: 
    +---------------+-------+-----------------+---------------+
    | Rating        | count | open_days_total | open_days_avg |
    +---------------+-------+-----------------+---------------+
    | 2-3 stars     |     2 |              14 |             7 |
    | 4-5 stars     |     2 |              14 |             7 |
    | below 2 stars |     1 |               7 |             7 |
    +---------------+-------+-----------------+---------------+


ii. Do the two groups you chose to analyze have a different number of reviews?

    SQL code used for analysis:

    SELECT 
    CASE 
    WHEN stars BETWEEN 4 AND 5 THEN '4-5 stars'
    WHEN stars BETWEEN 2 AND 3 THEN '2-3 stars'
    ELSE 'below 2 stars' 
    END AS Rating,    
               
    COUNT(DISTINCT b.id) AS count,  
    SUM(review_count) AS totalReviews,
    SUM(review_count)*1.0/COUNT(DISTINCT b.id)  AS review_count_avg
    FROM business b INNER JOIN category c ON b.id = c.business_id
    WHERE city = 'Phoenix' AND c.category ='Restaurants'
    GROUP BY Rating

    Result:
    +---------------+-------+--------------+------------------+
    | Rating        | count | totalReviews | review_count_avg |
    +---------------+-------+--------------+------------------+
    | 2-3 stars     |     2 |           68 |             34.0 |
    | 4-5 stars     |     3 |          626 |    208.666666667 |
    | below 2 stars |     1 |           63 |             63.0 |
    +---------------+-------+--------------+------------------+

    Answer: There is different number of review between the two groups; 68 and 626.
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.

    SQL code used for analysis:

    SELECT 
    CASE 
    WHEN stars BETWEEN 4 AND 5 THEN '4-5 stars'
    WHEN stars BETWEEN 2 AND 3 THEN '2-3 stars'
    ELSE 'below 2 stars' 
    END AS Rating   
    ,b.neighborhood
    ,b.address
    ,b.postal_code

    FROM business b INNER JOIN category c ON b.id = c.business_id
    WHERE city = 'Phoenix' AND c.category ='Restaurants'
    ORDER BY Rating

    Results:

    +---------------+--------------+-------------------------+-------------+
    | Rating        | neighborhood | address                 | postal_code |
    +---------------+--------------+-------------------------+-------------+
    | 2-3 stars     |              | 1850 S 7th St           | 85004       |
    | 2-3 stars     |              | 751 E Union Hls Dr      | 85024       |
    | 4-5 stars     |              | 1153 E Jefferson St     | 85034       |
    | 4-5 stars     |              | 3118 E Camelback Rd     | 85016       |
    | 4-5 stars     |              | 3375 E Shea Blvd        | 85028       |
    | below 2 stars |              | 2641 N 44th St, Ste 100 | 85008       |
    +---------------+--------------+-------------------------+-------------+

    Answer: No, I was not able to infer anything from the location data provided, because they were all segregated from each other. 
		
/******************************************
 QUESTION 2
******************************************/

2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
            
    Answer: 
    1st Difference : The number of businesses that are open are at least 5 times more than the ones that are closed.     
    2nd Difference : There is greater number of reviews for the businesses that are open compared to those that are closed. 
         
         
SQL code used for analysis:

SELECT COUNT(DISTINCT id) AS No_Of_Businesses
			    ,COUNT(DISTINCT city) AS No_Of_Cities
			    ,AVG(stars) AS Rating
                ,AVG(review_count) AS No_Of_Reviews
			   ,is_open AS Open

FROM business
GROUP BY is_open

Result:
+------------------+--------------+---------------+---------------+------+
| No_Of_Businesses | No_Of_Cities |        Rating | No_Of_Reviews | Open |
+------------------+--------------+---------------+---------------+------+
|             1520 |          144 | 3.52039473684 | 23.1980263158 |    0 |
|             8480 |          351 | 3.67900943396 | 31.7570754717 |    1 |
+------------------+--------------+---------------+---------------+------+
-- Businesses Open = 1, Businesses Closed = 0 

/******************************************
 QUESTION 3
******************************************/

3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:
         
    Answer: Which business category is the most successful one out of the rest? 
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:

    Answer: First of all, I will need to retrieve the data from the categories table. However, it is insufficient, as I would also need the ratings as an indicator of whether the category is successful or not compared to the rest.  Next, I would want to calculate the average stars that were given to each  and every categories, as well as the proportion of the businesses that are open, as more successful businesses tend to be open for longer period of time. 

                                             
iii. Output of your finished dataset:

+------------------------+------------------+--------------+---------------------+
| Category               | No_Of_Businesses | Avg_No_Stars | Avg_Proportion_Open |
+------------------------+------------------+--------------+---------------------+
| Local Services         |               12 |         4.21 |                0.83 |
| Health & Medical       |               17 |         4.09 |                0.94 |
| Home Services          |               16 |          4.0 |                0.94 |
| Shopping               |               30 |         3.98 |                0.83 |
| Beauty & Spas          |               13 |         3.88 |                0.92 |
| American (Traditional) |               11 |         3.82 |                0.73 |
| Food                   |               23 |         3.78 |                0.87 |
| Bars                   |               17 |          3.5 |                0.65 |
| Nightlife              |               20 |         3.48 |                 0.6 |
| Restaurants            |               71 |         3.46 |                0.75 |
+------------------------+------------------+--------------+---------------------+
    
    Explanation: From the output, we can see that the top three most successful categories are "Local Service", "Health & Medical", and "Home Services". They have the highest ratings and also comparably much higher opening rate. On the other hand, categories "Bars", "Nightlife", and "Restaurants" have lesser stars and are often closed, so they are less successful in these aspects. 

iv. Provide the SQL code you used to create your final dataset:

    SELECT c.category AS Category 
                    ,COUNT(b.id) No_Of_Businesses
                    ,ROUND(AVG(b.stars),2) AS Avg_No_Stars
                    ,ROUND(AVG(b.is_open),2) AS Avg_Proportion_Open

    FROM (business b INNER JOIN category c ON b.id = c.business_id)
    GROUP BY c.category
    HAVING num_business > 10
    ORDER BY avg_stars DESC -- to get the no. of stars from highest -> lowest
    ,avg_isopen DESC -- to get no. of businesses open


