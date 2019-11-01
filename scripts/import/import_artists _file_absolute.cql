// check neo4J configurations to see if we can import from file
// dbms.security.allow_csv_import_from_file_urls should be true
// dbms.directories.import should not be ""
// if need correct configurations and restart server
call dbms.listConfig()
yield name, value, description
where name = "dbms.security.allow_csv_import_from_file_urls"
or name  = "dbms.directories.import"
return name, value, description;

// load csv with no headers
load csv from "file://<repo root>/data/artists.csv" as line
create (:Artist {name: line[1], year: toInteger(line[2])});