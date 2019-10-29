// coStarPath
match coStarsOf = (star:Person)-[:ACTED_IN]->(m:Movie)<-[:ACTED_IN]-(costar:Person)
where star.name = "Tom Cruise"
return coStarsOf;

// shortest path between 'A Few Good Men' and 'The Matrix'
match p = shortestPath((m1:Movie)-[*]-(m2:Movie))
where m1.title = 'A Few Good Men' and m2.title = 'The Matrix'
return  p;

// collaborations
match (actor:Person)-[:ACTED_IN]->(m:Movie)<-[:DIRECTED]-(director:Person)
return actor.name, director.name, count(m) as collaborations, collect(m.title) as movies;

