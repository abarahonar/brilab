#!/usr/bin/env bash
# TODO tokenizar query de forma que cada termino es buscado independientemente

if [[ $# -eq 0 ]]; then
    echo "Usage: ${0} url"
    exit 1
fi

if [[ $# -ne 1 ]]; then
    echo "Incorrect usage: ${0} url"
    exit 1
fi

# Esto es un ejemplo
curl -X POST "${1}/files/_search" -H "Content-Type: application/json" -d '
{
    "query": {
        "query_string": {
            "default_field": "attachment.content",
            "query": "productivos"
        }
    }
}
'
