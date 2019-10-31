// get a movies cast and directors order by cast
match (a:Person)-[:ACTED_IN]->(m:Movie),
(p:Person)-[:PRODUCED]->(m)
with m, collect(distinct a.name) as cast, collect(distinct p.name) as producers
return m.title, producers, cast order by size(cast) desc

// get an actors list of movies
match (actor:Person)-[:ACTED_IN]->(movie:Movie)
with actor.name as Actor, collect(movie.title) as Movies
where size(Movies) > 5
return Actor, Movies order by size(Movies) desc

// unwind above
match (actor:Person)-[:ACTED_IN]->(movie:Movie)
with actor.name as Actor, collect(movie.title) as Movies
where size(Movies) > 5
unwind Movies as Movie
return Actor, Movie

