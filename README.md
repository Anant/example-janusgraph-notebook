# Setup JanusGraph
A tutorial for running [JanusGraph](https://janusgraph.org/) on Cassandra and Elasticsearch, and then integrating within [AWS Graph Notebook](https://github.com/aws/graph-notebook).

## WARNING
This will create files and potentially overwrite files on your box. Run with caution.
I think only is a problem if you have an existing janus-graph-0.5.2 installation and it's at ~/lib/janusgraph-0.5.2 . See ./scripts/startup/setup-janus.sh for what we do.

If you don't have Cassandra/Elasticsearch running on your box already, you can use our docker compose file to start Elassandra.

```
docker-compose up -d
```


