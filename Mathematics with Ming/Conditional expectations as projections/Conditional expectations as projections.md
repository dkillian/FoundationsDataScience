# Conditional Expectations as Projections – Task Memory

## Activity Setup
Follow the Activity Setup Guide at: `C:\Users\dkill\OneDrive\Documents\ActivitySetupGuide.md`
Read this at the start of each session to initialize or resume work on this task.

## Parent Activity
Mathematics with Ming — `Mathematics with Ming/AGENTS.md`

## Overview
Study of conditional expectations in probability theory from a geometric perspective.
The central thesis: **E[X|Y] is the orthogonal projection of X onto the closed subspace
H_Y ⊆ L² of Y-measurable random variables.** This viewpoint unifies and simplifies the
standard rules of conditional expectations as orthogonality statements.

## Core Concepts

| Concept | Geometric interpretation |
|---------|--------------------------|
| E[X] (unconditional mean) | Projection of X onto the subspace of constants (span of 1) |
| E[X\|Y] (conditional expectation) | Projection of X onto H_Y (functions of Y only) |
| Law of total expectation (tower property) | Setting h(Y) = 1 in the orthogonality condition |
| Take-out-what's-given rule | h(Y) · g(Y) lies in H_Y, orthogonality still holds |
| Conditional variance formula (EVE's law) | Pythagorean theorem in L² after orthogonal decomposition |

## Key Result
**Definition (projection-based):** E[X|Y] = g(Y) ∈ H_Y such that E[(X − g(Y))²] is minimized.

**Characterization:** E[X|Y] = g(Y) ⟺ ⟨X − g(Y), h(Y)⟩ = 0 for all h(Y) ∈ H_Y.

## Files

| File | Description |
|------|-------------|
| `Conditional expectations as projections.qmd` | Main Quarto notes document |
| `Conditional expectations as projections.html` | Rendered output |
| `Conditional expectations as projections.R` | R code (simulations / visualizations) |
| `Law of iterated expectations.qmd` | Companion notes on the tower property |
| `Activity setup - Conditional Expectations Are Just Projections.md` | Full transcript of the reference video |

## Reference
**Video:** [Conditional Expectations Are Just Projections](https://www.youtube.com/watch?v=q5D7w_i2JPg)
YouTube channel focused on geometric/algebraic statistics. ~20 min. Covers:
- Geometry of L² (inner product, norm, orthogonality)
- Definition of E[X|Y] as a least-squares minimizer over H_Y
- Proofs of tower property, take-out rule, and conditional variance formula
- Appendix example: mean and variance of a random sum via conditioning on N

## Status
Active. Notes document in progress; Law of Iterated Expectations also drafted.
