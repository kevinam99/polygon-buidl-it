const FileStore = artifacts.require("./FileStore.sol")
let contractInstance;
(async () =>{
    try {
        contractInstance = await FileStore.deployed()
    }
    catch(error) {
        console.error(error)
    }
})()

contract("FileStore", accounts => {
    it("stores the files with the correct cid", async() =>{
        try {
          const _cid = "some test cid"
          const addFile = await contractInstance.addFile(_cid).call()
          assert.equal(addFile, _cid, "has the correct cid")
          const getFile = await contractInstance.getFiles().call({from: accounts[0]})
          assert.equal(getFile, [_cid], "has the correct cid")
        }
        catch(error) {
            console.error(error)
        }
        
    })

    // it("shares files with another user", async() => {
    //   try {
    //     const _cid = "another test cid to share files"
    //     const addFile = await contractInstance.addFile.call(_cid)
    //     assert.equal(addFile, _cid, "has the correct cid")
    //     console.log(accounts[1])
    //     const sharedFile = await contractInstance.shareFile.call(accounts[1], _cid)
    //     assert.equal(sharedFile, _cid, "has the correct cid")
    //   }
    //   catch(error) {
    //     console.error(error)
    //   }
    // })
})
