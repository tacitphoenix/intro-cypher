// find neo4j import directory
call dbms.listConfig()
yield name, value, description
where name  = "dbms.directories.import"
return value;