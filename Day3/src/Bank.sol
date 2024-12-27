// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;


contract Bank{

event DepositEth(address indexed, uint amount);
event WithdrawEth(address indexed, uint amount);
    // Users can to deposit ETH
mapping(address user => uint ethAmount) public balances;


// setter functions

function depositEth() payable external returns (bool){
require(msg.value >=1 ether, "Expected more than 1 ether(s)");
balances[msg.sender] += msg.value;
emit DepositEth(msg.sender, msg.value);
return true;
}

function withdrawEth() external returns(bool) {
    require(msg.sender !=address(0), "You did not have an account with this bank" );
    require(balances[msg.sender] != 0, "oops broker, your balance is zero" );

    (bool success, ) = msg.sender.call{value:balances[msg.sender] }("");
    require(success,"Failed to perform transaction");
    emit DepositEth(msg.sender, msg.value);
    return true;
}
}