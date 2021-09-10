
var MyUser = artifacts.require("./User.sol");

module.exports = function(deployer) {
  // deployment steps
  deployer.deploy(MyUser);
};
