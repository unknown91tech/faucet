// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Storage {

  uint8 public a = 7; // 1 byte
  uint16 public b = 10; // 2bytes
  address public c = 0x67fb7B5F1cA3e0f364392AAE9Ab17657b2849f3F; // 20bytes
  bool d = true; // 1 byte
  uint64 public e = 15; // 8bytes
  // 32 bytes, all values will be stored in slot 0

  // 0x 0f 01 648faad551af1da6d6556f0e3c41b37b6055bad1 000a 07

  uint256 public f = 200; // 32bytes -> slot 1

  uint8 public g = 40; // 1byte -> slot 2

  uint256 public h = 789; // 32bytes -> slot 3

}