pragma solidity ^0.8.0;

contract NodeDeregisterTest {
    address[] public nodes;
    mapping(address => bool) public isRegistered;

    function testNodeDeregister() public {
        // Record initial number of nodes
        uint initialNodeCount = nodes.length;

        // Register a node
        registerNode(msg.sender);
        require(isRegistered[msg.sender], "Node registration failed");

        // Call function that may deregister a node
        functionWithPossibleNodeDeregister();

        // Check that node count has not decreased
        require(nodes.length == initialNodeCount, "Node deregistration detected: number of nodes has decreased");

        // Check that registered node is still in the list
        require(isRegistered[msg.sender], "Node deregistration detected: registered node is no longer in the list");
    }

    function registerNode(address node) internal {
        // Function to register a node
        nodes.push(node);
        isRegistered[node] = true;
    }

    function functionWithPossibleNodeDeregister() internal {
        // Function that may deregister a node
    }
}
