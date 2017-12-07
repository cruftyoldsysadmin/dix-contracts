pragma solidity ^0.4.18;

import "ds-test/test.sol";

import "./ProjectFactory.sol";

contract ProjectFactoryTest is DSTest {
    ProjectFactory projectFactory;

    function setUp() public {
        projectFactory = new ProjectFactory();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
