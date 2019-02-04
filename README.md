# Global warming

In recent decade, climate change became a topic of many political and social conversations. The principle of global warming and the heating up of the layers of atmosphere have been discussed a lot and public reactions  about its effects is increasing specially in social media. This project will discuss the social aspects of global warming by observing the users tweets in twitter including `#globalwarming`. Gathering information about the number of tweets in different states, the state political party and the popularity of tweets will provide us with informations we can use to analyze the social reaction to global warming.

The datas needed for this project where gathered from the available API from Twitter using Python and json. This data contains
the coordinates of all the state capitals within the range of 100mi in a circular area following with user id, date, text, favorite tweets number, state and the political party of the state, you can see as follows: 

user | date | text | id	| favorite_count | state	| party
--- | --- | --- | --- | --- | --- | ---
SajeEagle |	Sat Feb 02 15:13:58 +0000 2019	| New Rule: #Climate Emergency Real Time with ...	| 1091716362039422976	| 0 |	Alabama |	R
CatieGus |	Fri Feb 01 03:05:41 +0000 2019	| RT @GoGoGoDoc: Who said we have a problem with...	| 1091170694661054466	| 0	| Alabama	| R
GoGoGoDoc	| Fri Feb 01 03:04:45 +0000 2019	| Who said we have a problem with global warming...	| 1091170461986185216	| 3	| Alabama |	R
abigailjanette	| Fri Feb 01 00:07:02 +0000 2019 |	For those of you that don't read books: as the...	| 1091125736109498373	| 0	| Alabama	| R
AbitaJiny	| Thu Jan 31 23:44:59 +0000 2019	| RT @Actor_Siddharth: This idiot can't spell wa...	| 1091120188861366273	| 0	| Alabama	| R

The provided plots will show the followings: 

  - The correlation between the number of tweets in each state and the political party of the state
  
  - The frequency of tweets in different days of the week. The focus was on this particular days because of the unexpected weather condition
  

<img src="files/preview.jpg" alt = "plot" align="center" style="width:100%; margin:20px">


<img src="files/preview2.jpg" alt = "plot2" align="center" style="width:100%; margin:20px">





