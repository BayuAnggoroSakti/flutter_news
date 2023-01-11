# Flutter News App
News App developed with Flutter and API from [News API](https://newsapi.org)

## Versions
- [v1.0.0](https://github.com/BayuAnggoroSakti/flutter_news/tree/v1.0.0)

## Usage
1. Please open file **constants/newsApi_constants.dart** and change `YOUR API KEY` in the variable `apiKey` with your own.
2. In development mode, I'm used fake json server. So, the data is not realtime. 
3. Build flavor only work for Android. So, if you want to run as development mode you can use this command.
```
flutter run 
```
or in production mode.
```
flutter run --release 
```
*Note: If you want to build and release this app to Play Store. Please use this command.*
```
flutter build appbundle --release 
```
4. For running unit test
```
cd test
flutter test 
```

## Feature
- [X] List daily news.
- [X] Go to detail news website.

## Technology
1. Http<br />
This package contains a set of high-level functions and classes that make it easy to consume HTTP resources. It's multi-platform, and supports mobile, desktop, and the browser.
2. Flutter Web<br />
A Flutter plugin that provides a WebView widget.
3. Build Runner<br />
Tools to write binaries that run builders.
4. Mockito<br />
A mock framework inspired by Mockito.
5. Provider<br />
The provider package is easy to understand and it doesn't use much code. It also uses concepts that are applicable in every other approach

## Tech Stack

**Server:** Flutter 3.0.0, API


## Authors

- [@BayuAnggoroSakti](https://github.com/BayuAnggoroSakti)
