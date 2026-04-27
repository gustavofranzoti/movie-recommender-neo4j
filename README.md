

# 🎬 Movie Recommendation Engine (Arrow -> Neo4j AuraDB)

Este projeto implementa um motor de recomendação personalizado utilizando **Graph Databases**. O foco é mapear preferências e prever interesses com base na similaridade entre perfis de usuários, utilizando uma abordagem de "Graph-First Design".

## 🏗️ Arquitetura e Planejamento
O diferencial deste projeto foi a etapa de planejamento. Antes da implementação, o esquema do grafo foi desenhado no **Arrow.app** para garantir uma estrutura normalizada e escalável.

<img src="img/Arrow_graph_v2.png" width="800" alt="Modelo de Dados Arrow">

### Stack Tecnológica:
- **Design:** Arrow.app (Graph Modeling).
- **Banco de Dados:** Neo4j (Graph Database).
- **Infraestrutura:** **Neo4j AuraDB (Cloud)** - Instância gerenciada em nuvem.
- **Dataset:** MovieLens via Kaggle.

## 🛠️ Engenharia de Dados & ETL
A transformação dos dados tabulares para o grafo foi feita via **Cypher**, aplicando técnicas de:
- **Normalização de Gêneros:** Criação de nós independentes para otimização de travessias.
- **Extração via Regex:** Separação de metadados temporais (anos) de strings brutas.
- **Sanitização:** Conversão de tipos para otimização de performance no ambiente Aura.

## 🧠 Inteligência do Modelo: Índice de Jaccard
O sistema utiliza a **Similaridade de Jaccard** para calcular a afinidade entre perfis. O motor identifica usuários com alta interseção de interesses e sugere títulos com base nessa vizinidade matemática.

<img width="1262" height="702" alt="Neo4J_Graph" src="https://github.com/user-attachments/assets/08d237d1-085e-4999-8349-e4a132d2e8e4" />

> **Fórmula:** `J(A, B) = |A ∩ B| / |A ∪ B|`

## 📂 Estrutura do Repositório
- `/01_limpeza_tratamento`: Scripts de ingestão e carga.
- `/02_modelo_jaccard`: Implementação da lógica de similaridade e recomendação.
- `/img`: Documentação visual do projeto.
