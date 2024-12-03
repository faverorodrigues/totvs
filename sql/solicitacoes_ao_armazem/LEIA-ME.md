### Código

```sql
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
```

### Explicações:
1. **Cláusula `WHERE`**:
   - O filtro `D_E_L_E_T_ <> '*'` garante que você está desconsiderando registros marcados como excluídos.
   - Os filtros adicionais (`CP_PREREQU` e `CP_STATUS`) foram ajustados para respeitar a sintaxe SQL (com `=` em vez de `==` e valores entre aspas simples).

2. **Agrupamento por Condições**:
   - `UNION ALL` para combinar os resultados de diferentes contagens. Isso permite obter os totais para cada categoria de maneira separada.

3. **Alias para Colunas**:
   - Cada contagem possui um alias (`AS Total_Pendentes`, por exemplo) para facilitar a identificação no resultado.

4. **Uso Correto de Strings**:
   - No Protheus, os valores String devem ser comparados com aspas simples (`'`), não duplas (`"`).

### Resultado:
A consulta retornará um conjunto de resultados com as contagens separadas por tipo (Pendentes, Pré-Requisição Gerada, Atendidas, e Falta Baixar). 





Sim, é possível criar uma única consulta que retorna o nome de cada categoria em uma coluna, juntamente com o respectivo resultado em outra. Para isso, usamos o comando `UNION ALL` para combinar os resultados de cada filtro, adicionando uma coluna fixa que identifica cada categoria.

Segue o exemplo ajustado:

### Query Consolidada com Colunas Nomeadas

```sql
SELECT 
    'Pendentes' AS Categoria, 
    COUNT(*) AS Total
FROM 
    SCP010
WHERE 
    D_E_L_E_T_ <> '*' 
    AND CP_PREREQU = ' '
UNION ALL
SELECT 
    'Pré-Requisição Gerada' AS Categoria, 
    COUNT(*) AS Total
FROM 
    SCP010
WHERE 
    D_E_L_E_T_ <> '*' 
    AND CP_PREREQU = 'S'
UNION ALL
SELECT 
    'Atendidas' AS Categoria, 
    COUNT(*) AS Total
FROM 
    SCP010
WHERE 
    D_E_L_E_T_ <> '*' 
    AND CP_STATUS = 'E'
UNION ALL
SELECT 
    'Falta Baixar' AS Categoria, 
    COUNT(*) AS Total
FROM 
    SCP010
WHERE 
    D_E_L_E_T_ <> '*' 
    AND CP_STATUS <> 'E' 
    AND CP_PREREQU = 'S';
```

### Resultado da Query

Essa consulta retornará duas colunas:

- **Categoria**: O nome da categoria (como "Pendentes", "Pré-Requisição Gerada", etc.).
- **Total**: O número de registros que atendem à condição daquela categoria.

### Exemplo de Saída

| Categoria             | Total |
| --------------------- | ----- |
| Pendentes             | 10    |
| Pré-Requisição Gerada | 15    |
| Atendidas             | 20    |
| Falta Baixar          | 5     |

### Benefícios:

- Tudo fica em uma única tabela, mais fácil para exibição e manipulação em relatórios ou sistemas.
- Identificação clara das categorias.

Se precisar de mais personalizações, é só avisar!
