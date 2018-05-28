pragma solidity ^0.4.2;

contract Election {
    // model a candidate
    struct Candidate {
        uint id;
        string name;
        uint votecount;
    }
    // store candidates
    // fetch candidate
    mapping(uint => Candidate) public candidates;
    // store candidates count. can't use a "hash.count". must use counter. 
    uint public candidatesCount;

    function Election () public {
      addCandidate("Candidate 1");
      addCandidate("Candidate 2");
    }

    function addCandidate (string _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
}