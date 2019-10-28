// only Neo4j people
match (p)-[:WORKS_FOR]-(c:Company{name: "Neo4j"})
return p.name, c.name;

// how do people relate to Neo4j
match (p:Person)
optional match (p)-[:WORKS_FOR]-(c:Company{name: "Neo4j"})
return p.name, c.name;
