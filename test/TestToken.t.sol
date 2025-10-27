// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {TestToken} from "../src/TestToken.sol";

contract TestTokenTest is Test {
    TestToken public testToken;

    // Test addresses
    address public alice = makeAddr("alice");
    address public owner = makeAddr("owner");

    function setUp() public {
        testToken = new TestToken(owner);
    }

    function testFuzz_Mint(uint256 amount) public {
        vm.startPrank(owner);
        testToken.mint(alice, amount);
        vm.stopPrank();
        assertEq(testToken.balanceOf(alice), amount);
    }

    function testFuzz_OnlyOwnerCanMint(address fakeOwner) public {
        vm.assume(fakeOwner != owner);
        vm.startPrank(fakeOwner);
        vm.expectRevert();
        testToken.mint(alice, 1e18);
    }
}
