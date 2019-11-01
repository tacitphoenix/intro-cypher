// create single property index on Person born property
create index on :Person(born);

// see all the indexes
call db.indexes();

// drop single property index on Person born property
drop index on :Person(born); 