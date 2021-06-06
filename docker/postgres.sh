docker run --name test_sql -p 5432:5432  -d --rm \
    -v ${PWD}/sqls:/docker-entrypoint-initdb.d \
    -e POSTGRES_PASSWORD=pass \
    -e POSTGRES_USER=user \
    -e POSTGRES_DB=db \
    postgres:alpine
