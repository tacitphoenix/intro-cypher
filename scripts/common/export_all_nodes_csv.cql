
call apoc.export.csv.query("match (n) return n", "./all_nodes.csv", null)

