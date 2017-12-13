pragma solidity ^0.4.18;

import "ds-test/test.sol";

import "./ValidatorGroup.sol";

contract Validator {
    function propose(ValidatorGroup group, address target, bytes calldata, uint value) returns (uint id) {
        return group.propose(target, calldata, value);
    }


    function confirm(ValidatorGroup group, uint id) {
        group.confirm(id);
    }

    function trigger(ValidatorGroup group, uint id){
        group.trigger(id);
    }

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
        
        group.updateMembers(validators);
        assertEq(group.memberCount(), 3);
    }

    function test_trigger_after_validator_change() {
        Dummy dummy = new Dummy();
        bytes memory calldata = new bytes(4 + 32);
        bytes4 sig = bytes4(sha3("foo(uint256)"));

        calldata[0] = sig[0];
        calldata[1] = sig[1];
        calldata[2] = sig[2];
        calldata[3] = sig[3];
        calldata[4 + 31] = 123;

        address[] memory validators = new address[](2);
        validators[0] = validator1;
        validators[1] = validator2;

        var group = new ValidatorGroup(validators, 1, 300);
        var id = validator1.propose(group, dummy, calldata, 0);
        validator1.confirm(group, id);
        assertEq(group.confirmations(id), 1);

        validators = new address[](3);
        validators[0] = validator4;
        validators[1] = validator5;
        validators[2] = validator6;

        group.updateMembers(validators);
        validator4.confirm(group, id);
        assertEq(group.confirmations(id), 2);
        validator4.trigger(group, id);
        assert(group.triggered(id));
    }


}

contract Dummy {
    uint  public  fooArgument;
    uint  public  fooValue;
    bool  public  fallbackBlocked;
    bool  public  fallbackCalled;

    function () payable {
        if (fallbackBlocked) {
            throw;
        } else {
            fallbackCalled = true;
        }
    }

    function setFallbackBlocked(bool yes) {
        fallbackBlocked = yes;
    }

    function foo(uint argument) payable {
        fooArgument  = argument;
        fooValue     = msg.value;
    }
}
