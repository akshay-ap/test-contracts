// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {TestToken} from "../src/TestToken.sol";
import {SafeSingletonDeployer} from "@safe-singleton-factory/src/SafeSingletonDeployer.sol";

contract TestTokenScript is Script {
    TestToken public testToken;

    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address owner = vm.envAddress("OWNER");

        SafeSingletonDeployer.broadcastDeploy({
            deployerPrivateKey: deployerPrivateKey,
            creationCode: type(TestToken).creationCode,
            args: abi.encode(owner),
            salt: bytes32("0x")
        });
    }
}
