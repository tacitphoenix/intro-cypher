## Intro to Cypher

[Cypher][Cypher] is [Neo4j][Neo4j]'s graph query language and understanding it well allows you to unleash the true power of Neo4j.

I have packaged the cypher-shell for the MacOS and Linux in this repo with some simple convenience scripts to allow commandline exploration of Cypher.

>You know, I know this steak doesn't exist. I know that when I put it in my mouth, the Matrix is telling my brain that it is juicy and delicious. After nine years, you know what I realize? 

-Cypher (The Matrix)

### Configure

Edit the env variables in env file and rename it to .env

```shell
mv  env .env
```

### Usage

**cysh** : start cypher-shell   
**cql scripts/clear_graph.cql** : run cypher script to clear graph


[Cypher]: https://neo4j.com/developer/cypher-query-language/
[Neo4j]: https://neo4j.com/docs/
