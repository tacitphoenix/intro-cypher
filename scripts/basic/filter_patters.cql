// find which people are friends of someone who works for Xing
match (p:Person)-[r:IS_FRIENDS_WITH]-(friend:Person),
(c:Company {name: 'Xing'})
where exists((p)-[:WORKS_FOR]->(c))
return p, c, friend;

// find Jennifer's friends who do not work for a company
match (p:Person)-[r:IS_FRIENDS_WITH]->(friend:Person)
where p.name = 'Jennifer'
and not exists((friend)-[:WORKS_FOR]->(:Company))
return friend.name;

