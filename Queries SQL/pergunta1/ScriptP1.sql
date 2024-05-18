-- Seleciona o nome da categoria do produto e a soma dos preços dos itens como ReceitaTotal
SELECT 
    Produtos.product_category_name AS CategoriaProduto,
    SUM(Itens.price) AS ReceitaTotal

-- Especifica as tabelas de onde os dados serão extraídos
FROM olist_products_dataset AS Produtos
-- Junta a tabela de produtos com a tabela de itens de pedido com base no product_id
JOIN olist_order_items_dataset AS Itens ON Produtos.product_id = Itens.product_id 

-- Agrupa os resultados pela categoria do produto
GROUP BY CategoriaProduto 

-- Ordena os resultados pela ReceitaTotal em ordem decrescente
ORDER BY ReceitaTotal DESC;