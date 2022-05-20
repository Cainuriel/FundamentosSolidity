// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

 contract funciones 
{


  function multiplicar(uint _a, uint _b) external pure returns (uint) 
  {

       return _a * _b;
  }

  function sumar(uint _a, uint _b) public pure returns (uint balance) 
  {
    // return _a + multiplicar(_a, _b); // inaccesible por ser externa
    return _a + _b;
  }

  function restar(uint _a, uint _b) private pure returns (uint) 
  {
    return _a - _b;
  }
    
  function dividir(uint _a, uint _b) internal  pure returns (uint, uint, bool) 
  {
    uint result = _a / _b;
    uint residuo = _a % _b;
    if(residuo == 0) {
      return (result, residuo, true);
    } else {
      return (result, residuo, false);
    }
  }

 // function modulo(uint _a, uint _b) external pure virtual returns (uint);
  
}

contract Pagables is funciones 
{

  mapping(address => uint) balances;
  address internal owner;

    modifier segurity {

        require(msg.sender == owner, "Donde vas Baldomero ... ...esto no es tuyo");
        _;

    }

     /**
   * Event for token purchase logging
   * @param amount total sale balance
   * @param date collection date
   */
  event WithdrawTime(
    uint256 amount,
    uint256 date
  );

  constructor()  
  {
    owner = msg.sender;
  }

  function ingresar() public payable 
  {

       balances[msg.sender] = msg.value;
  }


   function balanceOf(address _owner) public view returns (uint balance) 
   {
    return balances[_owner];
  }

  function balanceOfContract() public view segurity returns  (uint balance) 
  {
    return address(this).balance;
  }

  function accesoFuncionesHeredadas(uint _a, uint _b) public pure returns (uint, uint) 
  {  
    (uint result, uint residuo,) = dividir(_a, _b);
    return (result, residuo);
    // return restar(_a, _b);  // innacesible por ser private
  }

  function withdraw() public segurity 
  {
      uint256 amount = balanceOfContract();
      payable(msg.sender).transfer(amount);
      emit WithdrawTime(amount, block.timestamp);
      
  }

    // function modulo(uint a, uint b) external pure override returns (uint) {
    //     return a % b;
    // }
}