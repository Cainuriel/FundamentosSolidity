// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

///@title:Malandrino Token
///@notice:Un malacioso desarrollador a intentando colocar este contrato a nuestro amigo Dani.
///@custom:La trampa: Utiliza una version de compilacion que no controla el overflow. 
///@custom:Solucion: Pasar a la version de compilacion ^0.8.0;
contract TokenMalandrino {

  mapping(address => uint) balances;
  uint public totalSupply;

  constructor(uint _initialSupply) public {
    balances[msg.sender] = totalSupply = _initialSupply;
  }

  function transfer(address _to, uint _value) public returns (bool) {
    require(balances[msg.sender] - _value >= 0);
    balances[msg.sender] -= _value;
    balances[_to] += _value;
    return true;
  }

  function balanceOf(address _owner) public view returns (uint balance) {
    return balances[_owner];
  }
  
}