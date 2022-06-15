pragma solidity>0.8.0;//SPDX-License-Identifier:None
interface IERC721{
    function balanceOf(address)external view returns(uint);
}
contract Main{
    struct Clubs{
        address contractAddr;
        address ownerAddr;
    }
    Clubs[]private clubs;
    function addremoveClubs(address a)external{unchecked{
        bool isNew=true;
        for(uint i=0;i<clubs.length;i++)
        if(clubs[i].contractAddr==a){
            if(clubs[i].ownerAddr==msg.sender){
                clubs[i]=clubs[clubs.length-1];
                clubs.pop();
                return;
            }
            isNew=false;
        }
        if(isNew)clubs.push(Clubs(a,msg.sender));
    }}
    function getClubs()external view returns(address[]memory c){
        c=new address[](clubs.length);
        for(uint i=0;i<clubs.length;i++)c[i]=clubs[i].contractAddr;
    }
    function getOwned(address c)external view returns(address[]memory a,uint[]memory b){unchecked{
        uint count;
        for(uint i=0;i<clubs.length;i++)
        if(IERC721(clubs[i].contractAddr).balanceOf(c)>0)count++;
        (a,b)=(new address[](count),new uint[](count));
        count=0;
        for(uint i=0;i<clubs.length;i++){
            uint bal=IERC721(clubs[i].contractAddr).balanceOf(c);
            if(bal>0)(a[count]=clubs[i].contractAddr,b[count]=bal,count++);
        }
    }}
}
