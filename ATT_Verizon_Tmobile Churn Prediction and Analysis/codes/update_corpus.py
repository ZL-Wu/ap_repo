import pandas as pd
df = pd.DataFrame(columns=['screen_name', 'name', 'date_time', 'location', 'text'])

def getTweets(searchString, df):
    for tweet in tweepy.Cursor(api.search, q=searchString, lang='en', count=100).items():
        df = df.append(pd.Series([tweet.user.screen_name, tweet.user.name, tweet.created_at, tweet.user.location, tweet.text], index=df.columns), ignore_index=True)
    return df    

df = getTweets('VerizonSupport', df)
df = getTweets('verizon', df)
df = getTweets('VZWSupport', df)
df = getTweets('ATT', df)
df = getTweets('ATTHelp', df)
df = getTweets('TMobile', df)
df = getTweets('TMobileHelp', df)
df[['name', 'text']]

# pip install tweepy
import tweepy
import pandas as pd
import pickle
 
# Authentication
consumer_api_key = '8AlKwqtWbAIErzUrTOTxiGbnS'
consumer_api_secret_key = 'GODC2dcpV73Q2gc16b2WIOmvOy8aOypvNhqvdNywP0N1cVjHBo'
access_token = '2510554254-r1gHLRt8dv7BqqQq5K1V9PfNrUe3XmFlNAWwitF'
access_token_secret = 'GIfJCfTky0g7MPS4JYSRVBdCcO3HI6FjR0tPz3CgxQyQf'
 
auth = tweepy.OAuthHandler(consumer_api_key, consumer_api_secret_key)
auth.set_access_token(access_token, access_token_secret)
api = tweepy.API(auth)
api = tweepy.API(auth, wait_on_rate_limit=True, wait_on_rate_limit_notify=True)

df = pd.DataFrame(columns=['screen_name', 'date_time', 'location', 'text'])


def getTweets(searchString, df):
    for tweet in tweepy.Cursor(api.search, q=searchString, lang='en', count=100).items():
        df = df.append(pd.Series([tweet.user.screen_name, tweet.created_at, tweet.user.location, tweet.text], index=df.columns), ignore_index=True)
    return df    

df = getTweets('verizon', df)
df.to_pickle("./mobileCarriers.pkl")
df.shape