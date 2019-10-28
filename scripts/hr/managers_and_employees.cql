match (n)--(:CostCenter)<-[:MANAGER_OF]-(m)
return m.name as Manager, n.name as Employee;

