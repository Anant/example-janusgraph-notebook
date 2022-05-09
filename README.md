# JanusGraph Notebook
A tutorial for running [JanusGraph](https://janusgraph.org/) on Cassandra and Elasticsearch, and then integrating within [AWS Graph Notebook](https://github.com/aws/graph-notebook). 

For more information, see the [blog post](https://blog.anant.us/janusgraph-on-jupyter-using-notebooks-with-graph/).

## Setup
Start everything using docker-compose
```
docker-compose up -d
```

You can now find it open in http://localhost:8888

Login using password: `tensorflow`

### Setup a connection in a notebook
Out of the box, the Graph Notebook lib provides dozens of notebooks to try out. Unfortunately those with seed data for loading into your graph mostly don't work since they use custom string ids, and [JanusGraph doesn't support that](https://github.com/JanusGraph/janusgraph/issues/1221). 

However, you can load in the air routes data manually using the commands below, which will allow you to use the `Air-Routes-Gremlin` notebook

#### Load seed data
```
./scripts/load-in-airroutes.sh
docker cp ./tmp jg-notebook-janusgraph:/opt/tmp/

docker exec -it jg-notebook-janusgraph ./bin/gremlin.sh
:remote connect tinkerpop.server conf/remote.yaml
g = traversal().withRemote('conf/remote-graph.properties')
path = "/opt/tmp/air-routes.xml";
g.io(path).read().iterate();
```


Run this at the top of any notebook that you try. Do it here as well.

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

#### Run the notebook!
You can find it here: http://localhost:8888/notebooks/notebooks/sample-config.ipynb

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
