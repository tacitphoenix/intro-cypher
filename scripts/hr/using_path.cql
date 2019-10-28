// find the path from davies to taylor
match path = (a{surname:'Davies'}) -[*]- (b{surname:'Taylor'})
return path;

// find the shortest path from davies to taylor
match (a{surname:'Davies'}), (b{surname:'Taylor'})
return allShortestPaths((a)-[*]-(b)) as path;

// set start point for faster find
start a=node(2), b=node(3)
return allShortestPaths((a)-[*]-(b)) AS path;
