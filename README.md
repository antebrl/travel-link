# Learning Flutter

![Build Status](https://code.fbi.h-da.de/hci-trapp/hci-lab-stud-base/badges/main/pipeline.svg)

This repo 

- contains a flutter base project using riverpod and go_router, see learning/demo-app
- is described by videos in the youtube playlists
  - in German:[Flutter-Tutorial (deutsch) mit Riverpod und GoRouter](https://www.youtube.com/playlist?list=PLosiZFS_rnz4QLGoivxmL8thtp9la79eW)
  - in English: [Flutter tutorial with Riverpod and GoRouter](https://www.youtube.com/playlist?list=PLosiZFS_rnz6GE9SJPoVrmHB3wndU6K_Q)
- shows the publication with gitlab ci and gitlab pages of
  - [documentation](https://hci-lab-stud-base-hci-trapp-b7d28e4b4e3781a4348b8736851ad75af0d.h-da.io/docs) written in md-files as supported by [obsidian](https://obsidian.md/) and realized using [mkdocs](https://www.mkdocs.org/)
  - the running flutter app as a [web app](https://hci-lab-stud-base-hci-trapp-b7d28e4b4e3781a4348b8736851ad75af0d.h-da.io/app/)
- shows ci of a flutter app
  - building the android APK-file (unsigned)
  - building the web app
  - analyzing the code
- contains templates for **new issues**, bugs and merge requests

The repository is given to the students of the module [Human Computer Interaction](https://obs.fbi.h-da.de/mhb/modul.php?nr=30.7328&sem=20212) at the University of Applied Sciences Darmstadt.
However, most of the corresponding material is publicly available under [HCI-Trapp-Lab-Exercises](https://hci-trapp.h-da.io/hci-material/) and you may do the course on your own.

## Pages

- [check your docs](https://hcimo4x-grey-trapp-hci-trapp-hci-lab-studi-sose2-e6afe3a1eb2adc.h-da.io/docs/)
    - example syntax is provided in docs/1-UserResearch.md
    - further syntax see [mkdocs-material](https://squidfunk.github.io/mkdocs-material/reference/)
- [check the app](https://hcimo4x-grey-trapp-hci-trapp-hci-lab-studi-sose2-e6afe3a1eb2adc.h-da.io/app/)

## Getting started

Some files contain hardcoded information of the repository and namespace of the app. Hence, to make everything work properly, you need to adapt some files and links. However, the pipeline should work at it is, just the links will not work. And if you go to your pages the embedded iframe shows the app of my repository. To be able to perform the following adaptions, you first need a successful pipeline.

1. find the url of the gitlab pages of your repository: go to deploy --> pages --> access pages. Make sure the checkbox with _Use unique domain_ is checked and saved.

2. adapt the relative path of your web app in the file .gitlab-ci.yml line 47 replace _/learning-flutter/app/_ by your relative path.

   - e.g. if your pages url looks like https://utrapp.gitlab.io/weather/ you will replace it by _/weather/app/_
   - e.g. if your pages url looks like https://hci-lab-stud-base-hci-trapp-b7d28e4b4e3781a4348b8736851ad75af0d.h-da.io/ you will replace it by _/app/_

3. adapt all links (search & replace in all files)

   - replace https://utrapp.gitlab.io/learning-flutter/ by your pages url
   - replace https://gitlab.com/utrapp/learning-flutter by the url of your repository

4. delete everything in the folder app and create a new app with your name; this will generate a new folder with the name of your app, I suggest to move everything under app 
5. follow the instructions of [new project](https://hci-trapp.h-da.io/hci-material/theory/flutter/#new-project) 

- work on the dev branch (no pipeline) for untested small commits, ...
- work on the main branch to publish your work (full pipeline)
- start coding in the folder app
- start filling the pages in the folder docs
- use riverpod generate to automatically update generated files on changes

```
flutter pub run build_runner watch -d
```

- code quality: go to cid/cd --> pipelines --> click a pipeline --> code quality, see [gitlab code quality](https://docs.gitlab.com/ee/ci/testing/code_quality.html)
- check regularly for new lib versions `flutter pub outdated`

## Building/starting docker container locally
Pull the container provided with `docker pull registry.code.fbi.h-da.de/hci-trapp-public/hci-docker/stud_project_builder`.
- navigate to your repository
- for the next commands: in windows cmd shell use `%cd%` for the current path, in linux shell use `$(pwd)` instead and within a powershell use `${pwd}`
- `docker run -it -v $(pwd):/home registry.code.fbi.h-da.de/hci-trapp-public/hci-docker/stud_project_builder bash` runs the docker image, starts the bash and mounts the current path to the folder /home in the container
  - go to the folder /home/app and run `flutter pub get` and `flutter build apk`, see a demo run below
  - got to the folder /home and run `mkdocs build --strict --verbose` to check if the docs creation works, see a demo run below

```
ubuntu@Notebook-Trapp:/mnt/c/repos/hdagit/hci/hci-lab-stud-base$ docker run -it -v $(pwd):/home registry.code.fbi.h-da.de/hci-trapp-public/hci-docker/stud_project_builder bash
root@b0e6eb37052a:/home/mk-docs# cd ..
root@b0e6eb37052a:/home# ls
LICENSE  README.md  app  docs  learning  mk-docs  mkdocs.yml  public
root@b0e6eb37052a:/home# cd learning/
root@b0e6eb37052a:/home/learning# cd demo-app/
root@b0e6eb37052a:/home/learning/demo-app# flutter pub get
Resolving dependencies... (5.2s)
  frontend_server_client 3.2.0 (4.0.0 available)
  ...
root@b0e6eb37052a:/home/learning/demo-app# flutter build apk
  ...
  ✓  Built build/app/outputs/flutter-apk/app-release.apk (20.7MB).
root@b0e6eb37052a:/home/learning/demo-app# cd /home
root@41b82fe3bb9d:/home# mkdocs build --strict --verbose
DEBUG   -  Loading configuration file: /home/mkdocs.yml
...
INFO    -  Documentation built in 2.25 seconds
root@41b82fe3bb9d:/home# exit 
```
  
- `docker run -p 0.0.0.0:8080:8080 -v  $(pwd):/home -w /home -it registry.code.fbi.h-da.de/hci-trapp-public/hci-docker/stud_project_builder mkdocs serve -a 0.0.0.0:8080` will run the mkdocs server and your docs are available at http://localhost:8080/

## Video tutorials

I recorded two video tutorials explaining this repository and how to learn flutter, how to use Riverpod and GoRouter. First I recorded the [German](https://www.youtube.com/playlist?list=PLosiZFS_rnz4QLGoivxmL8thtp9la79eW) version, so this is a bit more elaborative and shows more the development, the different steps of the repository -- sorry, the audio quality of the first videos is low. While the [English](https://www.youtube.com/playlist?list=PLosiZFS_rnz6GE9SJPoVrmHB3wndU6K_Q) version is a bit more condensed and focuses on the overall picture, mapping concepts to code.

## Naming convention

- files and folders in English and only with the following chars `[a-zAZ0-9_-]`
- commit comments -- see. https://www.conventionalcommits.org/en/v1.0.0/

## Contribute

Create an issue, write me an email any hints for improvement or feedback are welcome :smile:
