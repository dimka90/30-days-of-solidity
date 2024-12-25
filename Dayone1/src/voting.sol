// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Vote{

struct Candidate{
    string name;
    uint voteCount;
    uint candidateId;
    }

struct Voter{
    address voter;
    bool hasVoted;
}

uint voterid;
uint candidateId;
mapping(address => Voter)  public voter;
mapping(uint=> Candidate) public candidate;

Candidate[]  candidates;
function registerVoter() external 
{
voter[msg.sender] = Voter(
    {
        voter: msg.sender,
        hasVoted:false
    }
);
}

function addCanditate(string memory name) external returns (bool)

{

candidateId++;
candidate[candidateId] = Candidate({
    name: name,
    voteCount: 0,
    candidateId: candidateId
});
candidates.push(candidate[candidateId]);
return true;
}

function voteforCanditate(uint _candidateID) external returns (bool){
require(candidate[_candidateID].candidateId != 0 , "Candidate does not exist");
require(voter[msg.sender].hasVoted == true ," OOps you can't vote twice");
voter[msg.sender].hasVoted = true; 
candidate[_candidateID].voteCount++;
return true;
}

function getWinner() external view returns (Candidate memory)
{
uint winnerId;
uint maxVote = 0;
for( uint i; i< candidateId; i++)
{
if(candidates[i].voteCount > maxVote){
    maxVote = candidates[i].voteCount;
    winnerId = i;
}
}
return candidates[winnerId];
}
}