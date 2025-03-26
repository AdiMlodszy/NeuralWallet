# NeuralWallet – Struktura bazy danych

Poniżej znajduje się opis tabel oraz relacji w bazie danych aplikacji NeuralWallet. Baza została zaprojektowana z myślą o elastycznym importowaniu wyciągów bankowych, śledzeniu transakcji, sald kont oraz ewentualnej obsłudze kredytów.

---

## Tabela: `accounts`

Reprezentuje konto finansowe użytkownika – zwykłe, oszczędnościowe lub kredytowe.

| Kolumna           | Typ danych    | Opis                                       |
| ----------------- | ------------- | ------------------------------------------ |
| `id`              | int, PK       | Unikalny identyfikator konta               |
| `name`            | varchar(100)  | Nazwa konta (np. "ING Osobiste")           |
| `type`            | enum          | Typ konta: 'standard', 'savings', 'credit' |
| `currency`        | varchar(3)    | Kod waluty (np. PLN, EUR)                  |
| `initial_balance` | decimal(10,2) | Saldo początkowe                           |
| `created_at`      | timestamp     | Data dodania konta do systemu              |

---

## Tabela: `transactions`

Reprezentuje pojedynczą operację finansową powiązaną z kontem.

| Kolumna          | Typ danych    | Opis                                                  |
| ---------------- | ------------- | ----------------------------------------------------- |
| `id`             | int, PK       | Unikalny identyfikator transakcji                     |
| `account_id`     | int, FK       | Powiązanie z kontem (`accounts.id`)                   |
| `date`           | date          | Data zaksięgowania transakcji                         |
| `amount`         | decimal(10,2) | Kwota transakcji (ujemna = wydatek, dodatnia = wpływ) |
| `currency`       | varchar(3)    | Kod waluty                                            |
| `description`    | text          | Główny opis transakcji                                |
| `category`       | varchar(50)   | Kategoria transakcji (opcjonalna)                     |
| `counterparty`   | varchar(255)  | Nazwa nadawcy/odbiorcy                                |
| `title`          | text          | Tytuł przelewu                                        |
| `operation_type` | varchar(50)   | Typ operacji (np. wpływ, opłata, przelew)             |
| `import_source`  | varchar(100)  | Nazwa źródła importu                                  |
| `raw_data`       | text / json   | Surowe dane z importu (opcjonalnie)                   |
| `created_at`     | timestamp     | Data dodania wpisu do bazy                            |

---

## Tabela: `credit_details`

Dane szczegółowe dotyczące kredytu – tylko dla kont typu 'credit'.

| Kolumna         | Typ danych    | Opis                         |
| --------------- | ------------- | ---------------------------- |
| `id`            | int, PK       | Unikalny identyfikator wpisu |
| `account_id`    | int, FK       | Powiązane konto kredytowe    |
| `start_date`    | date          | Data rozpoczęcia kredytu     |
| `amount`        | decimal(10,2) | Kwota kredytu                |
| `installment`   | decimal(10,2) | Miesięczna rata              |
| `due_date`      | date          | Termin spłaty                |
| `interest_rate` | decimal(5,2)  | Oprocentowanie (opcjonalnie) |
| `bank_name`     | varchar(100)  | Nazwa banku (opcjonalnie)    |

---

## Relacje między tabelami

- `accounts.id` → `transactions.account_id` (relacja 1:N)
- `accounts.id` → `credit_details.account_id` (relacja 1:0..1)

---

## Uwagi projektowe

- Pola `raw_data` i `import_source` w `transactions` umożliwiają elastyczny import różnych formatów wyciągów bankowych.
- Podział `accounts` / `credit_details` umożliwia trzymanie tylko potrzebnych danych per konto.
- Możliwość rozszerzenia o tabele `users`, `tags`, `budgets`, `categories` w kolejnych iteracjach.
