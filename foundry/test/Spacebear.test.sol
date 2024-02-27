// contracts/GameItem.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "forge-std/Test.sol";
import "../src/Spacebear.sol";

contract SpacebearTest is Test {
   Spacebear spacebear;

   function setUp() public {
    spacebear = new Spacebear(msg.sender);

   }

   function testNameIsSpacebear() public {
    assertEq(spacebear.name(), "Spacebear");
   }

   function testMintingNFTs() public {
    spacebear.safeMint(msg.sender);
    assertEq(spacebear.ownerOf(0), msg.sender);
    assertEq(spacebear.tokenURI(0), "https://ethereum-blockchain-devloper.com/2022-06-nft-truffle-hardhat-foundry/spacebear_1.json");
   }

   function testNftCreationWrongOwner() public{
    address purchaser = address(0x1);
    vm.startPrank(purchaser);
    vm.expectRevert("Ownable: caller is not the owner");
    spacebear.safeMint(purchaser);
    vm.stopPrank();
   }

   function testNftBuyToken() public{
    address purchaser = address(0x2);
    vm.prank(purchaser);
    spacebear.buyToken();
    assertEq(spacebear.ownerOf(0), purchaser);
   }
}