-- Challenge 1 - Who Have Published What At Where?
-- In this challenge you will write a MySQL SELECT query that joins various tables to figure out what
-- titles each author has published at which publishers. Your output should have at least the following columns:
-- AUTHOR ID - the ID of the author
-- LAST NAME - author last name
-- FIRST NAME - author first name
-- TITLE - name of the published title
-- PUBLISHER - name of the publisher where the title was published

--select authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME',
--publishers.pub_id, titles.title_id, titles.title_id as 'TITLE' publishers.pub_name as 'PUBLISHER'
--from authors, publishers, titles
-- where publishers.pub_id = titles.title_id;



select authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', 
titles.title as 'TITLE', publishers.pub_name as 'PUBLISHER'
from titles
JOIN titleauthor
on titles.title_id = titleauthor.title_id
JOIN authors
on authors.au_id = titleauthor.au_id
JOIN publishers
on publishers.pub_id = titles.pub_id;


select authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', 
titles.title as 'TITLE', publishers.pub_name as 'PUBLISHER'
from titles, authors, publishers, titleauthor
where (titles.title_id = titleauthor.title_id) and (authors.au_id = titleauthor.au_id) and (publishers.pub_id = titles.pub_id)

-- I do not understand the use of WITH. I can not see the advantage of using it with the JOINs

--WITH challenge1_01 AS
--(select titles.title as 'TITLE'
--from titles
--JOIN titleauthor
--on titles.title_id = titleauthor.title_id),
--challenge1_02 as
--(select )

-- If your query is correct, the total rows in your output should be the same as the total number of records in Table titleauthor.

create VIEW temp_challenge1 as
select authors.au_id, authors.au_lname, authors.au_fname, 
titles.title, publishers.pub_name
from titles, authors, publishers, titleauthor
where (titles.title_id = titleauthor.title_id) and (authors.au_id = titleauthor.au_id) and (publishers.pub_id = titles.pub_id)

select au_id as 'AUTHOR ID', au_lname as 'LAST NAME', au_fname as 'FIRST NAME', title as 'TITLE', pub_name as 'PUBLISHER'
from temp_challenge1


-- Challenge 2 - Who Have Published How Many At Where?
-- Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher.

create VIEW temp_challenge2 as
select au_id as 'AUTHOR ID', au_lname as 'LAST NAME', au_fname as 'FIRST NAME', 
pub_name as 'PUBLISHER', count(title) as 'title_count'
from temp_challenge1
group by au_id, pub_name
order by count(title) desc;
	

select sum(title_count)
from temp_challenge2

select count(*)
from titleauthor


-- Challenge 3 - Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

-- I will create a view 

create view temp_challenge3 as
select authors.au_id as au_id, authors.au_lname as au_lname, authors.au_fname as au_fname, 
titles.title as title, titles.title_id as title_id
from titles, authors, sales, titleauthor
where (titles.title_id = titleauthor.title_id) and (authors.au_id = titleauthor.au_id)



select temp_challenge3.au_id as 'AUTHOR ID', temp_challenge3.au_lname as 'LAST NAME', temp_challenge3.au_fname as 'FIRST NAME',
temp_challenge3.title, sales.qty as 'TOTAL'
from temp_challenge3
left JOIN sales
on temp_challenge3.title_id = sales.title_id
group by temp_challenge3.title_id, temp_challenge3.au_id
 

--select "AUTHOR ID", "LAST NAME", "FIRST NAME", sum ((DISTINCT "AUTHOR ID") sales)
--from temp_challenge3_v2
--group by "AUTHOR ID"
--order by sales desc
--limit 3;

select "AUTHOR ID", "LAST NAME", "FIRST NAME", sum(sales) AS 'TOTAL'
from temp_challenge3_v2
group by "AUTHOR ID"
order by TOTAL DESC
limit 3;


-- Challenge 4

select "AUTHOR ID", "LAST NAME", "FIRST NAME", ifnull (sum(sales),0) as 'TOTAL'
from temp_challenge3_v2
group by "AUTHOR ID"
order by TOTAL desc

-- Same as challenge 3


select ifnull (sales, 0) as 'TOTAL'
from temp_challenge3_v2













