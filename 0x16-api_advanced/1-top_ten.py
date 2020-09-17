#!/usr/bin/python3
"""[function that queries the Reddit API and prints the titles of
    the first 10 hot posts listed for a given subreddit]
"""
import requests


def top_ten(subreddit):
    """[get top ten posts from subreddit]

    Args:
        subreddit ([str]): [subreddit name]
    """
    url = 'https://www.reddit.com/r/{}/hot.json?limit=10'.format(subreddit)
    headers = {"User-Agent": "Lothric_21"}
    response = requests.get(url, headers=headers, allow_redirects=False)
    if response.status_code == 404:
        print('None')
        return
    hot_posts = response.json().get('data')
    for sub in hot_posts.get('children'):
        print(sub.get('data').get('title'))
