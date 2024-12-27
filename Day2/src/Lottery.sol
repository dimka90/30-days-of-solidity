// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Lotter{
// address of users in array
address[] participants;
address owner;

uint winnerindex;

modifier onlyOnwer()
{
    require(msg.sender == owner,"Expected user to be Onwer");
    _;
}

constructor () {
    owner =msg.sender;
}
event EtherReceived(address indexed, uint amount);
event WithdrawEther(address, uint amount);
function getUserEther() external payable returns (bool){
    require(msg.value >=0.1 ether, "Expected 0.1 eth");
    participants.push(msg.sender);
    emit EtherReceived(msg.sender, msg.value);
    return true;
}
function getWinner() external  onlyOnwer returns (bool){
uint256 randomIndex = uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp))) % participants.length;

payable(participants[randomIndex]).transfer(address(this).balance);
delete participants;
emit WithdrawEther(participants[randomIndex], address(this).balance);
return true;

}

}
