// read csv from url
load csv with headers
from 'http://data.neo4j.com/intro-neo4j/actors.csv' as line
return line.id, line.name, line.birthYear;

// read csv and format
load csv with headers
from 'http://data.neo4j.com/intro-neo4j/actors.csv' as line
return line.id, line.name, toInteger(trim(line.birthYear));

// merge csv load data
load csv with headers
from 'http://data.neo4j.com/intro-neo4j/actors.csv' as line
merge (actor:Person {name: line.name})
  on create set actor.born = toInteger(trim(line.birthYear)), actor.actorId = line.id
  on match set actor.actorId = line.id;

// read movie data
load csv with headers
from 'http://data.neo4j.com/intro-neo4j/movies.csv' as line
return line.id, line.title, line.year, line.tagLine;

// read and format movie data
load csv with headers
from 'http://data.neo4j.com/intro-neo4j/movies.csv' as line
return line.id, line.title, toInteger(line.year), trim(line.tagLine);

// load movie data
load csv with headers
from 'http://data.neo4j.com/intro-neo4j/movies.csv' as line
merge (m:Movie {title: line.title})
on create
  set m.released = toInteger(trim(line.year)),
      m.movieId = line.id,
      m.tagline = line.tagLine
on match set m.movieId = line.id;

// read relationship data from file
load csv with headers
from 'http://data.neo4j.com/intro-neo4j/roles.csv' as line fieldterminator ';'
return line.personId, line.movieId, line.Role;

// read and format relationship data from file
load csv with headers
from 'http://data.neo4j.com/intro-neo4j/roles.csv' as line fieldterminator ';'
return line.personId, line.movieId, split(line.Role,',');

// load relationship data
load csv with headers
from 'http://data.neo4j.com/intro-neo4j/roles.csv' as line fieldterminator ';'
match (movie:Movie { movieId: line.movieId })
match (person:Person { actorId: line.personId })
merge (person)-[:ACTED_IN { roles: split(line.Role,',')}]->(movie);

