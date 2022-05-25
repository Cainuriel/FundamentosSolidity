// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
//@notice: Cambio en el envio de ethers para mostrar ataques por reentrada.
contract Hucha is Ownable 
{

    mapping(address => bool) public debtor;
    mapping(uint => uint) public check; 

    /**
   * Event for operations
   * @param message of operation
   * @param amount of operation
   */
    event operations(string message, uint amount);
        
    constructor()  {}
    
    function getbalance() view public returns(uint) 
    {
        return address(this).balance;
    }

    
    function enterFunds() public payable 
    {
 
        emit operations("Ingreso realizado de: ", msg.value);

    }
    
     function extractFunds(uint amount) onlyOwner public 
    {
              payable(msg.sender).transfer(amount);
              emit operations("Se han sacado: ", amount);
              
    }
       

    function paycheck(uint _check) public 
    {
            require(debtor[msg.sender], "Cheque pagado o inexistente");
            require(check[_check] != 0, "Este cheque no existe"); // si no existe el cheque devolvera cero.
            (bool success, ) = msg.sender.call{value: check[_check]}("");
            require(success, "Error");
            debtor[msg.sender] = false;
            emit operations("Se ha pagado: ", check[_check]);
    }
        
    
    function setdebtor(address _address, uint _checkId, uint256  _amount) onlyOwner public 
    {
        check[_checkId] = _amount;
        debtor[_address] = true;
         emit operations("Se ha generado una deuda de: ", check[_checkId]);
    }

  
}