// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Minter} from "../src/Minter.sol";

contract MinterTest is Test {
    Minter public counter;

    function setUp() public {
        counter = new Minter();
    }

    function test_mint() public {
        address addr = 0xdCfaD16AF20410D24757d0ae9366e122B55Af405;
        assertEq(counter.newMintBalance(), 0);
        assertEq(counter.lastMintAmount(), 0);
        counter.mint(addr, 100);
        assertEq(counter.lastMintAmount(), 100);
        // assertEq(counter.newBalance(), 100);
        // assertEq(addr.balance, 100); 
    }
    function test_burn() public {
        address addr = 0xdCfaD16AF20410D24757d0ae9366e122B55Af405;
        assertEq(counter.newBurnBalance(), 0);
        assertEq(counter.lastBurnAmount(), 0);
        counter.burn(addr, 100);
        assertEq(counter.lastBurnAmount(), 100);
        // assertEq(counter.newBalance(), 100);
        // assertEq(addr.balance, 100);
    }
}
