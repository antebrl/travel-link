FROM ubuntu:latest 
#points to the latest LTS version

##########################
# ENV -- define relevant versions
##########################
# latest versions check at https://developer.android.com/studio#command-tools
ENV ANDROID_TOOLS_VERSION "10406996"
ENV FLUTTER_CHANNEL="stable"

# update all packages
RUN apt-get update -y && \
  apt-get upgrade -y

# core utils needed by flutter AND android part
RUN apt-get update && apt-get install -y \
  bash \
  curl \
  unzip \
  wget \
  xz-utils \
    && rm -rf /var/lib/apt/lists/*

####################
# Android 
####################
# install the jdk, check which version is supported by android https://developer.android.com/studio/releases#jdk-17
RUN apt-get update && apt-get install -y \
  openjdk-17-jdk \
    && rm -rf /var/lib/apt/lists/*

ENV ANDROID_BASE_FOLDER "/opt/android"
RUN mkdir -p ${ANDROID_BASE_FOLDER}
WORKDIR ${ANDROID_BASE_FOLDER}
RUN wget -O tools.zip https://dl.google.com/android/repository/commandlinetools-linux-${ANDROID_TOOLS_VERSION}_latest.zip && \
    unzip ./tools.zip && rm ./tools.zip && \
    chmod a+x -R ${ANDROID_BASE_FOLDER}/cmdline-tools/bin
ENV PATH $PATH:${ANDROID_BASE_FOLDER}/cmdline-tools/bin
ENV ANDROID_SDK_ROOT "${ANDROID_BASE_FOLDER}/sdk"
# accept all licenses with echo y and install the android sdk
RUN echo y | sdkmanager --sdk_root=${ANDROID_SDK_ROOT} --install "cmdline-tools;latest"



####################
# FLUTTER 
####################
# flutter part based on https://docs.flutter.dev/get-started/install/linux
RUN apt-get update && apt-get install -y \
  file \
  git \
  libglu1-mesa \
  && rm -rf /var/lib/apt/lists/*
ENV FLUTTER_SDK_ROOT "/opt/flutter"
RUN mkdir -p ${FLUTTER_SDK_ROOT}

RUN git clone https://github.com/flutter/flutter.git ${FLUTTER_SDK_ROOT}

ENV PATH="${FLUTTER_SDK_ROOT}/bin:${FLUTTER_SDK_ROOT}/bin/cache/dart-sdk/bin:${PATH}"

RUN flutter config --enable-web
RUN flutter config --enable-android
RUN flutter config --no-enable-linux-desktop
RUN flutter config --android-sdk ${ANDROID_SDK_ROOT}
RUN flutter channel ${FLUTTER_CHANNEL}
RUN flutter precache
RUN flutter doctor
RUN flutter upgrade
RUN flutter --version

####################
# MKDocs 
####################
ENV MKDOCS_PROJECT_FOLDER "/home/mk-docs"
RUN mkdir -p ${MKDOCS_PROJECT_FOLDER}
WORKDIR ${MKDOCS_PROJECT_FOLDER}
COPY requirements.txt ${MKDOCS_PROJECT_FOLDER}
RUN apt-get update && apt-get install -y \
  python3 \
  python3-pip \
    && rm -rf /var/lib/apt/lists/*
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

