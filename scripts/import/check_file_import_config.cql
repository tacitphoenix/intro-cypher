// check neo4J configurations to see if we can import from file
// dbms.security.allow_csv_import_from_file_urls should be true
// dbms.directories.import should not be "" for absolute paths outside neo4j or relative value to neo4j install
// if need correct configurations and restart server
call dbms.listConfig()
yield name, value, description
where name = "dbms.security.allow_csv_import_from_file_urls"
or name  = "dbms.directories.import"
return name, value, description;