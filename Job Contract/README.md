This is a smart contract for a job that start with the block timestamp when contract is deployed and ends in exactly 1 year.
The salary is 2.5Eth per month.

The paySalary function allows the employer to pay the salary, and the getSalary function allows both parties to check the amount of salary. 
The isValid function returns true if the current time is within the start and end time of the contract, otherwise false.
