# KalaToken

KalaToken is a simple ERC-20 compatible token smart contract written in Solidity. This contract allows for basic token functionalities such as transferring tokens between addresses, checking balances, minting new tokens, and burning existing tokens.

## Contract Details

- **Name**: KalaToken
- **Symbol**: klt
- **Decimal**: 3
- **Total Supply**: Initially set to 0

## Functions

### `totalSupply()`

```solidity
function totalSupply() external view returns (uint)
```

This function returns the total supply of KalaToken.

### `balanceOf(address addr)`

```solidity
function balanceOf(address addr) external view returns (uint)
```

This function returns the balance of KalaToken for a given address.

### `transfer(address to, uint amount)`

```solidity
function transfer(address to, uint amount) external returns (bool)
```

This function allows transferring KalaToken from the sender's address to another address. It checks for sufficient balance and updates balances accordingly.

### `mint(uint amount)`

```solidity
function mint(uint amount) external onlyOwner
```

This function allows the owner of the contract to mint new KalaToken. It increases the total supply and assigns the minted tokens to the owner's address.

### `burn(uint amount)`

```solidity
function burn(uint amount) external
```

This function allows burning a specified amount of KalaToken from the sender's address.

## Modifiers

### `onlyOwner`

```solidity
modifier onlyOwner {
    require(msg.sender == owner, "Not Owner");
    _;
}
```

This modifier restricts access to functions only to the owner of the contract.

### `calculateDecimals()`

```solidity
function calculateDecimals() private pure returns (uint)
```

This internal function is used to calculate the value of 10 raised to the power of the decimal variable, facilitating token amount calculations.

## Constructor

### `constructor()`

```solidity
constructor()
```

This constructor initializes the owner of the contract as the sender.

## Variables

- `name`: Name of the token (KalaToken)
- `symbol`: Symbol of the token (klt)
- `decimal`: Number of decimal places (3)
- `owner`: Address of the contract owner
- `totalSupply_`: Total supply of KalaToken
- `balances`: Mapping of addresses to their respective KalaToken balances
