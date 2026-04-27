# 🎬 Movie Recommendation Engine (Neo4j Aura & Jaccard)

Este projeto implementa um sistema de recomendação personalizado utilizando **Graph Databases**. O objetivo é mapear preferências e prever interesses com base na similaridade entre perfis de usuários, utilizando infraestrutura em nuvem e processamento de grafos.

## 🏗️ Ambiente e Infraestrutura
- **Base de Dados:** Neo4j Graph Database.
- **Plataforma:** **Neo4j AuraDB (Cloud)** - Instância gerenciada em nuvem utilizada para garantir escalabilidade e alta disponibilidade do grafo.
- **Dataset:** **MovieLens (via Kaggle)** - Base de dados composta por milhares de avaliações de filmes, títulos e gêneros.
- **Linguagem:** Cypher Query Language.

## 🛠️ Engenharia de Dados e ETL
O processo de transformação (ETL) foi realizado diretamente via Cypher para estruturar os dados brutos do Kaggle em uma rede relacional:
- **Normalização de Gêneros:** Conversão de strings multiclasses em nós independentes, permitindo travessias (traversals) de alta performance.
- **Extração via Regex:** Separação automatizada de metadados (ano e título) de strings brutas para permitir filtros temporais.
- **Sanitização de Tipos:** Conversão de strings para tipos numéricos (IDs e Ratings), otimizando o consumo de recursos na instância Aura.

## 🧠 Algoritmo: Índice de Jaccard
Diferente de recomendações simples por popularidade, este motor utiliza a **Similaridade de Jaccard** para calcular a afinidade matemática entre usuários:
- **Lógica:** O sistema identifica usuários com histórico de consumo similar (interseção de filmes bem avaliados) e recomenda títulos que o "sósia" assistiu, mas o usuário atual ainda não conhece.
- **Fórmula:** `J(A, B) = |A ∩ B| / |A ∪ B|`

## 📂 Organização do Repositório
- `/01_limpeza_tratamento`: Scripts de carga e preparação da base.
- `/02_modelo_jaccard`: Implementação da lógica de similaridade e o motor final de sugestão.
