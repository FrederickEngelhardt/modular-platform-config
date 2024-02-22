const shelljs = require('shelljs')

function firstAvd() {
  const output = shelljs.exec('adb devices | sed -n "2,2p"', {
    shell: '/bin/bash',
    silent: true,
  })

  // always first string before tab character
  const [deviceName] = output.stdout.split('\t')

  console.log(deviceName)

  return deviceName
}

module.exports = { firstAvd }
