
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {
    constructor() ERC20("Degen Token", "DGN") Ownable(msg.sender) {}

    // Mapping to store user rewards
    mapping(address => uint256) public userRewards;

    // Mapping to store redeemed items
    mapping(address => mapping(uint256 => uint256)) public redeemedItems;

    // Function to mint new tokens
    function mintTokens(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount);
    }

    // Function to transfer tokens
    function transferTokens(address _recipient, uint256 _amount) public {
        require(_amount <= balanceOf(msg.sender), "Insufficient balance");
        _transfer(msg.sender, _recipient, _amount);
    }

    // Function to redeem tokens for rewards
    function redeemReward(uint256 _choice) public {
        require(balanceOf(msg.sender) >= getRewardCost(_choice), "Insufficient balance");
        burn(getRewardCost(_choice));
        userRewards[msg.sender] += 1;
        deliverReward(_choice, msg.sender);
    }

    // Function to deliver redeemed items
    function deliverReward(uint256 _choice, address _player) internal {
        if (_choice == 1) {
            // Deliver NFT
            redeemedItems[_player][1] += 1;
        } else if (_choice == 2) {
            // Deliver T-shirt
            redeemedItems[_player][2] += 1;
        } else if (_choice == 3) {
            // Deliver Mystery item
            redeemedItems[_player][3] += 1;
        }
    }

    // Function to get reward cost
    function getRewardCost(uint256 _choice) public pure returns (uint256) {
        if (_choice == 1) {
            return 100; // NFT
        } else if (_choice == 2) {
            return 75; // T-shirt
        } else if (_choice == 3) {
            return 50; // Mystery item
        } else {
            revert("Invalid choice");
        }
    }

    // Function to view redeemed items
function viewMyRedeemedItems() public view returns (string memory) {
    string memory items = "";
    for (uint256 i = 1; i <= 3; i++) {
        if (redeemedItems[msg.sender][i] > 0) {
            if (i == 1) {
                items = string(abi.encodePacked(items, "Official Degen NFT x", uint2str(redeemedItems[msg.sender][i]), "\n"));
            } else if (i == 2) {
                items = string(abi.encodePacked(items, "T-shirt x", uint2str(redeemedItems[msg.sender][i]), "\n"));
            } else if (i == 3) {
                items = string(abi.encodePacked(items, "Mystery item x", uint2str(redeemedItems[msg.sender][i]), "\n"));
            }
        }
    }
    return items;
}

// Helper function to convert uint to string
function uint2str(uint256 _i) internal pure returns (string memory) {
    if (_i == 0) {
        return "0";
    }
    uint256 j = _i;
    uint256 len;
    while (j != 0) {
        len++;
        j /= 10;
    }
    bytes memory bstr = new bytes(len);
    uint256 k = len;
    while (_i != 0) {
        k--;
        bstr[k] = bytes1(uint8(48 + _i % 10));
        _i /= 10;
    }
    return string(bstr);
}

    // Function to view store items
    function viewStoreItems() public pure returns (string memory) {
        return "1. Official Degen NFT\n2. T-shirt\n3. Mystery item";
    }

    // Function to burn tokens
    function burnMyTokens(uint256 _amount) public {
        _burn(msg.sender, _amount);
    }

    // Function to check token balance
    function checkMyBalance() public view returns (uint256) {
        return balanceOf(msg.sender);
    }

    // Function to check token balance of a specific address
    function checkBalanceOf(address _address) public view returns (uint256) {
        return balanceOf(_address);
    }
}