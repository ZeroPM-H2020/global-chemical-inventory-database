import requests

url = "http://127.0.0.1:8001/zeropm/c4_consensus_index_modified.json?_labels=on"
response = requests.get(url)
print(response.content)
