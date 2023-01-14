pragma solidity ^0.8.0;

contract Voting {
    // Variables and functions for the voting process

    function testManipulation() public {
        // Test that the contract properly counts votes
        uint initialVoteCount = voteCount();
        vote("Alice");
        require(voteCount() == initialVoteCount + 1);

        // Test that the contract properly resets vote count
        resetVotes();
        require(voteCount() == 0);

        // Test that the contract properly prevents double voting
        vote("Bob");
        require(voteCount() == 1);
        vote("Bob");
        require(voteCount() == 1);

        // Test that the contract properly prevents non-voters from manipulating results
        address nonVoter = msg.sender;
        nonVoter.transfer(address(this).balance);
        vote("Charlie");
        require(voteCount() == 2);
        require(address(this).balance == 0);
    }
}
