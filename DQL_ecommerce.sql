-- QUERY'S (PARTE 2 DO DESAFIO)
use ecommerce;

-- QUERY 1 numero de pedidos que cada pessoa realizou
select concat(Fname,' ',Lname) as Name, count(*) as N_orders from clients c join orders o on c.idClient = o.idClient group by Name;

-- QUERY 2 numero de pedidos acerca de cada tipo de produto que possuem mais de uma instância
select count(*) as Npedidos ,d.idProduct, d.Pname from orders b, productOrder c, product d where b.idOrder = c.idOrder and c.idProduct = d.idProduct group by idProduct having Npedidos>1 order by Npedidos DESC;

-- QUERY 3 mapeamento dos produtos que pessoas de fname = 'maria' pediram (com seus preços descontados 15%)
select concat(Fname,' ',Lname) as Name, d.idProduct, Pname, Val*0.85 as DiscontValue from clients a join orders b on a.idClient = b.idClient join productOrder c on b.idOrder = c.idOrder join product d on c.idProduct=d.idProduct group by idProduct, Name HAVING name like '%Maria%';

-- QUERY 4 mapeamento de delivery e produtos
select idDelivery, Pname from delivery a join productOrder b on a.Idproduct = b.idProduct and a.idOrder = b.idOrder join product c on b.idProduct = c.idProduct group by idDelivery order by Pname;

-- QUERY 5 mapeamento produto, fornecedores e estoque com enfoque a id Storage
select e.idStorage, group_concat(Pname) as Pnames, group_concat(c.SocialName)Suppliers from product a join productSupplier b on a.idProduct = b.idProduct join supplier c on b.idSupplier = c.idSupplier join productStorage d on a.idProduct = d.idProduct join storages e on d.idStorage = e.idStorage group by idStorage;

-- QUERY 6 Select básico de clients com nome que começa com A,B ou C
select Fname, idClient from clients where Fname like 'A%' or Fname like 'B%' or fname like 'C%';

-- QUERY 7 Select básico de products
select Pname, Val, idProduct from product Order by Val DESC;
