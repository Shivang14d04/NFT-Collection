// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public view {
        string memory expectedUri =
            "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgogICAgPHJlY3Qgd2lkdGg9IjEwMCIgaGVpZ2h0PSIxMDAiIGZpbGw9ImJsdWUiLz4KICAgIDxjaXJjbGUgY3g9IjUwIiBjeT0iNTAiIHI9IjQwIiBmaWxsPSJyZWQiLz4gCjwvc3ZnPg==";

        string memory svg =
            "<svg xmlns=\"http://www.w3.org/2000/svg\">\n    <rect width=\"100\" height=\"100\" fill=\"blue\"/>\n    <circle cx=\"50\" cy=\"50\" r=\"40\" fill=\"red\"/> \n</svg>";

        string memory actualUri = deployer.svgToImageUri(svg);
        assert(keccak256(abi.encodePacked(actualUri)) == keccak256(abi.encodePacked(expectedUri)));
    }
}
