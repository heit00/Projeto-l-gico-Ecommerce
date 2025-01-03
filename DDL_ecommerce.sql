-- exercício de Mapeamento EER/ER para modelo relacional

create database if not exists ecommerce;
use ecommerce;

-- criação das tabelas
-- cliente
create table clients(
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    Adress varchar(30)
);

alter table clients auto_increment=1;

create table cliente_pf(
	idClient int primary key,
    CPF char(11) UNIQUE,
    constraint fk_C_pf foreign key(idClient) references clients(idClient)
		on update cascade
		on delete cascade
    );
    
create table cliente_pj(
	idClient int primary key,
    CNPJ char(15) UNIQUE,
	constraint fk_C_pj foreign key(idClient) references clients(idClient)
		on update cascade
		on delete cascade
);

-- produto

create table product(
	idProduct int auto_increment primary key,
    Pname varchar(100) not null,
    classificatio_kids bool default false,
    Val float not null,
    category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') not null,
    avaliation float default 0,
    size varchar(10)
);

alter table product auto_increment=1;

-- pedido

create table orders(
	idOrder int auto_increment primary key,
    idClient int,
    orderSatus enum ('Cancelado','Confirmado','Em processamento') not null default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false, -- se é boleto ou não (embora pareça meio ineficiente, optei por seguir o código da Júlia
    constraint fk_O_client foreign key(idClient) references clients(idClient)
		on update cascade
		on delete cascade
);

alter table orders auto_increment=1;

-- forma de pagamento

create table payment(
    idPayment int,
    typePayment enum('Boleto','Cartão','Dois cartões'),
    limitAvaliable float,
	primary key(idPayment)
);

-- forma de pagamento <-> pedido (tabela intermediária)

create table orders_payment(
	idOrder int,
    idPayment int,
    ValuePay float not null default 0,
    primary key(idOrder,idPayment),
    constraint fk_OP_order foreign key(idOrder) references orders(idOrder)
		on update cascade
		on delete cascade,
	constraint fk_OP_payment foreign key(idPayment) references payment(idPayment)
		on update cascade
		on delete cascade
);

-- estoque

create table storages(
	idStorage int auto_increment primary key,
    Location varchar(255),
    quantity int default 0
);

alter table storages auto_increment=1;

-- fornecedor

create table supplier(
	idSupplier int auto_increment primary key,
	SocialName varchar(255) not null,
    CNPJ char(15) not null,
    Contact char(11) default 0,
	constraint unique_supplier unique (CNPJ)
);

alter table supplier auto_increment=1;

-- vendedor

create table seller(
	idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbsName varchar(255),
    Location varchar(255),
    Contact char(11) not null
);

alter table seller auto_increment=1;

create table seller_pj(
	idSeller int,
    CNPJ char(15) not null unique,
    primary key(idSeller),
    foreign key(idSeller) references seller(idSeller)
		on update cascade
		on delete cascade
);

create table seller_pf(
	idSeller int,
    CPF char(9) not null unique,
    primary key(idSeller),
    foreign key(idSeller) references seller(idSeller)
		on update cascade
		on delete cascade
);

-- produto_vendedor

create table productSeller(
	idSeller int,
    idProduct int,
	prodQuantity int default 1,
	primary key(idSeller,idProduct),
	constraint fk_PSE_seller foreign key(idSeller) references seller(idSeller)
		on update cascade
		on delete cascade,
	constraint fk_PSE_product foreign key(idProduct) references product(idProduct)
		on update cascade
		on delete cascade
);

-- produto_pedido

create table productOrder(
	idProduct int,
    idOrder int,
    pQuantity int default 1,
    pStatus enum('Disponível','Sem estoque') default 'Disponível',
    primary key(idProduct,idOrder),
    constraint fk_PO_product foreign key(idProduct) references product(idProduct)
		on update cascade
		on delete cascade,
	constraint fk_PO_order  foreign key(idOrder) references orders(idOrder)
		on update cascade
		on delete cascade
);

-- estoque_produto

create table productStorage(
	idProduct int,
    idStorage int,
    Location varchar(255) not null,
    primary key(idProduct,idStorage),
	constraint fk_PS_product foreign key(idProduct) references product(idProduct)
		on update cascade
		on delete cascade,
	constraint fk_PS_storage  foreign key(idStorage) references storages(idStorage)
		on update cascade
		on delete cascade
);

-- fornecedor_produto

create table productSupplier(
	idSupplier int,
    idProduct int,
    Quantity int not null,
    primary key(idSupplier,idProduct),
	constraint fk_PSU_product foreign key(idProduct) references product(idProduct)
		on update cascade
		on delete cascade,
	constraint fk_PSU_supplier foreign key(idSupplier) references supplier(idSupplier)
		on update cascade
		on delete cascade
);

-- entrega 

create table delivery(
	idDelivery int auto_increment primary key,
    idProduct int,
    idOrder int,
	trackingCode int not null,
    dStatus ENUM('Não iniciada', 'Iniciada', 'Finalizada') default 'Não iniciada',
	constraint delivery_unique unique(trackingCode),
	constraint fk_D_product foreign key(idProduct) references product(idProduct)
		on update cascade
		on delete cascade,
	constraint fk_D_order foreign key(idOrder) references orders(idOrder)
		on update cascade
		on delete cascade
);

alter table delivery auto_increment=1;