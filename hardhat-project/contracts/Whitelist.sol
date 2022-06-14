//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {

  // Max number of whitelisted addresses allowed
  uint8 public maxWhitelistedAddresses;

  // Create a mapping of whitelistedAddresses
  // if an address is whitelisted, we would set it to true, it is false by default for all other addresses.
  mapping(address => bool) public whitelistedAddresses;

  // numAddressessWhitelisted would be used to keep track of how many addresses have been whitelisted
  uint8 public numAddressesWhitelisted;

  // Setting the Max number of whitelisted addresses
  // User will put the value at the time of deployment
  constructor(uint8 _maxWhitelistedAddresses) {
    maxWhitelistedAddresses = _maxWhitelistedAddresses;
  }

  /**
  addAddressToWhitelist - This function adds the address of the sender to the whitelist
  */
  function addAddressToWhitelist() public {
    // Check if the address is already whitelisted
    require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
    // check if the numAddressesWhitelisted is less than the maxWhitelistedAddresses
    require(numAddressesWhitelisted < maxWhitelistedAddresses, "Max number of whitelisted addresses reached");
    whitelistedAddresses[msg.sender] = true;
    numAddressesWhitelisted++;
  }
}