/* 
Copyright (c) 2024 - Presente, Grupo Favero Rodrigues,
feito por João Victor Neto Caneo.
   _              _____  _____      
  (_)            / __  \|  _  |     
   ___   ___ __  `' / /'| |/' | ___ 
  | \ \ / / '_ \   / /  |  /| |/ __|
  | |\ V /| | | |./ /___\ |_/ / (__ 
  | | \_/ |_| |_|\_____/ \___/ \___|
 _/ |                               
|__/
https://github.com/jvn20c  
https://github.com/faverorodrigues/
*/

SELECT 
    'Pedido de Compra - Total' AS Filtro, 
    COUNT(DISTINCT CONCAT(C7_FILIAL, C7_NUM)) AS Total
FROM 
    SC7010
WHERE 
    D_E_L_E_T_ <> '*'
UNION ALL
SELECT
    'Pedido de Compra - Em Aberto' AS Filtro, 
    COUNT(DISTINCT CONCAT(C7_FILIAL, C7_NUM)) AS Total
FROM
    SC7010
WHERE
    D_E_L_E_T_ <> '*'
    AND C7_QUJE = 0
    AND C7_QTDACLA = 0
    AND C7_CONAPRO <> 'B'
    AND C7_TIPO = 1
    AND C7_RESIDUO = ' '
UNION ALL
SELECT 
    'Pedido de Compra - Entregue' AS Filtro, 
    COUNT(DISTINCT CONCAT(C7_FILIAL, C7_NUM)) AS Total
FROM 
    SC7010
WHERE 
    D_E_L_E_T_ <> '*' 
    AND C7_QUJE >= C7_QUANT
UNION ALL
SELECT 
    'Pedido de Compra - Aguardando Aprovação' AS Filtro, 
    COUNT(DISTINCT CONCAT(C7_FILIAL, C7_NUM)) AS Total
FROM 
    SC7010
WHERE 
    D_E_L_E_T_ <> '*'
    AND C7_CONAPRO = 'B'
    AND C7_QUJE < C7_QUANT
    AND C7_RESIDUO = ' ' 
UNION ALL
SELECT 
    'Pedido de Compra - Em Recebimento (Pré-Nota)' AS Filtro, 
    COUNT(DISTINCT CONCAT(C7_FILIAL, C7_NUM)) AS Total
FROM 
    SC7010
WHERE 
    D_E_L_E_T_ <> '*'
    AND C7_QTDACLA > 0
UNION ALL
SELECT 
    'Pedido de Compra - Recebido Parcialmente' AS Filtro, 
    COUNT(DISTINCT CONCAT(C7_FILIAL, C7_NUM)) AS Total
FROM 
    SC7010
WHERE 
    D_E_L_E_T_ <> '*'
    AND C7_QUJE <> 0
    AND C7_QUJE < C7_QUANT
    AND C7_RESIDUO = ' '
    AND C7_TIPO = 1