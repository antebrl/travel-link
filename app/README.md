# HCI/Flutter Demo Project

A Flutter demo project with basic architecture.

## Architecture und Libs

This project uses

- [flutter_riverpod](https://pub.dev/packages/flutter_riverpod) for state management including [annotation]() and [generator]()
- [go_router](https://pub.dev/packages/go_router) for navigation
- [freezed](https://pub.dev/packages/freezed), [freezed_annotation](https://pub.dev/packages/freezed_annotation) and [equatable](https://pub.dev/packages/equatable) to write less code


## navigation and layout

For the purpose of demonstration the app

- uses bottom navigation or navigation rail depending on the screen
- navigates to a separate screen for the details view
- shows the edit form responsive: either side by side or below

## Additional recommended libs

- [animations](https://pub.dev/packages/animations): This package contains pre-canned animations for commonly-desired effects.
- [rive](https://help.rive.app/getting-started/introduction): Animation editor and good integration into flutter
- [flutter_native_splash](https://pub.dev/packages/flutter_native_splash): customized splash screen
- [intro_slider](https://pub.dev/packages/intro_slider): Typical onboarding for first start of an app.
- [shimmer](https://pub.dev/packages/shimmer/example): show loading placeholders
  Be careful with your libraries, check the following
- [tutorial_coach_mark](https://pub.dev/packages/tutorial_coach_mark): Tap for help, on demand tutorial.
- [widget_book](https://www.widgetbook.io/) - organize reusable widgets and good
  integration into figma
- [feedback](https://pub.dev/packages/feedback): easy way to get feedback from your users
- [curated list of libs](https://fluttergems.dev/)

Whenever you address a task or problem, search in pub.dev, if someone solved it already. To choose a good lib, consider the following questions

- platform web AND your mobile platform supported?
- more than one developer?
- updated recently?
- as less dependencies as possible?

## naming conventions

- ## arb-files
- https://dart.dev/effective-dart/style

## APIs

Focus on the frontend and use tools for the backend. Be inspired by available APIs ...

- [administration digital](https://bund.dev/apis)
- [Air Quality API](https://developers.google.com/maps/documentation/air-quality)
- [Google Sheets per API](https://developers.google.com/sheets/api/samples?hl=de) und [Build a CRUD API using the Google Sheets API](https://blog.logrocket.com/build-crud-api-using-google-sheets-api/)
- [Big List of Free and Open Public APIs (No Auth Needed)](https://mixedanalytics.com/blog/list-actually-free-open-no-auth-needed-apis/)
- [Fake Store API](https://fakestoreapi.com/)
- https://quotes.rest/
- [OpenFoodFacts description](https://projects.fbi.h-da.de/~s.zander/nzse/praktikum/html/openfoodfacts_api_infos/)
- [https://www.freecodecamp.org/news/public-apis-for-developers/]
- simple table, access it with post/put/get/delete: https://retool.com/api-generator/ or https://www.rowy.io/
- https://supabase.com/ -- open source alternative for firebase and based on PostgreSQL

## open issues

- web build requires manual removing HREF-line in index.html
