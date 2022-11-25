// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/// @title A simple contract to test code4rena's gas optimization suggestions.
contract GasTest {
    function beforeOptimization(uint256[] calldata array) internal pure {
        for (uint256 i = 0; i < array.length; i++) {}
    }

    function afterOptimization(uint256[] calldata array) internal pure {
        uint256 len = array.length; // G002 - Cache Array Length Outside of Loop
        // G001 - Don't Initialize Variables with Default Value
        for (uint256 i; i < len; ) {
            // G011 - Unnecessary checked arithmetic in for loop
            unchecked {
                ++i; // G012 - Use Prefix Increment instead of Postfix Increment if possible
            }
        }
    }

    function shortArraysBefore(uint256[] calldata array) external pure {
        require(array.length <= 5);
        beforeOptimization(array);
    }

    function shortArraysAfter(uint256[] calldata array) external pure {
        require(array.length <= 5);
        afterOptimization(array);
    }

    function mediumArraysBefore(uint256[] calldata array) external pure {
        require(array.length > 5 && array.length <= 25);
        beforeOptimization(array);
    }

    function mediumArraysAfter(uint256[] calldata array) external pure {
        require(array.length > 5 && array.length <= 25);
        afterOptimization(array);
    }

    function longArraysBefore(uint256[] calldata array) external pure {
        require(array.length > 25);
        beforeOptimization(array);
    }

    function longArraysAfter(uint256[] calldata array) external pure {
        require(array.length > 25);
        afterOptimization(array);
    }

    /// @dev Echidna requires at least one test function.
    function echidna_test() public pure returns (bool) {
        return true;
    }
}
