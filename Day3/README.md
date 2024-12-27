Challenge: Create a Simple Decentralized Bank
Write a Solidity smart contract that acts as a basic decentralized bank. Users can deposit, withdraw, and check their balances.

Requirements:
Deposit Funds:

Allow users to deposit ETH into the contract.
Store the balance of each user in a mapping.
Withdraw Funds:

Allow users to withdraw their ETH balance.
Ensure users can only withdraw up to the amount they’ve deposited.
Check Balance:

Provide a function for users to check their current balance.
Owner's Features:

Only the contract owner can check the total funds stored in the contract.
Only the contract owner can withdraw any remaining funds in the contract after users have withdrawn theirs.
Additional Constraints:
Prevent the withdrawal of funds if the contract has insufficient balance.
Include appropriate error handling for deposits, withdrawals, and balance checks.
Use modifiers to restrict access to owner-only functions.
Take your time to tackle this! When you're done, explain your solution, and I’ll help you refine it or answer any questions.