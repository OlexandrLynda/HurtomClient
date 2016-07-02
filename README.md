# HurtomClient
Client for toloka.to written on C++Qt\QML

# Request examples
- Search request:
https://toloka.to/api.php?search=Rain+Man (returns JSON)

- Rss request:
https://toloka.to/rss.php?t=1&lite=1&cat=8&toronly=1&thumbs=1 (returns HTMLX)

# Data structure
### Rss item:
- title
- link
- pubData
- guid
- description
- dc::creator
- dc::subject
- category
- annotate:reference
- comments
