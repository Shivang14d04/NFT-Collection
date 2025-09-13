// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MoodNft is ERC721 {
    uint256 private s_tokenCounter;
    string private s_happySvgImageUri;
    string private s_sadSvgImageUri;

    constructor(string memory sadSvgImageUri, string memory happySvgImageUri) ERC721("MOOD NFT", "MN") {
        s_tokenCounter = 0;
        s_happySvgImageUri = sadSvgImageUri;
        s_sadSvgImageUri = happySvgImageUri;
    }

    function mintNft() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {}
}
