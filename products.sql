CREATE DATABASE loja;
use loja;

CREATE TABLE produtos (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
quantidade INT 
); 

insert into produtos VALUES
('1', 'Rimel', 50);
 insert into produtos VALUES
('2', 'Sombra', 35);
 insert into produtos VALUES
('3', 'Base', 80);

CREATE TABLE log_estoque (
id_log INT PRIMARY KEY AUTO_INCREMENT,
id_produto INT,
quantidade_antiga INT,
quantidade_nova INT,
data_alteracao DATETIME
);

DELIMITER $$

CREATE TRIGGER after_quantidade_update
AFTER UPDATE ON produtos
FOR EACH ROW
BEGIN
    IF OLD.quantidade != NEW.quantidade THEN
        INSERT INTO log_estoque (id_produto, quantidade_antiga, quantidade_nova)
        VALUES (OLD.id, OLD.quantidade, NEW.quantidade);
    END IF;
END$$

DELIMITER ;

INSERT INTO produtos (nome, quantidade) VALUES ('Rimel', 50);
UPDATE produtos SET quantidade = 75 WHERE nome = 'Rimel';
SELECT * FROM log_estoque;

