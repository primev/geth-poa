## Minter foundry project

To test out the minter contract, use the following commands:

`forge create --rpc-url http://localhost:8545 --private-key <PRIVATE_KEY> src/Minter.sol:Minter`

`cast send --rpc-url http://localhost:8545 --private-key <PRIVATE_KEY> <MINTER_CONTRACT_ADDR> "mint(address,uint256)" <ACCOUNT_TO_MINT_TO> <AMOUNT>`

`cast balance <ACCOUNT_TO_MINT_TO>`

`cast call 0x7F73fee83e658a8bDAe32baDd30deBcc0C0607c0 "newBalance()(uint256)"`
