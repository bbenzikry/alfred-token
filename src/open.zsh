#!/usr/bin/env zsh
. ./utils.zsh

CHAIN_ID=$1
TOKEN_ADDRESS=$2
EXPLORER_URL=$(jq -c '. | select(.chainId=='$CHAIN_ID')' chains.json | head -n 1 | jq -r ".explorers[0].url")

if [ -z $EXPLORER_URL ]; then 
    exit 1
fi

TOKEN_URL="$EXPLORER_URL/token/$TOKEN_ADDRESS"
open $TOKEN_URL


