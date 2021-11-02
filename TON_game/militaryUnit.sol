
/**
 * This file was generated by TONDev.
 * TONDev is a part of TON OS (see http://ton.dev).
 */
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

// This is class that describes you smart contract.
contract militaryUnit {

    uint public tvmPubkey;
    uint public  msgPubkey;

    address public msgAddress;
    address public addressAttacking;
    address public addressAttacked;

    uint public powerAttack;
    uint public powerProtection;

    uint public health;
    
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


    function attack(address addressAttacking, address addressAttacked) public {
        tvm.accept();

        tvmPubkey = tvm.pubkey();
        msgPubkey = msg.pubkey();

        msgAddress = msg.sender;
        addressAttacked = addressAttacked;
        addressAttacking = addressAttacking;
        health = addressAttacked.health - (addressAttacking.powerAttack - addressAttacked.powerProtection);

        if (health <= 0) {
            death();
        }
    }

    function death(address addressAttacked) public {
        tvm.accept();
        addressAttacked.transfer(0, true, 160);
    }
} 