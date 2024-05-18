SELECT Produtos.product_category_name AS CategoriaProduto,
       SUM(Itens.price) AS ReceitaTotal
       
FROM olist_products_dataset AS Produtos
JOIN olist_order_items_dataset AS Itens
ON Produtos.product_id = Itens.product_id 

GROUP BY CategoriaProduto 
ORDER BY ReceitaTotal DESC;