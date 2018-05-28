pragma solidity ^0.4.20;

contract Election {
    // model a candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Store accounts that have voted
    mapping(address => bool) public voters;
    // store candidates
    // fetch candidate
    mapping(uint => Candidate) public candidates;
    // store candidates count. can't use a "hash.count". must use counter. 
    uint public candidatesCount;

    // voted event
    event votedEvent (
        uint indexed _candidateId
    );

    function Election () public {
      addCandidate("Candidate 1");
      addCandidate("Candidate 2");
    }

    function addCandidate (string _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    // sender is sending ethereum as gas, but refunded if does not meet requirement UP UNTIL THIS POINT
    function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate. must be greater than 0 and less than or equal to candidatesCount
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;

        // trigger voted event
        votedEvent(_candidateId);
    }
}