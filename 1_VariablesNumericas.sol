//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract VariablesNumericas {

    // variables enteras

    // sin signo
    uint public enteroSinSigno;
    // con signo
    int public enteroConSigno;

    // se puede especificar el número de bits. MULTIPLOS DE OCHO desde 8 a 256
    uint32 public treintadosBits = 4_294_967_295;    
    //    uint32 treintadosBits2 = 4294967296; // demasiado grande
    uint8 public ochoBits = 255;
    //  uint8 ochoBits2 = 256;

    uint public constant MILMILLONES = 1000_000_000;
    uint public immutable immutableDecimal; 

    constructor(uint _decimalinmmutable) {
            immutableDecimal = _decimalinmmutable;
    }

    function inicializerNumbers(uint unsignedNumber, int signedNumber) public {
        enteroSinSigno = unsignedNumber;
        enteroConSigno = signedNumber;
    }

    // ejemplo de casteo
    function casteo() public view returns(uint) {
      //  uint casteoOchoBits = uint(ochoBits);
        return ochoBits =  ochoBits * MILMILLONES;
    }


}