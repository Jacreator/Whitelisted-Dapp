const { ethers } = require("hardhat");

async function main() {
  /*
  A ContractFactory in ethers.js is an abstraction used to deploy new smart contracts,
  so whitelistContract here is a factory for instances of our Whitelist contract.
  */
 const whitelistContract = await ethers.getContractFactory("Whitelist");

 // here we deploy the contract and 10 is the max number of whitelisted addresses allowed
  const deployedWhitelistContract = await whitelistContract.deploy(10);

  // wait for it to finish deploying
  await deployedWhitelistContract.deployed();

  console.log(
    "Whitelisted Contract Address: ",
    deployedWhitelistContract.address
  );
}

// call the main function and catch any errors
main()
.then(() => process.exit(0))
.catch((error) => {
  console.error(error);
  process.exit(1);
  });