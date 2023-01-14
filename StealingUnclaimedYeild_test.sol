pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/math/SafeMath.sol";

contract IncomeSecurityTest {
    address public owner;
    mapping(address => uint256) public userIncome;
    using SafeMath for uint256;

    function testIncomeTheft() public {
        // Record initial income of user
        uint256 initialUserIncome = userIncome[msg.sender];

        // Call function that may allow income theft
        functionWithPossibleIncomeTheft();

        // Check that user income has not decreased
        require(userIncome[msg.sender].eq(initialUserIncome), "Income theft detected: user income has decreased");
    }

    function functionWithPossibleIncomeTheft() internal {
        // Function that may allow income theft
    }
}
