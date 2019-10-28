MATCH (:Employee {surname: 'Davies'}) -[r*2]- (neighborhood)
RETURN neighborhood, r;