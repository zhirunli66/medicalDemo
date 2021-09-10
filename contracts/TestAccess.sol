pragma solidity >=0.4.24 <0.9.0;
import '../node_modules/openzeppelin-solidity/contracts/access/AccessControl.sol';


contract TestAccess is AccessControl{
    bytes32 public constant USER_ROLE = keccak256("USER");
    bytes32 public constant DOCTOR_ROLE = keccak256("DOCTOR");
    bytes32 public constant TEMP_ROLE = keccak256("TEMP");


    // constructor(address root) public{
    //     _setupRole(DEFAULT_ADMIN_ROLE, root);
    //     _setRoleAdmin(USER_ROLE, DEFAULT_ADMIN_ROLE);
    // }

     constructor() public{
         address root = 0x62f7c361D88235Ff5Da45d2acAEbf2b5f92dCB83;
        _setupRole(DEFAULT_ADMIN_ROLE, root);
         _setRoleAdmin(USER_ROLE, DEFAULT_ADMIN_ROLE);
     }


 /***Modifiers*************************************/    

    modifier onlyAdmin(){
        require(isAdmin(msg.sender),"Restricted to admins");
        _;
    }
    modifier onlyUser(){
        require(isUser(msg.sender),"Restricted to Users");
        _;
    }

     modifier onlyDoctoe(){
        require(isDoctor(msg.sender),"Restricted to Doctors");
        _;
    }

    modifier onlyTemp(){
        require(isTemp(msg.sender),"Restricted to Temp");
        _;
    }


/***Functions*********************************/

/********Judge*****************/
    function isAdmin(address account) public virtual view returns(bool){
        return hasRole(DEFAULT_ADMIN_ROLE,account);
    }

    function isUser(address account)public virtual view returns(bool){
        return hasRole(USER_ROLE,account);
    }

    function isDoctor(address account)public virtual view returns(bool){
        return hasRole(DOCTOR_ROLE,account);
    }

    function isTemp(address account)public virtual view returns(bool){
        return hasRole(TEMP_ROLE,account);
    }

/***** Add ***************/
    function addUser(address account)public{
        grantRole(USER_ROLE, account);
    }

    function addDoctor(address account)public virtual onlyAdmin{
        grantRole(DOCTOR_ROLE, account);
    }

    function addTemp(address account)public virtual onlyUser{
        grantRole(TEMP_ROLE, account);
    }

    function addAdmin(address account) public virtual onlyAdmin{
        grantRole(DEFAULT_ADMIN_ROLE, account);
    }

/*******Remove ***************** */
    function removeUser(address account) public virtual onlyAdmin{
        revokeRole(USER_ROLE, account);
    }
    function removeDoctor(address account) public virtual onlyAdmin{
        revokeRole(DOCTOR_ROLE, account);
    }
    function removeTemp(address account) public virtual onlyUser{
        revokeRole(TEMP_ROLE, account);
    }

    function renounceAdmin() public virtual{
        renounceRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }
}