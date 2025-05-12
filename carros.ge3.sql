DELIMITER $$
CREATE FUNCTION calculaDesconto(valor DECIMAL(10,2), desconto DECIMAL(5,2))
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
  RETURN valor = (valor * desconto / 100);
END$$
DELIMITER ;
SELECT marca, valor, calculaDesconto(valor, 50) AS preco_com_desconto
FROM carros;

DELIMITER $$
CREATE FUNCTION valorTotalVendasPorMarca(marca_param VARCHAR(10000))
RETURNS DECIMAL(50,2)
READS SQL DATA
BEGIN
DECLARE total DECIMAL(50,2);
SELECT SUM(valor * numero_Vendas) INTO total
FROM carros
WHERE marca = marca_param;
 RETURN total;
 END$$
 DELIMITER ;
 
 DELIMITER $$
 CREATE FUNCTION contarCarrosPorModelo(modelo_param VARCHAR(100))
RETURNS INT 
READS SQL DATA
BEGIN
DECLARE contagem INT;
SELECT COUNT(*) INTO contagem
FROM carros
WHERE modelo = modelo_param;
RETURN contagem;
END$$
DELIMITER ;

DELIMITER $$
CREATE FUNCTION nomeProprietario(id_carro_param INT)
RETURNS VARCHAR(100)
READS SQL DATA

BEGIN
DECLARE nome_proprietario VARCHAR(100);    
SELECT nome INTO nome_proprietario
FROM proprietario
WHERE id = id_carro_param;
RETURN nome_proprietario;
END$$

DELIMITER ;

SELECT nomeProprietario(3) AS nome_proprietario;
