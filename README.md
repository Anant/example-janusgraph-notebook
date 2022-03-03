# JanusGraph Notebook
A tutorial for running [JanusGraph](https://janusgraph.org/) on Cassandra and Elasticsearch, and then integrating within [AWS Graph Notebook](https://github.com/aws/graph-notebook). 


## Setup
Start everything using docker-compose
```
docker-compose up -d
```

You can now find it open in http://localhost:8888

Login using password: `tensorflow`

### Setup a connection in a notebook
Out of the box, the Graph Notebook lib provides dozens of notebooks to try out. Feel free to try any that aren't Neptune specific and run Gremlin commands. Some also require some linux file permissions that don't work on Docker as well though, so watch out for that. 

However, make sure to run this at the top of any notebook that you try:

```
%%graph_notebook_config
{
  "host": "janusgraph",
  "port": 8182,
  "ssl": false,
  "gremlin": {
    "traversal_source": "g"
  }
}
```

Example of how this works is given here: http://localhost:8888/notebooks/notebooks/sample-config.ipynb

## Start a console

Want to just use your standard Gremlin console for whatever reason?

```
docker exec -it jg-notebook-janusgraph ./bin/gremlin.sh
:remote connect tinkerpop.server conf/remote.yaml
g = traversal().withRemote('conf/remote-graph.properties')

# g.V() or whatever you want to run
```

# Credits: 
Based heavily on:
- https://github.com/JanusGraph/janusgraph-docker/blob/master/docker-compose-cql-es.yml 
- https://github.com/skhatri/notebook
