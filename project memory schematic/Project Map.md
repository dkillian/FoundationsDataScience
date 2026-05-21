# Foundations of Data Science – Project Map

Full task map across all activities. Update when activities or tasks are added.

```mermaid
graph TD
    ROOT["📁 Foundations of Data Science<br/><i>AGENTS.md</i>"]

    ROOT --> BLUM["📁 Blum 2020<br/><i>Blum 2020/Blum 2020.md</i>"]
    ROOT --> MWM["📁 Mathematics with Ming<br/><i>Mathematics with Ming/Mathematics with Ming.md</i>"]

    BLUM --> HDS["High Dimensional Space<br/><i>misc/ch2.qmd</i>"]
    BLUM --> SVD["Singular Value Decomposition<br/><i>misc/ch3.qmd</i>"]
    BLUM --> RW["Random Walks Along Markov Chains<br/><i>(forthcoming)</i>"]

    HDS --> MI["Markov's Inequality<br/><i>Markov inequality/</i>"]
    HDS --> CI["Chebyshev's Inequality"]
    HDS --> LLN["Law of Large Numbers"]
    HDS --> PROJ["Projection<br/><i>Projection/Projection.md</i>"]
    HDS --> SG["Separating Gaussians<br/><i>Separating gaussians/</i>"]

    SVD --> CD["Centering Data"]
    SVD --> PCA["Principal Component Analysis"]
    SVD --> SMG["Separating Mixtures of Gaussians"]
    SVD --> RR["Ranking Relevance"]

    RW --> RW1["(forthcoming)"]

    MWM --> CEAP["Conditional Expectations as Projections<br/><i>Conditional expectations as projections/</i>"]
```
