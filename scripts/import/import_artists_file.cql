// load csv with no headers
load csv from "file:///artists.csv" as row1
create (:Artist {name: row1[1], year: toInteger(row1[2])});

// load csv with headers
load csv with headers from "file:///artists-with-headers.csv" as row2
create (:Artist {name: row2.Name, year: toInteger(row2.Year)});