pragma solidity ^0.4.18;

import "ds-multisig/group.sol";

// This is just a dummy contract that forces 
// the imports to pull down and build so that we can use them

contract LoaderContract {
  DSGroup public group;
}
