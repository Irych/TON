
/**
 * This file was generated by TONDev.
 * TONDev is a part of TON OS (see http://ton.dev).
 */
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

// This is class that describes you smart contract.
contract token {

    struct Token {
        string name;
        string breed;
        string color;
        uint rare;
        uint price;   
    }

    Token[] public tokensArr;
    mapping (uint => uint) TokenToOwner;

    modifier uniqueName(string name){
        for (uint i; i <= tokensArr.length - 1; i++) {
            if (name == tokensArr[i].name) {
                revert(101);
            } else {
                _;
            }
        }
    }

    function createToken(string name, string breed, string color, uint rare) public uniqueName(name){
        tvm.accept();
        
        tokensArr.push(Token(name, breed, color, rare, 0));
        uint key = tokensArr.length - 1;
        TokenToOwner[key] = msg.pubkey();
    }

    function forSale(uint TokenId, uint TokenPrice) public {
        require(msg.pubkey() == TokenToOwner[TokenId], 102);
        tokensArr[TokenId].price = TokenPrice;
        tvm.accept();
    }

    function getTokenInfo(uint TokenId) public view returns (string TokenName, string TokenBreed, string TokenColor, uint TokenRare, uint TokenPrice){
        TokenName = tokensArr[TokenId].name;
        TokenBreed = tokensArr[TokenId].breed;
        TokenColor = tokensArr[TokenId].color;
        TokenRare = tokensArr[TokenId].rare;
        TokenPrice = tokensArr[TokenId].price;
    }

    constructor() public {
        // Check that contract's public key is set
        require(tvm.pubkey() != 0, 101);
        // Check that message has signature (msg.pubkey() is not zero) and
        // message is signed with the owner's private key
        require(msg.pubkey() == tvm.pubkey(), 102);
        // The current smart contract agrees to buy some gas to finish the
        // current transaction. This actions required to process external
        // messages, which bring no value (henceno gas) with themselves.
        tvm.accept();

    }

}
