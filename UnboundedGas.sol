pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/math/SafeMath.sol";

contract GasTest {
    using SafeMath for uint256;
    uint256 public gasUsed;

    function testUnboundedGas() public {
        // Record initial gas used
        uint256 initialGasUsed = gasUsed;

        // Call function that may have unbounded gas consumption
        functionWithPossibleUnboundedGas();

        // Check that gas used has increased by a reasonable amount
        gasUsed = gasUsed.sub(initialGasUsed);
        require(gasUsed < 1000000, "Unbounded gas consumption detected");
    }

    function functionWithPossibleUnboundedGas() internal {
        // Function that may have unbounded gas consumption
    }
}
