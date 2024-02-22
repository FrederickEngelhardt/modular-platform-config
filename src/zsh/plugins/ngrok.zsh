#!/usr/bin/env zsh
# ngrok
alias ngrok="~/ngrok"
alias ng-start="ngrok http"
alias ng-url-init="curl  http://localhost:4040/api/tunnels > ~/ngrok_tunnels.json;"
alias ng-get-tunnel="jq .tunnels[1].public_url ~/ngrok_tunnels.json"
alias ng-url-export="echo ${ng-get-tunnel} >> .env"
