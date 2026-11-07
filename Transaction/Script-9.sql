-- Таблица клиентов
CREATE TABLE clients (
    client_id INT PRIMARY KEY,
    registration_date DATE NOT NULL,
    segment VARCHAR(50) CHECK (segment IN ('Mass', 'Premium Bronze', 'Premium Silver', 'Premium Gold', 'Premium Diamond', 'Private')) NOT NULL,
    region VARCHAR(100) NOT NULL
);

-- Таблица счетов
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    client_id INT REFERENCES clients(client_id) ON DELETE CASCADE,
    account_type VARCHAR(50) CHECK (account_type IN ('Дебетовый', 'Накопительный', 'Кредитный', 'Инвесткопилка')) NOT NULL,
    open_date DATE NOT NULL,
    currency VARCHAR(3) DEFAULT 'RUB'
);

-- Таблица транзакций
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT REFERENCES accounts(account_id) ON DELETE CASCADE,
    transaction_date TIMESTAMP NOT NULL,
    amount DECIMAL(15, 2) NOT NULL, 
    category VARCHAR(100) CHECK (category IN ('Супермаркеты', 'Рестораны', 'Транспорт', 'Развлечения', 'Зарплата', 'Переводы')) NOT NULL
);