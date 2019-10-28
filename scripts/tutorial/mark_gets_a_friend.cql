// match nodes before relationship to prevent duplicates
match (m:Person{name: "Mark"})  
match (j:Person{name: "Jennifer"})  
create (m)-[:IS_FRIENDS_WITH{since: date()}]->(j);