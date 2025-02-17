// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "erc721a/contracts/ERC721A.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/interfaces/IERC2981.sol";

contract TarantulaTribe is ERC721A, Ownable, IERC2981 {
    uint256 public constant MAX_SUPPLY = 25;
    uint96 public constant ROYALTY_FEE = 500; // 5% royalty fee (500 basis points)
    string private baseURI;
    address private royaltyRecipient;

    constructor(string memory initialBaseURI) ERC721A("Tarantula Tribe", "TARANTULA") Ownable(msg.sender) {
        baseURI = initialBaseURI; 
        royaltyRecipient = owner();
        _mint(msg.sender, MAX_SUPPLY); // Mint all NFTs to the owner
    }

    // Returns the base URI for metadata stored on IPFS
    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    // Allows owner to update metadata location 
    function setBaseURI(string memory _newBaseURI) external onlyOwner {
        baseURI = _newBaseURI;
    }

    // Update royalty recipient
    function setRoyaltyRecipient(address _newRecipient) external onlyOwner {
        require(_newRecipient != address(0), "Invalid address");
        royaltyRecipient = _newRecipient;
    }

    // ERC-2981 royalty info function
    function royaltyInfo(uint256 _tokenId, uint256 _salePrice) external view override returns (address receiver, uint256 royaltyAmount) {
        require(_exists(_tokenId), "Token does not exist");
        return (royaltyRecipient, (_salePrice * ROYALTY_FEE) / 10000);
    }

    // Support interface check for ERC-2981
    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC721A, IERC165) returns (bool) {
        return interfaceId == type(IERC2981).interfaceId || super.supportsInterface(interfaceId);
    }
}