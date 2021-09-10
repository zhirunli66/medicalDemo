//user.sol
//定义用户数据结构
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

//import {AccessControl} from "../node_modules/openzeppelin-solidity/contracts/access/AccessControl.sol";
//import "@openzeppelin/contracts/access/AccessControl.sol";

contract User{

  //bool flag1;
//用户地址
//用户名(非姓名)
//社会保险号
//用户表层密码
//注册时间戳
//用户序号
 //是否有效
 //所有用户地址的集合
 //所有保险号的集合
 //所有用户名的集合
 //用户的角色
struct UserStruct {
      
          address userAddress;     
          string username;        
          string insuranceNo;        
          string userPwd;        
          uint reTime;         
          uint userIndex;       
          bool isValid;
}

address[] public  userAddressSet; 
string[]  private userInsuranceNoSet;  
string[]  private userNameSet;  

mapping(address =>UserStruct) private userAddressToUser;
mapping(string => UserStruct) private insuranceNoToUser;
mapping(string => UserStruct) private usernameToUser;

event CreateUserE(address ad);

     function hasAddress(address _address) public view  returns(bool flag3){
        
       if (userAddressSet.length == 0){
           flag3 = true; //可以注册
       }else{
           
             if(userAddressToUser[_address].isValid==true){ //如果为有效,则不可注册
                 flag3 =false;       
             }else{  //如果不为有效，则可注册
                 flag3 =true;
                   }     
       }    
       return flag3;    
   } 


function createUser1(address _userAddress,string memory uInsuranceNo,string memory uName,string memory pwd) public{


UserStruct memory uss;
address adi;
       
    
   userAddressSet.push(_userAddress);
   userInsuranceNoSet.push(uInsuranceNo);
   userNameSet.push(uName);  
   uint index = userAddressSet.length-1;
   uss =UserStruct(_userAddress,uInsuranceNo,uName,pwd,block.timestamp,index,true);

   userAddressToUser[_userAddress]=uss;
   adi=userAddressToUser[_userAddress].userAddress;
  
   emit CreateUserE(adi);
 
}



function getUser(address _addr)public view returns (string memory) {

  UserStruct memory uss1 =userAddressToUser[_addr];
       
  //  //UserStruct memory us =userAddressToUser[_addr];
   // address adi=uss1.userAddress;
  //  string memory uino = uss1.insuranceNo;
  //  string memory una = uss1.username;
  string memory upwd = uss1.userPwd;
  //  uint ts = uss1.reTime;
  //  uint ui = uss1.userIndex;
  //  bool iv = uss1.isValid;
  

  return upwd;

}

function getUserByUname(string memory _uname)public view returns(address){
    return usernameToUser[_uname].userAddress  ;

}


}




// v1:0x68eb9549FB5611BFd7D07DFE8493aAeB13088D99
// v2: 0x11a9BE4d3854868d20389B0E3Bc840aD696E6dDE
// v3:0x9A03eF263400Dd83B88Ff5FA3D15fC99A383E48C















