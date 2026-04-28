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

Используемая база:

```sql
ecommerce_test
Порядок запуска
psql -d ecommerce_test -f schema.sql
psql -d ecommerce_test -f task_1_insert_transaction.sql
psql -d ecommerce_test -f task_2_update_transaction.sql
psql -d ecommerce_test -f task_3_delete_transaction_rollback.sql
psql -d ecommerce_test -f task_4_group_by.sql
psql -d ecommerce_test -f task_5_cte.sql
psql -d ecommerce_test -f final_check.sql
Структура
schema.sql — создание таблиц и тестовых данных
task_1_insert_transaction.sql — INSERT нового покупателя, заказа и товаров в транзакции
task_2_update_transaction.sql — UPDATE данных в транзакции
task_3_delete_transaction_rollback.sql — DELETE, ROLLBACK и каскадное удаление
task_4_group_by.sql — агрегация через GROUP BY
task_5_cte.sql — запрос с CTE
final_check.sql — финальная проверка всей базы
