# Project 1 - *Flixter*
Rachna Gupta

Flixter is a movies app that shows current movies and their details using the [The Movie Database API](http://docs.themoviedb.apiary.io/#). It is meant to be an exercise for me to demonstrate basic iOS design layouts and concepts. 

Time spent: **24** hours spent in total

## User Stories

The following **required** functionality is complete:

- [X] User sees an app icon on the home screen and a styled launch screen.
- [X] User can view a list of movies currently playing in theaters from The Movie Database.
- [X] Poster images are loaded using the UIImageView category in the AFNetworking library.
- [X] User sees a loading state while waiting for the movies API.
- [X] User can pull to refresh the movie list.
- [X] User sees an error message when there's a networking error.
- [X] User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

The following **optional** features are implemented:

- [X] User can tap a poster in the collection view to see a detail screen of that movie
- [X] User can search for a movie.
- [ ] All images fade in as they are loading.
- [ ] User can view the large movie poster by tapping on a cell.
- [ ] For the large poster, load the low resolution image first and then switch to the high resolution image when complete.
- [ ] Customize the selection effect of the cell.
- [ ] Customize the navigation bar.
- [X] Customize the UI.
- [ ] Run your app on a real device.

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. How do we share with other users?
2. How do we embed a video?

## Video Walkthrough

Here's a walkthrough of implemented user stories:

![](https://github.com/rachgupta/Flixter/blob/main/demo.gif)

## Notes

I had a lot of issues with seguing data and refreshing the screen, but troubleshooted them! I also had issues with TableViews, but figured it out. 

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library
