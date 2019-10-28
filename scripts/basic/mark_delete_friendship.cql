match (m:Person{name: "Mark"})-[rel:IS_FRIENDS_WITH]-(f:Person) 
delete rel;
