# 🎬 Sistema de Recomendação de Filmes (Neo4j & Jaccard)

Projeto de um motor de recomendação baseado em **Grafos**, utilizando o dataset MovieLens. O foco principal é a identificação de similaridade comportamental entre usuários para predição de preferências.

## 🛠️ Desafios Técnicos e ETL
Para estruturar o grafo, realizei um processo de saneamento de dados (ETL) no Cypher:
- **Normalização de Gêneros:** Transformação de strings separadas por delimitadores em nós independentes.
- **Extração via Regex:** Separação automatizada de anos de lançamento e títulos.
- **Sanitização:** Conversão de tipos de dados para otimização de consultas no Neo4j Aura.

## 🧠 Algoritmo: Índice de Jaccard
A inteligência do sistema baseia-se na **Similaridade de Jaccard**. O algoritmo calcula a afinidade entre usuários através da fórmula:
`J(A, B) = |A ∩ B| / |A ∪ B|`

Desta forma, o sistema identifica "sósias de gosto", gerando recomendações personalizadas.

## 📂 Estrutura do Repositório
- `01_limpeza_tratamento/`: Scripts para carga e preparação da base.
- `02_modelo_jaccard/`: Lógica de similaridade e o motor final de sugestão.