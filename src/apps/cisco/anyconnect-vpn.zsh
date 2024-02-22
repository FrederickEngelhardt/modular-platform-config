alias vpn=/opt/cisco/anyconnect/bin/vpn

# All variables need to be set in a local file
# Requires ANYCONNECT_USER_ID, ANYCONNECT_VPN_HOST, ANYCONNECT_CREDENTIAL_KEYCHAIN

# VPN you are connecting to
local anyconnect_vpn_host=$ANYCONNECT_VPN_HOST

# found under Keychain Access > Logins
local anyconnect_credential_keychain=$ANYCONNECT_CREDENTIAL_KEYCHAIN

# anyconnect userid
local anyconnect_account_id=$ANYCONNECT_USER_ID

set-vpn-password(){
    echo -n "Enter your VPN Password: "
    read -s password
    security add-generic-password -s $anyconnect_credential_keychain -a $anyconnect_account_id -w $password 
}

get-vpn-password(){
    security find-generic-password -w -s $anyconnect_credential_keychain -a $anyconnect_account_id
}

vpn-start(){
echo "Enter your maf1 token"
read token
vpn -s connect $anyconnect_vpn_host <<EOF
$anyconnect_account_id
$(get-vpn-password)
$token
EOF
}

vpn-stop(){
    vpn disconnect $anyconnect_vpn_host
}