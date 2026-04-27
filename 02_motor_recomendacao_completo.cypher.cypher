// 1. Identifica usuários similares (Mantendo u1 no fluxo com WITH)
MATCH (u1:User {userId: 1})-[r1:RATED]->(m:Movie)<-[r2:RATED]-(u2:User)
WHERE r1.rating >= 4 AND r2.rating >= 4 AND u1 <> u2
WITH u1, u2, count(m) AS intersecao

MATCH (u1)-[:RATED]->(m1:Movie)
WITH u1, u2, intersecao, collect(elementId(m1)) AS set1
MATCH (u2)-[:RATED]->(m2:Movie)
WITH u1, u2, intersecao, set1, collect(elementId(m2)) AS set2

// 2. Filtra usuários com similaridade relevante
WITH u1, u2, (1.0 * intersecao / (size(set1) + size(set2) - intersecao)) AS jaccardIndex
WHERE jaccardIndex > 0.1 

// 3. Busca filmes que os similares amaram e você não viu
MATCH (u2)-[r3:RATED]->(recomenda:Movie)
WHERE r3.rating >= 4 
  AND NOT (u1)-[:RATED]->(recomenda)

// 4. Ranqueia as sugestões (Similaridade * Nota do Filme)
RETURN recomenda.title AS Filme, 
       sum(r3.rating * jaccardIndex) AS ScoreRecomendacao,
       count(*) AS QtdIndicacoes
ORDER BY ScoreRecomendacao DESC
LIMIT 10;