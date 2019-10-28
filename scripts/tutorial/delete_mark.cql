// all relationships must be deleted before node
match (m:Person{name: "Mark"})
detach delete m;
