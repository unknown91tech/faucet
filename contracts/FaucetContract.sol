// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Faucet {
  // private -> can be accesible only within the smart contract
  // internal -> can be accesible within smart contract and also derived smart contract

    uint public numOfFunders;
  mapping(address => bool) private funders;
  mapping(uint =>address) private lutfunders;

  receive() external payable{}

  function addFunds() external payable{
    address funder = msg.sender;
      if (!funders[funder]) {
      uint index = numOfFunders++;
      funders[funder] = true;
      lutfunders[index] = funder;
    }
  }

    function withdraw(uint withdrawAmount) external {
    if (withdrawAmount < 1000000000000000000) {
      payable(msg.sender).transfer(withdrawAmount);
    }
  }
  
  function getAllFunders() external view returns (address[] memory) {
    address[] memory _funders = new address[](numOfFunders);

    for (uint i = 0; i < numOfFunders; i++) {
      _funders[i] = lutfunders[i];
    }

    return _funders;
  }
 
  
  function getFunderAtIndex(uint8 index) external view returns(address){
    // address[] memory _funders = this.getallFunders();  u can use external and call the function like this but it will use more gas
    
    return lutfunders[index];
  }
  

}


// const instance = await Faucet.deployed();
// instance.addFunds({from: accounts[0], value: "2000000000000000000"})
// instance.addFunds({from: accounts[1], value: "2000000000000000000"})
// instance.withdraw("500000000000000000", {from: accounts[1]})
// instance.getFunderAtIndex(0)
// instance.getAllFunders()


// Block info
// Nonce - a hash that when combined with the minHash proofs that
// the block has gone through proof of work(POW)
// 8 bytes => 64 bits


  
  // this is a special function
  // it's called when you make a tx that doesn't specify
  // function name to call

  // External function are part of the contract interface
  // which means they can be called via contracts and other txs



  // pure, view - read-only call, no gas free
  // view - it indicates that the function will not alter the storage state in any way
  // pure - even more strict, indicating that it won't even read the storage state

  // Transactions (can generate state changes) and require gas fee
  // read-only call, no gas free

  // to talk to the node on the network you can make JSON-RPC http calls
