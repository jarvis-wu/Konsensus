from flask import Flask, redirect, request
from twitterscraper import query_tweets
import requests
import urllib
import json
import re
import datetime

app = Flask(__name__)

TEXT_ANALYTICS_API_KEY = "b7c0fd16e8dc46f29bc4ed6d45757c6a"
TEXT_ANALYTICS_API_BASE = "https://westcentralus.api.cognitive.microsoft.com/text/analytics/v2.0/"

def get_api_headers():
    return {
        "Ocp-Apim-Subscription-Key": TEXT_ANALYTICS_API_KEY
    }

emoji_pattern = re.compile("["
        u"\U0001F600-\U0001F64F"  # emoticons
        u"\U0001F300-\U0001F5FF"  # symbols & pictographs
        u"\U0001F680-\U0001F6FF"  # transport & map symbols
        u"\U0001F1E0-\U0001F1FF"  # flags (iOS)
                           "]+", flags=re.UNICODE)

def trim_emojis(string):
    return emoji_pattern.sub(r'', string.encode("ascii", "ignore").decode("ascii"))

test = "I hate this, I am very angry"

@app.route("/api/sentiment", methods=["GET", "POST"])
def sentiment():
    body = {
        "documents": [
            { "id": "1", "language": "en", "text": test }
        ]
    }
    response = requests.post(TEXT_ANALYTICS_API_BASE + "/sentiment", headers=get_api_headers(), json=body)
    return json.dumps(response.json())

@app.route("/api/tweets")
def tweets():
    tweets = []
    for tweet in query_tweets("The Emoji Movie", 100):
        tweets.append(tweet.text)
    return json.dumps(tweets)

@app.route("/api/sentiment/tweets")
def sentiment_tweets():
    documents = []
    tweets = []
    counter = 1
    for tweet in query_tweets(request.args.get("query"), 100, begindate=datetime.date(2017,1,1)):
        documents.append({
            "id": str(counter),
            "language": "en",
            "text": trim_emojis(tweet.text)
        })
        tweets.append(tweet.text)
        counter += 1
    body = { "documents": documents }
    response = requests.post(TEXT_ANALYTICS_API_BASE + "/sentiment", headers=get_api_headers(), json=body)
    scoreSum = 0
    length = 0
    for document in response.json()["documents"]:
        if document["score"] != 0.5:
            scoreSum += document["score"]
            length += 1
    
    response = {
        "score": scoreSum / length,
        "tweets": tweets
    }
    
    return json.dumps(response)

if __name__ == "__main__":
    app.run(host="0.0.0.0")