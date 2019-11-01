// check neo4J configurations to see if we can import from file
// dbms.security.allow_csv_import_from_file_urls should be true
// dbms.directories.import should not be ""
// if need correct configurations and restart server
call dbms.listConfig()
yield name, value, description
where name = "dbms.security.allow_csv_import_from_file_urls"
or name starts with "dbms.directories"
return name, value, description;
