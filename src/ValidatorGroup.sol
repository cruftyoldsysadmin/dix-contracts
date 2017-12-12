pragma solidity ^0.4.18;

import "ds-multisig/group.sol";

contract ValidatorGroup is DSGroup {

  function ValidatorGroup (
        address[]  members_,
        uint       quorum_,
        uint       window_
    ) DSGroup (members_, quorum_, window_) {

    }



    function updateMembers(address[]  members_) {
        assert(members_.length >= quorum);

        for (uint i = 0; i < members.length; i++) {
            delete isMember[members[i]];
        }

        for (i = 0; i < members_.length; i++) {
            isMember[members_[i]] = true;
        }
        members  = members_;
    }

    function updateQuorum(uint quorum_) {
      assert(quorum_ <= memberCount());
      quorum = quorum_;
    }

    function getQuorum() constant returns (uint) {
      return quorum;
    }
}
