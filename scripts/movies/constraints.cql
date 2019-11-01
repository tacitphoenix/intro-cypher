// only unique names
create constraint on (p:Person) assert p.name is unique;

// add Tom Hanks (won't work duplicate)
create (p:Person{name: "Tom Hanks"});

// add an existence constraint to Person
create constraint on (p:Person) assert exists(p.born);

// add born property to those who don't have it
match (p:Person)
where not exists(p.born)
set p.born = 0
return p.name;

// add an actor without born property
create (p:Person{name: "Sean Penn"});

 // all ACTED_IN relationships must have a role
 create constraint on ()-[r:ACTED_IN]-() assert exists(r.roles);

// create a new relationship
match (p:Person), (m:Movie)
where p.name = "Emil Eifrem" and m.title = "Forrest Gump"
merge (p)-[:ACTED_IN]->(m);

// create a node key on movie
create constraint on (m:Movie) assert (a.title, a.released) is node key;

// test node key
create (m:Movie{title: "Back to the Future", released: 1985});
create (m:Movie{title: "Back to the Future", released: 1985});

// show constraints
call db.constraints();

// drop ACTED_IN roles constraint
drop constraint on ()-[r:ACTED_IN]-() assert exists(r.roles);
