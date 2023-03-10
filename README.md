# 🔎🎩 Alfred token search

An [Alfred](https://www.alfredapp.com/) workflow that makes it easy to search for tokens and copy their address to the clipboard.
Supports multiple chains.

<div width="100%" align="center">
<img width="500" src="https://user-images.githubusercontent.com/1993348/224241747-30050353-a348-4fe0-9486-7b4a7cb2455c.gif" />
</div>

## Usage
Type a combination of chain id and token name, to find an address and copy it.

    token [chain_id] [token_name(optional)]
    token [token_name] [chain_id(optional)]
    
    token USDC --> Find cross chain USDC tokens
    token 1 --> Find tokens on Mainnet
    token 137 --> Find tokens on Polygon
    token 137 USDC --> Find tokens containing USDC on Polygon

return (↵) : Copy the selected address to your clipboard.
cmd + return (⌘↵) : Show in explorer ( Etherscan based only at the moment )

## Adding to Alfred 

### Download Workflow
Check out [releases](https://github.com/bbenzikry/alfred-token/releases)

## Notes
As the [index file](./tokens.json) is based on existing token lists, some tokens / icons are not available.

PNGs are optimized with ``pngquant``

<div align="center">
Did this help you out? 
<p>
donations: <a href="https://etherscan.io/address/0x10c97e3e727cb3ee0bafb4f99f63225525150a35">bbenzikry.eth</a>
</p>
</div>

