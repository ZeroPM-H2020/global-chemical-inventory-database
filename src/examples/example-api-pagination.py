# 🚧 work in progress ...
import requests


def get_api_pagination(url):
    items = []
    while url:
        response = requests.get(url)
        # print(response.json())
        try:
            url = response.links.get("next").get("url")
            print(url)
        except AttributeError:
            url = None
        # print(response.json())
        items.extend(response.json())

    return items


url = "https://database.zeropm.eu/zeropm-0~2E0~2E2/zeropm_chemicals.json?_labels=on"
zeropm_chemicals = get_api_pagination(url)
# print(zeropm_chemicals)
