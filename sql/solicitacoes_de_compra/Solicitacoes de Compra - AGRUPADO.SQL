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
    'Solicitações de Compra - Total' AS Filtro, 
    COUNT(DISTINCT C1_FILIAL+C1_NUM) AS Total
FROM 
    SC1010
WHERE
    D_E_L_E_T_ <> '*'
UNION ALL
SELECT 
    'Solicitações de Compra - Pendente' AS Filtro, 
    COUNT(DISTINCT C1_FILIAL+C1_NUM) AS Total
FROM 
    SC1010
WHERE 
    D_E_L_E_T_ <> '*'
    AND C1_QUJE = 0
    AND C1_COTACAO = ' '
    AND C1_RESIDUO = ' '
    AND C1_APROV = 'L'
UNION ALL
SELECT 
    'Solicitações de Compra - Totalmente Atendida' AS Filtro, 
    COUNT(DISTINCT C1_FILIAL+C1_NUM) AS Total
FROM 
    SC1010
WHERE 
    D_E_L_E_T_ <> '*' 
    AND C1_QUANT = C1_QUJE
UNION ALL
SELECT 
    'Solicitações de Compra - Parcialmente Atendida' AS Filtro, 
    COUNT(DISTINCT C1_FILIAL+C1_NUM) AS Total
FROM 
    SC1010
WHERE 
    D_E_L_E_T_ <> '*'
    AND C1_QUJE < 0
    AND C1_RESIDUO = ' '
    AND C1_QUJE < C1_QUANT
UNION ALL
SELECT 
    'Solicitações de Compra - Em Processo de Cotação' AS Filtro, 
    COUNT(DISTINCT C1_FILIAL+C1_NUM) AS Total
FROM 
    SC1010
WHERE 
    D_E_L_E_T_ <> '*'
    AND C1_COTACAO <> ' '
    AND C1_QUJE = 0
    AND C1_RESIDUO = ' '
UNION ALL
SELECT 
    'Solicitações de Compra - Bloqueada' AS Filtro, 
    COUNT(DISTINCT C1_FILIAL+C1_NUM) AS Total
FROM 
    SC1010
WHERE 
    D_E_L_E_T_ <> '*'
    AND C1_QUJE = 0
    AND C1_COTACAO = ' '
    AND C1_APROV = 'B'