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
    COUNT(*) AS Total_Pendentes
FROM 
    SCP010
WHERE 
    D_E_L_E_T_ <> '*' 
    AND CP_PREREQU = ' '
UNION ALL
SELECT 
    COUNT(*) AS Total_PreRequisicao_Gerada
FROM 
    SCP010
WHERE 
    D_E_L_E_T_ <> '*' 
    AND CP_PREREQU = 'S'
UNION ALL
SELECT 
    COUNT(*) AS Total_Atendidas
FROM 
    SCP010
WHERE 
    D_E_L_E_T_ <> '*' 
    AND CP_STATUS = 'E'
UNION ALL
SELECT 
    COUNT(*) AS Total_Falta_Baixar
FROM 
    SCP010
WHERE 
    D_E_L_E_T_ <> '*' 
    AND CP_STATUS <> 'E' 
    AND CP_PREREQU = 'S';
