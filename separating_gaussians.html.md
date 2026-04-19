---
title: "Separating Gaussians"
subtitle: "An explainer"
author: "Dan Killian"
date: today
toc: true
toc-depth: 3
number-sections: false
format:
  html:
    code-fold: true
    page-layout: full
execute:
  keep-md: true
editor: visual
reference-location: margin
---



## The Problem

We observe a sample of heights and know that it was drawn from a population composed of two groups — female and male — each with its own distribution of heights. The question is: given only a height measurement, what is the probability that the observation came from each group?

We model each group's heights as Gaussian, so the full population is a **Gaussian mixture**:

$$f(x) = \pi_f \cdot \phi(x; \mu_f, \sigma_f) + \pi_m \cdot \phi(x; \mu_m, \sigma_m)$$

where $\phi(x; \mu, \sigma)$ is the Gaussian density and $\pi_k$ is the **mixture weight** for group $k$ — the prior probability that a randomly drawn person belongs to that group.

### The data


::: {.cell}

```{.r .cell-code}
library(NHANES)

heights <- NHANES |>
    filter(Age >= 20, !is.na(Height), !is.na(Gender)) |>
    select(sex=Gender, age=Age, cm=Height) %>%
    mutate(inches=round(cm/2.54,0),
           ft=floor(inches/12),
           rem=round(inches%% 12,1),
           feet=round(inches/12,1),
           feet_lab = paste(ft, "'", rem, "\"", sep=""))
```
:::




::: {.cell}

```{.r .cell-code}
library(flextable)

parms <- heights |>
  group_by(sex) |>
  summarise(
    n       = n(),
    mean_cm = mean(cm, na.rm = TRUE),
    sd_cm   = sd(cm,   na.rm = TRUE)
  ) |>
  mutate(weight = n / sum(n))

parms |>
  select(sex, n, weight, mean_cm, sd_cm) |>
  flextable() |>
  colformat_double(j = "weight", digits = 3) |>
  colformat_double(j = c("mean_cm", "sd_cm"), digits = 1)
```

::: {.cell-output-display}

```{=html}
<div class="tabwid"><style>.cl-58883d8e{table-layout:auto;}.cl-587f20dc{font-family:'Gill Sans MT';font-size:10pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-5882dff6{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-5882e000{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-588313ae{background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-588313af{background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-588313b8{background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-588313c2{background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-588313c3{background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-588313cc{background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table data-quarto-disable-processing='true' class='cl-58883d8e'><thead><tr style="overflow-wrap:break-word;"><th class="cl-588313ae"><p class="cl-5882dff6"><span class="cl-587f20dc">sex</span></p></th><th class="cl-588313af"><p class="cl-5882e000"><span class="cl-587f20dc">n</span></p></th><th class="cl-588313af"><p class="cl-5882e000"><span class="cl-587f20dc">weight</span></p></th><th class="cl-588313af"><p class="cl-5882e000"><span class="cl-587f20dc">mean_cm</span></p></th><th class="cl-588313af"><p class="cl-5882e000"><span class="cl-587f20dc">sd_cm</span></p></th></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-588313b8"><p class="cl-5882dff6"><span class="cl-587f20dc">female</span></p></td><td class="cl-588313c2"><p class="cl-5882e000"><span class="cl-587f20dc">3,658</span></p></td><td class="cl-588313c2"><p class="cl-5882e000"><span class="cl-587f20dc">0.509</span></p></td><td class="cl-588313c2"><p class="cl-5882e000"><span class="cl-587f20dc">162.0</span></p></td><td class="cl-588313c2"><p class="cl-5882e000"><span class="cl-587f20dc">7.3</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-588313c3"><p class="cl-5882dff6"><span class="cl-587f20dc">male</span></p></td><td class="cl-588313cc"><p class="cl-5882e000"><span class="cl-587f20dc">3,524</span></p></td><td class="cl-588313cc"><p class="cl-5882e000"><span class="cl-587f20dc">0.491</span></p></td><td class="cl-588313cc"><p class="cl-5882e000"><span class="cl-587f20dc">175.8</span></p></td><td class="cl-588313cc"><p class="cl-5882e000"><span class="cl-587f20dc">7.5</span></p></td></tr></tbody></table></div>
```

:::
:::


### Mixture weights

The mixture weight $\pi_k$ is the share of the total sample belonging to group $k$:

$$\pi_k = \frac{n_k}{N}, \qquad N = \sum_k n_k$$

For this dataset, $\pi_f =$ 0.509 and $\pi_m =$ 0.491. These reflect the sample composition and serve as **prior probabilities** before observing any height.

Without mixture weights, we would implicitly treat each group as equally probable — equivalent to setting $\pi_f = \pi_m = 0.5$. When the groups differ in size, this introduces a systematic bias in classification.

## The Geometry

## The Algorithm

## Simulation
