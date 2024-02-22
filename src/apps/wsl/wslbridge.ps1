# Cut and paste the following code to run this script directly in powershell admin
# \\wsl$\Ubuntu\home\fengelhardt\FE_Projects\config\apps\wsl\wslbridge
$remoteip = wsl.exe /bin/bash -c "ip addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'"
$found = $remoteip -match '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}';

if( !$found ){
  echo "The Script Exited, the ip address of WSL 2 cannot be found";
  exit;
}

#[Ports]

#All the ports you want to forward separated by comma
$ports=@(80,443,3000,5000,6006,7687,8080,10000,64662,64770);


#[Static ip]
#You can change the addr to your ip config to listen to a specific address
$addr='127.0.0.1';
$ports_a = $ports -join ",";


#Remove Firewall Exception Rules
iex "Remove-NetFireWallRule -DisplayName 'WSL 2 Firewall Unlock' ";

#adding Exception Rules for inbound and outbound Rules
iex "New-NetFireWallRule -DisplayName 'WSL 2 Firewall Unlock' -Direction Outbound -LocalPort $ports_a -Action Allow -Protocol TCP";
iex "New-NetFireWallRule -DisplayName 'WSL 2 Firewall Unlock' -Direction Inbound -RemoteAddress $remoteip -Action Allow -Protocol TCP";

for( $i = 0; $i -lt $ports.length; $i++ ){
  $port = $ports[$i];
  iex "netsh interface portproxy delete v4tov4 listenport=$port listenaddress=$addr";
  iex "netsh interface portproxy add v4tov4 listenport=$port listenaddress=$addr connectport=$port connectaddress=$remoteip";
}

# You can also add this to windows scheduler as a task action select powershell and elevate the process with highest permissions and provide the following arguements listed below
# `Set-ExecutionPolicy Bypass \\wsl$\Ubuntu\home\fengelhardt\FE_Projects\config\apps\wsl\wslbridge.ps1`