// simple query
match (p:Person) return p.name;

// simple count
match (p:Person) return count(p.name);

// how many people in each company
match (p:Person)--(c:Company) 
with c, count(p.name) as employee_count
order by employee_count desc
return c.name, employee_count;
