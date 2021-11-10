
/**
Вывод списка покупок
Удаление покупки
Произвести покупку (от пользователя в том числе затребуется цена, за сколько он купил). 
То списке пометится флаг купленности и сохранится цена.
 */
pragma ton-solidity >=0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;

import "../Debot.sol";
import "../Terminal.sol";
import "../Menu.sol";
import "../AddressInput.sol";
import "../ConfirmInput.sol";
import "../Upgradable.sol";
import "../Sdk.sol";
