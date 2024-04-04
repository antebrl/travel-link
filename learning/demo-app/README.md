# HCI/Flutter Demo Project

A Flutter demo project with basic architecture.

## Architecture und Libs

This project uses

- [flutter_riverpod](https://pub.dev/packages/flutter_riverpod) for state management including [annotation]() and [generator]()
- [go_router](https://pub.dev/packages/go_router) for navigation
- [freezed](https://pub.dev/packages/freezed), [freezed_annotation](https://pub.dev/packages/freezed_annotation) and [equatable](https://pub.dev/packages/equatable) to write less code


## Navigation and Layout

For the purpose of demonstration the app

- uses bottom navigation or navigation rail depending on the screen
- navigates to a separate screen for the details view
- shows the edit form responsive: either side by side or below

## Debug
To debug this application you need an installation of Flutter and Android
1. open the folder with VS Code
2. open the terminal and run `flutter pub get`
3. open any dart file in the folder lib and hit F5

If you have problems to start the application run in the terminal `flutter doctor`.

## Build
To build the application with the docker container provided run

## Edit
If you edit any provider or freezed class make sure the builder is running 
`dart run build_runner watch` 