//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Estructuras {

/// ///     STRUCT ///

    struct Estructura {
        string cadena;
        uint id;
        address direccion;
    }

    Estructura datosUsuario;

//////////////////////////////////////////////////////////

    /// //// MAPPING ///

    mapping(address => bool)  permisos;
    mapping(uint => Estructura) public permisos;


/////////////////////////////////////////////////////////

    /// ///     ENUM ///    
    enum lenguage {JAVASCRIPT, JAVA, PYTHON, SOLIDITY}

    lenguage public selectLenguage;


    function selectSolidity() public {
        require(permisos[msg.sender], "NO tiene permiso");
        selectLenguage = lenguage.SOLIDITY;
    }

    function selectSomeLenguage(uint8 _selection) public {
        require(_selection <= 3, "Seleccion incorrecta");
        require(permisos[msg.sender], "NO tiene permiso");
        selectLenguage = lenguage(_selection);
    }

/////////////////////////////////////////////////////////

}
