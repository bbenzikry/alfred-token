#!/usr/bin/env zsh

. ./utils.zsh
SUBTITLE='{arg:((.chainId | tostring) + " " + .address),subtitle:(.subtitle+" ( Chain ID " + (.chainId|tostring) + " )")}'

# params
CHAIN_ID=$1
TOKEN_NAME=$2
if [ -z $CHAIN_ID ]; then
    CHAIN_ID="0"
fi


VARIABLES=$(cat <<EOF
{
  "CHAIN_ID": $CHAIN_ID,
  "TOKEN_NAME": "$TOKEN_NAME"
}
EOF
)

if is_addr "$TOKEN_NAME"; then
    if [ "$CHAIN_ID" = "0" ]; then 
        jq -s "{variables: $VARIABLES,items: [.[] | select(.address | test(\"$TOKEN_NAME\"; \"i\")) + $SUBTITLE ]}" ./tokens.json    
    else 
        jq -s "{variables: $VARIABLES, items: [.[] | select(.chainId==$CHAIN_ID) | select(.address | test(\"$TOKEN_NAME\"; \"i\")) + $SUBTITLE ]}" ./tokens.json
    fi
else
    if [ "$CHAIN_ID" = "0" ]; then 
        [ -z $TOKEN_NAME ] && jq -s "{variables: $VARIABLES,items: [.[] | select(.) + $SUBTITLE ]}" ./tokens.json
        [ ! -z $TOKEN_NAME ] && jq -s "{variables: $VARIABLES, items: [.[] | select(.symbol | test(\"$TOKEN_NAME\"; \"i\")) + $SUBTITLE ]}" ./tokens.json
    else 
        [ -z $TOKEN_NAME ] && jq -s "{variables: $VARIABLES, items: [.[] | select(.chainId==$CHAIN_ID) + $SUBTITLE ]}" ./tokens.json
        [ ! -z $TOKEN_NAME ] && jq -s "{variables: $VARIABLES, items: [.[] | select(.chainId==$CHAIN_ID) | select(.symbol | test(\"$TOKEN_NAME\"; \"i\")) + $SUBTITLE ]}" ./tokens.json
    fi
fi