const shelljs = require('shelljs')
const chalk = require('chalk')
const path = require('path')
const { exec } = require('child_process')

const basePathDir = `~/.modular-platform-config`
const defaultExtensionDir = `${basePathDir}/src/shelljs/shelljs-extensions`
const defaultOutputDir = `${basePathDir}/src/shelljs`
const GENERATED = '__generated__'
const defaultOutputFileName = `${GENERATED}shelljs-zsh-functions.zsh`

// required for resolving tild path
function resolveHome(filepath) {
  if (filepath[0] === '~') {
    return path.join(process.env.HOME, filepath.slice(1))
  }
  return filepath
}

// Registers any function that is added to module.exports
function registerFn(
  outputDir,
  filePath,
  outputFileName = defaultOutputFileName
) {
  const fileContents = shelljs.exec(`cat ${resolveHome(filePath)}`, {
    shell: '/bin/bash',
    silent: true,
  })

  const fnExports = fileContents
    .split('module.exports = {')[1]
    .replace(new RegExp(/\s\}\n/, 'gi'), '')
    .split(',')

  fnExports.forEach((name) => {
    const fnNameString = name.trim()

    function escapeShellArg(arg) {
      return `'${arg.replace(/'/g, `'\\''`)}'`
    }

    const stringRaw = `require(\"${filePath}\").${fnNameString}()`
    shelljs.exec(
      'echo ' +
        escapeShellArg(`${fnNameString}(){
  node -e '${stringRaw}'
}`) +
        ' >> ' +
        `${resolveHome(outputDir)}/${outputFileName}`
    )

    chalk.green(`registering ${fnNameString}`)
  })
}

const excludedFunctionDirs = new Set([
  'register-fn.js',
  'register-zsh-functions.js',
])

function registerAll(
  extensionDir,
  outputDir,
  outputFileName = defaultOutputFileName
) {
  const files = shelljs.ls(resolveHome(extensionDir))

  // deletes the outputFileName if it exists
  shelljs.rm(`${outputDir}/${outputFileName}`)

  files.forEach((file) => {
    if (!excludedFunctionDirs.has(file)) {
      const filePath = resolveHome(`${extensionDir}/${file}`)
      registerFn(outputDir, filePath, outputFileName)
    }
  })
}

registerAll(defaultExtensionDir, defaultOutputDir)

module.exports = { registerFn, registerAll }
