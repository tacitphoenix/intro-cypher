create ()

create (n) 

create (u:User) 

create (ui:User:Inactive) 

create (jd:User {name: "John", surname: "Doe"}) 

create 
(jr:User {name: "Jane", surname: "Roe"}),
(cg:User {name: "Carlos", surname: "Garcia"}), 
(mw:User {nane: "Mei", surname: "Weng"})

create (js:User {name: "Jack", surname: "Smith", age: 34}) -[:Sibling]-> (ms:User {name: "Mary", surname: "Smith"})

create 
(jkr:User {name: "Jack", surname: "Roe"}) -[:Sibling]-> 
(mr:User {name: "Mary", surname: "Roe"}) -[:Friend]->  
(jj:User {name: "Jane", surname: "Jones"}) -[:Coworker {company: "Acme Inc."}]-> (jkr);