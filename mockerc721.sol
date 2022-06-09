pragma solidity>0.8.0;//SPDX-License-Identifier:None
contract ERC721AC{
    address internal _owner;
    mapping(address=>uint)internal _balances;
    constructor(){
        _owner=msg.sender;
    }
    function balanceOf(address a)external view returns(uint){
        return _balances[a];
    }
    function owner()external view returns(address){
        return _owner;
    }
    function mint()external{unchecked{
        _balances[msg.sender]+=1;
    }}
}