# Browsers
chrome() {
  open -a Google\ Chrome
}

safari() {
  open -a safari
}

firefox() {
  open -a firefox
}

open-all-browsers() {
  chrome
  safari
  firefox

  printf "$(ANSI GREEN)All browsers opened\n"
}

# chrome CORS disable
# If you need HTTPS SSL disabled (if you boot https localhost server)
chrome-disable-ssl() {
  echo "chrome://flags/#allow-insecure-localhost"
}

chrome-cors(){
  open -na /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir="~/chrome-cors" --disable-web-security
}

chrome-c-cors(){
    open -a /Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --args --user-data-dir="/tmp/chrome_dev_test" --disable-web-security
}