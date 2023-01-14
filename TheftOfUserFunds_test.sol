pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/math/SafeMath.sol";

contract FundSecurityTest {
    address public owner;
    mapping(address => uint256) public userBalances;
    using SafeMath for uint256;

    function testFundTheft() public {
        // Record initial balance of contract and user
        uint256 initialContractBalance = address(this).balance;
        uint256 initialUserBalance = userBalances[msg.sender];

        // Call function that may allow fund theft
        functionWithPossibleFundTheft();

        // Check that contract balance has not increased
        require(address(this).balance.eq(initialContractBalance), "Fund theft detected: contract balance has increased");

        // Check that user balance has not decreased
        require(userBalances[msg.sender].eq(initialUserBalance), "Fund theft detected: user balance has decreased");
    }

    function functionWithPossibleFundTheft() internal {
        // Function that may allow fund theft
    }
}
