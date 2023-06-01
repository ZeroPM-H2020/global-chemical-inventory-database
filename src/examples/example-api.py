import requests

url = "https://database.zeropm.eu/zeropm-0~2E0~2E2/substances.json?_labels=on"
response = requests.get(url)
print(response.content)
