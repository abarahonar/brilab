#!/usr/bin/env bash

if [[ $# -eq 0 ]]; then
  echo "Usage: ${0} url index_name"
  exit 1
fi

if [[ $# -ne 2 ]]; then
  echo "Incorrect usage: ${0} url index_name"
  exit 1
fi

curl -X PUT "${1}/${2}" -H "Content-Type: application/json" -d'
{
    "mappings": {
        "properties": {
            "attachment.content": {
                "type": "text",
                "analyzer": "spanish"
            }
        }
    }
}
'