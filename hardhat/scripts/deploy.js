(async ()=>{
  try {
    const Spacebear = await hre.ethers.getContractFactory("Spacebear");
    const spacebearInstance = await Spacebear.deploy();

    console.log(`Deploy contract at ${spacebearInstance.address}`);
    await spacebearInstance.safeMint(spacebearInstance.owner())
    
  } catch (error) {
    console.error(error);
    process.exitCode = 1;
  }
})()