# Koncensus

Koncensus is a Hackathon project that won the first place in MLH Local Hack Day 2018. This project has a Python backend that generates normalized movie ratings through sentiment analysis on data scraped from Twitter; it also has an iOS app as a frontend where users can search for a movie from IMDb and view its overall rating score and each comment on Twitter.

## Getting Started

### Server setup instructions
```
$ python -m venv localHackDay
$ cd localHackDay
$ source ./bin/activate
$ git clone https://github.com/taspinar/twitterscraper
$ cp twitterscraper/twitterscraper/* twitterscraper
$ pip3 install -r requirements.txt
$ python3 server.py
```

## Built With

* [twitterscraper](http://twitterscraper.nl/) - Used to scrape tweets
* [Microsoft Azure Text Analytics](https://docs.microsoft.com/en-ca/azure/cognitive-services/text-analytics/how-tos/text-analytics-how-to-sentiment-analysis) - Used to generate sentiment score for tweets
* [OMDb](http://www.omdbapi.com) - Used to search for movies and get relevant info

## Authors

* **Patrick Hadlaw** - [patrickhadlaw](https://github.com/patrickhadlaw)
* **Ziad Hamdieh** - [ZiadHamdieh](https://github.com/ZiadHamdieh)
* **Jarvis Zhaowei Wu** - [jarvis-wu](https://github.com/jarvis-wu)

## Acknowledgments

* [MLH Local Hack Day](https://localhackday.mlh.io)
