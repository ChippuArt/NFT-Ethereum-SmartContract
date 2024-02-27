const MyNFT = require("../artifacts/contracts/Spacebear.sol/Spacebear.json");

module.exports = async function(callback) {
    try {
        // Fetch the deployed contract instance
        const myNFT = await MyNFT.deployed();
        
        // Define the recipient address and token ID
        const recipient = '0x4aB10fbE398287672b8c48d1f59C741FA9B895eF'; // Replace with the recipient's address
        const tokenId = 1; // The token ID to mint

        // Call the minting function
        await myNFT.mintNFT(recipient, tokenId);

        console.log(`NFT with ID ${tokenId} minted to ${recipient}`);
    } catch (error) {
        console.error("Error minting NFT:", error);
    }

    callback();
};