// form multiple relationships between actors and movie "Forrest Gump"
match (m:Movie{title: "Forrest Gump"}), (p:Person)
where p.name = 'Tom Hanks' OR p.name = 'Robin Wright' OR p.name = 'Gary Sinise'
create (p)-[:ACTED_IN]->(m);

// add director to "Forrest Gump"
match (fg:Movie{title: "Forrest Gump"}), (rz:Person{name: "Robert Zemeckis"})
create (rz)-[:DIRECTED]->(fg);

// Tom Hanks helped Gary Sinise
match (tm:Person{name: "Tom Hanks"}), (gs:Person{name: "Gary Sinise"})
create (tm)-[:HELPED]->(gs);

// all the nodes connected to Forrest Gump
match (m:Movie{title: "Forrest Gump"})-[rel]-(n)
return m.title, type(rel), n;

// assign some roles
match (p:Person)-[rel:ACTED_IN]->(m:Movie)
where m.title = 'Forrest Gump'
set rel.roles =
case p.name
  when 'Tom Hanks' then ['Forrest Gump']
  when 'Robin Wright' then ['Jenny Curran']
  when 'Gary Sinise' then ['Lieutenant Dan Taylor']
end;

// What type of help did Tom give Gary
match (t:Person)-[r:HELPED]->(g:Person)
where t.name = "Tom Hanks" and g.name = "Gary Sinise"
set r.research = "war history"
return t,g;

// all property keys in the graph
call db.propertyKeys();

// current schema of the graph
call db.schema();

// names and roles of actor from Forrest Gump
match (p:Person)-[r:ACTED_IN]->(:Movie{title: "Forrest Gump"})
return p.name, r.roles;

// get information about all helped relationships
match ()-[r:HELPED]->()
return r;

// update Gary Sinise's role in Forrest Gump
match (p:Person)-[r:ACTED_IN]-(m:Movie)
where p.name = "Gary Sinise" and m.title = "Forrest Gump"
set r.roles = ["Lt. Dan Taylor"]
return r;

// remove research property from HELPED relationship
match (t:Person)-[r:HELPED]->(g:Person)
where t.name = "Tom Hanks" and g.name = "Gary Sinise"
remove r.research
return r;
