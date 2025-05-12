USE bd_carro;

DELIMITER $$

CREATE PROCEDURE InserirCarro (
	IN p_id INT,
    IN p_marca VARCHAR(100), -- parametros de entrada 
    IN p_modelo VARCHAR(100), -- IN entrada / OUT saida
    IN p_ano INT,
    IN p_valor DECIMAL(10,2),
    IN p_cor VARCHAR(100),
    IN p_numero_vendas INT
)
BEGIN
    INSERT INTO tb_carros (id, marca, modelo, ano, valor, cor, numero_vendas)
    VALUES (p_id, p_marca, p_modelo, p_ano, p_valor, p_cor, p_numero_vendas);
END $$

DELIMITER ;

CALL InserirCarro('10', 'Toyota', 'Corolla', '2021', '95000.00', 'Branco', '50');

SELECT * FROM tb_carros;


DELIMITER $$

CREATE PROCEDURE AtualizarValorCarro (IN p_id_carro INT, IN p_valor_novo DECIMAL(10,2))
BEGIN
    DECLARE v_valor_atual DECIMAL(10,2);
    
    -- Obter o valor atual do carro
    SELECT valor INTO v_valor_atual FROM tb_carros WHERE id = p_id_carro;

    -- Atualizar o valor do carro
    UPDATE tb_carros 
    SET valor = p_valor_novo 
    WHERE id = p_id_carro;
 modificação 
    -- Inserir o histórico daão de preço
    INSERT INTO historico_preco (data_modificacao, id_carro, valor_anterior, valor_novo);
    VALUES (NOW(), p_id_carro, v_valor_atual, p_valor_novo);
END $$

DELIMITER ;

CALL AtualizarValorCarro(1, 85000.00);

SELECT * FROM tb_carros;
SELECT * FROM historico_preco;