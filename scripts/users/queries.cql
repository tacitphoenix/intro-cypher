MATCH (a:User {name: "Jack", surname: "Roe"}), 
      (b:User {name: "Jack", surname: "Smith"})
CREATE (a) -[r:Knows]-> (b)
RETURN a,r,b;

MATCH (a:User {name: "Jack", surname: "Roe"}), 
      (b:User {name: "Jack", surname: "Smith"})
OPTIONAL MATCH (a) -[r:Knows]- (b)
WITH a,r,b
WHERE r IS NULL
CREATE (a) -[rn:Knows]-> (b)
RETURN a,rn,b;

MATCH (a:User {name: "Jack", surname: "Roe"}), 
      (b:User {name: "Jack", surname: "Smith"})
CREATE UNIQUE (a) -[rn:Knows]-> (b)
RETURN a,rn,b;
      
MATCH (a:User {name: "Jack", surname: "Roe"})
CREATE UNIQUE (a) -[rn:Knows]-> (b:User {name: "Jack", surname: "Smith"})
RETURN a,rn,b;

MATCH (a:User {name: "Jack", surname: "Roe"})
CREATE UNIQUE (a) -[kn:Knows]-> (b:User {name: "Jack", surname: "Smith"}),
              (a) -[cw:Collegue]-> (b);

MATCH (a:User {name: "Jack", surname: "Roe"})
CREATE UNIQUE (a) -[rn:Knows {friend: true}]-> 
     (b:User {name: "Jack",surname: "Smith", age:34});
			  
MATCH (a:User {name: "Jack", surname: "Roe"})
  SET a.age = 34
RETURN a;

MATCH (a:User {surname: "Roe"})
  SET a.place = "London"
RETURN a;

MATCH (a:User {surname: "Roe"})
SET a.place="London", a.country="UK"
RETURN a;

MATCH (:User{surname: "Roe"})-[r:Knows]-() 
SET r.friend = true;

MATCH (a:User {name: "Jack", surname: "Roe"})
CREATE (b:Alias)-[:AliasOf]->(a)
  WITH a,b
   SET b = a
RETURN a,b;

MERGE (b:User {name: "Jack", surname: "Smith"})
SET b:Inactive;

MERGE (b:User {name: "Jack", surname: "Smith"})
SET b:Inactive:NewUser:MustConfirmEmail;

MATCH (a:User {name: "Jack", surname: "Roe"})
MERGE (b:User {name: "Jack", surname: "Smith"})
WITH a,b
MERGE (a) -[rn:Knows]-> (b)
RETURN a,rn,b;

MERGE (b:User {name: "Jack", surname: "Smith"})
ON CREATE SET b.place = "London";
	
MERGE (b:User {name: "Jack", surname: "Smith"})
ON CREATE SET b.place = "London"
ON MATCH SET b.age = 34;

MERGE (b:User {name: "Jack", surname: "Smith"})
SET b.age = 34;

MERGE (b:User {name: "Jack", surname: "Smith"})
REMOVE b:Inactive:MustConfirmEmail;

MERGE (b:User {name: "Jack", surname: "Smith"})
REMOVE b.age;

MERGE (b:User {name: "Jack", surname: "Smith"})
SET b.age = NULL;

MATCH (c:User {name: "Mei", surname: "Weng"}) 
DELETE c;

MATCH (c:User {name: "Mei", surname: "Weng"}) -[r]- ()
DELETE r;

MATCH (c:User {name: "Jack", surname: "Smith"})
OPTIONAL MATCH (c)-[r]- ()
DELETE r,c;

MATCH (a) OPTIONAL MATCH (a)-[r]-() DELETE a,r;

START a = node(*)
OPTIONAL MATCH (a)-[r]-() 
DELETE a, r;

MATCH (a:User {surname: "Roe"})
SET a.place = "London"
RETURN a;

MATCH p=shortestPath( 
   (a:User {name: "Mary", surname: "Smith"})-[*]-
       (b:User {name: "Jane", surname: "Jones"}) ) 
FOREACH (n IN tail(nodes(p)) | 
   CREATE UNIQUE (n)-[:MaybeKnows]->(a));