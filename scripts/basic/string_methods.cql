// starts with
match (p:Person)
where p.name starts with 'S'
return p.name;

// ends with
match (p:Person)
where p.name ends with 'r'
return p.name;

// contains 
match (p:Person)
where p.name contains 'r'
return p.name;

// regex
match (p:Person)
where p.name =~ '.*ha.*'
return p.name;

// in
match (a)-[r:IS_FRIENDS_WITH]-(b)
where r.since in [2011,2013,2015]
return a.name, b.name, r.since;

