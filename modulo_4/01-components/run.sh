#!/bin/bash
export ANDROID_HOME=/home/alumnos/Android/Sdk

if ! $ANDROID_HOME/platform-tools/adb devices 2>/dev/null | grep -q "device$"; then
  echo "Iniciando emulador..."
  $ANDROID_HOME/emulator/emulator -avd Pixel4_x86_64 -no-snapshot-load &
  echo "Esperando a que el emulador arranque..."
  while [ -z "$($ANDROID_HOME/platform-tools/adb devices 2>/dev/null | grep 'device$')" ]; do
    sleep 3
  done
  echo "Emulador listo."
fi

echo "Iniciando Expo..."
npx expo start --android
