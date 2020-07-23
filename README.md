# MovieZoo

IOS App written using Swift 5.0 with VIPER architecture. 

### Prerequisites

- iOS 10 and above.
- Xcode 10.3 and above.
- Swift 5.0.
- ZERO third party dependency. 

## Implemented UserStories

### US-1
As a customer, I want to be able to view a list of movies 
`ACCEPTANCE CRITERIA`

- The list should include the title of the movie, the release date and the rating.
- The movie list will be loaded from a local data store e.g. Json file.

### US-2
As a customer, I want to be able to select a movie and view more details
`ACCEPTANCE CRITERIA`

- The movie detail page should include the movie title, the year of release, the genre, the cast (if any) and the movie photos fetched from [Flickr API](https://www.flickr.com/services/api/flickr.photos.search.html)

### US-3
As a customer I want to be able to search for a movie
`ACCEPTANCE CRITERIA`

- On the movies list screen, there should be a search bar that can search movies by title.
- The search results should be categroized with **year** with at most **top 5** rated movies on each year. 

## Features

* Show local movies List.
* Search local movies by movie title.
* Show movie details.
* Show movie photos fetched from Flickr API using movie title as search term.
* Caching movie photos.

## More features to be added

* Recommended Movies based on search history.
* Add movies to favourites. 


