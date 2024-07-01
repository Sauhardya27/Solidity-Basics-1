// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getPrice() internal view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306); //This line initializes an instance of the AggregatorV3Interface pointing to the price feed contract at the specified address.

        (, int256 price, , , ) = priceFeed.latestRoundData(); //The function returns multiple values (refer github) but only the price is captures which can be both positive or negative

        return uint256(price * 1e10); //price variable has only 8 decimal places while 1 ETH has 18 decimal places. So we multiply it with 10 decimal places and typecast it into unsigned int.
    }
    //3449089480000000000000 Since 1 ETH = 10^18 wei, so to get the answer in $, put decimal after 18 zeroes from right
    //$3449.089480000000000000

    function getConversionRate(uint256 ethAmount) internal view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountUsed = (ethPrice * ethAmount)/1e18; //ethPrice (in wei), ethAmount (in wei), so (10^18 * 10^18)/10^18 
        return ethAmountUsed;
    }

    function getVersion() internal view returns (uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}