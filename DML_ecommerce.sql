-- Inserir dados na tabela de clientes

insert into payment (idPayment, typePayment, limitAvaliable) values
(1, 'Boleto', 1000.0),
(2, 'Cartão', 2000.0),
(3, 'Dois cartões', 3000.0);

insert into clients (Fname, Minit, Lname, Adress) values 
('Maria', 'A.', 'Oliveira', 'Rua A, 123'),
('João', 'B.', 'Silva', 'Rua B, 456'),
('Carlos', 'C.', 'Moura', 'Rua C, 789'),
('Ana', 'D.', 'Lima', 'Rua D, 321'),
('Felipe', 'E.', 'Gomes', 'Rua E, 654'),
('Juliana', 'F.', 'Santos', 'Rua F, 987'),
('Eduardo', 'G.', 'Souza', 'Rua G, 654'),
('Beatriz', 'H.', 'Costa', 'Rua H, 321'),
('Renato', 'I.', 'Alves', 'Rua I, 555'),
('Patrícia', 'J.', 'Martins', 'Rua J, 888');

-- Inserir pedidos para clientes (1:N entre Cliente e Pedido)
insert into orders (idClient, orderSatus, orderDescription, sendValue, paymentCash) values
(1, 'Confirmado', 'Pedido de smartphone', 10.0, true),
(1, 'Confirmado', 'Pedido de notebook', 12.0, false),
(2, 'Em processamento', 'Pedido de camiseta', 5.0, false),
(3, 'Confirmado', 'Pedido de sofá', 15.0, true),
(4, 'Em processamento', 'Pedido de cadeira gamer', 20.0, false),
(5, 'Confirmado', 'Pedido de notebook', 12.0, true),
(6, 'Confirmado', 'Pedido de boneca interativa', 8.0, false),
(6, 'Confirmado', 'Pedido de fone de ouvido', 6.0, true),
(7, 'Em processamento', 'Pedido de tênis esportivo', 25.0, true),
(8, 'Confirmado', 'Pedido de cama box', 40.0, false),
(9, 'Confirmado', 'Pedido de carrinho de controle remoto', 15.0, false),
(10, 'Cancelado', 'Pedido de bicicleta', 50.0, true);

-- Inserir dados na tabela de produtos
insert into product (Pname, classificatio_kids, Val, category, avaliation, size) values
('Smartphone', true,3570.0, 'Eletrônico', 4.5, 'M'),
('Notebook', false, 4690.0, 'Eletrônico', 4.7, 'G'),
('Camiseta', true, 100.0, 'Vestimenta', 4.2, 'M'),
('Sofá', false, 500.8,'Móveis', 4.8, 'G'),
('Cadeira Gamer', false, 1500.0, 'Móveis', 5.0, 'M'),
('Boneca Interativa', true, 150.0, 'Brinquedos', 4.3, 'P'),
('Fone de Ouvido', false, 500.0,  'Eletrônico', 4.6, 'P'),
('Tênis Esportivo', false, 500.0,  'Vestimenta', 4.5, 'G'),
('Cama Box', false, 1000.0,'Móveis', 4.9, 'G'),
('Carrinho Controle Remoto', true, 350.0, 'Brinquedos', 4.1, 'P');

-- Inserir dados na tabela de produtos em pedidos (N:M entre Produto e Pedido)
insert into productOrder (idProduct, idOrder, pQuantity, pStatus) values 
(1, 1, 1, 'Disponível'),
(2, 1, 1, 'Disponível'),
(3, 2, 2, 'Disponível'),
(4, 3, 1, 'Disponível'),
(5, 4, 2, 'Disponível'),
(1, 5, 1, 'Disponível'),
(2, 5, 1, 'Disponível'),
(6, 6, 3, 'Disponível'),
(7, 7, 2, 'Disponível'),
(8, 8, 1, 'Disponível'),
(9, 9, 2, 'Disponível'),
(10, 10, 1, 'Sem estoque'),
(1, 11, 1, 'Disponível'),
(4, 12, 1, 'Disponível');

-- Inserir dados na tabela de pagamento para pedidos (N:M entre Pedido e Pagamento)
insert into orders_payment (idOrder, idPayment, ValuePay) values
(1, 1, 10.0),
(1, 2, 5.0), 
(2, 3, 7.0),
(3, 1, 15.0),
(4, 2, 10.0),
(5, 3, 6.0),
(6, 2, 8.0),
(7, 1, 20.0),
(8, 3, 40.0),
(9, 2, 15.0),
(10, 1, 30.0),
(11, 2, 50.0);

-- Inserir dados na tabela de fornecedores (N:M entre Produto e Fornecedor)
insert into supplier (SocialName, CNPJ, Contact) values
('Fornecedor A', '12345678000123', '999123456'),
('Fornecedor B', '98765432000187', '998765432'),
('Fornecedor C', '23456789000100', '997654321');

-- Relacionamento Produto - Fornecedor
insert into productSupplier (idSupplier, idProduct, Quantity) values
(1, 1, 50), 
(1, 2, 40), 
(2, 3, 80),
(2, 4, 100),
(3, 5, 60),
(1, 6, 150),
(3, 7, 200),
(2, 8, 120),
(1, 9, 75),
(2, 10, 90);

-- Inserir dados na tabela de vendedores
insert into seller (SocialName, AbsName, Location, Contact) values
('Vendedor 1', 'Paulo Souza', 'São Paulo', '991234567'),
('Vendedor 2', 'Lucas Oliveira', 'Rio de Janeiro', '992345678'),
('Vendedor 3', 'Fernanda Costa', 'Belo Horizonte', '993456789');

-- Relacionamento Produto - Vendedor
insert into productSeller (idSeller, idProduct, prodQuantity) values
(1, 1, 20),
(1, 3, 50),
(2, 2, 30),
(2, 4, 40),
(3, 5, 10),
(3, 6, 60),
(1, 7, 15),
(2, 8, 10),
(3, 9, 30);

-- Inserir dados na tabela de estoques (1:N entre Estoque e Produto)
insert into storages (Location, quantity) values
('Armazém A', 200),
('Armazém B', 150),
('Armazém C', 300),
('Armazém D', 100);

-- Relacionamento Produto - Estoque
insert into productStorage (idProduct, idStorage, Location) values
(1, 1, 'Armazém A'),
(2, 2, 'Armazém B'),
(3, 3, 'Armazém C'),
(4, 1, 'Armazém A'),
(5, 4, 'Armazém D'),
(6, 2, 'Armazém B'),
(7, 3, 'Armazém C'),
(8, 4, 'Armazém D'),
(9, 1, 'Armazém A'),
(10, 2, 'Armazém B');

-- Inserir dados na tabela de entregas (1:N entre Pedido e Entrega)

insert into delivery (idProduct, idOrder, trackingCode, dStatus) values 
(1, 1, 1234, 'Iniciada'),    
(2, 2, 6789, 'Finalizada'),      
(3, 3, 5432, 'Não iniciada'),    
(4, 4, 9876, 'Finalizada'),     
(5, 5, 1357, 'Iniciada'),    
(6, 6, 2468, 'Não iniciada'),   
(7, 7, 1122, 'Finalizada'),     
(8, 8, 4455, 'Iniciada'),     
(9, 9, 7890, 'Não iniciada'),    
(10, 10, 3456, 'Finalizada');   