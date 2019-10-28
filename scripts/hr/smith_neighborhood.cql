match (:Employee{surname: 'Smith'}) -[*2]- (neighborhood)
return distinct neighborhood;
