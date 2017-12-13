pragma solidity ^0.4.18;

import "ds-test/test.sol";

import "./ValidatorGroup.sol";
import "ds-token/token.sol";
import "./ProjectFactory.sol";

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

    function callNewProject(ProjectFactory projectFactory) {
        projectFactory.newProject();
    }

}

contract ProjectTest is DSTest {

    ValidatorGroup group;
    DSToken token; 
    ProjectFactory projectFactory;
    Validator validator1;
    Validator validator2;

    Validator fakeValidator;


    function setUp() public {
        validator1 = new Validator();
        validator2 = new Validator();
        fakeValidator = new Validator();

        address[] memory validators = new address[](2);
        validators[0] = validator1;
        validators[1] = validator2;

        group = new ValidatorGroup(validators, 2, 30);

        token = new DSToken("TST");
        projectFactory = new ProjectFactory(token);
        projectFactory.setOwner(group);
        token.setOwner(group);

    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }

    function test_confirm() public {
        bytes memory calldata = new bytes(4 + 32);
        bytes4 sig = bytes4(sha3("newProject()"));

        calldata[0] = sig[0];
        calldata[1] = sig[1];
        calldata[2] = sig[2];
        calldata[3] = sig[3];
        calldata[4 + 31] = 123;

        var id = validator1.propose(group, projectFactory, calldata, 0);

        validator1.confirm(group, id);
        validator2.confirm(group, id);
        assertEq(group.confirmations(id), 2);
        validator1.trigger(group, id);
        
    }

}
