import requests

url = (
    "https://database.zeropm.eu/zeropm-v0~2E0~2E2/country_sources_index.json?_labels=on"
)
response = requests.get(url)
print(response.json())
