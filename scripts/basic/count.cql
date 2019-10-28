// simple query
match (p:Person) return p.name;

// simple count
match (p:Person) return count(p.name);

// how many people in each company
match (p:Person)--(c:Company) return c.name, count(p.name);

