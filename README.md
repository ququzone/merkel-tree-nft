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
// mainnet - 0x8cfE8bAeE219514bE529407207fCe9C612E705fD
forge create --legacy --rpc-url $ETH_RPC_URL \
  --constructor-args "0x55f8742a265605e92107b88e2d0bc707bcd3e16e210ee92092127998d64dca6b" "https://nft.iotex.io/tokens/mimo/frenzy_tribe_albie/metadata.json" 1000 "Mimo Frenzy Tribe - Albie" "MFTA" \
  --private-key $PRIVATE_KEY src/MimoFrenzyNFTAll.sol:MimoFrenzyNFTAll

// Gizzy
// testnet - 0x13F156F7730aDA5a2Df7f6F377cF559D3f67D25E
// mainnet - 0x0689021F9065b18c710f5204e41B3d20C3b7D362
forge create --legacy --rpc-url $ETH_RPC_URL \
  --constructor-args "0x1f9a6d7b43679b5a7af02c3f43805c79af262ae21889d79fe361b456cbcf2895" "https://nft.iotex.io/tokens/mimo/frenzy_tribe_gizzy/metadata.json" 1000 "Mimo Frenzy Tribe - Gizzy" "MFTG" \
  --private-key $PRIVATE_KEY src/MimoFrenzyNFTAll.sol:MimoFrenzyNFTAll
```

## W3bstream

```
// testnet 0x5Cf97af7e4fA2aD18fe079B7c6908407739CFDCc
// mainnet 0x8aa9271665e480f0866d2F61FC436B96BF9584AD
forge create --legacy --rpc-url $ETH_RPC_URL \
 --constructor-args 1686168000 1686600000 100 \
   0x4f5Bf4E0606301ac93d568B501E57B7584892D6B \
   "https://nft.iotex.io/tokens/w3bstream/dev_launch/metadata.json" \
 --private-key $PRIVATE_KEY src/W3bstreamDevnetLaunch.sol:W3bstreamDevnetLaunch

forge create --legacy --rpc-url $ETH_RPC_URL \
 --constructor-args 1686558860 1688600000 1 \
   0xBD62fB256F6F6a91B6F14716eA538FD2973E5c3b \
   "https://nft.iotex.io/tokens/w3bstream/dev_launch/metadata.json" \
 --private-key $PRIVATE_KEY src/W3bstreamDevnetLaunch.sol:W3bstreamDevnetLaunch
```

## Verify

```
forge verify-contract --watch --flatten --compiler-version "" --verifier sourcify \
 --constructor-args $(cast abi-encode "constructor(uint256,uint256,uint256,address,string)" 1686168000 1686600000 100 \
   0x4f5Bf4E0606301ac93d568B501E57B7584892D6B \
   "https://nft.iotex.io/tokens/w3bstream/dev_launch/metadata.json") \
 --verifier-url https://iotexscout.io/api 0x8aa9271665e480f0866d2F61FC436B96BF9584AD \
   src/W3bstreamDevnetLaunch.sol:W3bstreamDevnetLaunch

forge flatten --output ./Contract.flattened.sol src/W3bstreamDevnetLaunch.sol
```