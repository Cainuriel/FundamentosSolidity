//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// private: Accesibilidad para el contrato UNICAMENTE. Contratos que lo hereden no podrán alcanzarla.
/// internal: Accesibilidad para el contrato y demás contratos que la hereden. 
contract Accesibilidad 
{

  uint private privado = 250;
  uint internal interna = 500; // visibilidad por defecto.

  function multiplicar() public returns(uint) 
  {

      return privado = privado * 2;

  }

  function dividir() public returns(uint) 
  {

      return interna = interna / 2;

  }

}


contract PruebadeAcceso is Accesibilidad 
{

    uint public publica;

    function sumar(uint value) public returns(uint) 
    {
       return  publica = publica + value;

    }

   
    function sumarInternal(uint value) public returns(uint) 
    {

        return  interna = interna + value;

    }
// dará error porque no alcanzará a esta variable. Cambiar por la variable publica por ejemplo.
     function sumarPrivate(uint value) public returns(uint) 
    {
       return  privado = privado + value;

    }

}