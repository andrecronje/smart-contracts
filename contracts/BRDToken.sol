pragma solidity ^0.4.18;

import "./zeppelin-solidity-1.4/MintableToken.sol";
import "./zeppelin-solidity-1.4/SafeMath.sol";


contract BRDToken is MintableToken {
  using SafeMath for uint256;

  string public name = "Bread Token";
  string public symbol = "BRD";
  uint256 public decimals = 18;

  // override StandardToken#transferFrom
  // ensures that minting has finished or the message sender is the token owner
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
    require(mintingFinished || msg.sender == owner);
    return super.transferFrom(_from, _to, _value);
  }

  // override StandardToken#transfer
  // ensures the minting has finished or the message sender is the token owner
  function transfer(address _to, uint256 _value) public returns (bool) {
    require(mintingFinished || msg.sender == owner);
    return super.transfer(_to, _value);
  }
}
