## Endpoints:

**NOTE:** All endpoints can take a timezone parameter to provide as accurate data as possible for things like matches, scores, etc. Examples would be `/today?timezone=PST`, `/odds?timezone=Brasilia`, `matches/today?timezone=EST`. If no timezone param is passed, the query will run against UTC.

###### Root: [http://worldcup2014bot.herokuapp.com/](http://worldcup2014bot.herokuapp.com/)

###### Gifs - today's matches:

```
/gifs
```

[http://worldcup2014bot.herokuapp.com/gifs](http://worldcup2014bot.herokuapp.com/gifs)

###### Gifs - yesterday's matches:

```
/gifs/recap
```

[http://worldcup2014bot.herokuapp.com/gifs/recap](http://worldcup2014bot.herokuapp.com/gifs/recap)

###### Groups Standings:

```
/groups/:group
```

[http://worldcup2014bot.herokuapp.com/groups/A](http://worldcup2014bot.herokuapp.com/groups/A)

###### FIFA link for team:

```
/links/:team_country_acronym
```

[http://worldcup2014bot.herokuapp.com/links/USA](http://worldcup2014bot.herokuapp.com/links/USA)

###### Moneyline Odds:

```
/odds
```

[http://worldcup2014bot.herokuapp.com/odds](http://worldcup2014bot.herokuapp.com/odds)

###### Current Score:

```
/scores/now
```

[http://worldcup2014bot.herokuapp.com/scores/now](http://worldcup2014bot.herokuapp.com/scores/now)

###### Today's Scores:

```
/scores
```

[http://worldcup2014bot.herokuapp.com/scores](http://worldcup2014bot.herokuapp.com/scores)


###### Team's Past/Current Scores:

```
/scores/:team_country_acronym
```

[http://worldcup2014bot.herokuapp.com/scores/bra](http://worldcup2014bot.herokuapp.com/scores/bra)

###### Yesterday's Scores:

```
/scores/recap
```

[http://worldcup2014bot.herokuapp.com/scores/recap](http://worldcup2014bot.herokuapp.com/scores/recap)

###### Today's Matches:

```
/matches
```

[http://worldcup2014bot.herokuapp.com/matches](http://worldcup2014bot.herokuapp.com/matches)

###### Tomorrow's Matches:

```
/matches/tomorrow
```

[http://worldcup2014bot.herokuapp.com/matches/tomorrow](http://worldcup2014bot.herokuapp.com/matches/tomorrow)

###### Past Matches:

```
/matches/played
```

[http://worldcup2014bot.herokuapp.com/matches/played](http://worldcup2014bot.herokuapp.com/matches/played)

###### Team names:

```
/teams
```

[http://worldcup2014bot.herokuapp.com/teams](http://worldcup2014bot.herokuapp.com/teams)
