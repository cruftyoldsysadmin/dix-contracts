pragma solidity ^0.4.18;

import "ds-test/test.sol";
import "ds-token/token.sol";

import "./ProjectFactory.sol";
import "./Project.sol";

contract ProjectFactoryTest is DSTest {
    ProjectFactory projectFactory;
    DSToken token;

    function setUp() public {
        token = new DSToken("TST");
        projectFactory = new ProjectFactory(token);
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }

    function test_newProject() public {
        Project project = projectFactory.newProject();
        assertTrue(projectFactory.isProject(project));
        assertEq(token, project.token());
    }

    
}
