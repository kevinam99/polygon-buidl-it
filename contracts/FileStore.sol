// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FileStore {
  address admin;
  bool active = true;

  mapping (address => string[]) public ownerToFiles; 
  mapping (string => address[]) public fileToOwners;
  mapping (address => mapping(address => string[])) public sharedFiles;
  
  constructor() public {
    admin = msg.sender;
  }

  modifier isActive {
    require(active == true, "Service inactive");
    _;
  }

  modifier onlyOwner {
    require(msg.sender == admin, "This user has no access");
    _;
  }

  function addFile(string memory _cid) public isActive returns (string[] memory){
    ownerToFiles[msg.sender].push(_cid);
    fileToOwners[_cid].push(msg.sender);
    return ownerToFiles[msg.sender];
  }

  function getFile(string memory _cid) public isActive view returns (string memory) {
    string[] memory files = getFiles();
    for(uint i = 0; i < files.length; i++) {
      if(keccak256(abi.encodePacked(files[i])) == keccak256(abi.encodePacked(_cid))) {
        return files[i];
      }
    }
  }

  function getFiles() public isActive view returns (string[] memory) {
    return ownerToFiles[msg.sender];
  }

  function toggleServiceStatus() public onlyOwner {
    active = !active;
  }

  function getFilesFor(address _for) public isActive view returns (string[] memory) {
    return ownerToFiles[_for];
  }

  function shareFile(address _with, string memory _cid) public isActive returns (string[] memory) {
    require(keccak256(abi.encodePacked(getFile(_cid))) == keccak256(abi.encodePacked(_cid)));

    sharedFiles[msg.sender][_with].push(_cid);
    ownerToFiles[_with].push(_cid);
    fileToOwners[_cid].push(_with);
    return sharedFiles[msg.sender][_with];
    
  }
}
