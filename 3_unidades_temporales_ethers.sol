//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Unidades {

    // unidades temporales
    uint public segundo = 1 seconds;
    uint public minuto = 1 minutes;
    uint public hora = 1 hours;
    uint public dia = 1 days;
    uint public semana = 1 weeks;   // years deprecated
    uint public ahora = block.timestamp;  // now is deprecated

    // unidades ethers
    uint public oneEther = 1 ether;
    uint public EtherInWeis = 1_000_000_000_000_000_000;
    
    uint public decimaParteDeUnEther = 0.1 ether;
    uint public centesimaParteDeUnEther = 0.01 ether;
    uint public weis = 687687;
    uint public gweiUnidad = 1 gwei;

    uint public tokenPrice;


     function priceToDollar(uint _oneDollar, uint _amountOfdollars)  public  
    {
        tokenPrice = _oneDollar * _amountOfdollars;
        
    }

}