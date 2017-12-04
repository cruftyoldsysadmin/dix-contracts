pragma solidity ^0.4.18;

import "ds-test/test.sol";

import "./DixContracts.sol";

contract DixContractsTest is DSTest {
    DixContracts contracts;

    function setUp() public {
        contracts = new DixContracts();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
