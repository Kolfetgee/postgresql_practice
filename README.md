# PostgreSQL Practice

Практическая работа по PostgreSQL.

## Что покрыто

- Создание схемы БД
- Внешние ключи
- INSERT в транзакции
- UPDATE в транзакции
- DELETE с ROLLBACK и ON DELETE CASCADE
- SELECT с GROUP BY
- SELECT с CTE
- Финальная проверка данных через JOIN

## База данных

### Используемая база:

```sql
ecommerce_test
```


## Структура файлов

- `schema.sql` — создание таблиц и вставка тестовых данных.
- `task_1_insert_transaction.sql` — добавление нового покупателя, заказа и позиций заказа в транзакции.
- `task_2_update_transaction.sql` — обновление данных в транзакции.
- `task_3_delete_transaction_rollback.sql` — удаление данных, проверка ROLLBACK и каскадного удаления.
- `task_4_group_by.sql` — запрос с GROUP BY.
- `task_5_cte.sql` — запрос с CTE.
- `final_check.sql` — финальная проверка базы через JOIN.

### Порядок запуска


Сначала создать базу данных:
```bash
psql -U postgres -d postgres -c "CREATE DATABASE ecommerce_test;"
```
Затем выполнить файлы по порядку:
```bash
psql -U postgres -d ecommerce_test -f schema.sql
psql -U postgres -d ecommerce_test -f task_1_insert_transaction.sql
psql -U postgres -d ecommerce_test -f task_2_update_transaction.sql
psql -U postgres -d ecommerce_test -f task_3_delete_transaction_rollback.sql
psql -U postgres -d ecommerce_test -f task_4_group_by.sql
psql -U postgres -d ecommerce_test -f task_5_cte.sql
psql -U postgres -d ecommerce_test -f final_check.sql
```

### Проверка

После выполнения `final_check.sql` должен выводиться итоговый список покупателей, их заказов и позиций заказа.

### Примечание

Файлы `task_1`, `task_2` и `task_3` используют транзакции.
Файлы `task_4` и `task_5` выполняют только чтение данных, поэтому транзакции не используются.