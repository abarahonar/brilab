# Esto es un ejemplo
curl -X POST "${url}/${index_name}/_search" -H "Content-Type: application/json" -d '
{
    "query": {
        "query_string": {
            "default_field": "attachment.content",
            "query": "productivos"
        }
    }
}
'
# TODO tokenizar query de forma que cada termino es buscado independientemente