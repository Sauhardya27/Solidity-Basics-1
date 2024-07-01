//Get funds from users
//Withdraw funds
//Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public myValue = 1;
    uint256 public constant minUSD = 5e18; //5 ETH in wei

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    function fund() public payable {
        //Allow users to send $
        //Have a minimum $ limit that should be sent
        myValue = myValue + 2; //If the next statement gets reverted, then all the above statements would be undone and the gas spent on them will be refunded back

        //require(msg.value > 1e18, "didn't send enough ETH"); //1e18 = 1 ETH

        //What is revert?
        //Undo any action that have been done, and send the remaining gas back

        //require(getConversionRate(msg.value) >= minUSD, "didn't send enough ETH");

        require(msg.value.getConversionRate() >= minUSD, "didn't send enough ETH");

        funders.push(msg.sender); //Store the addresses of all the funders
        addressToAmountFunded[msg.sender] += msg.value;
        //It retrieves the value sent by the same user/function and then updates the value by adding the value of the current transaction to it.
    }

    function withdraw() public {
        //for(/* starting index; ending index; step amount*/) 
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex]; //Taking the address from the funders array
            addressToAmountFunded[funder] = 0; //Reseting the values in the addressToAmountFunded array to 0
        }
        funders = new address[](0); //Reseting the funders array

        //3 Methods to withdraw funds: transfer, send, call
        //Transfer
        //payable(msg.sender).transfer(address(this).balance);

        //Send
        //bool sendSuccess = payable(msg.sender).send(address(this).balance);
        //require(sendSuccess, "Send failed");

        //Call
        //(bool callSuccess, bytes memory dataReturned) = payable(msg.sender).call{value: address(this).balance}("");
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }

    modifier onlyOwner(){
        require(msg.sender == i_owner, "Sender is not owner!");
        _;
    }
}