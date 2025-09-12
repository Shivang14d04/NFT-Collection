// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "../lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "../src/BasicNFT.sol";

contract MintBasicNft is Script {
    string public constant PUG =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function run() external {
        address mostRecentlyDeployed =0x44cBE25eF4b6B6Eb363D93C7038D4ca8af9fe1b2;
        //address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("BasicNft", block.chainid);

        // IMPORTANT:
        
        // DevOpsTools.get_most_recent_deployment("BasicNft", block.chainid);
        // this is to fetch the most recently deployed contract address
        // but since we are using --ffi which is disabled by default
        // we have to enable it in foundry.toml and also add the path in the Makefile

        //The get_most_recent_deployment function works by reading files inside your 
        //project's ./broadcast directory to find the address of the last deployment. 
        //For security, the Foundry VM blocks scripts from reading the file system by default.
        //So, your script is failing before it even gets to the mintNftOnContract function
        // because it's being denied permission to read the address.

        /*The quickest and most reliable way to get this working is to temporarily bypass
        the file-reading function and give the script the contract address directly.

        Find your deployed BasicNft contract address on the Sepolia network. You can find this in the terminal output from when you ran your make deploy command, or by looking it up on Sepolia Etherscan.

        Hardcode the address in your script. Replace the DevOpsTools line with the actual address */
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNft(contractAddress).mintNft(PUG);
        vm.stopBroadcast();
    }
}
