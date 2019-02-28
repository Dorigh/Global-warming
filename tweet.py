import datetime as dt
import pandas as pd
import json
from twython import Twython

states = pd.read_csv('files/States.csv')
states.head()

credentials = {}  
credentials['APP_KEY'] = 'KEY' 
credentials['APP_SECRET'] =  'KEY' 
credentials['ACCESS_TOKEN'] = 'TOKEN' 
credentials['ACCESS_SECRET'] = 'TOKEN'

with open("twitter_credentials.json", "w") as file:  
    json.dump(credentials, file)
    

with open("twitter_credentials.json", "r") as file:  
    creds = json.load(file)


python_tweets = Twython(creds['APP_KEY'], creds['APP_SECRET'])

geo = states['Geo']
sta = states['State']
par = states['Political Party']

dict_ = {'user': [], 'date': [], 'text': [], 'id':[], 'favorite_count': [], 'retweet_num': [], 'state': [], 'party': []} 
for i in range(0,len(geo)):
    query = {'q': '#globalwarming', 
             'count': '100',
             'lang': 'en',
             'until': dt.datetime.today().strftime('%Y-%m-%d'),
             'geocode': geo[i]}
    
    for status in python_tweets.search(**query)['statuses']:  
        dict_['user'].append(status['user']['screen_name'])
        dict_['date'].append(status['created_at'])
        dict_['text'].append(status['text'])
        dict_['id'].append(status['id'])
        dict_['favorite_count'].append(status['favorite_count'])
        dict_['retweet_num'].append(status['retweet_count'])
        dict_['state'].append(sta[i])
        dict_['party'].append(par[i])
                
df = pd.DataFrame(dict_)
df.to_csv('twitter_query.csv')

