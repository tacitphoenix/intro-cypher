// load csv with no headers
load csv from "file://<repo root>/data/artists.csv" as line
create (:Artist {name: line[1], year: toInteger(line[2])});