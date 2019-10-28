// who are the innovators
match (p:Person)
where exists(p.innovator)
return p.name;

// checking for the property directly also works
match (p:Person{innovator: true}) return p.name;

// only friends with the since property on the relationship
match (a:Person)-[r:IS_FRIENDS_WITH]-(b:Person)
where exists(r.since)
return  a.name, b.name;
