#!/bin/bash

# export ANDROID_SDK_HOME=$HOME/Library/Android/sdk
# export ANDROID_BUILD_TOOLS_VERSION=31.0.0
# export ANDROID_SDK_API_LEVEL=30
# export ANDROID_NDK_HOME=$HOME/Library/Android/sdk/ndk/25.1.8937393
# export ANDROID_NDK_API_LEVEL=21
export TF_PYTHON_VERSION=3.11

bazel build -c opt --cxxopt=--std=c++17 --config=android_arm \
  --fat_apk_cpu=x86,x86_64,arm64-v8a,armeabi-v7a \
  --define=android_dexmerger_tool=d8_dexmerger \
  --define=android_incremental_dexing_tool=d8_dexbuilder \
  --define=xnn_enable_arm_fp16=false \
  --define=xnn_enable_arm_i8mm=false \
  //tensorflow/lite/java:tensorflow-lite

bazel build -c opt --cxxopt=--std=c++17 --config=android_arm \
  --fat_apk_cpu=x86,x86_64,arm64-v8a,armeabi-v7a \
  --define=android_dexmerger_tool=d8_dexmerger \
  --define=android_incremental_dexing_tool=d8_dexbuilder \
  --define=xnn_enable_arm_fp16=false \
  --define=xnn_enable_arm_i8mm=false \
  //tensorflow/lite/java:tensorflow-lite-gpu
