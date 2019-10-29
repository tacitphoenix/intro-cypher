// who is friends with two innovators
match (i1:Person{innovator: true}) -[:IS_FRIENDS_WITH]- (f) -[:IS_FRIEND_WITH] - (i2:Person{innovator: true})
return i1.name, f.name, i2.name;

// find all the people who have two friend relationship types and their friends
match (p:Person)-[r]-(f:Person)
with p, collect(type(r)) as friend_types, collect(f.name) as friends
where "FRIEND" in friend_types
and "IS_FRIENDS_WITH" in friend_types
return distinct p.name, friends;
