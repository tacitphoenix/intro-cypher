match (m:Person{name: "Mark"})-[rel:IS_FRIENDS_WITH]-(f:Person) 
set rel.since = date("2019-10-01");
