# Pedido de Compra - AGRUPADO.SQL

Conta apenas os valores distintos de `C7_NUM`, utilizando-o como índice de agrupamento. Através da cláusula `DISTINCT`.

```sql
SELECT 
    'Pedido de Compra - Total' AS Filtro, 
    COUNT(DISTINCT C7_NUM) AS Total
FROM 
    SC7010
WHERE 
    D_E_L_E_T_ <> '*'
UNION ALL
SELECT 
    'Pedido de Compra - Em Aberto' AS Filtro, 
    COUNT(DISTINCT C7_NUM) AS Total
FROM 
    SC7010
WHERE 
    D_E_L_E_T_ <> '*'
    AND C7_QUJE = '0'
    AND C7_QTDACLA = '0'
    AND C7_CONAPRO <> 'B'
    AND C7_TIPO = '1'
    AND C7_RESIDUO = ' '
UNION ALL
SELECT 
    'Pedido de Compra - Entregue' AS Filtro, 
    COUNT(DISTINCT C7_NUM) AS Total
FROM 
    SC7010
WHERE 
    D_E_L_E_T_ <> '*' 
    AND C7_QUJE >= C7_QUANT
UNION ALL
SELECT 
    'Pedido de Compra - Aguardando Aprovação' AS Filtro, 
    COUNT(DISTINCT C7_NUM) AS Total
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
    COUNT(DISTINCT C7_NUM) AS Total
FROM 
    SC7010
WHERE 
    D_E_L_E_T_ <> '*'
    AND C7_QTDACLA > 0
UNION ALL
SELECT 
    'Pedido de Compra - Recebido Parcialmente' AS Filtro, 
    COUNT(DISTINCT C7_NUM) AS Total
FROM 
    SC7010
WHERE 
    D_E_L_E_T_ <> '*'
    AND C7_QUJE <> 0
    AND C7_QUJE < C7_QUANT
    AND C7_RESIDUO = ' '
    AND C7_TIPO = 1;
```

### Alterações feitas:
1. **Uso de `COUNT(DISTINCT C7_NUM)`**:
   - Cada consulta agora conta apenas os valores únicos de `C7_NUM` que atendem às condições especificadas.

2. **Manutenção das condições**:
   - As condições existentes foram mantidas, garantindo que os filtros ainda segmentem os pedidos de compra como antes.

3. **Resultado**:
   - O resultado final exibirá a contagem de registros únicos de `C7_NUM` para cada categoria de filtro especificada.

### Validação
Antes de executar o script, certifique-se de que:
- A coluna `C7_NUM` está devidamente indexada para desempenho otimizado, caso a tabela seja muito grande.
- Os filtros especificados (como valores de `C7_QUJE`, `C7_RESIDUO`, etc.) continuam fazendo sentido para o novo contexto.