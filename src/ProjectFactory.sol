pragma solidity ^0.4.18;

import "ds-auth/auth.sol";
import "ds-note/note.sol";
import "./Project.sol";

contract ProjectFactory is DSAuth, DSNote {
    ERC20  public  token;
    mapping (address => bool)  public  isProject;

    function swap(ERC20 token_) public auth {
        token = token_;
    }

    function newProject() auth note returns (Project project) {
        project = new Project();
        project.swap(token);
        isProject[project] = true;
    }

}
