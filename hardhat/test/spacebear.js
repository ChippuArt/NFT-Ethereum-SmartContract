const {expect} = require("chai");
const hre = require("hardhat");
const {loadFixture} = require("@nomicfoundation/hardhat-network-helpers")

describe("Spacebear", function(){
  it("is possible to mint a token", async() => {
    const Spacebear = await hre.ethers.getContractFactory("Spacebear");
    const spacebearInstance = await Spacebear.deploy();
    const [owner, otherAccount] = await ethers.getSigners();
    expect(await spacebearInstance.owner()).to.equal(owner.address);
  })

  it("fails to transfer tokens from the wrong address", async() => {
    const Spacebear = await hre.ethers.getContractFactory("Spacebear");
    const spacebearInstance = await Spacebear.deploy();
    const [owner, otherAccount, notTheNFTOwner] = await ethers.getSigners();
    await spacebearInstance.safeMint(owner.address)

    expect(await spacebearInstance.owner()).to.equal(owner.address);
    await expect(spacebearInstance.connect(notTheNFTOwner).transferFrom(owner.address, notTheNFTOwner.address, 0)).to.be.revertedWith();
  })
})