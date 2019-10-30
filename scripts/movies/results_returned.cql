// which actor where in movies from the 90s
match (m:Movie)<-[:ACTED_IN]-(p:Person)
where 1990 <= m.released < 2000
return m.title, m.released, collect(p.name);

// sort above movies by release date
match (m:Movie)<-[:ACTED_IN]-(p:Person)
where 1990 <= m.released < 2000
return m.title, m.released, collect(p.name)
order by m.released;

// top five movies with the best average rating
match (m:Movie)<-[r:REVIEWED]-(:Person)
with m, avg(r.rating) as avgRating
return m.title, avgRating
order by avgRating desc
limit 5;

// actors that haven't appeared in more than 3 movies
match (p:Person)-[:ACTED_IN]->(m:Movie)
with p, count(m) as movieCount, collect(m.title) as movies
where movieCount < 4
return p.name, movies;