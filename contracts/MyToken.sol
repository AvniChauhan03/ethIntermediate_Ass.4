// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    constructor() ERC20("Avni", "AC") {
        // Initialize predefined items in the constructor
        _addPredefinedItem(1, "Item 1", 100);
        _addPredefinedItem(2, "Item 2", 200);
        _addPredefinedItem(3, "Item 3", 300);
    }

    // Item struct to hold item details
    struct Item {
        string name;
        uint256 price; // Price in tokens to redeem the item
    }

    // Mapping to store predefined items
    mapping(uint256 => Item) public items;

    // Mapping to keep track of redeemed items for each user
    mapping(address => mapping(uint256 => bool)) public redeemedItems;

    // Event emitted when an item is redeemed
    event ItemRedeemed(address indexed account, uint256 indexed itemId);

    // Function to add a predefined item (can only be called by the contract owner)
    function _addPredefinedItem(uint256 itemId, string memory name, uint256 price) private onlyOwner {
        items[itemId] = Item(name, price);
    }

    // Function to redeem a predefined item with the given itemId
    function redeemItem(uint256 itemId) public {
        Item memory item = items[itemId];
        require(item.price > 0, "Item not found"); // Check if the item exists
        require(balanceOf(msg.sender) >= item.price, "Insufficient balance"); // Check if the user has enough tokens
        require(!redeemedItems[msg.sender][itemId], "Item already redeemed"); // Check if the item is not already redeemed

        _burn(msg.sender, item.price); // Burn the required amount of tokens
        redeemedItems[msg.sender][itemId] = true; // Mark the item as redeemed for the user
        emit ItemRedeemed(msg.sender, itemId); // Emit the ItemRedeemed event
    }

    // Function to get the details of a stored item by its itemId
    function getItemDetails(uint256 itemId) public view returns (string memory name, uint256 price) {
        Item memory item = items[itemId];
        require(item.price > 0, "Item not found"); // Check if the item exists
        return (item.name, item.price);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        require(amount <= balanceOf(msg.sender), "Insufficient balance");
        return super.transfer(to, amount);
    }

    // New function to get the token balance of an address
    function getMyTokenBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }
}