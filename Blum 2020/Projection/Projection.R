# Projection — Random Projection and the Johnson-Lindenstrauss Lemma
# Foundations of Data Science – Blum 2020, Ch. 2: High Dimensional Space
# Primary content file. The .qmd extracts summative output from labeled chunks below.

source("C:/Users/dkill/OneDrive/Documents/prep (May 2025).R")


# ---- setup ----------------------------------------------------------------

library(tidyverse)
library(dslabs)
library(glue)
library(patchwork)
library(MatchIt)   # lalonde data
library(hdm)       # pension data


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


# ---- application-lalonde --------------------------------------------------
# LaLonde (1986) / Dehejia-Wahba (1999) job training data.
# Causal question: does job training (treat) raise 1978 earnings (re78)?
# Illustrates OLS-as-projection via the Frisch-Waugh-Lovell theorem:
# controlling for covariates = projecting both Y and D onto the orthogonal
# complement of the control subspace, then regressing residual on residual.
# The coefficient is identical to full OLS — guaranteed by FWL.

data("lalonde")

ctrl_fmla  <- re78 ~ age + educ + race + married + nodegree + re74 + re75
full_fmla  <- re78 ~ treat + age + educ + race + married + nodegree + re74 + re75
treat_fmla <- treat ~ age + educ + race + married + nodegree + re74 + re75

tau_naive_l <- coef(lm(re78 ~ treat, data = lalonde))["treat"]
tau_full_l  <- coef(lm(full_fmla,    data = lalonde))["treat"]

# Project out controls from both Y and D; regress residual on residual
e_Y_l <- residuals(lm(ctrl_fmla,  data = lalonde))
e_D_l <- residuals(lm(treat_fmla, data = lalonde))
tau_fw_l <- coef(lm(e_Y_l ~ e_D_l))["e_D_l"]

stopifnot(isTRUE(all.equal(tau_full_l, tau_fw_l, check.names = FALSE)))

lalonde_fw <- tibble(e_D = e_D_l, e_Y = e_Y_l)

names(lalonde)

l1 <- lm(re78 ~ treat + age + educ + race + married + nodegree + re74 + re75,
         data=lalonde)
summary(l1)


# ---- visualization-lalonde ------------------------------------------------

p_naive_l <- lalonde |>
  mutate(treat = factor(treat, labels = c("Control", "Treated"))) |>
  ggplot(aes(x = treat, y = re78)) +
  geom_jitter(width = 0.15, alpha = 0.3, size = 0.8, color = medium_blue) +
  geom_pointrange(
    stat = "summary", fun = mean,
    fun.min = \(x) mean(x) - sd(x) / sqrt(length(x)),
    fun.max = \(x) mean(x) + sd(x) / sqrt(length(x)),
    color = usaid_red, size = 0.5
  ) +
  scale_y_continuous(labels = scales::dollar_format(scale = 1e-3, suffix = "K")) +
  labs(
    title    = "Raw comparison",
    subtitle = glue("τ̂ = {scales::dollar(round(tau_naive_l, -2))}"),
    x        = NULL,
    y        = "1978 earnings (re78)"
  )

p_fw_l <- lalonde_fw |>
  ggplot(aes(x = e_D, y = e_Y)) +
  geom_point(alpha = 0.25, size = 0.8, color = medium_blue) +
  geom_smooth(method = "lm", se = FALSE, color = usaid_red, linewidth = 0.9) +
  scale_y_continuous(labels = scales::dollar_format(scale = 1e-3, suffix = "K")) +
  labs(
    title    = "After projecting out controls  (FWL)",
    subtitle = glue("τ̂ = {scales::dollar(round(tau_fw_l, -2))}"),
    x        = "Residual treatment  ê_D",
    y        = "Residual outcome  ê_Y"
  )

p_naive_l + p_fw_l +
  plot_annotation(
    title    = "Frisch-Waugh-Lovell: OLS as projection",
    subtitle = "LaLonde job training data  |  n = 614"
  )


# ---- application-pensions -------------------------------------------------
# 401(k) pension eligibility data (Chernozhukov & Hansen 2004, via hdm).
# Causal question: does 401(k) participation (p401) raise net financial assets?
# Same FWL projection geometry as LaLonde; larger n (≈ 9,915), richer covariates.

data("pension")

ctrl_p    <- net_tfa ~ age + fsize + inc + educ + marr + twoearn + pira + nifa
full_p    <- net_tfa ~ p401 + age + fsize + inc + educ + marr + twoearn + pira + nifa
treat_p   <- p401 ~ age + fsize + inc + educ + marr + twoearn + pira + nifa

tau_naive_p <- coef(lm(net_tfa ~ p401, data = pension))["p401"]
tau_full_p  <- coef(lm(full_p,          data = pension))["p401"]

e_Y_p <- residuals(lm(ctrl_p,  data = pension))
e_D_p <- residuals(lm(treat_p, data = pension))
tau_fw_p <- coef(lm(e_Y_p ~ e_D_p))["e_D_p"]

stopifnot(isTRUE(all.equal(tau_full_p, tau_fw_p, check.names = FALSE)))

pension_fw <- tibble(e_D = e_D_p, e_Y = e_Y_p)


# ---- visualization-pensions -----------------------------------------------

p_naive_p <- pension |>
  mutate(p401 = factor(p401, labels = c("Non-participant", "Participant"))) |>
  ggplot(aes(x = p401, y = net_tfa)) +
  geom_jitter(width = 0.15, alpha = 0.08, size = 0.4, color = medium_blue) +
  geom_pointrange(
    stat = "summary", fun = mean,
    fun.min = \(x) mean(x) - sd(x) / sqrt(length(x)),
    fun.max = \(x) mean(x) + sd(x) / sqrt(length(x)),
    color = usaid_red, size = 0.5
  ) +
  scale_y_continuous(labels = scales::dollar_format(scale = 1e-3, suffix = "K")) +
  labs(
    title    = "Raw comparison",
    subtitle = glue("τ̂ = {scales::dollar(round(tau_naive_p, -2))}"),
    x        = NULL,
    y        = "Net financial assets"
  )

p_fw_p <- pension_fw |>
  ggplot(aes(x = e_D, y = e_Y)) +
  geom_point(alpha = 0.08, size = 0.4, color = medium_blue) +
  geom_smooth(method = "lm", se = FALSE, color = usaid_red, linewidth = 0.9) +
  scale_y_continuous(labels = scales::dollar_format(scale = 1e-3, suffix = "K")) +
  labs(
    title    = "After projecting out controls  (FWL)",
    subtitle = glue("τ̂ = {scales::dollar(round(tau_fw_p, -2))}"),
    x        = "Residual treatment  ê_D",
    y        = "Residual outcome  ê_Y"
  )

p_naive_p + p_fw_p +
  plot_annotation(
    title    = "Frisch-Waugh-Lovell: OLS as projection",
    subtitle = "401(k) pension data  |  n ≈ 9,915"
  )


# ---- derivation -----------------------------------------------------------
# (notes on the concentration inequality and union bound proof)




# ---- simulation -----------------------------------------------------------
# (theoretical simulations — see Projection_lesson.qmd)


