pragma solidity ^0.4.18;

import "ds-test/test.sol";

import "./Project.sol";

contract ProjectTest is DSTest {
    Project project;

    function setUp() public {
        project = new Project();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
