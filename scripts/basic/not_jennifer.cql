match (j:Person)
where not j.name = "Jennifer"
return j;
