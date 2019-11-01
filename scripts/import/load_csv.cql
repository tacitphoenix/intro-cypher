// count lines in csv
load csv with headers from "file:///artists-with-headers.csv" as line
return count(line);

// limit lines
load csv with headers from "file:///artists-with-headers.csv" as line
return line limit 2;

// dry run conversion
load csv with headers from "file:///artists-with-headers.csv" as line
return line.Name, toInteger(line.Year);
