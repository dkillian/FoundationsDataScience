# Projection — Random Projection and the Johnson-Lindenstrauss Lemma
# Foundations of Data Science – Blum 2020, Ch. 2: High Dimensional Space
# Primary content file. The .qmd extracts summative output from labeled chunks below.

source("C:/Users/dkill/OneDrive/Documents/prep (May 2025).R")


# ---- setup ----------------------------------------------------------------

library(tidyverse)
library(dslabs)
library(glue)


# ---- application-mnist ----------------------------------------------------
# Load a 500-image subset of MNIST (d = 784 pixel dimensions).
# Explore how well random projection preserves pairwise distances and
# nearest-neighbor structure across a range of target dimensions k.

set.seed(7823)

mnist    <- read_mnist()
n        <- 500
idx      <- sample(nrow(mnist$train$images), n)
X        <- mnist$train$images[idx, ]   # 500 x 784
labels   <- mnist$train$labels[idx]
d        <- ncol(X)                     # 784

# Pairwise distances in original space
D_orig   <- as.matrix(dist(X))

# Nearest neighbor in original space (excluding self)
diag(D_orig) <- Inf
nn_orig  <- apply(D_orig, 1, which.min)
diag(D_orig) <- 0

# Upper-triangle distances as a vector (for distortion calculation)
d_orig_vec <- D_orig[upper.tri(D_orig)]

# JL theoretical bound: k >= 8 * log(n) / eps^2
jl_bound <- function(n, eps) ceiling(8 * log(n) / eps^2)
jl_10    <- jl_bound(n, 0.10)   # eps = 10%
jl_20    <- jl_bound(n, 0.20)   # eps = 20%

# Sweep over k values: measure distortion and NN accuracy
ks <- c(5, 10, 20, 30, 50, 75, 100, 150, 200, 300, 400, 500)

mnist_results <- map_dfr(ks, function(k) {
  A      <- matrix(rnorm(k * d), nrow = k) / sqrt(k)
  X_proj <- X %*% t(A)
  D_proj <- as.matrix(dist(X_proj))

  # Max distortion
  d_proj_vec    <- D_proj[upper.tri(D_proj)]
  max_distortion <- max(abs(d_proj_vec^2 / d_orig_vec^2 - 1))

  # 1-NN accuracy
  diag(D_proj)  <- Inf
  nn_proj       <- apply(D_proj, 1, which.min)
  nn_accuracy   <- mean(nn_proj == nn_orig)

  tibble(k = k, max_distortion = max_distortion, nn_accuracy = nn_accuracy)
})


# ---- visualization-mnist --------------------------------------------------

# Plot 1: NN accuracy vs k, with JL bounds marked
p_nn <- mnist_results |>
  ggplot(aes(x = k, y = nn_accuracy)) +
  geom_line(color = medium_blue, linewidth = 0.9) +
  geom_point(color = medium_blue, size = 2.5) +
  geom_vline(xintercept = jl_10, linetype = "dashed",
             color = usaid_red, linewidth = 0.5) +
  geom_vline(xintercept = jl_20, linetype = "dotted",
             color = usaid_red, linewidth = 0.5) +
  annotate("text", x = jl_10 + 8, y = 0.25,
           label = glue("JL bound\n(ε=0.10)\nk={jl_10}"),
           color = usaid_red, hjust = 0, size = 3.2, lineheight = 0.9) +
  annotate("text", x = jl_20 + 8, y = 0.45,
           label = glue("JL bound\n(ε=0.20)\nk={jl_20}"),
           color = usaid_red, hjust = 0, size = 3.2, lineheight = 0.9) +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
  labs(
    title    = "Nearest-neighbor accuracy after random projection",
    subtitle = glue("MNIST digits  |  n = {n}  |  d = {d}"),
    x        = "Target dimension  k",
    y        = "1-NN accuracy"
  )

# Plot 2: Max distortion vs k, same JL markers
p_dist <- mnist_results |>
  ggplot(aes(x = k, y = max_distortion)) +
  geom_line(color = medium_blue, linewidth = 0.9) +
  geom_point(color = medium_blue, size = 2.5) +
  geom_vline(xintercept = jl_10, linetype = "dashed",
             color = usaid_red, linewidth = 0.5) +
  geom_vline(xintercept = jl_20, linetype = "dotted",
             color = usaid_red, linewidth = 0.5) +
  geom_hline(yintercept = c(0.1, 0.2), linetype = "dashed",
             color = light_grey, linewidth = 0.4) +
  annotate("text", x = max(ks) * 0.95, y = 0.115,
           label = "ε = 0.10", hjust = 1, size = 3, color = "gray40") +
  annotate("text", x = max(ks) * 0.95, y = 0.215,
           label = "ε = 0.20", hjust = 1, size = 3, color = "gray40") +
  labs(
    title    = "Maximum pairwise distance distortion after random projection",
    subtitle = glue("MNIST digits  |  n = {n}  |  d = {d}"),
    x        = "Target dimension  k",
    y        = "Maximum distortion  Δₖ"
  )


# ---- derivation -----------------------------------------------------------
# (notes on the concentration inequality and union bound proof)




# ---- simulation -----------------------------------------------------------
# (theoretical simulations — see Projection_lesson.qmd)


