// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

/**
 * @title Find the word
 * @dev Find the correct word to get a reward.
 */
contract SecretWord {
    
    bytes32 private word;
    address payable private owner ;

    constructor(bytes32 _word) payable{
        word = _word;
        owner = payable(msg.sender);
    }
    
    function getReward() public view returns (uint){
        return address(this).balance;
    }
    
    function findWord(string memory _word) public payable returns (bool){
        if(getWord() == keccak256(abi.encodePacked(_word))){
            return payable(msg.sender).send(address(this).balance);
        }
        return false;
    }
    
    function setReward() public payable returns (bool){
        if(getOwner() == msg.sender){
            return payable(address(this)).send(msg.value);
        }
        return false;
    }
    
    function getWord() private view returns(bytes32){
        return word;
    }
    
    function getOwner() private view returns(address){
        return owner;
    }
    
    function setWord(bytes32 _word) public returns(bool){
        if(getOwner() == msg.sender){
            word = _word;
            return true;
        }
        return false;
    }
    
}
