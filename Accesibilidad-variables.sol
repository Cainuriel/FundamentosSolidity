//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Variable_Private_e_Internal {

  uint private privado = 250;
  uint internal interna = 500; // visibilidad por defecto.

  function multiplicar() public returns(uint) {

      return privado = privado * 2;

  }

  function dividir() public returns(uint) {

      return interna = interna / 2;

  }

    function modulo() public view returns(uint) {

      return interna % 2;

  }

//     function ultimaCifra(uint number) public pure returns(uint) {

//       return number % 10;

//   }

//      function dividirDosNumeros(uint number1, uint number2) public pure returns(uint) {

//       return number1  / number2;

//   }

}


contract PruebadeAcceso is Variable_Private_e_Internal {

    uint public publica;

    function sumar(uint value) public returns(uint) {
       return  publica = publica + value;
    }

   
        function sumarInternal(uint value) public returns(uint) {
       return  interna = interna + value;
    }

    //  function sumarPrivate(uint value) public returns(uint) {
    //    return  privado = privado + value;
    // }



}