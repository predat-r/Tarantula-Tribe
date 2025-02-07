// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "erc721a/contracts/ERC721A.sol";

import "@openzeppelin/contracts/access/Ownable.sol";

contract TarantulaTribe is ERC721A , Ownable
 {

    string private baseURI;  
    uint256 public constant MAX_SUPPLY = 25;  

    constructor(string memory initialBaseURI) ERC721A("Tarantula Tribe", "TARANTULA") Ownable(msg.sender) {
        baseURI = initialBaseURI; 
        _mint(msg.sender, 1);  // Minting 1 NFT to deployer 
    }


    // Returns the base URI for metadata stored on IPFS
    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    // Allows owner to update metadata location 
    function setBaseURI(string memory _newBaseURI) external onlyOwner {
        baseURI = _newBaseURI;
    }
}