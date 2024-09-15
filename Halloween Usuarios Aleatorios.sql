create database halloween;
use halloween;

create table usuario (id_usuario int auto_increment primary key,
nome varchar (45) not null,
email varchar (100) not null,
idade int not null
); 

INSERT INTO usuario (nome, email, idade) VALUES ('teste da silva junior', 'teste@uol.com' , 16);
SELECT * from usuario;

DELIMITER $$

CREATE PROCEDURE InsereUsuariosAleatorios()
BEGIN
    DECLARE i INT DEFAULT 0;
    
    -- Loop para inserir 10.000 registros
    WHILE i < 10000 DO
        -- Gere dados aleatórios para os campos
        SET @nome := CONCAT('Usuario', i);
        SET @email := CONCAT('usuario', i, '@exemplo.com');
        SET @idade := FLOOR(RAND() * 80) + 18;  -- Gera uma idade entre 18 e 97 anos
        
        -- Insira o novo registro na tabela de usuários
        INSERT INTO usuario (nome, email, idade) VALUES (@nome, @email, @idade);
        -- Incrementa o contador
        SET i = i + 1;
    END WHILE;
END$$

-- Restaure o delimitador padrão
DELIMITER ;

call InsereUsuariosAleatorios();

