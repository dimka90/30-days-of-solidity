// Get action
// Create a Factory Contract
// Create Bidders to ther money
// start bidding
// endbidding
//withdraw

pragma solidity ^0.8.26;
contract Auction{

event Bid(address,string, uint);
event Withdraw(address, uint256);
mapping (address autioneer=> uint256 ethers) public balance;
string itemToAuction;
uint priceofItemToAuction;
uint deadlineOfAuction;

bool bidStatus;
mapping (address => uint256) public highestbidderValue;
address highestbidder;

constructor (string memory _itemToAuction,
            uint _priceofItemToAuction,
            uint _deadlineOfAuction) {
    itemToAuction = _itemToAuction;
    priceofItemToAuction = _priceofItemToAuction;
    deadlineOfAuction = block.timestamp + _deadlineOfAuction;
bidStatus = true;
}

function bid() external payable returns(bool){ 
require(!(block.timestamp>deadlineOfAuction),"Oops Bidding time has expired") ;
if (msg.value > highestbidderValue[highestbidder])
{
highestbidder= msg.sender;
highestbidderValue[highestbidder] = msg.value;
balance[msg.sender] = msg.value;
}
else{
balance[msg.sender] = msg.value;
}
emit Bid(msg.sender,  itemToAuction, msg.value);

return true;

}

function endbid() external  returns(bool){
require(block.timestamp > deadlineOfAuction,"Bidding is still ongoing");

bidStatus = false;

(bool success, ) = highestbidder.call{value: balance[highestbidder] }("");
require(success, "uable to process payment");
return true;

}

function withdraw() external returns (bool) {
    require(msg.sender != address(0), " Error, Address 0");
require(!(balance[msg.sender] == 0 ), "Opps  User did not plance an auction");

(bool success, ) = msg.sender.call{value:balance[msg.sender]}("");
require(success);

emit Withdraw(msg.sender, balance[msg.sender]);

return true;
}
}