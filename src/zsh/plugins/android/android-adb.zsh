#!/usr/bin/env zsh


if [[ -z $ANDROID_HOME ]]
then
  echo 'Please set ANDROID_HOME the root directory of your Android SDK'
else

  if [[ -z $DEFAULT_AVD ]]
  then
    echo 'No DEFAULT_AVD is set, so I will simply pick the first available AVD'
  fi

  export ADB_ALL_DEVICES=`adb devices | grep -v devices | grep device | cut -f 1`
  # react-native is 8081 so it defaults to this
  export ADB_DEFAULT_PORT_REVERSE=(8081)
  export ADB_REVERSE_ALL_PORTS=()

  adb_all_update_devices(){
    export ADB_ALL_DEVICES=`adb devices | grep -v devices | grep device | cut -f 1`
    echo "Updated current devices: got ${#ADB_ALL_DEVICES[@]} devices"
  }

  adb_all(){
    if (( ${#a[@]} )); then
    else
      adb_all_update_devices
    fi

    for device in $ADB_ALL_DEVICES; do
        adb -s $device $@
    done
  }

  adb_reverse_update_ports(){
    ADB_REVERSE_ALL_PORTS=($@)
    echo "Updated current ports: got ${#ADB_REVERSE_ALL_PORTS[@]} ports"
  }

  # single device reverse
  adb_reverse(){
    adb $@ reverse tcp:$1 tcp:$1
  }

  # allows device args
  adb_reverse_all(){
    for port in $ADB_DEFAULT_PORT_REVERSE; do
        adb $@ reverse tcp:$port tcp:$port
    done

    for port in $ADB_REVERSE_ALL_PORTS; do
        adb $@ reverse tcp:$port tcp:$port
    done
  }

  adb_all_reverse(){
    for device in $ADB_ALL_DEVICES; do
        adb_reverse_all -s $device $@
    done
  }

  alias adba=adb_all
  alias adbar=adb_reverse_all

  # Blindly picks the name of the first available virtual device
  function EchoEmulatorFirstAvdName {
    $ANDROID_HOME/emulator/emulator -list-avds | head -1
  }

  function FirstAvd {
    # selects the device only the second line
    adb devices | sed -n "2,2p"
  }

  function ConnectAvd {
    adb tcpip 5555;

    if [[ -z $DEFAULT_AVD ]]
    then
    else
      adb devices | sed -n "2,2p"
    fi
  }

  # Prints the name of your chosen default AVD, or (if you didn't choose one)
  # it will print the name of the first available AVD
  function EchoDefaultAvdName {
    echo ${DEFAULT_AVD:-$(EchoFirstAvdName)}
  }

  # launches the optionally specified AVD
  # With no argument, it will use $DEFAULT_AVD or the first available AVD
  # e.g.: LaunchAvdForeground Nexus_5X_API_23
  function LaunchAvdForeground {
    local avdName=${1:-$(EchoDefaultAvdName)}
    echo "Launching AVD: $avdName"
    $ANDROID_HOME/emulator/emulator -avd $avdName
  }

  # launches the optionally specified AVD as a background process
  # With no argument, it will use $DEFAULT_AVD or the first available AVD
  # e.g.: LaunchAvdBackground Nexus_5X_API_23
  function LaunchAvdBackground {
    local avdName=${1:-$(EchoDefaultAvdName)}
    echo "Launching AVD: $avdName"
    nohup $ANDROID_HOME/emulator/emulator -avd $avdName &>/dev/null &
  }

  # Launches the optionally specified AVD only if no android emulator
  # is presently running.  Note that this will skip launching if any
  # android emulator is already running - not just the emulator of the
  # AVD you specify (if you specified).
  function LaunchAvdIfNeeded {
    if [[ -z $(pgrep emulator) ]]; then LaunchAvdBackground $1; fi
  }

    # android

  # Setup aapt tool so it accessible using a single command
  aapt(){
    $ANDROID_HOME/build-tools/30.0.3/aapt
  }

  # Install APK to device
  # Use as: apkinstall app-debug.apk
  apkinstall(){
    adb devices | tail -n +2 | cut -sf 1 | xargs -I X adb -s X install -r $1
  }
  # As an alternative to apkinstall, you can also do just ./gradlew installDebug

  # Alias for building and installing the apk to connected device
  # Run at the root of your project
  # $ buildAndInstallApk
  
  buildAndInstallApk(){
    ./gradlew assembleDebug && apkinstall ./app/build/outputs/apk/debug/app-debug.apk
  }

  # Launch your debug apk on your connected device
  # Execute at the root of your android project
  # Usage: launchDebugApk
  launchDebugApk() {
    adb shell monkey -p `aapt dump badging ./app/build/outputs/apk/debug/app-debug.apk | grep -e 'package: name' | cut -d \' -f 2` 1
  }
  # ------------- Single command to build+install+launch apk------------#
  # Execute at the root of your android project
  # Use as: buildInstallLaunchDebugApk
  buildInstallLaunchDebugApk(){
    "buildAndInstallApk && launchDebugApk"
  }

fi


connectWifiAndroidDevice(){
  device = $1 || 
}