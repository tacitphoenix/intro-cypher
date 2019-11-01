// load csv with no headers
load csv from "file:///artists.csv" as line
create (:Artist {name: line[1], year: toInteger(line[2])});