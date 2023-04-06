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
  --constructor-args "0x2d11ac7205c177ca81fb491c71b92e36176732b91749c42b261d7609ac1b856e" "https://nft.iotex.io/tokens/ivoted/iip13.png" \
  --private-key $PRIVATE_KEY src/MimoFirst1000.sol:MimoFirst1000
```
