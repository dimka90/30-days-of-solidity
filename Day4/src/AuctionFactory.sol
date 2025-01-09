
pragma solidity ^0.8.26;

import {Auction} from "./Auction.sol";

contract AuctionFactory{

event CreateAucion(string, uint, uint);
    Auction[] public auctions;
    uint count;
function createContract(
    string memory _itemToAuction,
    uint256 _priceofItemToAuction,
    uint _deadlineOfAuction
) external returns(bool)
{
auctions.push(new Auction( _itemToAuction,_priceofItemToAuction, _deadlineOfAuction));
count++;
emit CreateAucion(_itemToAuction, _priceofItemToAuction, _deadlineOfAuction);
return true;
}
function getAllAuctions() external view returns(Auction[] memory){
return auctions;
}
}