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

Address:    `0x02Da0B5C80b13b1ec96a844A01A11396E8E27593`

## Validator Accounts (also POA signers)

### Node1

Address:     `0xd9cd8E5DE6d55f796D980B818D350C0746C25b97`

### Node2

Address:     `0x788EBABe5c3dD422Ef92Ca6714A69e2eabcE1Ee4`

## Relayer

Address:     `0x0DCaa27B9E4Db92F820189345792f8eC5Ef148F6`

