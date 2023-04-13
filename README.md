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
  --constructor-args "0x9c6fe5972dcb001809d4eabfd9fca128cf8f2a58fee9ff8508f3b4475071a472" "https://nft.iotex.io/tokens/mimo/frenzy_tribe_pippi/metadata.json" 1000 \
  --private-key $PRIVATE_KEY src/MimoFrenzyNFT.sol:MimoFrenzyNFT

// mainnet - 0xF65096009a76Df3A8d8b35646a24C8450fEE7E7f
forge create --legacy --rpc-url $ETH_RPC_URL \
  --constructor-args "0x9c6fe5972dcb001809d4eabfd9fca128cf8f2a58fee9ff8508f3b4475071a472" "https://nft.iotex.io/tokens/mimo/frenzy_tribe_pippi/metadata.json" 100 \
  --private-key $PRIVATE_KEY src/MimoFrenzyNFT.sol:MimoFrenzyNFT
```
