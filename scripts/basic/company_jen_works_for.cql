// using where clause
//match (j:Person)-[:WORKS_FOR]->(c:Company) where j.name = "Jennifer" return c.name;

// using properties
match (j:Person{name: "Jennifer"})-[:WORKS_FOR]->(c:Company) return c;
