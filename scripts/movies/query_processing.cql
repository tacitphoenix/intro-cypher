// list movies 'Gene Hackman" has acted in including directors and costars
match 
(gene:Person{name: "Gene Hackman"})-[:ACTED_IN]->(m:Movie)<-[:DIRECTED]-(director:Person),
(costar:Person)-[:ACTED_IN]->(m)
return  m.title as Movie, director.name as Director, gene.name as Star, collect(costar.name) as Costars;

// all people that james follows that are on hop away
match (jt:Person{name: "James Thompson"})-[:FOLLOWS*1]-(n) return jt, n;
match (jt:Person{name: "James Thompson"})-[:FOLLOWS*3]-(n) return jt, n;
match (jt:Person{name: "James Thompson"})-[:FOLLOWS*1..2]-(n) return jt, n;
match (jt:Person{name: "James Thompson"})-[:FOLLOWS*]-(n) return jt, n;

// get people whose name starts with 'Tom' and optionally whose directed a movie
match (a:Person)
where a.name starts with 'Tom'
optional match (a)-[:DIRECTED]->(m:Movie)
return a.name, m.title;

// get all the actors and the movies that they acted in
match (a:Person)-[:ACTED_IN]-(m:Movie)
return a.name as Actor, collect(m.title) as MOVIES;

// all the movies tom cruise has acted in an his costars
match (tom:Person{name: "Tom Cruise"})-[:ACTED_IN]->(m:Movie)<-[:ACTED_IN]-(costar:Person)
return m.title as Movie, collect(costar.name) as `Tom Cruise's Costar`;

// get a list of how many people reviewed a movie
match (m:Movie)<-[:REVIEWED]-(p:Person)
return m.title as Movie, collect(p.name) as Reviewers, count(p) as ReviewCount
order by ReviewCount desc;

// get a director and the list of people worked with
match (d:Person)-[:DIRECTED]->(:Movie)<-[:ACTED_IN]-(p:Person)
return d.name as Director, collect(p.name) as Actors, count(p) as ActorCount
order by ActorCount desc;

// get the actor who has acted in exactly five movies
match (a:Person)-[:ACTED_IN]->(m:Movie)
with a, collect(m.title) as movieList, count(m) as movieCount
where movieCount = 5
return a.name as Actor, movieList;

// get all the reviewers from a movie with 2 directors
match (m:Movie)<-[:DIRECTED]-(d:Person)
with m, count(d) as directorCount
where directorCount > 1
optional match (m)<-[:REVIEWED]-(p:Person)
return m.title, collect(p.name);

