// get all movies releaseed in 2003
match (m:Movie{released: 2003}) return m;

// query the database for all property keys
call db.propertyKeys;

// get all movies released in 2006 returning their titles
match (m:Movie{released: 2006}) return m.title;

// all movie nodes from the database and return the title, released, and tagline values
match (m:Movie) return m.title, m.released, m.tagline;

// alias above
match (m:Movie) return m.title as name, m.released as year, m.tagline as qoute;

