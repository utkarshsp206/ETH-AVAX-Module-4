# ETH-AVAX-Module-4

# DegenToken
==========

DegenToken is an ERC20 token contract with built-in redeemable rewards. The contract allows users to mint new tokens, transfer tokens, and redeem tokens for rewards.

## Getting Started
---------------

1. Install Remix (<https://remix.ethereum.org/>) or any other Solidity IDE.
2. Copy and paste the DegenToken contract code into the IDE.
3. Compile the contract.
4. Deploy the contract.

## Contract Functions
------------------

### mintTokens

Mints new tokens for a specific address.

* `_to`: The address to receive the new tokens.
* `_amount`: The number of tokens to mint.

### transferTokens

Transfers tokens from the caller's account to another address.

* `_recipient`: The address to receive the tokens.
* `_amount`: The number of tokens to transfer.

### redeemReward

Redeems tokens for a specific reward.

* `_choice`: The ID of the reward to redeem (1: NFT, 2: T-shirt, 3: Mystery item).

### viewStoreItems

Displays the available rewards in the store.

### burnMyTokens

Burns a specific number of tokens from the caller's account.

* `_amount`: The number of tokens to burn.

### checkMyBalance

Returns the caller's token balance.

### checkBalanceOf

Returns the token balance of a specific address.

* `_address`: The address to check the balance of.

### viewMyRedeemedItems

Displays the caller's redeemed items.

## Mapping Variables
-----------------

### userRewards

Maps an address to the number of rewards they have redeemed.

### redeemedItems

Maps an address to a mapping of redeemed item IDs to their quantities.
