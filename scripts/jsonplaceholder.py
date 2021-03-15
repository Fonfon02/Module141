#!/bin/python3

# This script will:
# Generate random data depending of what you choose as resource.

# Resources
#/posts	100 posts
#/comments	500 comments
#/albums	100 albums
#/photos	5000 photos
#/todos	200 todos
#/users	10 users

#https://jsonplaceholder.typicode.com/guide/

import requests

resource = "users" # Do not leave empty
id = "4" # If empty, prints all the resource

url = "https://jsonplaceholder.typicode.com/{}/{}".format(resource, id)
payload={}
headers = {}

r = requests.request("GET", url, headers=headers, data=payload)

print(r.text)