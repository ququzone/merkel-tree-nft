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
forge create --legacy --rpc-url $ETH_RPC_URL \
  --constructor-args "0x178de26c9dc3edee5cd861a652b6baf1341df115dcf2774d7998a1450b304503" "https://nft.iotex.io/tokens/ivoted/iip13.png" \
  --private-key $PRIVATE_KEY src/MimoFrenzyNFT.sol:MimoFrenzyNFT
```
