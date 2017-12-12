pragma solidity ^0.4.18;

import "ds-test/test.sol";

import "./ValidatorGroup.sol";

contract Validator {

}

contract ValidatorGroupTest is DSTest {
    Validator validator1;
    Validator validator2;
    Validator validator3;
    Validator validator4;
    Validator validator5;
    Validator validator6;

    function setUp() public {
        validator1 = new Validator();
        validator2 = new Validator();
        validator3 = new Validator();
        validator4 = new Validator();
        validator5 = new Validator();
        validator6 = new Validator();

    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }

    function test_constructor() public {
        address[] memory validators = new address[](2);
        validators[0] = validator1;
        validators[1] = validator2;

        var group = new ValidatorGroup(validators, 1, 300);
        assertEq(group.memberCount(), 2);
    }

    function test_update_quorum() public {
        address[] memory validators = new address[](2);
        validators[0] = validator1;
        validators[1] = validator2;

        var group = new ValidatorGroup(validators, 1, 300);
        assertEq(group.getQuorum(), 1);

        group.updateQuorum(2);
        assertEq(group.getQuorum(), 2);
    }

    function test_update_members() public {
        address[] memory validators = new address[](2);
        validators[0] = validator1;
        validators[1] = validator2;

        var group = new ValidatorGroup(validators, 1, 300);

        validators = new address[](3);
        validators[0] = validator1;
        validators[1] = validator2;
        validators[2] = validator3;
        
        group = new ValidatorGroup(validators, 1, 300);
        assertEq(group.memberCount(), 3);
    }

}
