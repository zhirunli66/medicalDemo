var TestAccess = artifacts.require("./TestAccess.sol");

module.exports = function(deployer) {
  deployer.deploy(TestAccess);
};
