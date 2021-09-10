//pragma solidity ^0.8.3;
pragma solidity >=0.4.22 <0.9.0;
library IterableMapping {
    // Iterable mapping from address to uint;
    struct Map {
        address[] keys;
        string [] hashs;
     //   mapping(address => uint) values;
        mapping(uint => uint) values;
        mapping(address => uint) indexOf;
        mapping(address => bool) inserted;  //标记hash是否存储过

     //   mapping(address => uint) values;
        mapping(string => bool) insertedHash;  //标记hash是否存储过
    }

    function getKeyAtIndex(Map storage map, uint index) public view returns (address) {
        return map.keys[index];
    }

    function size(Map storage map) public view returns (uint) {
         return map.hashs.length;
     }

    function set(
        Map storage map,
        address key,
      //  uint val,

        string memory hash
    ) public {
        
            if(map.inserted[key]){ //如果地址添加过
                 map.values[map.hashs.length] = map.indexOf[key];

            }else{      //如果地址没添加过
                map.inserted[key] = true;
                map.indexOf[key] = map.keys.length;
                map.values[map.hashs.length] = map.keys.length;
                map.keys.push(key); //把地址塞进地址数组中
            }

           map.hashs.push(hash); //直接塞进去
    }


/*********************
    function remove(Map storage map, address key) public {
        if (!map.inserted[key]) {
            return;
        }

        delete map.inserted[key];
        delete map.values[key];

        uint index = map.indexOf[key];
        uint lastIndex = map.keys.length - 1;
        address lastKey = map.keys[lastIndex];

        map.indexOf[lastKey] = index;
        delete map.indexOf[key];

        map.keys[index] = lastKey;
        map.keys.pop();
    }

    ****************/
}
