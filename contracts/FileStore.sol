// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract FileStore {
  address admin;
  bool active = true;

  mapping (address => string) ownerToFile; 
  constructor() public {
    admin = msg.sender;
  }

  modifier isActive {
    require(active == true);
    _;
  }

  modifier onlyOwner {
    require(msg.sender == admin);
    _;
  }

  function addFile(string memory _cid) public isActive returns (string memory){
    ownerToFile[msg.sender] = _cid;
    return ownerToFile[msg.sender];
  }

  function getFile() public view returns (string memory) {
    return ownerToFile[msg.sender];
  }

  function toggleServiceStatus() public onlyOwner {
    active = !active;
  }
}
