#!/usr/bin/python3
"""[Python script to export data in the JSON format.]
"""
import json
import requests
from sys import argv


if __name__ == "__main__":
    todos = requests.get("https://jsonplaceholder.typicode.com/todos/",
                         params={"userId": argv[1]})
    users = requests.get("https://jsonplaceholder.typicode.com/users/",
                         params={"id": argv[1]})
    tasks = todos.json()
    user = users.json()
    for item in user:
        name = item.get("name")
        username = item.get('username')

    completed_tasks = 0
    for task in tasks:
        if task.get("completed"):
            completed_tasks += 1

    with open('{}.json'.format(argv[1]), 'w') as f:
        for task in tasks:
            all_tasks = []
            task_dict = {}
            task_dict['task'] = task.get('title')
            task_dict['completed'] = task.get('completed')
            task_dict['username'] = username
            all_tasks.append(task_dict)
            data = json.dumps(all_tasks)
            f.write(data)
