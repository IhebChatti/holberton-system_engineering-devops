#!/usr/bin/python3
"""[python script to use reddit api to get subreddit nbr of subs]
"""
import requests


def number_of_subscribers(subreddit):
    """[subreddit number of subs]

    Args:
        subreddit ([str]): [name of subreddit]

    Returns:
        [int]: [nbr of subs on success, 0 on failure]
    """
    headers = {"User-Agent": "Lothric_21"}
    response = requests.get('https://www.reddit.com/r/{}/about.json'.
                            format(subreddit),
                            headers=headers)
    if response.status_code == 404:
        return 0
    count = response.json().get("data").get("subscribers")
    return count
