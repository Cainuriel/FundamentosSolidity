//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringsBooleanoBytesAddresses {

    // cadenas de texto UTF-8 de longitud arbitraria. 
    // EN REALIDAD NO SON UN TIPO DE DATO SINO UN ARRAY DE BYTES DINAMICO
    string public stringvariable = "String Variable";
    // booleano
    bool public booleano;

    // bytes
    bytes32 public variableBytes; // de 1 a 32 Bytes

    bytes20 public veinteBytes; 

    bytes public UnByte;

    // address
    address public direccion;



    function comparacion() public view returns(bool) 
    {

     return   bytes20(direccion).length == veinteBytes.length;

    }
    ////////////////////// COMPARACION DE STRINGS
    function comparacion(string memory one, string memory two) public pure returns(bool) 
    {

     return   bytes(one).length == bytes(two).length ;

    }

    // ESTE CÓDIGO ESTA MAL SI SE QUERE SABER EL NUMERO DE CARACTERES
    function getStringLength(string memory _s) public pure returns (uint) 
    {
        bytes memory bs = bytes(_s);
        return bs.length;
    }

}