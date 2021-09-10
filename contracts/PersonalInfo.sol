pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

//import {IterableMapping} from "./IterableMapping.sol";
//import {AccessControl} from "../node_modules/openzeppelin-solidity/contracts/access/AccessControl.sol";
//import   './IterableMapping.sol';
//import {User} from './User.sol';



contract PersonalInfo{


   // using IterableMapping for IterableMapping.Map;
  //  IterableMapping.Map private map;

    struct PersonalStruct{

          address userAddress;
          string contact; //时间
          string postcode; //时间
          string gender; //时间
          uint age; //时间
          uint[4] basicSet; //症状
          uint index;
          bool   isValid;
          
          

    }

    uint[] indexSet; //临时存储用
    string[] stringSet; //临时存储用
    PersonalStruct[] private personalSet;

  //  address[] addrSet;

    mapping(address =>PersonalStruct) addressToStruct;
    mapping(uint =>PersonalStruct)  indexToStruct;

   

    event StorageF(uint t0); 
    event ShowList(uint[] uintSet, string[] strSet); 
    


function addPersonal(address _ad,string memory _contact,uint _age,string memory _gender,uint[4] memory _bSet, string memory _pcode)public {
  PersonalStruct memory hs;
  uint index= personalSet.length;
  hs= PersonalStruct(_ad,_contact,_pcode,_gender,_age,_bSet,index,true);

  personalSet.push(hs);



  //uint t0= hs.symSet[0];

  addressToStruct[_ad]=hs;
  indexToStruct[index]=hs;

  //emit StorageF(t0);
  
}
// 
function findBasic(address _ad) public view returns(uint){
    uint[4] memory tset=addressToStruct[_ad].basicSet;
    uint t0 = tset[0];

    return t0;
}

function findById(uint id) public view returns(string memory,uint[4] memory,string memory){
    PersonalStruct memory hs=indexToStruct[id];

    return (hs.contact,hs.basicSet,hs.gender);
}

function showList(address _ad)public{

  uint len=indexSet.length; 
    if(len >0){
      delete indexSet;
      delete stringSet;
    }

    for(uint i=0;i<personalSet.length;i++){
      if(personalSet[i].userAddress==_ad ){
        indexSet.push(i);
      //  stringSet.push(personalSet[i].startTime);
      }
    }

  emit ShowList(indexSet,stringSet);

}


}