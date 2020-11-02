# -*- coding: utf-8 -*-
import tweepy

consumer_api_key = 'SVPEZLIMfgWbPFziJwiNOgUyo'
consumer_api_secret_key = 'YMBI6iy8YDZExPmHmHJ7InoFAbNtqsFCTWbcsdXYm0WujZo3IK'
access_token = '774712728367816704-4oChLhtlraPplr6hIrlyPCoX5cNfKB3'
access_token_secret = 'FrOvKeaTHusQruhn29sKPTH4EsBpiR9rvjpcyujABo7Ac'

auth = tweepy.OAuthHandler(consumer_api_key, consumer_api_secret_key)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)
#api = tweepy.API(auth, wait_on_rate_limit=True, wait_on_rate_limit_notify=True)

print(type(api))
for tweet in api.home_timeline():
    print(f'{tweet.user.name} said {tweet.text}')
    
for tweet in api.user_timeline():
    print(tweet.created_at, tweet.text)
    

 # Save Twitter search results in a Pandas dataframe

import pandas as pd
df = pd.DataFrame(columns=['screen_name', 'name', 'date_time', 'location', 'text'])

for tweet in api.search(q='Starbucks', lang='en', rpp=100):
    df = df.append(pd.Series([tweet.user.screen_name, tweet.user.name, tweet.created_at, tweet.user.location, tweet.text], index=df.columns), ignore_index=True)

df.shape
df.columns
df[['name', 'text']]