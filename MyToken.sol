// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


    /*///////////////////////////////////////////////////////////////
                             __          _     
                       __ _ / _|_      _| |__  
                      / _` | |_\ \ /\ / / '_ \ 
                     | (_| |  _|\ V  V /| | | |
                      \__,_|_|   \_/\_/ |_| |_|
                      
    //////////////////////////////////////////////////////////////*/
    
contract MyToken is ERC20, Ownable {
    constructor() ERC20("MyToken", "MTK") {}


    function mint(uint256 amount) public onlyOwner {
        _mint(msg.sender, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }

    function withdraw() external onlyOwner {
        (bool success, ) = msg.sender.call{value: address(this).balance}("");
        require(success, "Withdrawal failed");
    }

}
