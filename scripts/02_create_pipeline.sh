#!/usr/bin/env bash

if [[ $# -eq 0 ]]; then
  echo "Usage: ${0} url"
  exit 1
fi

if [[ $# -ne 1 ]]; then
  echo "Incorrect usage: ${0} url"
  exit 1
fi

curl -X PUT "${1}/_ingest/pipeline/attachment" -H "Content-Type: application/json" -d'
{
    "description": "Procesar archivo en forma Base64 para poder ser analizado",
    "processors": [
        {
            "attachment": {
                "field": "data",
                "properties": [ "content", "title" ]
            },
            "remove": {
                "field": "data"
            }
        }
    ]
}
'