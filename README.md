# MyToken

MyToken is a Solidity smart contract that implements an ERC20 token.

## Description

MyToken is a Solidity smart contract that implements an ERC20 token called MyToken (symbol: AC). The contract provides basic functionalities for minting, transferring, and burning tokens, with ownership control for minting and an external function to check balances.

## Features

Minting: The contract owner can mint new tokens and assign them to a specified recipient address.

Transferring: Token holders can transfer  tokens to other addresses while ensuring the transfer amount is greater than zero.

Burning: Token holders can burn a specific amount of tokens to reduce their balance.

Balance Checking: An external function allows anyone to check the token balance of a specific account.

## Getting Started

### Installing

To run the contract, follow these steps:

1. Install the project dependencies by running the following command:

   ```bash
   npm i
   ```

2. Install 'hardhat' by running the command:
   
   ```bash
   npm install --save-dev hardhat
   ```

3. Install OpenZeppelin:

   ```bash
    npm install @openzeppelin/contracts
    ```


4. Deploy the DegenToken smart contract to Fuji (C-Chain) Network by running the deployment script:

     ```bash
     npx hardhat run scripts/deploy.js --network fuji
      ```

### Executing program

* Go to [remix](remix.ethereum.org) IDE.
* Paste the contract in the IDE.
* Compile the contract.
* Select the `Injected Provider - Metamask` as the environment in Deploy tab.
* Paste you contract address in remix and click on `Deploy`.
* Interact with your contract in remix!!

## Authors

Avni Chauhan

@AvniChauhan03


## License

This code is released under the MIT License. Feel free to use, modify, and distribute it as per the terms of the license.

