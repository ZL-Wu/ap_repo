import os
import sys
import tweepy
import simplejson as json
from tweepy.models import Status
import time
from sys import stdout

tempData = []
flname="tweets_json"

def readFilelines(fileName):
	f=open(fileName,"r")
	lines=f.readlines()
	f.close()
	return lines

def my_on_data(data):
	#global filename, tweetcount
	global tempData
	global totalTweets
	global flname
	tempData.append(data.strip()+"\n")
	if len(tempData) == 10:
		f = open(flname, 'a')
		content = ''.join(tempData)
		f.write(content)
		f.close()
		tempData = []    

def my_on_error(status_code):
    print 'Error: ', str(status_code)


def main():
    try:
	#amiri
	os.remove(flname) if os.path.exists(flname) else None
	missingTweets=0

	count=0;

	tids=[]		
	tids=readFilelines("tids")
	print "".join(tids)
	auth = tweepy.OAuthHandler('GsJU0mL3SybHiZ3r9pQpaI53L', 's7TgkRgfnsZoxBrYxxASH5Ocod0Vp9LpV9RtjwWrxr488bIGaG')# get consumerkey, consumersecret at https://apps.twitter.com/
	auth.set_access_token('312588785-OPMUvbGpaeD3eXgmNnVUKDUmodt21jIxUCNUjYoM', '59pbZ87o1LffsbFr2CHyq9h0jN3WlX07lwsOnM98f2bk4')# get accesstoken, accesstokensecret at https://apps.twitter.com/
	api = tweepy.API(auth)
	for tid in tids:
		try:
			count+=1
			if count==16:
				print "sleeping for 15 min!\n"
				time.sleep(15*60)
				count=1;
			#print tid
			tweet = api.get_status(id=tid)
			if tweet:
				#print tweet._json
				my_on_data(json.dumps(tweet._json))
		except:
			print "tweet not found: ",tid,sys.exc_info()[1]
			missingTweets+=1
			continue
	print "\nNumber of missing tweets:",missingTweets
    except:
	print "Unexpected error:", sys.exc_info()[0],sys.exc_info()[1]

if __name__ == '__main__':
	tempData = []
	totalTweets=0
	main()
