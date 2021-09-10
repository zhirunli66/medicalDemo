module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
     // network_id: "*" // Match any network id
	 network_id:"*"
    },
    develop: {
      port: 8545
    },
	privatenwork:{
		host: "127.0.0.1",
		 port: 8545,
		// network_id: "*" // Match any network id
		network_id:"1997"
	}
  },
  compilers: {
    solc: {
        version: "0.8.7",
        //version:"native",
        //parser:"solcjs"
      //  version:"D:\WinForDev\nodejs\node_global\node_modules\solc"

    }
}
};
