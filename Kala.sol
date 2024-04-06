// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;


contract Kala {

    string private constant name = "KalaToken";
    string private constant symbol = "klt";
    uint private constant decimal = 3;
    address private owner;
    uint private totalSupply_;

    mapping (address => uint) private balances;

    modifier onlyOwner{
        require(msg.sender == owner, "Not Owner");
        _;
    }

    constructor(){
        owner = msg.sender;
    }

    function totalSupply() external view returns (uint){
        return totalSupply_;
    }

    function balanceOf(address addr) external view returns (uint){
        return balances[addr];
    }

    function calculateDecimals() private pure returns (uint){
        return 10 ** decimal;
    }

    function transfer(address to, uint amount) external returns (bool){
        if (balances[msg.sender] < (amount * calculateDecimals())) revert("Insufficient amount");
        if (address(to) == address(0)) {
            _burn(amount);
            return true;
        }
        
        balances[msg.sender] = balances[msg.sender] - (amount * calculateDecimals());
        balances[to] = balances[to] + (amount * calculateDecimals());
        return true;
    }

    function mint(uint amount) external onlyOwner {
        totalSupply_ = amount * calculateDecimals();
        balances[owner] = balances[owner] + (amount * calculateDecimals());
    }

    function burn(uint amount) external {
        _burn(amount);
    }

    function _burn(uint amount) internal{
        if (balances[msg.sender] < (amount * calculateDecimals())) revert("Not enough balance");
        balances[msg.sender] = balances[msg.sender] - (amount * calculateDecimals());
        totalSupply_ = totalSupply_ - (amount * calculateDecimals());
    }
}
