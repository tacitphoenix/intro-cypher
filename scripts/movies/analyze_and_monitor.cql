// view query plan
explain match (r:Person)-[rel:REVIEWED]->(m:Movie)<-[:ACTED_IN]-(a:Person)
where m.released = $year and rel.rating > $ratingValue
return distinct r.name, m.title, m.released, rel.rating, collect(a.name);

// view query metrics
profile match (r:Person)-[rel:REVIEWED]->(m:Movie)<-[:ACTED_IN]-(a:Person)
where m.released = $year and rel.rating > $ratingValue
return distinct r.name, m.title, m.released, rel.rating, collect(a.name);

// remove labels and view query metrics
profile match (r)-[rel]->(m)<-[:ACTED_IN]-(a)
where m.released = $year and rel.rating > $ratingValue
return distinct r.name, m.title, m.released, rel.rating, collect(a.name);

// long running query (open browser connection to observer with :queries)
profile match (a)--(b)--(c)--(d)--(e)--(f)--(g)
return a;