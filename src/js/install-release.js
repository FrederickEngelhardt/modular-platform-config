const { execSync } = require('child_process')

const execOptions = { stdio: 'inherit', encoding: 'utf-8' }
const timestamp = new Date().getTime()
/**
 * increments the app version with a patch
 */
if (process.env.HAS_PUBLISH) {
  execSync('npm version patch', execOptions)
}

const { version, appName } = require('../package.json')
const appName = `${appName}-${version}-${timestamp}`

const getAdbDevices = () => {
  const allowedDevices = new Set([
    'usb:337969152X',
    'product:gts7lwifixx',
    'product:q2quew',
  ])
  const devices = execSync('adb devices -l', {
    stdio: 'pipe',
    encoding: 'utf8',
  })
  const devicesByID = devices
    .split('\n')
    .slice(1)
    .map(line => line.split('device ').map(v => v.split(' ')[0])[1])
    .filter(item => !!item)
    .filter(id => allowedDevices.has(id))
  return devicesByID
}

const pushApkToDevices = () => {
  const deviceIds = getAdbDevices()
  deviceIds.forEach(id => {
    execSync(
      `adb -s ${id} push ./android/app/build/outputs/apk/release/app-release.apk /storage/emulated/0/Downloads/${appName}.apk`,
      execOptions,
    )
  })
}

const installApkToDevices = () => {
  const deviceIds = getAdbDevices()
  console.log(deviceIds)
  deviceIds.forEach(id => {
    execSync(
      `adb -s ${id} install ./android/app/build/outputs/apk/release/app-release.apk`,
      execOptions,
    )
  })
}

// Bash alternative
// for SERIAL in $(adb devices | grep -v List | cut -f 1);
// do adb -s $SERIAL install -r /path/to/product.apk;
// done

process.env.HAS_INSTALL_APK && pushApkToDevices()
process.env.HAS_INSTALL && installApkToDevices()

// execSync(
//   `adb -s product:gts7lwifixx push ./android/app/build/outputs/apk/release/app-release.apk /storage/emulated/0/Downloads/${appName}.apk`,
//   execOptions,
// )
