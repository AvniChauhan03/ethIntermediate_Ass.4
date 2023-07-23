const hre = require("hardhat");
const { ethers } = require("ethers");

async function main() {
  // Get the MyToken smart contract (modified from DegenToken)
  const MyToken = await hre.ethers.getContractFactory("MyToken");

  // Deploy it
  const myToken = await MyToken.deploy();
  await myToken.deployed();

  // Display the contract address
  console.log(`MyToken deployed to ${myToken.address}`);

  // Listen for the ItemRedeemed event (modified from PrizeRedeemed)
  const contract = new ethers.Contract(myToken.address, MyToken.interface, hre.ethers.provider);
  contract.on("ItemRedeemed", (account, itemId) => {
    console.log(`User ${account} redeemed Item ${itemId}.`);
    // You can update your frontend UI or perform any other actions here.
  });

  // Now you can interact with the contract, mint tokens, transfer, redeem items, etc.
  // For example:
  // const signer = await hre.ethers.getSigners();
  // const address = await signer[0].getAddress();
  // const balanceBefore = await myToken.getMyTokenBalance(address);
  // console.log(`Account ${address} balance before redeeming: ${balanceBefore}`);
  // await myToken.redeemItem(1); // Redeem the first item
  // const balanceAfter = await myToken.getMyTokenBalance(address);
  // console.log(`Account ${address} balance after redeeming: ${balanceAfter}`);
}

// Hardhat recommends this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});