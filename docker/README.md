Elasticsearch version: `7.12.1`


Custom docker image that installs the ingest-attachment plugin. To build it `docker build -t elastic_pdf .`


To run elasticserach: `docker run -d --name elastic -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -v elastic_data:/usr/share/elasticsearch/data elastic_pdf`. Another useful command: `docker run -d --rm --name elastic -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elastic_pdf`

Create an index with an analyzer (see index code)


Pipeline steps (see pipeline code)
1. Process the file, it has to be in Base64


To encode a file in base64, you can use the `base64` command in Linux or the `b64encode` function of the `base64` package in python. The file must be in the data field of the json.


2. Remove the file (it needs to be on a bucket) 


Problem: text has too much whitespace, maybe tokenize the input so that each term is treated independently
