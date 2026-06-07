// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
 * @title EventEmissionHub
 * @dev High-density event emitter used to benchmark log extraction engines.
 */
contract EventEmissionHub {

    event LogA(uint256 indexed index, address indexed caller, bytes32 metadata);
    event LogB(uint256 indexed index, uint256 quantity, string message);

    uint256 public eventCounter;

    /**
     * @notice Emits multiple event logs inside a single transaction.
     */
    function emitHighDensityLogs(uint256 iterations) external {
        uint256 currentCount = eventCounter;
        
        for (uint256 i = 0; i < iterations; i++) {
            currentCount++;
            emit LogA(currentCount, msg.sender, keccak256(abi.encodePacked(block.timestamp, currentCount)));
            emit LogB(currentCount, currentCount * 10, "MonadShadowIndexer_Benchmark");
        }
        
        eventCounter = currentCount;
    }
}
