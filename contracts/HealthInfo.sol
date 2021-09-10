pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

//import {IterableMapping} from "./IterableMapping.sol";
//import {AccessControl} from "../node_modules/openzeppelin-solidity/contracts/access/AccessControl.sol";
//import   './IterableMapping.sol';
//import {User} from './User.sol';



contract HealthInfo{


   // using IterableMapping for IterableMapping.Map;
  //  IterableMapping.Map private map;

    struct HealthStruct{

          address userAddress;
          string startTime; //时间
          uint[6] symSet; //症状
          string bodyTemp;//体温       
          uint index;
          bool   isValid;
          
          

    }

    uint[] indexSet; //临时存储用
    string[] timeSet; //临时存储用
    string[] tempSet; //临时存储用
    HealthStruct[] private healthSet;

  //  address[] addrSet;

    mapping(address =>HealthStruct) addressToStruct;
    mapping(uint =>HealthStruct)  indexToStruct;

   

    event StorageF(uint t0); 
    event ShowList(uint[] uintSet, string[] timeSet,string[] tempSet); 
    



//
function addHealth(address _ad,uint[6] memory _sym,string memory _stime, string memory _pcode)public {
  HealthStruct memory hs;
  uint index= healthSet.length;
  hs= HealthStruct(_ad,_stime,_sym,_pcode,index,true);

  healthSet.push(hs);



  //uint t0= hs.symSet[0];

  addressToStruct[_ad]=hs;
  indexToStruct[index]=hs;

  //emit StorageF(t0);
  
}
// 
function findSym(address _ad) public view returns(uint){
    uint[6] memory tset=addressToStruct[_ad].symSet;
    uint t0 = tset[0];

    return t0;
}

function findById(uint id) public view returns(string memory,uint[6] memory,string memory){
    HealthStruct memory hs=indexToStruct[id];

    return (hs.startTime,hs.symSet,hs.bodyTemp);
}

function showList(address _ad)public{

  uint len=indexSet.length; 
    if(len >0){
      delete indexSet;
      delete timeSet;
      delete tempSet;
    }

    for(uint i=0;i<healthSet.length;i++){
      if(healthSet[i].userAddress==_ad ){
        indexSet.push(i);
        timeSet.push(healthSet[i].startTime);
        tempSet.push(healthSet[i].bodyTemp);
      }
    }

  emit ShowList(indexSet,timeSet,tempSet);

}


//function findByAddress()



//存储
/******************************** 
    function storeHash(address _addr,string memory _fileHash,string memory _fileName,string memory _fileTime) public {

        FormStruct memory ps;

        bool returnFlag =true;

        //hash判重
        if(map.insertedHash[_fileHash]!=true){ //如果不存在hash

           //   ps= FormStruct(_addr,_fileName,_fileHash,_fileTime,map.size(),true);
              map.set(_addr, _fileHash);                        
              hashToStruct[_fileHash]=ps;
        }else{       //如果已存在Hash,则判错。因为不应该出现这种情况
          returnFlag = false;
        }
     
        uint msize =  map.size();
        emit StorageE(_addr,returnFlag,msize);

    }

    ***************/

//按address查询返回
/******************

   function showList(address _addr) public{


   //清空临时存储
    uint len=indexSet.length; 
    if(len >0){
      delete indexSet;
    }


    for (uint i=0;i<map.size();i++){

           if(map.values[i]==map.indexOf[_addr]){
                indexSet.push(i);
           }
   }

      uint hsize = indexSet.length;

      emit StorageU(indexSet,hsize);
  
  }

  **************/
/******************
   function getHashByPid(uint _pid)public view returns(string memory){
         return map.hashs[_pid] ;
  }
 

*************/
    //  function hasAddress(address _addr)public view returns(bool) {
    //       if(addressToStruct[_addr].isValid!=true){
    //           return true;
    //       }else{
    //           return false;
    //       }

    // }


    //  function getAddressByHash(string memory newhash)public view returns(address){
    //    return hashToAddress[newhash];
    //  }

 

    //  function getHashByAddress(address _addr)public view returns(string memory){
    //    return addressToStruct[_addr].fileHash;
    //  }
     

    

    // function getHashByUid(uint uid) public view returns(string memory){
    //     uint pid = uIdToPid[uid];
    //     string memory phash= photoSet[pid];
    //     return phash;
    // }




 

   
/********************** 
  function sum0(address _addr) public view returns  (uint[] memory)
  {
  
  uint s=0;
  uint[] memory temp;
        for (uint i = 0; i < map.size(); i++) {

            address key = map.getKeyAtIndex(i);
           // uint vv=map.get(key) ;

            if(key==_addr){
            temp[i]=uint(i);
            s++;
        }else{
          temp[i]=uint(6);
        }
      
        }

    return temp;
  }
****************/

/************* 
function sum1() public pure returns  (uint[] memory)
  {
  
 uint a=1;
 uint b=2;
 uint c=3;
 uint d=4;
 uint e=5;

uint[] memory temp =new uint[](1) ;
  temp[0] = a;
  temp[1] = b;     

    return temp;
  }

   function sum2(address _addr) public view returns  (uint )
  {
  
  uint s=0;
  //uint count=0;
  uint[] memory temp;
        for (uint i = 0; i < map.size(); i++) {

            address key = map.getKeyAtIndex(i);
           // uint vv=map.get(key) ;

            if(key==_addr){
            temp[i]=uint(i);
            s++;
        }else{
          temp[i]=uint(6);
          s=10;
        }
      
        }

    return s;
  }
****************/
/**************
   function sum5() public
  {
    //indexSet.push()
    uint len=indexSet.length;

    if(len >0){
      // for (uint c=0;c<len;c++){
      //   indexSet[c] =  indexSet[c+1];
      // }

      delete indexSet;
      indexSet.push(uint(8));

    }else{
           for(uint i=0;i<uint(5);i++){        
          //indexSet[i]=0;
           indexSet.push(uint(6));
    }
    }

    emit StorageU(indexSet);

    // return indexSet;

    
  }

******************/
     // function hasHash(string memory ipfsHash)public view returns(bool) {
    //       if(hashToStruct[ipfsHash].isValid!=true){ //如果不等于true，说明没存过，返回可以存
    //           return true;
    //       }else{
    //           return false;
    //       }

    // }





}