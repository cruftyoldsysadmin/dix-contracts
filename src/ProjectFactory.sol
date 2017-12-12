pragma solidity ^0.4.18;

import "ds-auth/auth.sol";
import "ds-note/note.sol";
import "./Project.sol";


contract ProjectFactory is DSAuth, DSNote {
    ERC20  public  token;
    mapping (address => bool)  public  isProject;

    event NewProject  (address project);

    function ProjectFactory(ERC20 token_) public {
        token = token_;
    }

    function newProject() auth note returns (Project project) {
        project = new Project();
        project.swap(token);
        isProject[project] = true;

        NewProject(project);
    }

}
