CREATE VIEW top_rating_movie as 
select m.movie_title, count(first_name) as "number_of_directors"
from directors d
		join movie_directors md on md.director_id = d.director_id
		join movies m on m.movie_id = md.movie_id
group by m.movie_title;

select t.movie_title, r.imdb_rating, t.number_of_directors, m.duration
from top_rating_movie t
join movies m on t.movie_title=m.movie_title
join reviews r on m.movie_id = r.movie_id;