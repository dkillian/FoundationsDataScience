# Foundations of Data Science – Project Memory

## Overview
Course notes for **Foundations of Data Science** by Blum, Hopcroft & Kannan (2020).
Published at: https://dkillian.github.io/FoundationsDataScience/

## Files
- `Foundations of Data Science_ch2.qmd` — Chapter 2 notes (active)
- `Foundations of Data Science (Blum 2020).pdf` — Source textbook (486 pages)
- `ch2_text.txt` — Extracted plain text of Chapter 2 (pages 12–38)
- `prep (May 2025).R` — Global setup: loads libraries, sets themes/palettes (sourced in YAML)

## Chapter 2 – High-Dimensional Space

### Document structure (current)
| Section | Title | Status |
|---------|-------|--------|
| 2.1 | Markov's Inequality | Complete — application, derivation, interactive Plotly widget (6 distributions, animated slider) |
| 2.2 | Chebyshev's Inequality | Complete — application, derivation (via Markov on (X−μ)²), two-point distribution static chart, interactive Plotly widget (5 distributions) |
| 2.3 | Law of Large Numbers | Complete — statement, derivation via Chebyshev, simulation with 3 distributions (Normal, Exponential, Bernoulli), two ggplot2 visualizations |
| 2.4 | Chernoff Bounds | Complete — MGF derivation, Binomial example, comparison plot vs Chebyshev |
| 2.5 | Higher Moments | Complete — k-th moment bound, Exponential(1) example, plot of optimal k |
| 2.6 | Gaussian Annulus | Complete — Chebyshev-based derivation, simulation for d=2,5,20,100,500 |
| 2.7 | Power Law Distributions | Complete — Pareto distribution, three-regime simulation (α=0.8, 1.5, 2.5) |
| 2.8 | Master Tail Bounds Theorem | Complete — but needs revision (see below) |

### Outstanding work – Chapter 2
1. **Fix Section 2.8**: My write-up described a general E[g(X)]/g(a) framework. Blum's Theorem 2.5 is a *specific* exponential concentration result for sums of independent zero-mean variables with bounded higher moments: P(|x| ≥ a) ≤ 3e^{−a²/(12nσ²)}. Section needs to be rewritten to match the textbook.
2. **Fix Section 2.6 (Gaussian Annulus)**: My derivation gives a Chebyshev-based polynomial bound. Blum's Theorem 2.9 gives a tighter exponential bound (≤ 3e^{−cβ²}) derived from Theorem 2.5. The tighter result should be noted.
3. **Unwritten sections** (2.3–2.9 in Blum, geometry of high dimensions):
   - 2.3 Geometry of High Dimensions (volume near surface)
   - 2.4 Properties of the Unit Ball (volume formula via Gamma function; volume near equator Theorem 2.7)
   - 2.5 Generating Points Uniformly at Random from a Ball
   - 2.6 Gaussians in High Dimension (Gaussian Annulus Theorem 2.9)
   - 2.7 Random Projection and Johnson-Lindenstrauss Lemma
   - 2.8 Separating Gaussians
   - 2.9 Fitting a Spherical Gaussian to Data

## Coding style / conventions
- Base R pipe `|>` (not magrittr `%>%`)
- `tidyverse` + `ggplot2` for static plots
- `plotly` + `htmltools` for interactive widgets
- Interactive widgets use tab buttons (custom CSS `.mkbtn`/`.mkactive` for Markov, `.cbbtn`/`.cbactive` for Chebyshev) with animated sliders
- Color scheme: `#0067B9` (blue), `#BA0C2F` (red), `lightgray` (neutral)
- Code chunks: visible by default; `#| echo: false` for plotting code and large widget blocks
- `flextable()` for data tables
- `set.seed()` uses arbitrary integers (not 42/123)
- Sections follow pattern: application → derivation → simulation/visualization

## Chapter 3 – Best-Fit Subspaces and SVD (next)
Blum Chapter 3 covers:
- 3.1 Introduction
- 3.2 Preliminaries
- 3.3 Singular Vectors
- 3.4 Singular Value Decomposition (SVD)
- 3.5 Best Rank-k Approximations
- 3.6 Left Singular Vectors
- 3.7 Power Method for SVD (+ faster method)
- 3.8 Singular Vectors and Eigenvectors
- 3.9 Applications of SVD (centering data, PCA, clustering mixture of Gaussians, ranking, discrete optimization)
- 3.10 Bibliographic Notes
- 3.11 Exercises
