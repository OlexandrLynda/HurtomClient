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

### Search item
#### - for toloka.to:
- id
- link
- title
- author
- comments
- size
- seeders
- leechers
- complete

#### - for posters.hurtom.com:
- id
- link
- title
- folder
- filename
- author
- image_thumbnail
- image_medium
- image_original 
