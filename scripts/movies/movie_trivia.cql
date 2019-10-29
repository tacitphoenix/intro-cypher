// who directed the movies rated 9 or higher
match (d:Person)-[:DIRECTED]->(m:Movie)<-[r:REVIEWED]-(:Person)
with d.name as Director, m.title as Movie, max(r.rating) as Rating
where Rating > 9
return collect(Director) as Directors, Movie, Rating
order by Rating desc;


