# WSL Docksal Fix

This document is deprecated/unmaintained but may still be applicable for react-native + WSL + dev server proxying.

You will need to know networking and how windows and WSL connect to do this properly. 

The info below is mostly copy pasted from other online resources and tutorials and combined together. 

Last updates: `~2020`.

## Steps

Edit using admin rights `C:\Windows\System32\drivers\etc`
//powershell
```ps1
netsh http add iplisten 0.0.0.0
netsh http add iplisten 127.0.0.1
```

Then create a file and execute it by changing execution policy
```ps1
 Get-ExecutionPolicy
 Set-ExecutionPolicy Unrestricted -Scope Process -Force
 Set-ExecutionPolicy Restricted -Scope Process -Force
```


```ps1
$remoteip = wsl.exe /bin/bash -c "ip addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'"
$found = $remoteip -match '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}';
​
if( !$found ){
  echo "The Script Exited, the ip address of WSL 2 cannot be found";
  exit;
}
​
#[Ports]
​
#All the ports you want to forward separated by comma
$ports=@(80,8080,443,10000,3000,5000,6006);
​
​
#[Static ip]
#You can change the addr to your ip config to listen to a specific address
$addr='127.0.0.1';
$ports_a = $ports -join ",";
​
​
#Remove Firewall Exception Rules
iex "Remove-NetFireWallRule -DisplayName 'WSL 2 Firewall Unlock' ";
​
#adding Exception Rules for inbound and outbound Rules
iex "New-NetFireWallRule -DisplayName 'WSL 2 Firewall Unlock' -Direction Outbound -LocalPort $ports_a -Action Allow -Protocol TCP";
iex "New-NetFireWallRule -DisplayName 'WSL 2 Firewall Unlock' -Direction Inbound -RemoteAddress $remoteip -Action Allow -Protocol TCP";
​
for( $i = 0; $i -lt $ports.length; $i++ ){
  $port = $ports[$i];
  iex "netsh interface portproxy delete v4tov4 listenport=$port listenaddress=$addr";
  iex "netsh interface portproxy add v4tov4 listenport=$port listenaddress=$addr connectport=$port connectaddress=$remoteip";
```