import { utils } from "ethers"
import AccountTree from "./account-tree"

const { isAddress, getAddress } = utils

// This is the blob that gets distributed and pinned to IPFS.
// It is completely sufficient for recreating the entire merkle tree.
// Anyone can verify that all air drops are included in the tree,
// and the tree has no additional distributions.
interface MerkleDistributorInfo {
    merkleRoot: string
    claims: {
        [account: string]: {
            index: number
            proof: string[]
        }
    }
}

export function parseAccountMap(whitelist: string[]): MerkleDistributorInfo {
    const dataByAddress = whitelist.reduce<{ [address: string]: boolean }>((memo, account) => {
        if (!isAddress(account)) {
            throw new Error(`Found invalid address: ${account}`)
        }
        const parsed = getAddress(account)
        if (memo[parsed]) throw new Error(`Duplicate address: ${parsed}`)

        memo[parsed] = true
        return memo
    }, {})

    const sortedAddresses = Object.keys(dataByAddress).sort()

    // construct a tree
    const tree = new AccountTree(sortedAddresses.map((address) => ({ account: address })))

    // generate claims
    const claims = sortedAddresses.reduce<{
        [address: string]: { index: number; proof: string[] }
    }>((memo, address, index) => {
        memo[address] = {
            index,
            proof: tree.getProof(index, address),
        }
        return memo
    }, {})

    return {
        merkleRoot: tree.getHexRoot(),
        claims,
    }
}
