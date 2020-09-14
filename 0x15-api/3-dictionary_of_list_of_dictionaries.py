#!/usr/bin/python3
"""[Python script to export Records all tasks
    from all employees in the JSON format.]
"""
import json
import requests


if __name__ == "__main__":
    users = requests.get("https://jsonplaceholder.typicode.com/users").json()
    users_dict = {}
    big_dict = {}
    for user in users:
        _id = user.get('id')
        username = user.get('username')
        big_dict[_id] = []
        users_dict[_id] = username

    tasks = requests.get("https://jsonplaceholder.typicode.com/todos").json()
    for task in tasks:
        userId = task.get("userId")
        all_tasks = {}
        all_tasks['task'] = task.get("title")
        all_tasks['completed'] = task.get("completed")
        all_tasks['username'] = username
        all_mighty_dict = {}
        big_dict.get(userId).append(all_tasks)

    with open("todo_all_employees.json", "w") as f:
        json.dump(big_dict, f)
