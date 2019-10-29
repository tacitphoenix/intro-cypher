// all movies that Tom Cruise acted in
match (m:Movie)-[:ACTED_IN]-(p:Person)
where p.name = "Tom Cruise"
return m.title;

// get all the people born in the 70s return their names and birth year
match (p:Person)
where p.born > 1969 and p.born < 1980
return p.name as name, p.born as birthYear
order by birthYear;

// get all the actors who acted in the matrix born after 1960
match (p:Person)-[:ACTED_IN]->(m:Movie)
where p.born > 1960 and m.title = "The Matrix"
return p.name as Name, p.born as `Year Born`
order by `Year Born`;

// all movies released in 2000
match (m)
where m:Movie AND m.released = 2000
return m.title;

// get all the people that wrote movies
match (p)-[r]->(m)
where p:Person and type(r) = "WROTE" and m:Movie
return p.name as name, m.title as movie;

// all the people that don't have a born property
match (p)
where p:Person
and not exists(p.born)
return p.name as name;

// get people who reviewed a movie
match (p:Person)-[r]->(m:Movie)
where exists(r.rating)
return p.name, r.rating, type(r), m.title
order by r.rating desc;

// all the actors whose name starts with 'James'
match (p:Person)-[:ACTED_IN]->(:Movie)
//where p.name starts with 'James'
where p.name =~ 'James.*'
return distinct p.name as Name;

// get all ratings for reveiew summaries containing 'fun'
match (p:Person)-[r:REVIEWED]->(m:Movie)
//where r.summary =~ '(?i).*fun.*'
where toLower(r.summary) contains 'fun'
return m.title, r.rating, r.summary;

// all movies with love in the tagline
match (m:Movie)
where toLower(m.tagline) contains 'love'
return m.title, m.tagline;

match (m:Movie)
where m.tagline =~ '(?i).*LOVE.*'
return m.title, m.tagline;

// who has produced and not directed a movie
match (p:Person)-[:PRODUCED]-(m:Movie)
where not exists((p)-[:DIRECTED]-(:Movie))
return p.name, m.title;

// who has produced and directed a movie
match (p:Person)-[:PRODUCED]-(:Movie),
(p)-[:DIRECTED]-(:Movie)
return distinct p.name;

// who as directed and acted in a movie and name his costars
match (p:Person)-[:DIRECTED]->(m:Movie)<-[:ACTED_IN]-(p),
(costar:Person)-[:ACTED_IN]->(m)
return p.name as Director, m.title as Movie, collect(costar.name) as Actors;

match (p:Person)-[:ACTED_IN]->(m:Movie)<-[:ACTED_IN]-(a:Person)
where exists((p)-[:DIRECTED]->(m))
return p.name as Director, m.title as Movie, collect(a.name) as Actors;

// get all movies release in 2000, 2004, 2008
match (m:Movie)
where m.released in [2000,2004,2008]
return m.title as Movie, m.released as `Year Released`;

// get a movie whose till is the same as a role
match (a:Person)-[r:ACTED_IN]->(m:Movie)
where m.title in r.roles
return  m.title as Movie, a.name as Actor;

