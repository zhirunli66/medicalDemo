// var aoe=function() {
//   new_element = document.createElement("script");
//   new_element.setAttribute("src","https://www.npmjs.com/package/bignumber.js");
//   document.body.appendChild(new_element);
// }
//var bignumber= require("https://www.npmjs.com/package/bignumber.js");
App = {

  web3Provider: null,
  contracts: {},

  init: function() {
  //  alert("2");
 //   return App.initWeb3();
  },

  login2 :function() {
    
    //alert("L");
  },

/*加载web3*/

//upload web3
//alert("5");

  // initWeb3: function() {
  //   if (typeof web3 !== 'undefined') {
  //        App.web3Provider = web3.currentProvider
  //        ethereum.enable();//apply for log in
  //        web3 = new Web3(App.web3Provider);
  //    } else {
  //        App.web3Provider = new Web3.providers.HttpProvider("http://localhost:8545")
  //        ethereum.enable();
  //        web3 = new Web3(App.web3Provider);
  //    }
  //    return App.initContract();
  // },


  
/*初始化合约，获取合约，不需要使用at()的方式；
  显示合约的姓名和年龄信息*/
  // initContract: function() {

  //   $.getJSON('InfoContract.json', function(data){
  //     App.contracts.InfoContract = TruffleContract(data);
  //     App.contracts.InfoContract.setProvider(App.web3Provider);

  //     App.getInfo();
  //     App.watchChanged();
  //   });

  //   App.bindEvents();

  // },

  // getInfo: function() {
  //   App.contracts.InfoContract.deployed().then(function(instance) {
  //     alert("123");
  //     return instance.getInfo.call();
  //   }).then(function(result) {
  //     $("#loader").hide();
  //     $("#info").html(result[0]+' ('+result[1]+' years old)');
  //     console.log(result);
  //   }).catch(function(err) {
  //     alert("Wrong");
  //     console.error(err);
  //   });
  // },

/*点击按钮更新姓名和年龄，则需要更新到智能合约上*/
  // bindEvents: function() {
    
  //   $("#buttonT").on('click','btn-adopt',App.getData);
  //   $("#button").click(function() {
  //       $("#loader").show();
  //       alert("f");

  //       App.contracts.InfoContract.deployed().then(function(instance) {
  //         return instance.setInfo($("#name").val(), $("#age").val(), {gas: 500000});
  //       }).then(function(result) {
  //         return App.getInfo();
  //       } ).catch(function(err) {
  //         console.error(err);
  //       });
  //     });
  // },

  

//   watchChanged: function() {
//     App.contracts.InfoContract.deployed().then(function(instance) {
//       var infoEvent = instance.Instructor();
//       return infoEvent.watch(function(err, result) {
//         $("#loader").hide();
//         $("#info").html(result.args.name +' ('+ result.args.age +' years old)');
//       });
//     });
//   }
// ,

  getData:function(){
    var a = 456;
   // alert(a);
  }

  }



$(function(){
  $(window).load(function() {
    //alert("T");
    //  App.init();
  });
});