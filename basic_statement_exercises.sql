show databases;
use albums_db;

select *
from albums;
-- What does the column named 'name represent? 
-- name of the albums

-- What do you think the sales column represents? 
-- the number of albums sold 

-- Find the name of all albums by Pink Floyd
select *
from albums
where artist = 'pink floyd';
-- the dark side of the moon, the wall

-- What is the year Sgt. Pepper's Lonely Hearts Club Band was released? 
select *
from albums
where name = "Sgt. Pepper's Lonely Hearts Club Band"; 
-- 1967

-- What is the genre for the album Nevermind? 
select *
from albums
where name = 'nevermind';
-- Grunge, Alternative rock

-- Which albums were released in the 1990s? 
select *
from albums
where release_date between 1990 and 1999;

-- Which albums had less than 20 millon certified sales? 
select * 
from albums
where sales < 20; 
/* Grease, Bad, Sgt. Peppers, Dirty Dance, Let's Talk, Dangerous, Immaculate, Abbey,
Brothers, Titanic, Nevermind, The wall. 
*/







