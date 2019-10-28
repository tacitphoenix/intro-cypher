// This provides duplicates
// merge (m:Person {name: 'Mark'})-[r:IS_FRIENDS_WITH]->(s:Person {name: 'Steve'}) RETURN m, r, s;

// matching first prevents duplication
// match (m:Person {name: 'Mark'})
// match (s:Person {name: 'Steve'})
// merge (m)-[r:IS_FRIENDS_WITH]->(s) RETURN m, r, s;

// only create relationship
merge (m)-[r:IS_FRIENDS_WITH]->(s) 
on create set r.since = date("2019-10-01")
on match set  r.since = date()
RETURN m, r, s;
