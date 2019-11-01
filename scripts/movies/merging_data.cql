// create a movie node
merge (m:Movie{title: "Forrest Gump"}) 
on create set m:UPDATED
on match set m:SKIPPED
return m;

// update on match tagline
merge (m:Movie{title: "Forrest Gump"}) 
on match set m.tagline = "Life is like a box of chocolates...you never know what you're goinna get"
return m;

// create a production node
merge (p:Production{title: "Forrest Gump"})
on create set p.year = 1994
on match set p.updated = date()
return p;

// labels for all nodes with title property Forrest Gump
match (n)
where n.title = "Forrest Gump"
return labels(n);

// if production node exist add company property
merge (p:Production{title: "Forrest Gump"})
on create set p.year = 1994
on match set p.company = "Paramount Pictures"
return p;

// add label if movie exists
merge (m:Movie{title: "Forrest Gump"})
on match set m:OlderMovie
return m;

// never create nodes like this!
// it is an all or nothing operation if nodes exist but not relationships duplicate nodes are created
// always create nodes first before relationships; matching nodes first helps here
// add label if movie exists
merge (p:Person {name: 'Robert Zemeckis'})-[:DIRECTED]->(m {title: 'Forrest Gump'})

// find right person
match (p:Person {name: 'Robert Zemeckis'})-[rel]-(x)
return p, rel, x;

// delete that person 
match (p:Person {name: 'Robert Zemeckis'})-[rel]-(x)
detach delete p;

// find the correct node to delete
match (n)
where n.title = 'Forrest Gump' and labels(n) = []
RETURN n, labels(n);

// delete the correct node
match (n)
where n.title = 'Forrest Gump' and labels(n) = []
detach delete n;

// establish a directed relationship between a person and movie
// since nodes exist match them before merging relationship
match (p:Person), (m:Movie)
where p.name = 'Robert Zemeckis' AND m.title = 'Forrest Gump'
merge (p)-[:DIRECTED]->(m);

// add multiple actors to a movie
match (p:Person), (m:Movie)
where p.name IN ['Tom Hanks','Gary Sinise', 'Robin Wright']
      AND m.title = 'Forrest Gump'
merge (p)-[:ACTED_IN]->(m)
return p, m;

// add roles for actors on a movie
match (m:Movie)-[r:ACTED_IN]-(p:Person)
where m.title = "Forrest Gump"
set r.roles =
case p.name
when "Tom Hanks" then "Forrest Gump"
when "Gary Sinise" then "Lt. Dan Taylor"
when "Robin Wright" then "Jenny Curran"
end
return m, p;