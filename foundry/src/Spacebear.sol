// contracts/GameItem.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";
import "openzeppelin-contracts/contracts/utils/Strings.sol";



contract Spacebear is ERC721,ERC721Burnable, Ownable {

    uint256 private _nextTokenId;

      constructor(address initialOwner)
        ERC721("Spacebear", "SPB")
        Ownable(initialOwner)
    {}


    function _baseURI() internal pure override returns(string memory){
        return "https://ethereum-blockchain-developer.com/2022-06-nft-truffle-hardhat-foundry/nftdata/";
    }

    function buyToken() public payable {
        uint256 tokenId = _nextTokenId;
        require(msg.value == tokenId * 0.1 ether, "Not enough funds sent!");
        _nextTokenId += 1;
        _safeMint(msg.sender, tokenId);
    }
    
    function safeMint(address to) public onlyOwner{
        uint256 tokenId = _nextTokenId;
        _nextTokenId += 1;
        _safeMint(to, tokenId);
    }

    function tokenURI(uint256 tokenId) public pure override(ERC721) returns(string memory){
        return string(abi.encodePacked(_baseURI(),"spacebear_",Strings.toString(tokenId+1),".json"));
    }
}