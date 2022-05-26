//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

//Do safemath

contract GotchiCare is Ownable, ERC20 {
    constructor() ERC20("Remaining days", "DAYS") {}

    uint256 private constant MULTIPLIER = 7; // 1 MATIC for 7 days (changeable in the future)
    uint256 private constant MATIC_FOR_TXS = 100000000000000000; //10**17 -> 0.1 MATIC

    event depositDone(uint256 amount, address indexed depositedTo); //indexed (used for search and query)

    function deposit() public payable returns (uint256) {
        require(msg.value > 0, "You do not have funds to deposit");
        _mint(msg.sender, msg.value * MULTIPLIER);
        emit depositDone(msg.value, msg.sender);
        return address(this).balance;
    }

    function withdraw(uint256 amount) public payable returns (uint256) {
        require(balanceOf(msg.sender) > amount, "You do not have DAYS to burn"); //ERC20 already check
        require(
            address(this).balance > 0,
            "The contract does not have funds to return"
        );
        payable(msg.sender).transfer(amount);
        _burn(msg.sender, amount);
        return address(this).balance;
    }

    function interact(uint256 gotchiId) public {}

    function withdrawEarnedFunds() public onlyOwner {
        require(
            (totalSupply() / MULTIPLIER) <
                (address(this).balance + MATIC_FOR_TXS),
            "There is nothing to withdraw"
        );
        uint256 earnedAmount = (totalSupply() / MULTIPLIER) -
            (address(this).balance + MATIC_FOR_TXS);
        payable(msg.sender).transfer(earnedAmount);
    }
}
