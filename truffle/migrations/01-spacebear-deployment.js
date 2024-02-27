const SpaceBear = artifacts.require("Spacebear");

module.exports = function(deployer, network, accounts){
  console.log(network, accounts)
  deployer.deploy(SpaceBear, "0x4aB10fbE398287672b8c48d1f59C741FA9B895eF");
}