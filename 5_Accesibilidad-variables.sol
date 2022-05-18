//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


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

     function sumarPrivate(uint value) public returns(uint) 
    {
       return  privado = privado + value;

    }

}