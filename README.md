# 🔎🎩 Alfred token search

An [Alfred](https://www.alfredapp.com/) workflow that makes it easy to search for tokens across chains, copy their address to the clipboard and open them on relevant explorers.

<div width="100%" align="center">
<img width="500" src="https://user-images.githubusercontent.com/1993348/224454546-ec8f5dc4-5fb6-427a-9321-971b3ffb69c9.gif" />
</div>

## Usage

    token [chain_id] [token_name(optional)]
    token [token_name] [chain_id(optional)]
    
    token USDC --> Find cross chain USDC tokens
    token 1 --> Find tokens on Mainnet
    token 137 --> Find tokens on Polygon
    token 137 USDC --> Find tokens containing USDC on Polygon

    return (↵) : Copy the selected address to your clipboard.
    cmd + return (⌘↵) : Show in explorer ( Etherscan based only at the moment )

## Adding to Alfred 
### Prerequisites
[jq](https://stedolan.github.io/jq/download/) should be available at ``/usr/local/bin/jq``

### Download Workflow
Check out [releases](https://github.com/bbenzikry/alfred-token/releases)

### Build locally
```bash
# Create output folder and zip into workflow
./scripts/build.sh 
```

## More info
- PNGs are optimized with ``pngquant``
- Token data is populated from [viaprotocol/tokenlists](https://github.com/viaprotocol/tokenlists)
- Chain data is populated from [ethereum-lists/chains](https://github.com/ethereum-lists/chains)


<div align="center">
Did this help you out? 
<p>
donations: <a href="https://etherscan.io/address/0x10c97e3e727cb3ee0bafb4f99f63225525150a35">bbenzikry.eth</a>
</p>
</div>

