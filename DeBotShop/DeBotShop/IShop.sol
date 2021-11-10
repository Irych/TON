
/**
Структура:
"Покупка"
- идентификатор/номер
- название
- количество (сколько надо купить)
- когда заведена
- флаг, что куплена (при заведении в список всегда false)
- цена, за которую купили [за все единиицы сразу] (при заведении в список всегда 0)
Структура "Саммари покупок"
- сколько предметов в списке "оплачено"
- сколько предметов в списке "не оплачено"
- на какую сумму всего было оплачено
Если список содержит "Молоко, кол-во 2", "сметана, кол-во 3", то в статистике это будет "5"
Интерфейсы:
"Список покупок"
- ...
"Transactable"
- sendTransaction
Абстрактный контракт
HasConstructorWithPubKey
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

struct Task {
    uint32 id;
    string text;
    uint64 createdAt;
    bool isDone;
}


struct Stat {
    uint32 completeCount;
    uint32 incompleteCount;
}

interface IShop {
   function createTask(string text) external;
   function updateTask(uint32 id, bool done) external;
   function deleteTask(uint32 id) external;
   function getTasks() external returns (Task[] tasks);
   function getStat() external returns (Stat);
}
