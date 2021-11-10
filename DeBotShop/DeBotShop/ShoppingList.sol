
/**
Смарт-контракт Списка покупок:
- конструктор
- контроль за правами доступа (onlyOwner)
- список покупок-статистика о покупках
- добавление покупки в список (параметры: название продукта, количество)
- удаление покупки из списка
- купить [помечает, чты вы купили; купить обратно, то есть сбросить флаг покупки  не надо делать]. 
параметры: (ID, цена)
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
