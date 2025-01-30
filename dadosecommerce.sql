USE ecommerce;

SHOW TABLES;
DESC clients;

INSERT INTO clients(Fname, Minit, Lname, CPF, Address) 
VALUES ('Ana','B','Costa', 12345678, 'Rua das Flores 101, Belo Horizonte - MG'),
       ('Carlos','C','Oliveira', 987654321,'Avenida Paulista 999, São Paulo - SP'),
       ('Beatriz','L','Silva', 45678912,'Rua das Laranjeiras 450, Rio de Janeiro - RJ'),
       ('Mariana','S','Santos', 789123456,'Rua do Sol 345, Curitiba - PR'),
       ('Felipe','G','Moraes', 98745631,'Avenida Brasil 78, Porto Alegre - RS'),
       ('Fernanda','A','Pereira', 654789123,'Rua das Acácias 123, Campinas - SP');

DESC product;

INSERT INTO product(Pname, Classification_kids, Category, Feedback, Size) 
VALUES ('Headphone',false,'Eletrônico','4',null),
       ('Boneca Frozen',true,'Brinquedos','3',null),
       ('Camiseta Nike',true,'Vestimenta','5',null),
       ('Microfone USB',false,'Eletrônico','4',null),
       ('Sofá Modular',false,'Móveis','3','3x57x80'),
       ('Arroz',false,'Alimentos','2',null),
       ('Smart TV',false,'Eletrônico','3',null);

DESC orders;

INSERT INTO orders (idOrderClient, OrderStatus, OrderDescription, ShippingCost)
VALUES (1, default,'compra via aplicativo',null),
       (2,default,'compra via aplicativo',50),
       (3,'Confirmado',null,null),
       (4,default,'compra via website',150);

DESC productOrder;

SELECT * FROM orders;

INSERT INTO productOrder(idPOproduct, idPOorder, poQuantity, poStatus) 
VALUES (1,1,2,'Disponivel'), 
       (2,2,1,'Disponivel'), 
       (3,3,1,'Disponivel');

DESC productStorage;

INSERT INTO productStorage (StorageLocation,Quantity) 
VALUES ('Rio de Janeiro',1000),
       ('Rio de Janeiro',500),
       ('São Paulo',10),
       ('São Paulo',100),
       ('São Paulo',10),
       ('Brasília',60);

SHOW TABLES;

INSERT INTO storeagelocation (idLproduct, idLstorage, location) 
VALUES (1,2,'RJ'),
       (2,6,'GO');

INSERT INTO supplier (SocialName, CNPJ, contact) 
VALUES ('Loja de Eletrônicos', 123456789123456,'21985474'),
       ('Móveis Modernos',854519649143457,'21985484'),
       ('Brinquedos Alegres', 934567893934695,'21975474');

INSERT INTO seller (SocialName, AbstName, CNPJ, CPF, location, contact) 
VALUES ('Eletro Tech', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
       ('Boutique Moda',null,null,123456783,'São Paulo', 219567895),
       ('Mundo Kids',null,456789123654485,null,'Campinas', 1198657484);

SELECT * FROM product;

INSERT INTO productSeller (idPseller, idPproduct, prodQuantity) 
VALUES (1,1,80),
       (2,2,10);

SELECT * FROM clients;

SELECT COUNT(*) FROM clients;

SELECT c.idClient, Fname AS Client_name, COUNT(*) AS Num_Orders
FROM clients c 
INNER JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY idClient;
