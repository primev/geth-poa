// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Minter {
    uint256 public newBalance;
    uint256 public lastAmount;
    address constant TRANSFER = address(0x89);

    function mint(address to, uint256 amount) public {
        bool success;
        (success, ) = TRANSFER.call{value: 0, gas: gasleft()}(abi.encode(msg.sender, to, amount));
        require(success, "Native mint failed");
        lastAmount = amount;
        newBalance = to.balance;
    }
}
