# Learning Flutter

![Build Status](https://code.fbi.h-da.de/hci-trapp/hci-lab-stud-base/badges/main/pipeline.svg)

This repo contains a base project, that

- contains a flutter base project using riverpod and go_router
- is described by videos in the youtube playlists
  - in German:[Flutter-Tutorial (deutsch) mit Riverpod und GoRouter](https://www.youtube.com/playlist?list=PLosiZFS_rnz4QLGoivxmL8thtp9la79eW)
  - in English: [Flutter tutorial with Riverpod and GoRouter](https://www.youtube.com/playlist?list=PLosiZFS_rnz6GE9SJPoVrmHB3wndU6K_Q)
- shows the publication with gitlab ci and gitlab pages of
  - [documentation](https://utrapp.gitlab.io/learning-flutter/docs/) written in md-files as supported by [obsidian](https://obsidian.md/) and realized using [mkdocs](https://www.mkdocs.org/)
  - the running flutter app as a [web app](https://utrapp.gitlab.io/learning-flutter/app/)
- shows ci of a flutter app
  - building the android APK-file (unsigned)
  - building the web app
  - analyzing the code
  - running widget tests
- contains templates for new issues, bugs and merge requests

The repository is given to the students of the module [Human Computer Interaction](https://obs.fbi.h-da.de/mhb/modul.php?nr=30.7328&sem=20212) at the University of Applied Sciences Darmstadt.
However, most of the corresponding material is publicly available under [HCI-Trapp-Lab-Exercises](https://hci-trapp.h-da.io/hci-lab-exercises/) and you may do the course on your own.

## Pages

- [check your docs](https://utrapp.gitlab.io/learning-flutter/docs/)
- [check the app](https://utrapp.gitlab.io/learning-flutter/app/)

## Getting started

Some files contain hardcoded information of the repository and namespace of the app. Hence, to make everything work properly, you need to adapt some files and links. However, the pipeline should work at it is, just the links will not work. And if you go to your pages the embedded iframe shows the app of my repository. To be able to perform the following adaptions, you first need a successful pipeline.

1. find the url of the gitlab pages of your repository: go to deploy --> pages --> access pages. Make sure the checkbox with _Use unique domain_ is checked and saved.

2. adapt the relative path of your web app in the file .gitlab-ci.yml line 47 replace _/learning-flutter/app/_ by your relative path.

   - e.g. if your pages url looks like https://utrapp.gitlab.io/weather/ you will replace it by _/weather/app/_
   - e.g. if your pages url looks like https://hci-lab-stud-base-hci-trapp-b7d28e4b4e3781a4348b8736851ad75af0d.h-da.io/ you will replace it by _/app/_

3. adapt all links (search & replace in all files)

   - replace https://utrapp.gitlab.io/learning-flutter/ by your pages url
   - replace https://gitlab.com/utrapp/learning-flutter by the url of your repository

4. namespace of your app: (search&replace in all files com.example.ri_go_demo with a real namespace related to the web url of your company, e.g. de.hda.fbi.hci.trapp.demo)

- work on the dev branch (no pipeline) for untested small commits, ...
- work on the main branch to publish your work (full pipeline)
- start coding in the folder src
- start filling the pages in the folder docs
- use riverpod generate to automatically update generated files on changes

```
flutter pub run build_runner watch -d
```

- code quality: go to cid/cd --> pipelines --> click a pipeline --> code quality, see [gitlab code quality](https://docs.gitlab.com/ee/ci/testing/code_quality.html)
- check regularly for new lib versions `flutter pub outdated`

## Building/starting docker container locally

Open a command shell and navigate to the path with the file Dockerfile. And make sure docker is running, test with _docker ps_.

- in windows cmd shell use `%cd%/app/` for the current path, in linux shell use `$(pwd)/app/` instead and within a powershell use `${pwd}/app/`
- `docker build -f ./Dockerfile -t "flutter_project_builder" .` builds the docker image locally
- `docker run -it -v %cd%:/home flutter_project_builder bash` runs the docker image and mounts the current path to the folder /home in the container
  - go to the folder /home/app and run `flutter pub get` and `flutter build apk`
  - got to the folder /home and run `mkdocs build --strict --verbose` to check if the docs creation works
- `docker run -p 0.0.0.0:8080:8080 -v  $(pwd):/home -w /home -it flutter_project_builder mkdocs serve -a 0.0.0.0:8080` will run the mkdocs server and your docs are available at http://127.0.0.1:8080/learning-flutter/labs/flutter/

## Video tutorials

I recorded two video tutorials explaining this repository and how to learn flutter, how to use Riverpod and GoRouter. First I recorded the German version, so this is a bit more elaborative and shows more the development, the different steps of the repository. While the English version is a bit more condensed and focuses on the overall picture, mapping concepts to code.

<table>
  <tbody>
    <tr>
      <th>English</th>
      <th>German</th>
    </tr>
    <tr>
    <td><a href="https://www.youtube.com/playlist?list=PLosiZFS_rnz6GE9SJPoVrmHB3wndU6K_Q">playlist</a></td> <td><a href="https://www.youtube.com/playlist?list=PLosiZFS_rnz4QLGoivxmL8thtp9la79eW">Wiedergabeliste</a></td>
    </tr>
    <tr>
      <td><a href="https://www.youtube.com/watch?v=XoBddlNX1_E&list=PLosiZFS_rnz6GE9SJPoVrmHB3wndU6K_Q&index=1&pp=gAQBiAQB">Intro</a></td>
      <td><a href="https://www.youtube.com/watch?v=tA6sKYexoQM">Einführung</a></td>
    </tr>
    <tr>
      <td><a href="https://www.youtube.com/watch?v=FsIjhEAeZDs">Material to learn the basics</a></td>
      <td><ul><li><a href="https://www.youtube.com/watch?v=rJQIER25YI0">Dart: Grundlagen und Besonderheiten</a></li><li><a href="https://www.youtube.com/watch?v=xUiZKa1kTdw">GUI: Grundlagen und Besonderheiten</a></li></td>
    </tr>
    <tr>
      <td><a href="https://www.youtube.com/watch?v=KzvyjQcRUZs">gitlab pages with CI and mkdocs</a></td>
      <td><a href="https://www.youtube.com/watch?v=CX94bzfqTOo">gitlab pages, accessibility tests in ci, mkdocs</a></td>
    </tr>
    <tr>
      <td><a href="https://www.youtube.com/watch?v=k0ZnGjzpBwo">Logging, Accessibility, Responsive Design and other typical problems</a></td>
      <td><ul><li><a href="https://www.youtube.com/watch?v=8_WBlYk_3nY">Typische Probleme und Lösungen</a></li><li><a href="https://www.youtube.com/watch?v=J8MtGYcvoX8">Übung zur Anwendung der bisherigen Inhalte und Vorbereitung von Riverpod</a></li></ul></td>
    </tr>
    <tr>
      <td><a href="https://www.youtube.com/watch?v=gmUdwu32K2g">State Management and Architecture</a></td>
      <td><ul><li><a href="https://www.youtube.com/watch?v=RZrLMU1Op08">warum Riverpod</a></li>
      <li><a href="https://www.youtube.com/watch?v=U18Y5LVEkJg">Grundlagen Riverpod (Theorie)</a></li></ul></td>
    </tr>
    <tr>
      <td><a href="https://www.youtube.com/watch?v=c2fv3oua2GU">Counter with Riverpod, state, controller, generator</a></td>
      <td><a href="https://www.youtube.com/watch?v=D_NIYnP1kaw">Counter-App mit Riverpod-Generator und gitlab Workflow</a></td>
    </tr>
    <tr>
      <td><ul><li><a href="https://www.youtube.com/watch?v=lIBxLrtz7nc">fetch data from a REST-API using Riverpod, show it to the user, implement pull to refresh</a></li><li><a href="https://www.youtube.com/watch?v=iYnXjVmN4UQ">update, create and delete data with riverpod generator and dio</a></li></ul></td>
      <td><ul><li><a href="https://www.youtube.com/watch?v=gsQ-eQQLkBg">Verzeichnisstruktur, Lokalisierung, Merge-Requests</a></li><li><a href="https://www.youtube.com/watch?v=jLYjr5DMfg0">Vorbereitung zur Anbindung von REST</a></li><li><a href="https://www.youtube.com/watch?v=P5Kn8qZcvls">Nutzung eines API-Generators und Implementation Repository</a></li><li><a href="https://www.youtube.com/watch?v=9FMKkaynaXk">Form-Widgets, Controller, ListView, Intenet-Permission, "alles verdrahten"</a></li></ul></td>
    </tr>
    <tr>
      <td><a href="https://www.youtube.com/watch?v=9c5A-iaiLqI"> Responsive Navigation with GoRouter, ShellRoutes</a></td>
      <td><a href="https://www.youtube.com/watch?v=m--Ayq140JI">Responsive Navigation mit GoRouter, ShellRoute</a></td>
    </tr>
    <tr>
      <td><a href="https://www.youtube.com/watch?v=zAWCOgjSkU4">Widget Tests, accessibility tests, start your own app</a></td>
      <td><a href="https://www.youtube.com/watch?v=rgQQKBaHEA8">Wie Sie weiter machen können</a></td>
    </tr>
  </tbody>
</table>

## Tags

With the following tags you might follow the development of the repository.

- [initial project with mkdocs, ci and counter app as generated by project template](https://gitlab.com/utrapp/learning-flutter/-/tags/v0.0.1)
- [with safe area and de/en und automatic accessibility test, own primary color, include tests in ci](https://gitlab.com/utrapp/learning-flutter/-/tags/v0.0.2)
- [with riverpod generator, folder structure and localization helper methods](https://gitlab.com/utrapp/learning-flutter/-/tags/v0.0.3)
- [CRUD](https://gitlab.com/utrapp/learning-flutter/-/tags/v0.0.4)
- [fixes, refactoring, docs](https://gitlab.com/utrapp/learning-flutter/-/tags/v1.0.0)

## Naming convention

- files and folders in English and only with the following chars `[a-zAZ0-9_-]`
- commit comments -- see. https://www.conventionalcommits.org/en/v1.0.0/
- branches
  - structure: feat/fix/docs/style/refactor/learn/orga/test / #issue Titel
  - example _feat-49-adds-new-endpoints-to-fast-api_
- merge request
  - structure #Issue title
  - example _#49 adds new endpoints to FastAPI_
  - additional sources
    - [GitLab Code Review Guidelines](https://docs.gitlab.com/ee/development/code_review.html)
    - [11 Ways to Create Pull Requests that are Easy to Review](https://www.pullrequest.com/blog/11-ways-to-create-pull-requests-that-are-easy-to-review/)

## Contribute

Create an issue, write me an email any hints for improvement or feedback are welcome :smile:
