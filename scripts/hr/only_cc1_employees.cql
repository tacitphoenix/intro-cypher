match (e:Employee) --> (:CostCenter{code: "cc1"})
return e;

match (e:Employee) -- (:CostCenter{code: "cc1"})
return e;
