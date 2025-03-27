CREATE TABLE accounts (
  id INT IDENTITY (1, 1) PRIMARY KEY,
  name VARCHAR(100),
  type ENUM (
    'checking',
    'savings',
    'credit_card',
    'loan',
    'investment',
    'cash',
    'e_wallet',
    'other'
  ) NOT NULL DEFAULT 'checking',
  currency CHAR(4),
  initial_balance DECIMAL(10, 2),
  created_at TIMESTAMP
);

CREATE TABLE transactions (
  id INT IDENTITY (1, 1) PRIMARY KEY,
  account_id INT,
  date DATE,
  amount DECIMAL(10, 2),
  currency CHAR(4),
  description VARCHAR(MAX),
  category VARCHAR(100),
  counterparty VARCHAR(255),
  title VARCHAR(MAX),
  operation_type VARCHAR(50),
  import_source VARCHAR(100),
  raw_data JSON,
  created_at TIMESTAMP
);

CREATE TABLE credit_details (
  id INT IDENTITY (1, 1) PRIMARY KEY,
  account_id INT,
  start_date date,
  amount DECIMAL(10, 2),
  due_date date,
  interest_rate DECIMAL(10, 2),
  bank_name VARCHAR(100)
);
