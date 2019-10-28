//find who likes graphs besides Jennifer
match (j:Person {name: 'Jennifer'})-[:LIKES]-(Technology {type: 'Graphs'})-[:LIKES]-(p:Person)
return p.name;

//find who likes graphs besides Jennifer that she is also friends with
match (j:Person {name: 'Jennifer'})-[:LIKES]->(:Technology {type: 'Graphs'})<-[:LIKES]-(p:Person),
      (j)-[:IS_FRIENDS_WITH]-(p)
return p.name;
