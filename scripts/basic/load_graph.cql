// create nodes
// TODO: Create Person "Robert" who is friends with everyone
create (mike:Person{name: "Michael", innovator: true})
create (jen:Person{name: "Jennifer", innovator: true})
create (john:Person {name: 'John'})
create (joe:Person {name: 'Joe'})
create (steve:Person {name: 'Steve', innovator: true})
create (sara:Person {name: 'Sara'})
create (maria:Person {name: 'Maria'})
create (sal:Person {name: 'Sally'})
create (ann:Person {name: 'Ann'})
create (dan:Person {name: 'Dan'})
create (miles:Person {name: 'Miles'})
create (mel:Person {name: 'Melissa'})
create (dee:Person {name: 'Diana'})

// create companies
// TODO: Create Company "Mbweha" founded by all the innovators from other companies
create (neo:Company{name: "Neo4j"})
create (nin:Company{name: "Nintendo"})
create (apl:Company{name: "Apple"})
create (abc:Company{name: "ABC"})
create (xyz:Company{name: "XYZ"})
create (xng:Company{name: "Xing"})
create (zal:Company{name: "Zalando"})

// create technologies
// TODO: Create a new Technology Mobile
create (gh:Technology{type: "Graphs"})
create (os:Technology{type: "Operating System"})
create (vg:Technology{type: "Video Game"})
create (jv:Technology{type: "Java"})
create (ql:Technology{type: "Query Languages"})
create (de:Technology{type: "Data ETL"})
create (ig:Technology{type: "Integration"})
create (ap:Technology{type: "Application"})

// create friendships
// TODO: Who has the oldest friendship?
// TODO: Who has the most friends?
create 
(jen)-[:IS_FRIENDS_WITH{since: 2018}]->(mike),
(jen)-[:IS_FRIENDS_WITH{since: 2011}]->(steve),
(jen)-[:IS_FRIENDS_WITH]->(john),
(jen)-[:IS_FRIENDS_WITH]->(sal),
(jen)-[:IS_FRIENDS_WITH]->(ann),
(jen)-[:IS_FRIENDS_WITH]->(mel),
(jen)-[:IS_FRIENDS_WITH]->(miles),
(mike)-[:IS_FRIENDS_WITH{since: 2013}]->(maria),
(john)-[:FRIEND]->(joe)-[:FRIEND]->(steve),
(john)-[:FRIEND]->(sara)-[:FRIEND]->(maria),
(joe)-[:FRIEND]->(maria),
(sara)-[:FRIEND]->(steve),
(john)-[:IS_FRIENDS_WITH]->(sal),
(ann)-[:IS_FRIENDS_WITH]->(dan),
(joe)-[:IS_FRIENDS_WITH]->(miles),
(joe)-[:IS_FRIENDS_WITH]->(dee)

// create employment relationship
// TODO: Who has friends who work for different companies?
create
(jen)-[:WORKS_FOR]->(neo),
(john)-[:WORKS_FOR]->(neo),
(joe)-[:WORKS_FOR]->(neo),
(mike)-[:WORKS_FOR]->(nin),
(maria)-[:WORKS_FOR]->(nin),
(steve)-[:WORKS_FOR]->(apl),
(sara)-[:WORKS_FOR]->(apl),
(john)-[:WORKS_FOR]->(xyz),
(sal)-[:WORKS_FOR]->(xyz),
(ann)-[:WORKS_FOR]->(abc),
(dan)-[:WORKS_FOR]->(abc),
(mel)-[:WORKS_FOR]->(xng),
(dee)-[:WORKS_FOR]->(zal)

// create technology relationships
// TODO: Create a relationship "Apple" is getting into "Video Games"
create
(neo)-[:INDUSTRY]->(gh),
(neo)-[:WRITTEN_IN]->(jv),
(nin)-[:INDUSTRY]->(vg),
(apl)-[:INDUSTRY]->(os)

// create preferences
// TODO: Update everyone should like the technology their company's industry is in
create
(jen)-[:LIKES]->(gh),
(sara)-[:LIKES]->(os),
(jen)-[:LIKES]->(vg),
(john)-[:LIKES]->(ap),
(ann)-[:LIKES]->(ap),
(sal)-[:LIKES]->(ig),
(dan)-[:LIKES]->(ig),
(dan)-[:LIKES]->(de),
(mel)-[:LIKES]->(de),
(mel)-[:LIKES]->(ql),
(dee)-[:LIKES]->(ql),
(joe)-[:LIKES]->(ql),
(mel)-[:LIKES]->(gh),
(dee)-[:LIKES]->(gh),
(miles)-[:LIKES]->(gh),
(jen)-[:LIKES]->(jv),
(john)-[:LIKES]->(jv);
