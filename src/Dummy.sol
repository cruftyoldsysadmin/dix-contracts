pragma solidity ^0.4.18;

import "ds-multisig/group.sol";
import "ds-token/token.sol";
import "ds-vault/vault.sol";

// This is just a dummy contract that forces 
// the imports to pull down and build so that we can use them

contract Dummy {
  DSGroup public group;
  DSToken public token;
}
