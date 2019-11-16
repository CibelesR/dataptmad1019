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
select authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', 
titles.title as 'TITLE', publishers.pub_name as 'PUBLISHER'
from titles, authors, publishers, titleauthor
where (titles.title_id = titleauthor.title_id) and (authors.au_id = titleauthor.au_id) and (publishers.pub_id = titles.pub_id)

select *
from views.temp_challenge1
