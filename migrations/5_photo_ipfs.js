const IterableMapping = artifacts.require("./IterableMapping.sol");
const PhotoIpfs = artifacts.require("./PhotoIpfs.sol");

module.exports = function(deployer) {

  deployer.deploy(IterableMapping);
  deployer.link(IterableMapping, PhotoIpfs);
  deployer.deploy(PhotoIpfs);
  

};


// const ConvertLib = artifacts.require("ConvertLib");
// const MetaCoin = artifacts.require("MetaCoin");

// module.exports = function(deployer) {
//   deployer.deploy(ConvertLib);
//   deployer.link(ConvertLib, MetaCoin);
//   deployer.deploy(MetaCoin);
// };