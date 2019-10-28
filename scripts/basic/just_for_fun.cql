// who is friends with two innovators
match (i1:Person{innovator: true}) -[:IS_FRIENDS_WITH]- (f) -[:IS_FRIEND_WITH] - (i2:Person{innovator: true})
return i1.name, f.name, i2.name;
