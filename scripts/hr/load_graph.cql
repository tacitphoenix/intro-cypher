// Cost Center
create (cc1:CostCenter{code: "cc1"})
create (cc2:CostCenter{code: "cc2"})

// Employee
create (davies:Employee{name: "Nathan", surname: "Davies"})
create (taylor:Employee{name: "Rose", surname: "Taylor"})
create (underwood:Employee{name: "Heather", middle_name: "Mary", surname: "Underwood"})
create (smith:Employee{name: "John", surname: "Smith"})
create (vacantPost:Employee{})

// Relationship
create 
(davies)-[:BELONGS_TO{from: date("2011-1-10")}]->(cc1),
(davies)-[:REPORTS_TO]->(taylor),
(taylor)-[:MANAGER_OF{from: date("2010-2-8")}]->(cc1),
(smith)-[:BELONGS_TO{from: date("2008-9-20")}]->(cc2),
(smith)-[:REPORTS_TO]->(underwood),
(underwood)-[:BELONGS_TO]->(cc2),
(underwood)-[:REPORTS_TO]->(vacantPost),
(vacantPost)-[:BELONGS_TO]->(cc2);