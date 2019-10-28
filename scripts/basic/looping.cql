// for a list of techRequirements, look for people who have each skill
with ['Graphs','Query Languages'] AS techRequirements
unwind techRequirements AS technology
match (p:Person)-[r:LIKES]-(t:Technology {type: technology})
return t.type, collect(p.name) AS potentialCandidates;

// for numbers in a list, find candidates who have that many years of experience
with [4, 5, 6, 7] AS experienceRange
unwind experienceRange AS number
match (p:Person)
where p.yearsExp = number
return p.name, p.yearsExp;
