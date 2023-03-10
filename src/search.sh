#!/usr/bin/env bash
SUBTITLE='{subtitle:(.subtitle+" ( Chain ID " + (.chainId|tostring) + " )")}'
function jq() {
  /usr/local/bin/jq "$@"
}

# params
CHAIN_ID=$1
TOKEN_NAME=$2
if [ -z $CHAIN_ID ]; then
    CHAIN_ID="0"
fi

if [ "$CHAIN_ID" == "0" ]; then 
    [ -z $TOKEN_NAME ] && jq -s "{items: [.[] | select(.) + $SUBTITLE ]}" ./tokens.json
    [ ! -z $TOKEN_NAME ] && jq -s "{items: [.[] | select(.symbol | test(\"$TOKEN_NAME\"; \"i\")) + $SUBTITLE ]}" ./tokens.json
else 
    [ -z $TOKEN_NAME ] && jq -s "{items: [.[] | select(.chainId==$CHAIN_ID) + $SUBTITLE ]}" ./tokens.json
    [ ! -z $TOKEN_NAME ] && jq -s "{items: [.[] | select(.chainId==$CHAIN_ID) | select(.symbol | test(\"$TOKEN_NAME\"; \"i\")) + $SUBTITLE ]}" ./tokens.json
fi