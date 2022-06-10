pragma solidity>0.8.0;//SPDX-License-Identifier:None
interface IERC721{
    function owner()external view returns(address);
    function balanceOf(address)external view returns(uint);
}
contract Main{
    address[]public clubs;
    function addremoveClubs(address a)external{unchecked{
        require(IERC721(a).owner()==msg.sender);
        for(uint i=0;i<clubs.length;i++)
        if(clubs[i]==a){
            clubs[i]=clubs[clubs.length-1];
            clubs.pop();
            return;
        } 
        clubs.push(a);
    }}
    function getClubs()external view returns(address[]memory){
        return clubs;
    }
    function getOwned()external view returns(address[]memory a,uint[]memory b){unchecked{
        uint count;
        for(uint i=0;i<clubs.length;i++)
        if(IERC721(clubs[i]).balanceOf(msg.sender)>0)count++;
        (a,b)=(new address[](count),new uint[](count));
        count=0;
        for(uint i=0;i<clubs.length;i++){
            uint bal=IERC721(clubs[i]).balanceOf(msg.sender);
            if(bal>0)(a[count]=clubs[i],b[count]=bal,count++);
        }
    }}
}
