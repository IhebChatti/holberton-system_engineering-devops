#!/usr/bin/python3
"""[python script to list containing the titles
    of all hot articles for a given subreddit]
"""
import requests


def recurse(subreddit, hot_list=[], after=""):
    """[get a list of the titles of all hot posts]

    Args:
        subreddit ([str]): [subreddit title]
        hot_list (list, optional): [list of hot posts]. Defaults to [].
        after (str, optional): [later in the listing"]. Defaults to "".

    Returns:
        [list]: [list of all hot posts]
    """
    url = 'https://www.reddit.com/r/{}/hot.json'.format(subreddit)
    headers = {"User-Agent": "Lothric_21"}
    if after:
        url = url + '?after={}'.format(after)
    response = requests.get(url, headers=headers, allow_redirects=False)
    if response.status_code == 404:
        return None
    hot_posts = response.json().get('data')
    after = hot_posts.get('after')
    for post in hot_posts.get('children'):
        hot_list.append(post.get('data').get('title'))
    if after:
        return recurse(subreddit, hot_list, after)
    return hot_list
