// 1. Localiza gêneros com '|' e os separa em nós individuais
MATCH (m:Movie)-[:IN_GENRE]->(g:Genre)
WHERE g.name CONTAINS '|'
WITH m, g, split(g.name, '|') AS nomes_generos
UNWIND nomes_generos AS nome_final
MERGE (novoG:Genre {name: nome_final})
MERGE (m)-[:IN_GENRE]->(novoG)
WITH g
DETACH DELETE g;