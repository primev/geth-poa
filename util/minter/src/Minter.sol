// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Minter {
    // purely for debugging
    uint256 public newMintBalance;
    uint256 public lastMintAmount;
    uint256 public newBurnBalance;
    uint256 public lastBurnAmount;
    address constant MINT = address(0x89);
    address constant BURN = address(0x90);

    function mint(address to, uint256 amount) public {
        bool success;
        (success, ) = MINT.call{value: 0, gas: gasleft()}(abi.encode(msg.sender, to, amount));
        require(success, "Native mint failed");
        lastMintAmount = amount;
        newMintBalance = to.balance;
    }
    function burn(address addrReqBurn, uint256 amount) public {
        bool success;
        (success, ) = BURN.call{value: 0, gas: gasleft()}(abi.encode(msg.sender, addrReqBurn, amount));
        require(success, "Native burn failed");
        lastBurnAmount = amount;
        newBurnBalance = addrReqBurn.balance;
    }
}
