// get schema
call db.schema;

// all the people that wrote for Speed racer
call db.relationshipTypes;
match (p:Person)-[:WROTE]-(:Movie{title: "Speed Racer"}) return p.name;

// all the people who have written an movie
match (p:Person)-[:WROTE]-(m:Movie) return p.name, m.title;

// all the people who have acted in a movie
match (p:Person)-[:ACTED_IN]-(m:Movie) return p.name, m.title;

// all the people who have directed in a movie
match (p:Person)-[:DIRECTED]-(m:Movie) return p.name, m.title;

// all movies connected to Tom Hanks
match (tom:Person{name: "Tom Hanks"})-[r]-(m:Movie) 
return type(r) as Tom, m.title as Movie;

// all the connections actors have to movies
match (p:Person)-[r]-(m:Movie)
with p.name as name, collect(type(r)) as connections, collect(m.title) as movies, size(collect(m.title)) as count
return name, connections, movies order by count desc;

// movies with the top 10 most connections and the people connected to them
match (m:Movie)-[r]-(p:Person)
with m.title as name, size(collect(type(r))) as connections, collect(p.name) as people
return name, connections, people
order by connections desc
limit 10;

// get a list of all directors and the movies that they directed
match (p:Person)-[:DIRECTED]-(m)
with p.name as name, collect(m.title) as movies
return name, movies
order by size(movies) desc;

// get all of Tom Hanks movies and his roles in them
match (tom:Person{name: "Tom Hanks"})-[r:ACTED_IN]-(m)
return tom.name, r.roles, m.title;

// get the actors with the top 10 most roles (insane)
match (p:Person)-[r:ACTED_IN]-()
with p.name as name, collect(r.roles) as ndroles
unwind ndroles as droles
unwind droles as drole
with name, collect(drole) as droles
return name, droles
order by size(droles) desc
limit 10;

// get the movie with the top 10 most roles (insane)
match (p:Movie)-[r:ACTED_IN]-()
with p.title as name, collect(r.roles) as ndroles
unwind ndroles as droles
unwind droles as drole
with name, collect(drole) as droles
return name, droles
order by size(droles) desc
limit 10;

// all roles in the database (really insane)
match (p:Person)-[r:ACTED_IN]-()
with p.name as name, collect(r.roles) as ndroles // nested roles with duplicates
unwind ndroles as ndrole
unwind ndrole as drole 
with collect(drole) as droles // unnested roles with duplicates
unwind droles as role
with distinct role 
return collect(role) as roles; // collect distinct roles

