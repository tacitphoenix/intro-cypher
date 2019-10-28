// show people and their friends
match (p:Person)-[:IS_FRIENDS_WITH]-(f:Person) 
return p.name, f.name;

// count how many friends people have
match (p:Person)-[:IS_FRIENDS_WITH]-(f:Person) 
return p.name, count(f.name);

// list the friends a person has
match (p:Person)-[:IS_FRIENDS_WITH]-(f:Person) 
return p.name, collect(f.name);

// how many friends are in that list (.hmmm count?)
match (p:Person)-[:IS_FRIENDS_WITH]-(f:Person) 
return p.name, size(collect(f.name));
