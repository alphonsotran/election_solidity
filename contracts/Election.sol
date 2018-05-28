pragma solidity ^0.4.2;

contract Election {
    // store candidate 
    // read candidate as getter with "public"
    string public candidate; 

    function Election () public {
        candidate = "Candidate 1";
    }
}