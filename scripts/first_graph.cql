// create nodes
// TODO: Create Person "Robert" who is friends with everyone
create (mike:Person{name: "Michael", innovator: true})
create (jen:Person{name: "Jennifer", innovator: true})
create (john:Person {name: 'John'})
create (joe:Person {name: 'Joe'})
create (steve:Person {name: 'Steve', innovator: true})
create (sara:Person {name: 'Sara'})
create (maria:Person {name: 'Maria'})

// create companies
// TODO: Create Company "Tacit Oasis" founded by all the innovators from other companies
create (neo:Company{name: "Neo4j"})
create (nin:Company{name: "Nintendo"})
create (apl:Company{name: "Apple"})

// create technologies
// TODO: Create a new Technology Mobile
create (gh:Technology{type: "Graphs"})
create (os:Technology{type: "Operating System"})
create (vg:Technology{type: "Video Game"})

// create friendships
// TODO: Who has the oldest friendship?
// TODO: Who has the most friends?
create 
(jen)-[:IS_FRIENDS_WITH{since: 2018}]->(mike),
(maria)-[:IS_FRIENDS_WITH{since: 2011}]->(jen),
(steve)-[:IS_FRIENDS_WITH{since: 2013}]->(mike),
(joe)-[:IS_FRIENDS_WITH{since: 2015}]->(jen),
(sara)-[:IS_FRIENDS_WITH{since: 2010}]->(mike),
(john)-[:FRIEND]->(joe)-[:FRIEND]->(steve),
(john)-[:FRIEND]->(sara)-[:FRIEND]->(maria),
(joe)-[:FRIEND]->(maria),
(sara)-[:FRIEND]->(steve)

// create employment relationship
// TODO: Who has friends who work for different companies?
create
(jen)-[:WORKS_FOR]->(neo),
(john)-[:WORKS_FOR]->(neo),
(joe)-[:WORKS_FOR]->(neo),
(mike)-[:WORKS_FOR]->(nin),
(maria)-[:WORKS_FOR]->(nin),
(steve)-[:WORKS_FOR]->(apl),
(sara)-[:WORKS_FOR]->(apl)

// create industry relationship
// TODO: Create a relationship "Apple" is getting into "Video Games"
create
(neo)-[:INDUSTRY]->(gh),
(nin)-[:INDUSTRY]->(vg),
(apl)-[:INDUSTRY]->(os)

// create preferences
// TODO: Update everyone should like the technology their company's industry is in
create
(jen)-[:LIKES]->(gh),
(jen)-[:LIKES]->(vg)
