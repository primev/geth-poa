# geth-poa

Tool for spinning up a POA ethereum sidechain bridged to goerli via [hyperlane](https://www.hyperlane.xyz/) token warp route.

## TODOs

* add container which stress tests network with txs
* Update to hyperlane v3 once released
* merge branch with local anvil l1 once hyperlane v3 is released -> useful for mev-commit docker testing 

## Key Summary

Testnet private keys are in notion, and need to be copied into an .env.

All relevant accounts are funded on sidechain genesis, you may need to fund these accounts on L1 with faucets. See [hyperlane docs](https://docs.hyperlane.xyz/docs/deploy/deploy-hyperlane#1.-setup-keys).

## Contract deployer

Address:    `0xBe3dEF3973584FdcC1326634aF188f0d9772D57D`

Note if the relayer is emitting errors related to unexpected contract routing, try using a new deployer key pair. It's likely that the current bridge contract deployments are clashing with previous deployments.   

You'd need to replace `Address` above, the allocs field of `genesis.json`, and the `CONTRACT_DEPLOYER_PRIVATE_KEY` in `.env`.

## Validator Accounts (also POA signers)

### Node1

Address:     `0xd9cd8E5DE6d55f796D980B818D350C0746C25b97`

### Node2

Address:     `0x788EBABe5c3dD422Ef92Ca6714A69e2eabcE1Ee4`

## Relayer

Address:     `0x0DCaa27B9E4Db92F820189345792f8eC5Ef148F6`

