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
    mapping(uint => Estructura) public users;


/////////////////////////////////////////////////////////

    /// ///     ENUM ///    
    enum lenguage {JAVASCRIPT, JAVA, PYTHON, SOLIDITY}

    lenguage public selectLenguage;


    function selectSolidity() public {

        require(permisos[msg.sender], "No tiene permiso");
        selectLenguage = lenguage.SOLIDITY;

    }

    function selectSomeLenguage(uint8 _selection) public {

        require(_selection <= 3, "Seleccion incorrecta");
        require(permisos[msg.sender], "No tiene permiso");
        selectLenguage = lenguage(_selection);

    }

/////////////////////////////////////////////////////////

    /// ///     ARRAYS ///    

    // array fijo
    uint [] arrayFijo = [1,2,3,4,5,6,7,8];
    // array dinamico
    Estructura [] public arrayDinamico;


       function getFijo() public view returns(uint[] memory) {

        return arrayFijo;

    }

          function getDinamico() public view returns(Estructura[] memory) {

        return arrayDinamico;

    }

        function removeItemArray(uint i) public {

        delete arrayFijo[i];

        }

        function lengthArray() public view returns(uint) {

            return arrayFijo.length;

        }

        // eliminando elemento en array DESORDENADAMENTE
        function remove(uint index) public returns(uint){

        uint element = arrayFijo[index];
        arrayFijo[index] = arrayFijo[arrayFijo.length - 1];
        delete arrayFijo[arrayFijo.length - 1];
        arrayFijo.pop();
        return element;

        }

        function deleteOrdenado(uint index) public returns(uint) {
        
        uint startGas = gasleft();
        for(uint i = index; i < arrayFijo.length-1; i++){
        arrayFijo[i] = arrayFijo[i+1];      
        }
        arrayFijo.pop();
        uint gasUsed = startGas - gasleft();
        return gasUsed;
        }




///////////////////////////////////////////////////////////////////////////////////////////////////

    uint public contador;

    function crearUsuario(uint _idNFT, string memory _nombre) public  {

            require(!permisos[msg.sender], "Usted ya esta registrado");
            contador++;
            Estructura memory newEstructura  = Estructura(_nombre, _idNFT, msg.sender);
            users[contador] = newEstructura;
            permisos[msg.sender] = true;
            arrayDinamico.push(newEstructura);

    }

      function createArray() public view returns(Estructura[] memory) 
      {
            Estructura[] memory array = new Estructura[](contador);
            for(uint i = 0; i < contador; i++){
                array[i] = users[i + 1];
            }
            return array;
    }

}
