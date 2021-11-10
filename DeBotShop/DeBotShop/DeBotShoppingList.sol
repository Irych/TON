
/**
Меню содержит:
Добавление продукта (обратите внимание, что вам несколько раз надо запрашивать у пользователя данные.
Сперва про название, затем про количество.
Вывод списка покупок
Удаление покупки
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

