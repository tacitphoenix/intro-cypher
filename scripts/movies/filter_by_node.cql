// get all nodes
match (n) return n;

// examine schema
call db.schema();

// get all person nodes
match (p:Person) return p;

// get all movie nodes
match (m:Movie) return m;
