Write a Solidity smart contract for a simple lottery system. The contract should include the following functionalities:

Requirements:
Enter the Lottery:

Allow users to enter the lottery by sending a fixed amount of ETH (e.g., 0.1 ETH).
Store the participants’ addresses in an array.
Pick a Winner:

Only the contract owner can pick a winner.
Use a randomness mechanism (e.g., keccak256 with a block hash) to select a random participant as the winner.
Payout:

Transfer the entire balance of the contract to the winner.
Reset the Lottery:

After picking a winner, reset the participant list so the lottery can start again.
Additional Constraints:
Include a modifier to restrict certain actions (e.g., only the owner can pick a winner).
Prevent users from entering if they don’t send the required ETH amount.
Handle cases where there are no participants before picking a winner.