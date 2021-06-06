CREATE TABLE IF NOT EXISTS conflictos (
    id SERIAL PRIMARY KEY,
    filename VARCHAR(31) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    region VARCHAR(255) NOT NULL,
    sector VARCHAR(255) NOT NULL,
    year INTEGER
);

CREATE TABLE IF NOT EXISTS regiones (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS sectores (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) UNIQUE NOT NULL
)