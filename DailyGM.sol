// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract DailyGM {
    mapping(address => uint256) public lastGmDay;
    mapping(address => uint256) public gmCount;

    event GM(address indexed user, uint256 day, uint256 totalGM);

    function today() public view returns (uint256) {
        return block.timestamp / 1 days;
    }

    function sendGM() external {
        uint256 day = today();
        require(lastGmDay[msg.sender] < day, "GM already sent today");

        lastGmDay[msg.sender] = day;
        gmCount[msg.sender] += 1;

        emit GM(msg.sender, day, gmCount[msg.sender]);
    }
}
