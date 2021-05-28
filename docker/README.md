# Image
Elasticsearch version: `7.12.1`

A custom docker image that installs the ingest-attachment plugin is needed. To build it `docker build -t elastic_pdf elasticsearch/`

# Container
To run elasticserach persistently

```bash
docker run -d --name elastic -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -v elastic_data:/usr/share/elasticsearch/data elastic_pdf
```

To run an ephemeral elasticsearch: 

```bash
docker run -d --rm --name elastic -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elastic_pdf
```
