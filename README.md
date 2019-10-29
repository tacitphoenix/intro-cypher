## Intro to Cypher

[Cypher][Cypher] is [Neo4j][Neo4j]'s graph query language and understanding it well allows you to unleash the true power of Neo4j.

I have packaged the cypher-shell for the MacOS and Linux in this repo with some simple convenience scripts to allow commandline exploration of Cypher.

![](https://vignette.wikia.nocookie.net/matrix/images/d/dc/Cypher_Talks_with_Neo.png/revision/latest/scale-to-width-down/240?cb=20130215031028)

>...there's way too much information to decode the Matrix. You get used to it, though. Your brain does the translating. I don't even see the code. All I see is blonde, brunette, redhead. Hey uh, you want a drink?	 

-Cypher (The Matrix)

### Configure

1. Download Cypher Shell
	1. **(Recommended)** Run the get_cypher.sh script to download and unzip cypher-shell
	2. **(Manual)** Download [cypher-shell][Cypher Shell] and unzip into this directory.
2. Rename env file to .env and edit the variable to match your environment

**Commands**

```shell
./get_cypher.sh
mv  env .env
```

### Usage

**./cysh** : start cypher-shell   
**./cql scripts/common/clear_graph.cql** : run cypher script to clear graph

### Tutorials

#### Basic

The basic tutorial uses a combination of Neo4j online cypher tutorials.

**./cql scripts/basic/load_graph.cql** : load basic tutorial graph



[Cypher]: https://neo4j.com/developer/cypher-query-language/
[Neo4j]: https://neo4j.com/docs/
[Cypher Shell]: https://github.com/neo4j/cypher-shell/releases/download/1.1.12/cypher-shell.zip
