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

## Free mint nft

```
// testnet - 0xccA6b4E205D4dD5c2395b17261789FA991c5975E / 0x9Ad32dCaD664FC8e5b835A9a8E5ec93783E85ACd / 0xBa26194FdBf724694f823C4b7F2cE45Df55CF412
// mainnet - 0x7f37290Ea2D4b25Dc92869Ad127c38dB273dF8EE
forge create --legacy --rpc-url $ETH_RPC_URL \
  --constructor-args "Galxe & IoTeX Co-Brand NFT" "GIBT" 1688108000 \
  "https://nft.iotex.io/tokens/galxe/metadata.json" \
  --private-key $PRIVATE_KEY src/FreeMintNFT.sol:FreeMintNFT
```

## Introducing ZKP wallet

```
// testnet - 0xA3Ce183b2EA38053f85A160857E6f6A8C10EF5f7
// mainnet - 
forge create --legacy --rpc-url $ETH_RPC_URL \
  --constructor-args "https://nft.iotex.io/tokens/introducing_zkp/metadata.json" \
  --private-key $PRIVATE_KEY src/ZKPWalletNFT.sol:ZKPWalletNFT
```

## Mgland NFT

```
// testnet - 0x8f5b95c1c6d512A67241EdE19918a5C0789e5bcA
// mainnet - 0x778E131aA8260C1FF78007cAde5e64820744F320
forge create --legacy --rpc-url $ETH_RPC_URL \
  --constructor-args 1689307200 0x8f00c94d617072c8Adca7B65ad5c87839b623061 \
  --private-key $PRIVATE_KEY src/MgLandNFT.sol:MgLandNFT
```

## Alchemy NFT

```
// mainnet - 0x0Ea30721Ae887d5a5bdd95B36497E345868046D9
forge create --legacy --rpc-url $ETH_RPC_URL \
  --constructor-args "Alchemy Pay - IoTeX Co-Brand NFT" "AIT" "https://nft.iotex.io/tokens/mimo/alchemy/metadata.json"  \
  --private-key $PRIVATE_KEY src/OwnedNFT.sol:OwnedNFT

cast send 0x0Ea30721Ae887d5a5bdd95B36497E345868046D9 "batchMint(address[])" \
'[0x71608f639c1ffbba380e5a1905e4a9cf6671e345,0x78a7faed11a85b0268d426f10be94423a9f177c5,0xb0dbdad3baccf39474d474f9881b6da6193b1127,0x582c398779ee40e2fa21ba4a5d9daef6d8d66189,0xcada01977701d80a3ded96b46b6e1c52cada45d4,0xfeb819f2f896172e5612e138fa0260558d22ca86,0x201742a65d394ef42d85626c2e8732c8d941048a,0x93c3763561e0042dec4ad666d90a0c1f8068599f,0xd2f05d05d13497bba887032ffc2c26031639427f,0xdb07cda8cade2d59de0f84e90c296e0d9750567a]' \
  --legacy --private-key $PRIVATE_KEY

cast send 0x0Ea30721Ae887d5a5bdd95B36497E345868046D9 "batchMint(address[])" \
'[0x44ddfa2a35b652031e10b8ca12468d90ca4c81a9,0x3e5e6421b08667d7c06f79b64f096e07fd2e07c1,0xe7c696b1bc214d57cfd2ae8f8451df956b94e0e0,0xa5e2a05809d6fd8c3d52742c356c78c472b0dcf6,0x97b32150be37105516675ff1876c7e1e04faa285,0xe6034e637614b5ce1634d3d417bd300722911e81,0xd70833f39948862234d977771b8e6eaea26a881c,0xfd72b24b9730dff0b879d176b9a8fb3992281c21,0xf4f1a6eadb7793515517363586d9cbecd4077081,0xf74c82de2a5ce44b6a8cc73f83f0b2b650297ebb]' \
  --legacy --private-key $PRIVATE_KEY

cast send 0x0Ea30721Ae887d5a5bdd95B36497E345868046D9 "batchMint(address[])" \
'[0xfecc96386b0907996d7c3c358ca854db90df465e,0x7086547a9d850f588b442caaff4bf18f6f7ef736,0x43ec671f9ae6ab2fe07516410838e748af88efa2,0x2f452b2965af75e9f4440fc0c0967dbecac6b815,0xa0e29a8b968d1caa66203f9c81b25686f7a18f08,0xa5fcbbe3b780bc8f13bb296e2cf3dccf9112e6ad,0x7677bb1c76992f34711a0737e2ba56c9b4e0794f,0xfeed8588af2ba5d18499d97a53de9e2d504d3641,0xa2e09e0a3d31b2a457017f19c0ecd7d225bd374b]' \
  --legacy --private-key $PRIVATE_KEY

cast send 0x0Ea30721Ae887d5a5bdd95B36497E345868046D9 "batchMint(address[])" \
'[0x801F1d4276f9a226E4e04905939F6CfDEc1b6500,0x801F1d4276f9a226E4e04905939F6CfDEc1b6500,0x801F1d4276f9a226E4e04905939F6CfDEc1b6500,0x801F1d4276f9a226E4e04905939F6CfDEc1b6500,0x801F1d4276f9a226E4e04905939F6CfDEc1b6500,0x801F1d4276f9a226E4e04905939F6CfDEc1b6500,0x801F1d4276f9a226E4e04905939F6CfDEc1b6500,0x801F1d4276f9a226E4e04905939F6CfDEc1b6500,0x801F1d4276f9a226E4e04905939F6CfDEc1b6500,0x801F1d4276f9a226E4e04905939F6CfDEc1b6500]' \
  --legacy --private-key $PRIVATE_KEY
```

## BadgeNFT

```
// testnet: 0x15A235808A8A1093b9231aBAa2b7F38e6ce77066
// mainnet: 0xa7779d7a8d6db241d13dd687A12086c016018feb
forge create --legacy --rpc-url $ETH_RPC_URL \
  --constructor-args "https://badge-cdn.iotex.me/badges/"  \
  --private-key $PRIVATE_KEY src/BadgeSBT.sol:BadgeSBT
```

## Multisender

```
// mainnet: 0x77341ed4AdE3F6077Fc9a8c8426153a51c288A68
forge create --legacy --rpc-url $ETH_RPC_URL \
  --constructor-args 0 50  \
  --private-key $PRIVATE_KEY src/multisender/Multisender.sol:Multisender
```
