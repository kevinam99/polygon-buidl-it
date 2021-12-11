const FileStore = artifacts.require("./FileStore.sol")
let tokenInstance;
(async () =>{
    try {
        tokenInstance = await FileStore.deployed()
    }
    catch(error) {
        console.error(error)
    }
})()

contract("FileStore", accounts => {
    it("initialises the contract with the correct values", async() =>{
        try {
          const _cid = "some test cid"
            const addFile = await tokenInstance.addFile.call(_cid)
            assert.equal(addFile, _cid, "has the correct cid")
            const getFile = await tokenInstance.getFile()
            assert.equal(getFile, _cid, "has the correct cid")
        }
        catch(error) {
            console.error(error)
        }
        
    })
})
