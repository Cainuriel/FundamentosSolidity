//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VariablesGlobales {

        function creationHash(string memory _string) public pure returns(bytes32) {
            return keccak256(abi.encodePacked(_string));
        }

         function creationMultipleValuesHash(string memory _string, uint _number, address _address) public pure returns(bytes32) {
            return keccak256(abi.encodePacked(_string, _number,_address));
        }

           function signoFuncion(address _owner) public view returns(bytes4) {
        require(msg.sender == _owner);
         return msg.sig;

        }

      function keka() public pure returns(bytes32) {

         return keccak256(abi.encodePacked("signoFuncion(address)"));
       // return keccak256(bytes("signoFuncion(address)"));

        }


}