Get all users from Chicago.
SELECT * FROM "accounts" WHERE "city" ILIKE 'Chicago';

Get all users with usernames that contain the letter a.
SELECT * FROM "accounts" WHERE "username" ILIKE '%a%';

The bank is giving a new customer bonus! Update all records with an account balance of 0.00 and a transactions_attempted of 0. Give them a new account balance of 10.00.
SELECT * FROM "accounts" WHERE ("transactions_attempted" = 0 AND "account_balance" = 0);
UPDATE "accounts" SET "account_balance" = 10 WHERE "user_id" = 5;

Select all users that have attempted 9 or more transactions.
SELECT * FROM "accounts" WHERE "transactions_attempted" > 8;

Get the username and account balance of the 3 users with the highest balances, sort highest to lowest balance. NOTE: Research LIMIT
SELECT * FROM "accounts" WHERE "account_balance" > 0 ORDER BY "account_balance" DESC LIMIT 3;

Get the username and account balance of the 3 users with the lowest balances, sort lowest to highest balance.
SELECT "username", "account_balance" FROM "accounts" ORDER BY "account_balance" ASC LIMIT 3;

Get all users with account balances that are more than $100.
SELECT "username" FROM "accounts" WHERE "account_balance" > 100;

Add a new record.
INSERT INTO "public"."accounts"("user_id", "username", "city", "transactions_completed", "transactions_attempted", "account_balance") VALUES(11, 'ty', 'minneapolis', 15, 17, 5000.57) RETURNING "user_id", "username", "city", "transactions_completed", "transactions_attempted", "account_balance";

The bank is losing money in Miami and Phoenix and needs to unload low transaction customers: Delete users that reside in miami OR phoenix and have completed fewer than 5 transactions.
SELECT * FROM "accounts" WHERE "transactions_completed" < 5 AND ("city" = 'miami' OR "city" = 'phoenix');
DELETE FROM "accounts" WHERE "transactions_completed" < 5 AND ("city" = 'miami' OR "city" = 'phoenix');