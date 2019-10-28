match (e:Employee)
match (c:CostCenter) <–[:MANAGER_OF]- (e) <-[:REPORTS_TO]- (m:Employee)
return  e.surname, m.surname;

match (e:Employee)
optional match (c:CostCenter) <–[:MANAGER_OF]- (e) <-[:REPORTS_TO]- (m:Employee)
return  e.surname, m.surname;
