
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
//@notice: Contrato para almacenar Ethers y hacer pagares a cuentas. 
/// Este contrato puede que tenga la seguridad minima para el fin que se propone pero es muy mejorable
/// en la logica del negocio, por ejemplo: Hay que mejorar la construcción de los cheques para que
/// no puedan volver a ser cobrados. INVITO A QUE OS ATREVAIS A MEJORARLO.
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
            payable(msg.sender).transfer(check[_check]);
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