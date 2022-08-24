import requests
import json
resp = requests.get('https://pokeapi.co/api/v2/pokemon/dragonair')
datos = json.loads(resp.content)
print(datos["name"])
print(datos["base_experience"])

tipos = datos["types"]

for t in tipos:
    print(t["type"]["name"])