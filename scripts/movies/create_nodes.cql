// create movie "Forrest Gump"
create (m:Movie{title: "Forrest Gump"}) return n;

// create person "Robin Wright"
create (p:Person{name: "Robin Wright"}) return p;

// label all the movies older than 2010 as OlderMovie
match (m:Movie)
where m.released < 2010
set m:OlderMovie
return m;

// lab all peoples name tha
match (p:Person)
where p.name starts with 'Robin'
set p:Female
return p;

// get all female nodes
match (f:Female) return f;

// remove the female label
match (f:Female) 
remove f:Female 
return f;

// view current schema of the graph
call db.schema();

// add a new label and properties to "Forest Gump"
match (m:Movie{title: "Forrest Gump"})
set m.released = 1994,
m.tagline = "Life is like a box of chocolates...you never know what you're gonna get",
m.lengthInMinutes = 142,
m:OlderMovie
return m;

// add properties to "Robin Wright"
match (robin:Person{name: "Robin Wright"})
set robin.born = 1966, robin.birthPlace = "Dallas"
return robin;

// remove property from movie
match (m:Movie{title: "Forrest Gump"})
remove m.lengthInMinutes
return m;

// remove birthPlace  property from "Robin Wright"
match (robin:Person{name: "Robin Wright"})
remove robin.birthPlace
return robin;

