// find people who have a twitter and like graphs or query languages
match (user:Person)
where user.twitter IS NOT null
with user
match (user)-[:LIKES]-(t:Technology)
where t.type in ['Graphs','Query Languages']
return distinct user.name;
