pragma solidity ^0.8.0;

contract BotDetectionTest {
    mapping(address => bool) public isHuman;
    string public captcha;

    function testBotDetection() public {
        // Generate a random captcha
        captcha = generateCaptcha();

        // Call function that may be called by a bot
        functionWithPossibleBot();

        // Check that user is human
        require(isHuman[msg.sender], "Bot detected: user did not solve the captcha");
    }

    function solveCaptcha(string memory solution) public {
        require(solution == captcha, "Wrong captcha solution");
        isHuman[msg.sender] = true;
    }

    function functionWithPossibleBot() internal {
        // Function that may be called by a bot
    }
    
    function generateCaptcha() internal view returns (string memory) {
        // Generates a random string as a captcha
        // Example: return "5 + 3";
        // You can use any other way of generating a captcha
    }
}
