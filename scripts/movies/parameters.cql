// all reviewers the movies they reviewed and actors in them
match (reviewer:Person)-[r:REVIEWED]->(m:Movie),
(actor:Person)-[:ACTED_IN]->(m)
return distinct reviewer.name, m.title, m.released, r.rating, collect(actor.name);

// add a year parameter
:param year => 2000;

// use parameter in previous query
match (reviewer:Person)-[r:REVIEWED]->(m:Movie),
(actor:Person)-[:ACTED_IN]->(m)
where m.released = $year
return distinct reviewer.name, m.title, m.released, r.rating, collect(actor.name);

// change year parameter
:param year => 2006;

// add ratingValue parameter
:param ratingValue => 65;

// add new parameter to previous query
match (reviewer:Person)-[r:REVIEWED]->(m:Movie),
(actor:Person)-[:ACTED_IN]->(m)
where m.released = $year and r.rating = $ratingValue
return reviewer.name, m.title, m.released, r.rating, collect(actor.name);

// add ratingValue parameter
:param ratingValue => 68;
