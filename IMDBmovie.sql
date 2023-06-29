use imdbmovies;

select movie_title,budget,gross,(gross-budget) as profit,  actor_1_name from imdb 
order by PROFIT desc LIMIT 20;

select movie_title as IMDb_Top_250,imdb_score, Dense_rank() over(order by imdb_score desc) as RankNo 
from imdb 
where num_voted_users > 25000 
limit 250;

select movie_title as Top_Foreign_Lang_Film, Language,imdb_score, 
Dense_rank() over(order by imdb_score desc) as RankNo 
from imdb 
where num_voted_users > 25000 and language !="English"
limit 250;

select genres, avg(imdb_score) as HighestIMDBscore 
from imdb group by genres
order by HighestIMDBscore desc
limit 10;

select actor_1_name, movie_title as Combined from imdb 
where actor_1_name = 'Meryl Streep' or actor_1_name = 'Leonardo DiCaprio' or actor_1_name = 'Brad Pitt' 
order by actor_1_name;

select actor_1_name as Actor, avg(num_critic_for_reviews + num_user_for_reviews) as mean
from imdb 
group by actor_1_name
order by mean desc ;

select floor(Title_year/10)*10 as decade,sum(num_voted_users) as votes from imdb
group by decade
order by votes desc;


select actor_1_name as actor, num_voted_users as audience_favourite
from imdb
group by actor order by num_voted_users desc limit 1;

select actor_1_name as actor, num_critic_for_reviews as critic_favourite 
from imdb
group by actor order by num_critic_for_reviews desc limit 1;
 


      