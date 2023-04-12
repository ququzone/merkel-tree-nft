# Merkel tree NFT

## Local Development

The following assumes the use of `node@>=12`.

### Install Dependencies

`yarn`

### Compile Contracts

`yarn compile`

### Run Tests

`yarn test`

### Deploy

```
// testnet
forge create --legacy --rpc-url $ETH_RPC_URL \
  --constructor-args "0x178de26c9dc3edee5cd861a652b6baf1341df115dcf2774d7998a1450b304503" "https://nft.iotex.io/tokens/ivoted/iip13.png" \
  --private-key $PRIVATE_KEY src/MimoFrenzyNFT.sol:MimoFrenzyNFT

// mainnet - 0xF65096009a76Df3A8d8b35646a24C8450fEE7E7f
forge create --legacy --rpc-url $ETH_RPC_URL \
  --constructor-args "0x1df393cbad523f85ae2f8b04414e53d8148793b13d26242e1e9fa64f2bbc1aa8" "https://nft.iotex.io/tokens/mimo/frenzy_tribe_pippi/metadata.json" \
  --private-key $PRIVATE_KEY src/MimoFrenzyNFT.sol:MimoFrenzyNFT
```
