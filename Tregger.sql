# TRIGGER

select * from produto

DELIMITER $
CREATE TRIGGER TGR_ITEMSAIDA_ISERT AFTER INSERT

ON ITEMSAIDA
FOR EACH ROW
BEGIN
 UPDATE ITEMENTRADA SET QTDE = QTDE - NEW.QTDE
 WHERE PRODUTO_CODPRODUTO = NEW.PRODUTO_CODPRODUTO;
 END$