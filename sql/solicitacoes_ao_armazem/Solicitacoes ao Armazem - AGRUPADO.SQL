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
    'Solicitações ao Armazém - Total' AS Filtro, 
    COUNT(DISTINCT CONCAT(CP_FILIAL,CP_NUM)) AS Total
FROM 
    SCP010
WHERE 
    D_E_L_E_T_ <> '*' 
UNION ALL
SELECT 
    'Solicitações ao Armazém - Pendentes' AS Filtro, 
    COUNT(DISTINCT CONCAT(CP_FILIAL,CP_NUM)) AS Total
FROM 
    SCP010
WHERE 
    D_E_L_E_T_ <> '*' 
    AND CP_PREREQU = ' '
UNION ALL
SELECT 
    'Solicitações ao Armazém - Pré-Requisição Gerada' AS Filtro, 
    COUNT(DISTINCT CONCAT(CP_FILIAL,CP_NUM)) AS Total
FROM 
    SCP010
WHERE 
    D_E_L_E_T_ <> '*' 
    AND CP_PREREQU = 'S'
UNION ALL
SELECT 
    'Solicitações ao Armazém - Atendidas' AS Filtro, 
    COUNT(DISTINCT CONCAT(CP_FILIAL,CP_NUM)) AS Total
FROM 
    SCP010
WHERE 
    D_E_L_E_T_ <> '*' 
    AND CP_STATUS = 'E'
UNION ALL
SELECT 
    'Solicitações ao Armazém - Falta Baixar' AS Filtro, 
    COUNT(DISTINCT CONCAT(CP_FILIAL,CP_NUM)) AS Total
FROM 
    SCP010
WHERE 
    D_E_L_E_T_ <> '*' 
    AND CP_STATUS <> 'E' 
    AND CP_PREREQU = 'S';