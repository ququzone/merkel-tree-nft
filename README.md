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
// Pippi
//   testnet - 0xC543c0F9D277b95b4361Fe44DbA67d5501d28F8D
//   mainnet - 0xe1Bb99ed442ce6c6ad3806C3afcbd8f7733841A7
forge create --legacy --rpc-url $ETH_RPC_URL \
  --constructor-args "0x9c6fe5972dcb001809d4eabfd9fca128cf8f2a58fee9ff8508f3b4475071a472" "https://nft.iotex.io/tokens/mimo/frenzy_tribe_pippi/metadata.json" 1000 \
  --private-key $PRIVATE_KEY src/MimoFrenzyNFT.sol:MimoFrenzyNFT

// Bimby
//   testnet - 0x6dce88C23a8bfdb7B27fbD114e32b55FcbB9Cc25
//   mainnet - 0xAA5314f9ee6A6711e5284508fEC7F40E85969ed6
forge create --legacy --rpc-url $ETH_RPC_URL \
  --constructor-args "0x28bbf7891cb928989fc4386baa3e06b8960b868634a6bf9aea7c5d63b80ca2e2" "https://nft.iotex.io/tokens/mimo/frenzy_tribe_bimby/metadata.json" 1000 \
  --private-key $PRIVATE_KEY src/MimoFrenzyNFTBimby.sol:MimoFrenzyNFTBimby

// Albie
// testnet - 0x4C96242C5E1176354aA94Ed571841D9aab9C88f6
// mainnet - 
forge create --legacy --rpc-url $ETH_RPC_URL \
  --constructor-args "0x55f8742a265605e92107b88e2d0bc707bcd3e16e210ee92092127998d64dca6b" "https://nft.iotex.io/tokens/mimo/frenzy_tribe_albie/metadata.json" 1000 "Mimo Frenzy Tribe - Albie" "MFTA" \
  --private-key $PRIVATE_KEY src/MimoFrenzyNFTAll.sol:MimoFrenzyNFTAll
```
