match (p:Person{name: "Sara"})-[:FRIEND]->(f:Person)
return p.name as Person, f.name as Friend;
