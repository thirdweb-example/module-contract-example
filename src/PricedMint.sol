// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Module} from "modular-contracts/src/Module.sol";
import {BeforeMintCallbackERC721} from "modular-contracts/src/callback/BeforeMintCallbackERC721.sol";

contract PricedMint is Module, BeforeMintCallbackERC721 {
    uint256 public constant mintPrice = 0.01 ether;

    function getModuleConfig()
        external
        pure
        override
        returns (ModuleConfig memory config)
    {
        config.callbackFunctions = new CallbackFunction[](1);

        config.callbackFunctions[0] = CallbackFunction(
            this.beforeMintERC721.selector
        );

        config.requiredInterfaces = new bytes4[](1);
        config.requiredInterfaces[0] = 0x80ac58cd; // ERC721.
    }
}
