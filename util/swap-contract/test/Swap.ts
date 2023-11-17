import { token } from "../typechain-types/@openzeppelin/contracts";

const { expect } = require("chai");
const { ethers } = require("hardhat");

async function getTokenContract() {
  const token = await ethers.getContractFactory("Token");
  const deployedContract = await token.deploy();
  return deployedContract;
}

async function getSwapContract(addr : any) {
  const swap = await ethers.getContractFactory("Swap");
  const deployedContract = await swap.deploy( addr );
  return deployedContract;
}

describe("Swap", function () {
  it("", async function () {

    const token = await getTokenContract();
    expect(token.target).to.be.properAddress;

    const swap = await getSwapContract(token.target);
    expect(swap.target).to.be.properAddress;

    // Now fund the Swap contract with 1000 ether
    const [owner, addr1] = await ethers.getSigners();
    const value = ethers.parseEther("1000");
    await owner.sendTransaction({
      to: swap.target,
      value,
    });

    // Balance of the Swap contract should be 1000 ether
    const balance = await ethers.provider.getBalance(swap.target);
    expect(balance).to.equal(value);

    // Confirm owner balance of erc20 tokens is 1000000000000000000000 (see constructor)
    const ownerBalance = await token.balanceOf(owner.address);
    expect(ownerBalance).to.equal(BigInt("1000000000000000000000"));

    // call swapErc20ForEth
    const valueSwap = ethers.parseEther("50");
    await token.approve(swap.target, valueSwap);
    const ethBefore = await ethers.provider.getBalance(owner.address);
    await swap.swapErc20ForEth(valueSwap);
    const ethAfter = await ethers.provider.getBalance(owner.address);
    // expect more eth after the swap, some paid for gas
    expect(ethAfter).to.be.gt(ethBefore);
    console.log("ethBefore", ethBefore);
    console.log("ethAfter", ethAfter);

    // call swapEthForErc20
    const tokenBefore = await token.balanceOf(owner.address);
    const valueSwap2 = ethers.parseEther("5");
    const tx1 = await token.connect(owner).approve(swap, valueSwap2);
    await tx1.wait();
    const tx = await swap.connect(owner).swapEthForErc20({ value: valueSwap2 });
    await tx.wait();
    const tokenAfter = await token.balanceOf(owner.address);
    expect(tokenAfter).to.be.gt(tokenBefore);
    console.log("tokenBefore", tokenBefore);
    console.log("tokenAfter", tokenAfter);

  });
});
