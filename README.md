# FundMe - Secure Crowdfunding Smart Contract

## Introduction

FundMe is a Solidity smart contract that facilitates a secure and transparent crowdfunding platform. Users can deposit funds (USD-denominated) to contribute to a campaign, with a minimum funding requirement to ensure project viability. The contract owner can then withdraw the collected funds.

## Features

- **USD-based contributions:** Leverages Chainlink's oracles to convert ETH deposits to USD value, ensuring contributors send the required minimum amount.
- **Minimum funding threshold:** Enforces a minimum contribution amount to safeguard against low-value contributions.
- **Transparent recordkeeping:** Tracks the addresses and contributions of all funders.
- **Secure withdrawal:** Allows the contract owner to withdraw all accumulated funds securely.
- **Owner control:** Only the contract owner can initiate withdrawals using a modifier.

## Technology Stack

- **Solidity:** The smart contract programming language.
- **Chainlink:** Provides decentralized price feeds for accurate ETH-USD conversion.

## Installation

1. Clone this repository.
2. Install required dependencies using a package manager like `npm`.

## Deployment

1. Choose a suitable blockchain network for deployment (e.g., Ethereum testnet).
2. Use a development framework like Truffle or Hardhat to compile and deploy the contract.

## Usage

1. **Contributors:** Send a minimum of `5 ETH` (equivalent to `$5` USD) to the contract address.
2. **Contract Owner:** Withdraw the collected funds once the campaign goal is reached.

## License

This project is licensed under the MIT License.

## Disclaimer

This smart contract is provided for educational purposes only. Before using it in a production environment, thoroughly audit and test it for security vulnerabilities.
