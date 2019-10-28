match (e:Employee) --> (:CostCenter{code: "cc1"})
return e;

match (e:Employee) -- (:CostCenter{code: "cc1"})
return e;

match (e:Employee) -[r]- (:CostCenter{code: "cc1"})
return e.name, e.surname, type(r), r;
