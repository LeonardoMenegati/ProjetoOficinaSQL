-- queries

use projetoOficina;


-- Recuperação simples com SELECT
select * from tabela_ordem;
select * from tabela_clientes;
select * from tabela_veiculos;
select * from tabela_mecanicos;
select * from tabela_equipes;


-- Filtros com WHERE
/*Quais clientes possuem o carro Fit?*/
select Pnome, Lnome from tabela_clientes, tabela_veiculos
where idCliente = idVcliente and veiculo = 'Fit';

/*Quais mecânicos fazem parte da equipe Delta?*/
select idMecanicos, Pname, Lname, idEmecanicos from tabela_mecanicos, tabela_equipes
where idMecanicos = idEmecanicos and equipe = 'Delta';


-- Expressões com ATRIBUTOS DERIVADOS
/*Quais mecânicos moram no município de Barueri?*/
select * from tabela_mecanicos;
select concat(Pname, Lname) as Nome_Completo, endereco from tabela_mecanicos
where endereco like '%Barueri%';												/*like '%palavra%' busca a palavra citada dentro de um valor complexo*/

/*Quais veículos com orçamento maior que R$1.000 podemos dar 10% de desconto com pagamento á vista?*/
select * from tabela_veiculos;
select veiculo, idOrdem, valor, round(valor*0.10, 2) as desconto from tabela_ordem, tabela_veiculos		/*round deixa apenas duas casa decimais*/
where idOrdem = idVordem and valor >= 1000;


-- GROUP BY e ORDER BY
/*Quantos clientes possuem dois ou mais carros?*/
select concat(Pnome,' ',Lnome) as Nome_Completo, count(veiculo) from tabela_clientes, tabela_veiculos
where idCliente = idVcliente
group by idCliente
having count(veiculo) >=2;				/* condição do resultado do group by */


/*Selecione as datas de emissões da ordem de pedidos pela ordem crescente*/
select veiculo, idOrdem, dataEmissao from tabela_veiculos, tabela_ordem
where idVordem = idOrdem
order by dataEmissao;


-- JOIN
/*Quais mecânicos possuem uma ordem de serviço com status Aguardando Peça?*/
select idMecanicos, Pname, Lname from tabela_mecanicos
join tabela_equipes on idMecanicos = idEmecanicos
join tabela_ordem on idEordem = idOrdem
where statusOrdem = 'Aguardando peça';

/*Quais as ordens de serviços dos mecânicos que moram em Santo André?*/
select idOrdem, idMecanicos, Pname, Lname from tabela_mecanicos
join tabela_equipes on idMecanicos = idEmecanicos
join tabela_ordem on idEordem = idOrdem
where endereco like '%Santo André%';