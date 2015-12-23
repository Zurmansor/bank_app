CREATE TABLE client
(
    id INT(11) PRIMARY KEY NOT NULL,
    first_name VARCHAR(32) NOT NULL,
    last_name VARCHAR(32) NOT NULL,
    email VARCHAR(32),
    phone VARCHAR(16) NOT NULL,
    address TEXT,
    created_at TIMESTAMP DEFAULT 'CURRENT_TIMESTAMP' NOT NULL
);
CREATE UNIQUE INDEX client_id_uindex ON client (id);
CREATE TABLE account
(
    id INT(11) PRIMARY KEY NOT NULL,
    client_id INT(11) NOT NULL,
    number INT(11) NOT NULL,
    balance DOUBLE NOT NULL,
    created_at TIMESTAMP DEFAULT 'CURRENT_TIMESTAMP' NOT NULL,
    active TINYINT(1) DEFAULT '1' NOT NULL,
    CONSTRAINT account_client_id_fk FOREIGN KEY (client_id) REFERENCES client (id)
);
CREATE INDEX account_client_id_fk ON account (client_id);
CREATE UNIQUE INDEX account_id_uindex ON account (id);
CREATE TABLE payment
(
    id INT(11) PRIMARY KEY NOT NULL,
    created_at TIMESTAMP DEFAULT 'CURRENT_TIMESTAMP' NOT NULL,
    amount DOUBLE NOT NULL,
    recipient_account_id INT(11) NOT NULL,
    sender_account_id INT(11) NOT NULL,
    transaction_id VARCHAR(32) NOT NULL,
    CONSTRAINT payment_account_id_fk FOREIGN KEY (recipient_account_id) REFERENCES account (id),
    CONSTRAINT payment_recipient_account_id_fk FOREIGN KEY (recipient_account_id) REFERENCES account (id),
    CONSTRAINT payment_sender_account_id_fk FOREIGN KEY (sender_account_id) REFERENCES account (id)
);
CREATE UNIQUE INDEX payment_id_uindex ON payment (id);
CREATE INDEX payment_recipient_account_id_fk ON payment (recipient_account_id);
CREATE INDEX payment_sender_account_id_fk ON payment (sender_account_id);