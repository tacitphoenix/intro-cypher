// find and list the technologies people like
match (a:Person)-[r:LIKES]-(t:Technology)
with a.name AS name, collect(t.type) AS technologies
return name, technologies;

// find and list the technologies people like (no with)
MATCH (a:Person)-[r:LIKES]-(t:Technology)
RETURN a.name, collect(t.type);

// find number of friends who have other friends 
match (p:Person)-[:IS_FRIENDS_WITH]->(friend:Person)
with p, collect(friend.name) AS friendsList, size((friend)-[:IS_FRIENDS_WITH]-(:Person)) AS numberOfFoFs
where numberOfFoFs > 1
return p.name, friendsList, numberOfFoFs;

// find people with 2-6 years of experience
with 2 AS experienceMin, 6 AS experienceMax
match (p:Person)
where experienceMin <= p.yrsExperience <= experienceMax
return p;


