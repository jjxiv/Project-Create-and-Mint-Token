// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ERC20_Almoro is ERC20 {
    address public owner;

    constructor(uint256 initialSupply) ERC20("JERICHO", "JER") {
        _mint(msg.sender, initialSupply);
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner is allowed to initiate this function");
        _;
    }

    function mint(address to, uint256 value) external onlyOwner {
        _mint(to, value);
    }

    function transfer(address to, uint256 value) public override returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }
    
    function burn(address from, uint256 value) external {
        _burn(from, value);
    }
}
