pragma solidity>0.8.0;//SPDX-License-Identifier:None
interface IERC721{
    function owner()external view returns(address);
}
contract Main{
    address[]public clubs;
    function addClubs(address a)external{
        require(IERC721(a).owner()==msg.sender);
        clubs.push(a);
    }
    function removeClubs(address a)external{
        require(IERC721(a).owner()==msg.sender);
        for(uint i=0;i<clubs.length;i++)
        if(clubs[i]==a){
            clubs[i]=clubs[clubs.length-1];
            clubs.pop();
            return;
        }
    }
}