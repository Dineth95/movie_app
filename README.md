# Top Rated Movie App

Flutter App developed with Flutter and API from [The Movie Database (TMDB) (themoviedb.org)][https://developers.themoviedb.org/3/movies/get-top-rated-movies]

```
Flutter version: 3.3.6
```
## Getting Started

1. Please open file **config.dart** and change `API KEY` in the variable `apiKey` with your own.(lib->core->config)
2. Then run the project with flutter run command

## Json Serialization
Run following commands
```
flutter pub get
```
After we can generate models using this
```
flutter2 pub run build_runner build --delete-conflicting-outputs
```

## Feature
- [X] List Top rated movies.
- [X] easy scrolling.
- [X] pull to refresh.
- [X] offine data providing.
- [X] paginated view.
- [X] orientation 

## Technology
1. Dio<br />
A powerful Http client for Dart, which supports interceptors, FormData, Request Cancellation, File Downloading, Timeout, etc.
2. Flutter BLoC<br />
Flutter widgets that make it easy to implement the BLoC design pattern.(State management)
3. Cached Network Image<br />
Flutter library to load and cache network images. Can also be used with placeholder and error widgets.
4. Get It<br />
Simple direct Service Locator that allows to decouple the interface from a concrete implementation and to access the concrete implementation from everywhere in your App.
5. Dartz<br />
Functional Programming in Dart. Purify your Dart code using efficient immutable data structures, monads, lenses and other FP tools.
6. Equatable<br />
An abstract class that helps to implement equality without needing to explicitly override == and hashCode.
7. Mockito<br />
A mock framework inspired by Mockito.
8. Shimmer<br />
provides an easy way to add shimmer effect in Flutter project
9. tf_dio_cache<br />
Dio-http-cache is a cache library for Dio ( http client for flutter )
10. internet_connection_checker<br />
A pure Dart library that checks for internet by opening a socket to a list of specified addresses, each with individual port and timeout. Defaults are provided for convenience.
11. percent_indicator<br />
Library that allows you to display progress widgets based on percentage, can be Circular or Linear, you can also customize it to your needs.
