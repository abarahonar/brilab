#!/bin/env python3
import json
import sys
import re


if len(sys.argv) != 2:
    print(f'Usage: {sys.argv[0]} filename')
    sys.exit(1)

filename = sys.argv[1]
with open(filename) as f:
    data = json.load(f)

year_pattern = re.compile(r'Año de inicio: (\d\d\d\d)')
sector_pattern = re.compile(r'Sector Productivo:([\w ]*)')
region_pattern = re.compile(r'saturación/contaminación: {0,1}\w*\s\s([\w \']*)')

dump = data['data']
for conflict in dump:
    name = conflict['filename']
    match = year_pattern.search(conflict['content'])
    year = match.group(1)
    match = sector_pattern.search(conflict['content'])
    sector = match.group(1)
    match = region_pattern.search(conflict['content'])
    region = match.group(1)
    print(f'{name}: {year}, {sector}, {region}')
