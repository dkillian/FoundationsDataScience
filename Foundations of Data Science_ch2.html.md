---
title: "Foundations of Data Science"
subtitle: "Chapter notes for textbook by Blum et al 2020"
author: "Dan Killian"
date: 2-1-2026
toc: true
toc-depth: 3
number-sections: false
format:
  html:
    code-fold: true
    page-layout: full
execute: 
  keep-md: true
server: shiny
editor: visual
reference-location: margin
---



# 2 High Dimensional Space

## 2.1 Markov's Inequality

### 2.1.1 Introduction and application

Markov's Inequality states the following:

$P(X \geq a) \leq \frac{E(X)}{a}$

The probability of some data point in the distribution X exceeding some threshold value $a$ cannot exceed the average of the distribution divided by $a$.

When all we know about a distribution is it's mean, Markov's Inequality sets an upper bound on the probability of observing a particular value of any data point in the distribution.

How might this look in practice?

Let $X$ be a discrete random variable with values $x_1, x_2, \ldots, x_n$ and probabilities $p_1, p_2, \ldots, p_n$ where $X \geq 0$.


::: {.cell}
::: {.cell-output-display}

```{=html}
<div class="tabwid"><style>.cl-173003c4{table-layout:auto;}.cl-1727ffee{font-family:'Gill Sans MT';font-size:10pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-172b5766{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-172b988e{background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-172b9898{background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-172b9899{background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table data-quarto-disable-processing='true' class='cl-173003c4'><thead><tr style="overflow-wrap:break-word;"><th class="cl-172b988e"><p class="cl-172b5766"><span class="cl-1727ffee">x</span></p></th><th class="cl-172b988e"><p class="cl-172b5766"><span class="cl-1727ffee">p</span></p></th></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-172b9898"><p class="cl-172b5766"><span class="cl-1727ffee">1</span></p></td><td class="cl-172b9898"><p class="cl-172b5766"><span class="cl-1727ffee">0.4</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-172b9898"><p class="cl-172b5766"><span class="cl-1727ffee">2</span></p></td><td class="cl-172b9898"><p class="cl-172b5766"><span class="cl-1727ffee">0.2</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-172b9898"><p class="cl-172b5766"><span class="cl-1727ffee">4</span></p></td><td class="cl-172b9898"><p class="cl-172b5766"><span class="cl-1727ffee">0.2</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-172b9898"><p class="cl-172b5766"><span class="cl-1727ffee">8</span></p></td><td class="cl-172b9898"><p class="cl-172b5766"><span class="cl-1727ffee">0.1</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-172b9899"><p class="cl-172b5766"><span class="cl-1727ffee">16</span></p></td><td class="cl-172b9899"><p class="cl-172b5766"><span class="cl-1727ffee">0.1</span></p></td></tr></tbody></table></div>
```

:::
:::


We get the expected value, or average, of the variable by summing over each value in the distribution times its weight.

$$E(X) = \sum_i x_i \cdot P(X = x_i)$$ $E(X)$ = $(1)(.4) + (2)(.2) + (4)(.2) + (8)(.1) + (16)(.1)$

So $E(X)$ = 4


::: {.cell}

:::


Now let's establish some arbitrary threshold $a\geq4$

In this example, what is $P(X\geq a)\leq\frac{E(X)}{a}$?

$P(X\geq4)\leq\frac{4}{4}\leq 1$

An obvious case, because the data point is also the mean!

What if $a\geq8$?

$P(X\geq8)\leq\frac{4}{8}\leq.5$

For a distribution with mean four, only half of all values of the distribution may exceed eight. If more than half of values in the distribution exceeded eight, it would shift the mean!

$a\geq16$?

$P(X\ge16)\leq\frac{4}{16}\leq.25$

For a distribution of mean four, at most 25 percent of all data values may exceed 16. As soon as more than 25 percent of data values exceed four, it will shift the mean.

### 2.1.2 Derivation

Let's work out how we can derive Markov's Inequality, and offer additional illustrations

Note how we computed $E(X)$ as the sum of all values times their weight.

$$E(X) = \sum_i x_i \cdot P(X = x_i)$$

Let's do that again, but this time grouping terms around our threshold $a=4$.[^1]

[^1]: This is the Law of Total Expectation: $E(X) = E(X|A)P(A) + E(X|A^c)P(A^c)$

$$E[X] = \sum\limits_{x_i < a} x_i \cdot P(X = x_i) + \sum\limits_{x_i \geq a} x_i \cdot P(X = x_i)$$ In the example we're working with, that would be

$E(X) = \Big[ (1)(.4) + (2)(.2) \Big] + \Big[ (4)(.2) + (8)(.1) + (16)(.1) \Big]$

$2+2

We're only interested in the second part of the decomposition. What happens if we remove the first part where $a\lt 4$?

Since all values of $X$ are non-negative, that means we are removing positive values from the sum. Because we are removing positive values from the sum, the result of the operation will be less than $E(X)$. Therefore, $E(X)$ will be the same as or higher than the remaining sum.

This allows us to replace the equality with greater than or equal to.

$$E(X) \geq \sum\limits_{x_i \geq a} x_i \cdot P(X = x_i)$$

Returning to our example, that would be

$E(X) \geq (4)(.2) + (8)(.1) + (16)(.1)$

Recall that $E(X)=4$ and $E(X\geq4)=.8 + .8 + 1.6 = 3.2$

$4\geq3.2$ and our inequality holds

Let's go back to the generalized notation:

$$E(X) \geq \sum\limits_{x_i \geq a} x_i \cdot P(X = x_i)$$

Note that our remaining $x_i$ values are greater than or equal to $a$. So our inequality still holds if we replace all the $X\geq a$ with just $a$.

$$E(X) \geq \sum\limits_{x_i \geq a} a \cdot P(X = x_i)$$ We're still summing over the same values where $x_i\geq a$, but now we multiply by $a$ instead of $x_i$.

This is where the loosening of the bound occurs! Back to our simple example for $a=4$, what is the expected value?

$x_i$ = 4: 4 \* 0.2 = 0.8\
$x_i$ = 8: 8 \* 0.1 = 0.8\
$x_i$ = 16: 16 \* 0.1 = 1.6

Add them up: 4 \* 0.2 + 8 \* 0.1 + 16 \* 0.1 = 3.2

Now we repeat that step, but use only $a$ - a lesser value:

$x_i$ = 4: 4 \* 0.2 = 0.8\
$x_i$ = 8: 4 \* 0.1 = 0.4\
$x_i$ = 16: 4 \* 0.1 = 0.4

Add them up: 4 \* 0.2 + 4 \* 0.1 + 4 \* 0.1 = 1.6

We loosened the bound, in order to derive the proof.

Now let's factor out the constant, based on the linearity of the summation operator.

$$E(X) \geq a\cdot \sum\limits_{x_i \geq a} P(X = x_i)$$

Now note that the summation of all $x_i\geq a$ is just the cumulative probability of $x\geq a$. So let's replace the summation operator with the cumulative probability.

$$E(X) \geq a \cdot P(X \geq a)$$

Solve for the probability to get Markov's Inequality

$$P(X \geq a) \leq \frac{E(X)}{a}$$

Recap:

-   After establishing some arbitrary threshold $a$, we used the Law of Total Expectation to group the values of the distribution below and above the threshold.

-   We dropped all terms below the threshold. In doing this, we ensure that the remaining sum is less than the expected value (because the expected value is the sum of all terms).

-   Knowing that the expected value is the same as or higher than the remaining terms, we replaced the equality operator in the total expectation with a greater than or equal to operator after dropping the terms less than $a$.

-   Knowing that the remaining values of $X$ are greater than or equal to $a$, we replaced the $X$ notation with $a$. This is where the loosening of the bound occurs, but it enables us to derive its proof.

-   We factored the constant $a$ out of the summation operator.

-   We recognized that the summation of terms above a threshold is the same thing as the cumulative probability above the threshold, so we replaced the summation operator with cumulative probability.

-   We solved for $P(X\geq a)$ to be $\frac{E(X)}{a}$.

And that is Markov's Inequality

Let's look at a few more data illustrations


::: {.cell}
::: {.cell-output-display}

```{=html}
<div class="tabwid"><style>.cl-175f4b66{table-layout:auto;}.cl-1758c3fe{font-family:'Gill Sans MT';font-size:10pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-175b7d60{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-175b9890{background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-175b98a4{background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-175b98a5{background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table data-quarto-disable-processing='true' class='cl-175f4b66'><thead><tr style="overflow-wrap:break-word;"><th class="cl-175b9890"><p class="cl-175b7d60"><span class="cl-1758c3fe">x</span></p></th></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-175b98a4"><p class="cl-175b7d60"><span class="cl-1758c3fe">43</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-175b98a4"><p class="cl-175b7d60"><span class="cl-1758c3fe">64</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-175b98a4"><p class="cl-175b7d60"><span class="cl-1758c3fe">56</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-175b98a4"><p class="cl-175b7d60"><span class="cl-1758c3fe">56</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-175b98a4"><p class="cl-175b7d60"><span class="cl-1758c3fe">55</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-175b98a5"><p class="cl-175b7d60"><span class="cl-1758c3fe">54</span></p></td></tr></tbody></table></div>
```

:::
:::



::: {.cell}
::: {.cell-output-display}

```{=html}
<div class="tabwid"><style>.cl-17797072{table-layout:auto;}.cl-1771fad6{font-family:'Gill Sans MT';font-size:10pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-17752e40{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-17756b44{background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-17756b45{background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table data-quarto-disable-processing='true' class='cl-17797072'><thead><tr style="overflow-wrap:break-word;"><th class="cl-17756b44"><p class="cl-17752e40"><span class="cl-1771fad6">vars</span></p></th><th class="cl-17756b44"><p class="cl-17752e40"><span class="cl-1771fad6">n</span></p></th><th class="cl-17756b44"><p class="cl-17752e40"><span class="cl-1771fad6">mean</span></p></th><th class="cl-17756b44"><p class="cl-17752e40"><span class="cl-1771fad6">sd</span></p></th><th class="cl-17756b44"><p class="cl-17752e40"><span class="cl-1771fad6">median</span></p></th><th class="cl-17756b44"><p class="cl-17752e40"><span class="cl-1771fad6">trimmed</span></p></th><th class="cl-17756b44"><p class="cl-17752e40"><span class="cl-1771fad6">mad</span></p></th><th class="cl-17756b44"><p class="cl-17752e40"><span class="cl-1771fad6">min</span></p></th><th class="cl-17756b44"><p class="cl-17752e40"><span class="cl-1771fad6">max</span></p></th><th class="cl-17756b44"><p class="cl-17752e40"><span class="cl-1771fad6">range</span></p></th><th class="cl-17756b44"><p class="cl-17752e40"><span class="cl-1771fad6">skew</span></p></th><th class="cl-17756b44"><p class="cl-17752e40"><span class="cl-1771fad6">kurtosis</span></p></th><th class="cl-17756b44"><p class="cl-17752e40"><span class="cl-1771fad6">se</span></p></th></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-17756b45"><p class="cl-17752e40"><span class="cl-1771fad6">1</span></p></td><td class="cl-17756b45"><p class="cl-17752e40"><span class="cl-1771fad6">100</span></p></td><td class="cl-17756b45"><p class="cl-17752e40"><span class="cl-1771fad6">48.8</span></p></td><td class="cl-17756b45"><p class="cl-17752e40"><span class="cl-1771fad6">9.59</span></p></td><td class="cl-17756b45"><p class="cl-17752e40"><span class="cl-1771fad6">48.5</span></p></td><td class="cl-17756b45"><p class="cl-17752e40"><span class="cl-1771fad6">48.5</span></p></td><td class="cl-17756b45"><p class="cl-17752e40"><span class="cl-1771fad6">11.1</span></p></td><td class="cl-17756b45"><p class="cl-17752e40"><span class="cl-1771fad6">31</span></p></td><td class="cl-17756b45"><p class="cl-17752e40"><span class="cl-1771fad6">73</span></p></td><td class="cl-17756b45"><p class="cl-17752e40"><span class="cl-1771fad6">42</span></p></td><td class="cl-17756b45"><p class="cl-17752e40"><span class="cl-1771fad6">0.23</span></p></td><td class="cl-17756b45"><p class="cl-17752e40"><span class="cl-1771fad6">-0.84</span></p></td><td class="cl-17756b45"><p class="cl-17752e40"><span class="cl-1771fad6">0.959</span></p></td></tr></tbody></table></div>
```

:::
:::



::: {.cell}

:::


Let's say a = 52

$$P(x\geq52)\leq\frac{49}{52}\leq 0.942$$ For context, what is the actual probability of observing 52 or more?


::: {.cell}
::: {.cell-output .cell-output-stdout}

```
[1] 0.41
```


:::
:::


Under the Markov bound, as many as 94 percent of data values may exceed 51. In the actual data simulated from a normal distribution, 41 percent of the data values exceed 51.

Now let's set values of $a$ at higher and higher quantiles[^2]

[^2]: Values of $a$ at low quantiles are uninteresting because the probability is unity


::: {.cell}

:::



::: {.cell}
::: {.cell-output-display}

```{=html}
<div class="tabwid"><style>.cl-179524de{table-layout:auto;}.cl-178bac74{font-family:'Gill Sans MT';font-size:10pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-17911a92{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-17911a9c{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-17913860{background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-1791386a{background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-1791386b{background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-17913874{background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-17913875{background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-17913876{background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table data-quarto-disable-processing='true' class='cl-179524de'><thead><tr style="overflow-wrap:break-word;"><th class="cl-17913860"><p class="cl-17911a92"><span class="cl-178bac74">quantile</span></p></th><th class="cl-1791386a"><p class="cl-17911a9c"><span class="cl-178bac74">a</span></p></th><th class="cl-1791386a"><p class="cl-17911a9c"><span class="cl-178bac74">ex_a</span></p></th><th class="cl-1791386a"><p class="cl-17911a9c"><span class="cl-178bac74">actual_prob</span></p></th></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-1791386b"><p class="cl-17911a92"><span class="cl-178bac74">75%</span></p></td><td class="cl-17913874"><p class="cl-17911a9c"><span class="cl-178bac74">56</span></p></td><td class="cl-17913874"><p class="cl-17911a9c"><span class="cl-178bac74">0.875</span></p></td><td class="cl-17913874"><p class="cl-17911a9c"><span class="cl-178bac74">0.26</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-1791386b"><p class="cl-17911a92"><span class="cl-178bac74">90%</span></p></td><td class="cl-17913874"><p class="cl-17911a9c"><span class="cl-178bac74">61</span></p></td><td class="cl-17913874"><p class="cl-17911a9c"><span class="cl-178bac74">0.803</span></p></td><td class="cl-17913874"><p class="cl-17911a9c"><span class="cl-178bac74">0.15</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-1791386b"><p class="cl-17911a92"><span class="cl-178bac74">95%</span></p></td><td class="cl-17913874"><p class="cl-17911a9c"><span class="cl-178bac74">64</span></p></td><td class="cl-17913874"><p class="cl-17911a9c"><span class="cl-178bac74">0.766</span></p></td><td class="cl-17913874"><p class="cl-17911a9c"><span class="cl-178bac74">0.08</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-17913875"><p class="cl-17911a92"><span class="cl-178bac74">99%</span></p></td><td class="cl-17913876"><p class="cl-17911a9c"><span class="cl-178bac74">69</span></p></td><td class="cl-17913876"><p class="cl-17911a9c"><span class="cl-178bac74">0.710</span></p></td><td class="cl-17913876"><p class="cl-17911a9c"><span class="cl-178bac74">0.02</span></p></td></tr></tbody></table></div>
```

:::
:::


The Markov bounds are much higher than the actual probabilities found in the data. There is such a gap that Markov's Inequality isn't helpful in terms of hypothesis testing. It is still used in theoretical work to set bounds and support proofs. It would probably be best to think of it this way: what is the maximum proportion of data points that may exceed a given threshold, before the mean must shift toward the threshold?

Let's see Markov's Inequality across the discrete distribution we've been using for examples. 


::: {.cell}
::: {.cell-output-display}

```{=html}
<div class="plotly html-widget html-fill-item" id="htmlwidget-0a93e8c8e720661a7245" style="width:100%;height:464px;"></div>
<script type="application/json" data-for="htmlwidget-0a93e8c8e720661a7245">{"x":{"visdat":{"8f58414d315a":["function () ","plotlyVisDat"],"8f583d3727c8":["function () ","data"],"8f58170d7001":["function () ","data"],"8f5815c863bb":["function () ","data"]},"cur_data":"8f5815c863bb","attrs":{"8f583d3727c8":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"type":"bar","name":"P(X = x)","marker":{"color":"#0067B9","opacity":0.5},"width":0.40000000000000002,"inherit":true},"8f58170d7001":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"name":"Markov Bound (E[X]/a)","type":"scatter","mode":"lines","line":{"color":"#BA0C2F","width":3},"inherit":true},"8f5815c863bb":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"name":"Actual P(X ≥ a)","type":"scatter","mode":"lines","line":{"color":"#0067B9","width":3},"inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":"Markov's Inequality: Interactive Exploration","xaxis":{"domain":[0,1],"automargin":true,"title":"Threshold (a)"},"yaxis":{"domain":[0,1],"automargin":true,"title":"Probability","range":[0,1]},"hovermode":"x unified","legend":{"x":0.69999999999999996,"y":0.94999999999999996},"showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[1,2,4,8,16],"y":[0.40000000000000002,0.20000000000000001,0.20000000000000001,0.10000000000000001,0.10000000000000001],"type":"bar","name":"P(X = x)","marker":{"color":"#0067B9","opacity":0.5,"line":{"color":"rgba(31,119,180,1)"}},"width":[0.40000000000000002,0.40000000000000002,0.40000000000000002,0.40000000000000002,0.40000000000000002],"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10,10.5,11,11.5,12,12.5,13,13.5,14,14.5,15,15.5,16],"y":[4,2.6666666666666665,2,1.6000000000000001,1.3333333333333333,1.1428571428571428,1,0.88888888888888884,0.80000000000000004,0.72727272727272729,0.66666666666666663,0.61538461538461542,0.5714285714285714,0.53333333333333333,0.5,0.47058823529411764,0.44444444444444442,0.42105263157894735,0.40000000000000002,0.38095238095238093,0.36363636363636365,0.34782608695652173,0.33333333333333331,0.32000000000000001,0.30769230769230771,0.29629629629629628,0.2857142857142857,0.27586206896551724,0.26666666666666666,0.25806451612903225,0.25],"name":"Markov Bound (E[X]/a)","type":"scatter","mode":"lines","line":{"color":"#BA0C2F","width":3},"marker":{"color":"rgba(255,127,14,1)","line":{"color":"rgba(255,127,14,1)"}},"error_y":{"color":"rgba(255,127,14,1)"},"error_x":{"color":"rgba(255,127,14,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10,10.5,11,11.5,12,12.5,13,13.5,14,14.5,15,15.5,16],"y":[1,0.60000000000000009,0.60000000000000009,0.40000000000000002,0.40000000000000002,0.40000000000000002,0.40000000000000002,0.20000000000000001,0.20000000000000001,0.20000000000000001,0.20000000000000001,0.20000000000000001,0.20000000000000001,0.20000000000000001,0.20000000000000001,0.10000000000000001,0.10000000000000001,0.10000000000000001,0.10000000000000001,0.10000000000000001,0.10000000000000001,0.10000000000000001,0.10000000000000001,0.10000000000000001,0.10000000000000001,0.10000000000000001,0.10000000000000001,0.10000000000000001,0.10000000000000001,0.10000000000000001,0.10000000000000001],"name":"Actual P(X ≥ a)","type":"scatter","mode":"lines","line":{"color":"#0067B9","width":3},"marker":{"color":"rgba(44,160,44,1)","line":{"color":"rgba(44,160,44,1)"}},"error_y":{"color":"rgba(44,160,44,1)"},"error_x":{"color":"rgba(44,160,44,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>
```

:::
:::


Finally, let's explore Markov's Inequality across several distributions:


::: {.cell}
::: {.cell-output .cell-output-stderr}

```

Attaching package: 'bslib'
```


:::

::: {.cell-output .cell-output-stderr}

```
The following object is masked from 'package:sjstats':

    bootstrap
```


:::

::: {.cell-output .cell-output-stderr}

```
The following object is masked from 'package:broom':

    bootstrap
```


:::

::: {.cell-output .cell-output-stderr}

```
The following object is masked from 'package:utils':

    page
```


:::

::: {.cell-output-display}

```{=html}
<body class="bslib-page-fill bslib-gap-spacing bslib-flow-mobile html-fill-container bslib-page-sidebar" style="padding:0px;gap:0px;">
<div class="bslib-sidebar-layout bslib-mb-spacing html-fill-item" data-bslib-sidebar-border="false" data-bslib-sidebar-border-radius="false" data-bslib-sidebar-init="TRUE" data-collapsible-desktop="true" data-collapsible-mobile="false" data-open-desktop="open" data-open-mobile="always" data-require-bs-caller="layout_sidebar()" data-require-bs-version="5" style="--_sidebar-width:250px;">
<div class="main bslib-gap-spacing html-fill-container">
<main class="bslib-page-main bslib-gap-spacing html-fill-item html-fill-container">
<div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container" data-bslib-card-init data-require-bs-caller="card()" data-require-bs-version="5">
<div class="card-header bslib-gap-spacing">Distribution Visualization</div>
<div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
<div class="shiny-plot-output html-fill-item" id="distPlot" style="width:100%;height:400px;"></div>
</div>
<script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
</div>
<div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container" data-bslib-card-init data-require-bs-caller="card()" data-require-bs-version="5">
<div class="card-header bslib-gap-spacing">Markov's Inequality Check</div>
<div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
<div id="markovTable" class="shiny-html-output shiny-table-output"></div>
</div>
<script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
</div>
</main>
</div>
<aside id="bslib-sidebar-5137" class="sidebar" hidden>
<div class="sidebar-content bslib-gap-spacing">
<div class="form-group shiny-input-container">
<label class="control-label" id="dist_type-label" for="dist_type">Distribution:</label>
<div>
<select id="dist_type" class="shiny-input-select"><option value="discrete" selected>Discrete (custom)</option>
<option value="normal">Normal</option>
<option value="uniform">Uniform</option>
<option value="exponential">Exponential</option>
<option value="poisson">Poisson</option>
<option value="gamma">Gamma</option></select>
<script type="application/json" data-for="dist_type" data-nonempty="">{"plugins":["selectize-plugin-a11y"]}</script>
</div>
</div>
<div class="form-group shiny-input-container">
<label class="control-label" id="a_threshold-label" for="a_threshold">Threshold (a):</label>
<input class="js-range-slider" id="a_threshold" data-skin="shiny" data-min="0" data-max="20" data-from="5" data-step="0.5" data-grid="true" data-grid-num="10" data-grid-snap="false" data-prettify-separator="," data-prettify-enabled="true" data-keyboard="true" data-data-type="number"/>
</div>
<hr/>
<div id="dist_info" class="shiny-html-output"></div>
</div>
</aside>
<button class="collapse-toggle" type="button" title="Toggle sidebar" aria-expanded="true" aria-controls="bslib-sidebar-5137"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" class="bi bi-chevron-left collapse-icon" style="fill:currentColor;" aria-hidden="true" role="img" ><path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"></path></svg></button>
<script data-bslib-sidebar-init>bslib.Sidebar.initCollapsibleAll()</script>
</div>
</body>
```

:::
:::



::: {.cell context='server'}

:::


preservec7a8f32ada6e074c
preserve41761baaead2f3f7

<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="dependencies">
{"type":"list","attributes":{},"value":[{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["name","version","src","meta","script","stylesheet","head","attachment","package","all_files","pkgVersion"]},"class":{"type":"character","attributes":{},"value":["html_dependency"]}},"value":[{"type":"character","attributes":{},"value":["tabwid"]},{"type":"character","attributes":{},"value":["1.1.3"]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["file"]}},"value":[{"type":"character","attributes":{},"value":["web_1.1.3"]}]},{"type":"NULL"},{"type":"character","attributes":{},"value":["tabwid.js"]},{"type":"character","attributes":{},"value":["tabwid.css"]},{"type":"NULL"},{"type":"NULL"},{"type":"character","attributes":{},"value":["flextable"]},{"type":"logical","attributes":{},"value":[true]},{"type":"character","attributes":{},"value":["0.9.11"]}]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["name","version","src","meta","script","stylesheet","head","attachment","package","all_files","pkgVersion"]},"class":{"type":"character","attributes":{},"value":["html_dependency"]}},"value":[{"type":"character","attributes":{},"value":["tabwid"]},{"type":"character","attributes":{},"value":["1.1.3"]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["file"]}},"value":[{"type":"character","attributes":{},"value":["web_1.1.3"]}]},{"type":"NULL"},{"type":"character","attributes":{},"value":["tabwid.js"]},{"type":"character","attributes":{},"value":["tabwid.css"]},{"type":"NULL"},{"type":"NULL"},{"type":"character","attributes":{},"value":["flextable"]},{"type":"logical","attributes":{},"value":[true]},{"type":"character","attributes":{},"value":["0.9.11"]}]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["name","version","src","meta","script","stylesheet","head","attachment","package","all_files","pkgVersion"]},"class":{"type":"character","attributes":{},"value":["html_dependency"]}},"value":[{"type":"character","attributes":{},"value":["tabwid"]},{"type":"character","attributes":{},"value":["1.1.3"]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["file"]}},"value":[{"type":"character","attributes":{},"value":["web_1.1.3"]}]},{"type":"NULL"},{"type":"character","attributes":{},"value":["tabwid.js"]},{"type":"character","attributes":{},"value":["tabwid.css"]},{"type":"NULL"},{"type":"NULL"},{"type":"character","attributes":{},"value":["flextable"]},{"type":"logical","attributes":{},"value":[true]},{"type":"character","attributes":{},"value":["0.9.11"]}]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["name","version","src","meta","script","stylesheet","head","attachment","package","all_files","pkgVersion"]},"class":{"type":"character","attributes":{},"value":["html_dependency"]}},"value":[{"type":"character","attributes":{},"value":["tabwid"]},{"type":"character","attributes":{},"value":["1.1.3"]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["file"]}},"value":[{"type":"character","attributes":{},"value":["web_1.1.3"]}]},{"type":"NULL"},{"type":"character","attributes":{},"value":["tabwid.js"]},{"type":"character","attributes":{},"value":["tabwid.css"]},{"type":"NULL"},{"type":"NULL"},{"type":"character","attributes":{},"value":["flextable"]},{"type":"logical","attributes":{},"value":[true]},{"type":"character","attributes":{},"value":["0.9.11"]}]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["name","version","src","meta","script","stylesheet","head","attachment","package","all_files","pkgVersion"]},"class":{"type":"character","attributes":{},"value":["html_dependency"]}},"value":[{"type":"character","attributes":{},"value":["htmltools-fill"]},{"type":"character","attributes":{},"value":["0.5.9"]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["file"]}},"value":[{"type":"character","attributes":{},"value":["fill"]}]},{"type":"NULL"},{"type":"NULL"},{"type":"character","attributes":{},"value":["fill.css"]},{"type":"NULL"},{"type":"NULL"},{"type":"character","attributes":{},"value":["htmltools"]},{"type":"logical","attributes":{},"value":[true]},{"type":"character","attributes":{},"value":["0.5.9"]}]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["name","version","src","meta","script","stylesheet","head","attachment","package","all_files","pkgVersion"]},"class":{"type":"character","attributes":{},"value":["html_dependency"]}},"value":[{"type":"character","attributes":{},"value":["htmlwidgets"]},{"type":"character","attributes":{},"value":["1.6.4"]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["file"]}},"value":[{"type":"character","attributes":{},"value":["www"]}]},{"type":"NULL"},{"type":"character","attributes":{},"value":["htmlwidgets.js"]},{"type":"NULL"},{"type":"NULL"},{"type":"NULL"},{"type":"character","attributes":{},"value":["htmlwidgets"]},{"type":"logical","attributes":{},"value":[true]},{"type":"character","attributes":{},"value":["1.6.4"]}]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["name","version","src","meta","script","stylesheet","head","attachment","package","all_files","pkgVersion"]},"class":{"type":"character","attributes":{},"value":["html_dependency"]}},"value":[{"type":"character","attributes":{},"value":["plotly-binding"]},{"type":"character","attributes":{},"value":["4.12.0"]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["file"]}},"value":[{"type":"character","attributes":{},"value":["htmlwidgets"]}]},{"type":"NULL"},{"type":"character","attributes":{},"value":["plotly.js"]},{"type":"NULL"},{"type":"NULL"},{"type":"NULL"},{"type":"character","attributes":{},"value":["plotly"]},{"type":"logical","attributes":{},"value":[false]},{"type":"character","attributes":{},"value":["4.12.0"]}]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["name","version","src","meta","script","stylesheet","head","attachment","package","all_files","pkgVersion"]},"class":{"type":"character","attributes":{},"value":["html_dependency"]}},"value":[{"type":"character","attributes":{},"value":["typedarray"]},{"type":"character","attributes":{},"value":["0.1"]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["file"]}},"value":[{"type":"character","attributes":{},"value":["htmlwidgets/lib/typedarray"]}]},{"type":"NULL"},{"type":"character","attributes":{},"value":["typedarray.min.js"]},{"type":"NULL"},{"type":"NULL"},{"type":"NULL"},{"type":"character","attributes":{},"value":["plotly"]},{"type":"logical","attributes":{},"value":[false]},{"type":"character","attributes":{},"value":["4.12.0"]}]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["name","version","src","meta","script","stylesheet","head","attachment","package","all_files","pkgVersion"]},"class":{"type":"character","attributes":{},"value":["html_dependency"]}},"value":[{"type":"character","attributes":{},"value":["jquery"]},{"type":"character","attributes":{},"value":["3.5.1"]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["file"]}},"value":[{"type":"character","attributes":{},"value":["lib/jquery"]}]},{"type":"NULL"},{"type":"character","attributes":{},"value":["jquery.min.js"]},{"type":"NULL"},{"type":"NULL"},{"type":"NULL"},{"type":"character","attributes":{},"value":["crosstalk"]},{"type":"logical","attributes":{},"value":[true]},{"type":"character","attributes":{},"value":["1.2.2"]}]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["name","version","src","meta","script","stylesheet","head","attachment","package","all_files","pkgVersion"]},"class":{"type":"character","attributes":{},"value":["html_dependency"]}},"value":[{"type":"character","attributes":{},"value":["crosstalk"]},{"type":"character","attributes":{},"value":["1.2.2"]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["file"]}},"value":[{"type":"character","attributes":{},"value":["www"]}]},{"type":"NULL"},{"type":"character","attributes":{},"value":["js/crosstalk.min.js"]},{"type":"character","attributes":{},"value":["css/crosstalk.min.css"]},{"type":"NULL"},{"type":"NULL"},{"type":"character","attributes":{},"value":["crosstalk"]},{"type":"logical","attributes":{},"value":[true]},{"type":"character","attributes":{},"value":["1.2.2"]}]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["name","version","src","meta","script","stylesheet","head","attachment","package","all_files","pkgVersion"]},"class":{"type":"character","attributes":{},"value":["html_dependency"]}},"value":[{"type":"character","attributes":{},"value":["plotly-htmlwidgets-css"]},{"type":"character","attributes":{},"value":["2.25.2"]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["file"]}},"value":[{"type":"character","attributes":{},"value":["htmlwidgets/lib/plotlyjs"]}]},{"type":"NULL"},{"type":"NULL"},{"type":"character","attributes":{},"value":["plotly-htmlwidgets.css"]},{"type":"NULL"},{"type":"NULL"},{"type":"character","attributes":{},"value":["plotly"]},{"type":"logical","attributes":{},"value":[false]},{"type":"character","attributes":{},"value":["4.12.0"]}]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["name","version","src","meta","script","stylesheet","head","attachment","package","all_files","pkgVersion"]},"class":{"type":"character","attributes":{},"value":["html_dependency"]}},"value":[{"type":"character","attributes":{},"value":["plotly-main"]},{"type":"character","attributes":{},"value":["2.25.2"]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["file"]}},"value":[{"type":"character","attributes":{},"value":["htmlwidgets/lib/plotlyjs"]}]},{"type":"NULL"},{"type":"character","attributes":{},"value":["plotly-latest.min.js"]},{"type":"NULL"},{"type":"NULL"},{"type":"NULL"},{"type":"character","attributes":{},"value":["plotly"]},{"type":"logical","attributes":{},"value":[false]},{"type":"character","attributes":{},"value":["4.12.0"]}]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["name","version","src","meta","script","stylesheet","head","attachment","package","all_files","pkgVersion"]},"class":{"type":"character","attributes":{},"value":["html_dependency"]}},"value":[{"type":"character","attributes":{},"value":["jquery"]},{"type":"character","attributes":{},"value":["3.7.1"]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["file"]}},"value":[{"type":"character","attributes":{},"value":["www/shared"]}]},{"type":"NULL"},{"type":"character","attributes":{},"value":["jquery.min.js"]},{"type":"NULL"},{"type":"NULL"},{"type":"NULL"},{"type":"character","attributes":{},"value":["shiny"]},{"type":"logical","attributes":{},"value":[false]},{"type":"character","attributes":{},"value":["1.13.0"]}]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["name","version","src","meta","script","stylesheet","head","attachment","package","all_files"]},"class":{"type":"character","attributes":{},"value":["html_dependency"]}},"value":[{"type":"character","attributes":{},"value":["bootstrap"]},{"type":"character","attributes":{},"value":["5.3.1"]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["href"]}},"value":[{"type":"character","attributes":{},"value":["Foundations of Data Science_ch2_files/libs/bootstrap-5.3.1"]}]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["viewport"]}},"value":[{"type":"character","attributes":{},"value":["width=device-width, initial-scale=1, shrink-to-fit=no"]}]},{"type":"character","attributes":{},"value":["bootstrap.bundle.min.js"]},{"type":"character","attributes":{},"value":["bootstrap.min.css"]},{"type":"NULL"},{"type":"NULL"},{"type":"NULL"},{"type":"logical","attributes":{},"value":[true]}]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["name","version","src","meta","script","stylesheet","head","attachment","all_files","package","pkgVersion"]},"class":{"type":"character","attributes":{},"value":["html_dependency"]}},"value":[{"type":"character","attributes":{},"value":["bs3compat"]},{"type":"character","attributes":{},"value":["0.10.0"]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["file"]}},"value":[{"type":"character","attributes":{},"value":["bs3compat/js"]}]},{"type":"NULL"},{"type":"character","attributes":{},"value":["transition.js","tabs.js","bs3compat.js"]},{"type":"NULL"},{"type":"NULL"},{"type":"NULL"},{"type":"logical","attributes":{},"value":[true]},{"type":"character","attributes":{},"value":["bslib"]},{"type":"character","attributes":{},"value":["0.10.0"]}]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["name","version","src","meta","script","stylesheet","head","attachment","package","all_files","pkgVersion"]},"class":{"type":"character","attributes":{},"value":["html_dependency"]}},"value":[{"type":"character","attributes":{},"value":["htmltools-fill"]},{"type":"character","attributes":{},"value":["0.5.9"]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["file"]}},"value":[{"type":"character","attributes":{},"value":["fill"]}]},{"type":"NULL"},{"type":"NULL"},{"type":"character","attributes":{},"value":["fill.css"]},{"type":"NULL"},{"type":"NULL"},{"type":"character","attributes":{},"value":["htmltools"]},{"type":"logical","attributes":{},"value":[true]},{"type":"character","attributes":{},"value":["0.5.9"]}]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["name","version","src","meta","script","stylesheet","head","attachment","package","all_files","pkgVersion"]},"class":{"type":"character","attributes":{},"value":["html_dependency"]}},"value":[{"type":"character","attributes":{},"value":["bslib-component-js"]},{"type":"character","attributes":{},"value":["0.10.0"]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["file"]}},"value":[{"type":"character","attributes":{},"value":["components/dist"]}]},{"type":"NULL"},{"type":"list","attributes":{},"value":[{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["src"]}},"value":[{"type":"character","attributes":{},"value":["components.min.js"]}]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["src","type"]}},"value":[{"type":"character","attributes":{},"value":["web-components.min.js"]},{"type":"character","attributes":{},"value":["module"]}]}]},{"type":"NULL"},{"type":"NULL"},{"type":"NULL"},{"type":"character","attributes":{},"value":["bslib"]},{"type":"logical","attributes":{},"value":[true]},{"type":"character","attributes":{},"value":["0.10.0"]}]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["name","version","src","meta","script","stylesheet","head","attachment","package","all_files","pkgVersion"]},"class":{"type":"character","attributes":{},"value":["html_dependency"]}},"value":[{"type":"character","attributes":{},"value":["bslib-component-css"]},{"type":"character","attributes":{},"value":["0.10.0"]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["file"]}},"value":[{"type":"character","attributes":{},"value":["components/dist"]}]},{"type":"NULL"},{"type":"NULL"},{"type":"character","attributes":{},"value":["components.css"]},{"type":"NULL"},{"type":"NULL"},{"type":"character","attributes":{},"value":["bslib"]},{"type":"logical","attributes":{},"value":[true]},{"type":"character","attributes":{},"value":["0.10.0"]}]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["name","version","src","meta","script","stylesheet","head","attachment","package","all_files","pkgVersion"]},"class":{"type":"character","attributes":{},"value":["html_dependency"]}},"value":[{"type":"character","attributes":{},"value":["bslib-tag-require"]},{"type":"character","attributes":{},"value":["0.10.0"]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["file"]}},"value":[{"type":"character","attributes":{},"value":["components"]}]},{"type":"NULL"},{"type":"character","attributes":{},"value":["tag-require.js"]},{"type":"NULL"},{"type":"NULL"},{"type":"NULL"},{"type":"character","attributes":{},"value":["bslib"]},{"type":"logical","attributes":{},"value":[true]},{"type":"character","attributes":{},"value":["0.10.0"]}]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["name","version","src","meta","script","stylesheet","head","attachment","package","all_files","pkgVersion"]},"class":{"type":"character","attributes":{},"value":["html_dependency"]}},"value":[{"type":"character","attributes":{},"value":["selectize"]},{"type":"character","attributes":{},"value":["0.15.2"]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["file"]}},"value":[{"type":"character","attributes":{},"value":["www/shared/selectize"]}]},{"type":"NULL"},{"type":"character","attributes":{},"value":["js/selectize.min.js","accessibility/js/selectize-plugin-a11y.min.js"]},{"type":"character","attributes":{},"value":["css/selectize.bootstrap3.css"]},{"type":"NULL"},{"type":"NULL"},{"type":"character","attributes":{},"value":["shiny"]},{"type":"logical","attributes":{},"value":[true]},{"type":"character","attributes":{},"value":["1.13.0"]}]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["name","version","src","meta","script","stylesheet","head","attachment","package","all_files","pkgVersion"]},"class":{"type":"character","attributes":{},"value":["html_dependency"]}},"value":[{"type":"character","attributes":{},"value":["ionrangeslider-javascript"]},{"type":"character","attributes":{},"value":["2.3.1"]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["file"]}},"value":[{"type":"character","attributes":{},"value":["www/shared/ionrangeslider"]}]},{"type":"NULL"},{"type":"character","attributes":{},"value":["js/ion.rangeSlider.min.js"]},{"type":"NULL"},{"type":"NULL"},{"type":"NULL"},{"type":"character","attributes":{},"value":["shiny"]},{"type":"logical","attributes":{},"value":[true]},{"type":"character","attributes":{},"value":["1.13.0"]}]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["name","version","src","meta","script","stylesheet","head","attachment","package","all_files","pkgVersion"]},"class":{"type":"character","attributes":{},"value":["html_dependency"]}},"value":[{"type":"character","attributes":{},"value":["strftime"]},{"type":"character","attributes":{},"value":["0.9.2"]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["file"]}},"value":[{"type":"character","attributes":{},"value":["www/shared/strftime"]}]},{"type":"NULL"},{"type":"character","attributes":{},"value":["strftime-min.js"]},{"type":"NULL"},{"type":"NULL"},{"type":"NULL"},{"type":"character","attributes":{},"value":["shiny"]},{"type":"logical","attributes":{},"value":[true]},{"type":"character","attributes":{},"value":["1.13.0"]}]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["name","version","src","meta","script","stylesheet","head","attachment","package","all_files","pkgVersion"]},"class":{"type":"character","attributes":{},"value":["html_dependency"]}},"value":[{"type":"character","attributes":{},"value":["ionrangeslider-css"]},{"type":"character","attributes":{},"value":["2.3.1"]},{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["file"]}},"value":[{"type":"character","attributes":{},"value":["www/shared/ionrangeslider"]}]},{"type":"NULL"},{"type":"NULL"},{"type":"character","attributes":{},"value":["css/ion.rangeSlider.css"]},{"type":"NULL"},{"type":"NULL"},{"type":"character","attributes":{},"value":["shiny"]},{"type":"logical","attributes":{},"value":[true]},{"type":"character","attributes":{},"value":["1.13.0"]}]}]}
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="execution_dependencies">
{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["packages"]}},"value":[{"type":"list","attributes":{"names":{"type":"character","attributes":{},"value":["packages","version"]},"class":{"type":"character","attributes":{},"value":["data.frame"]},"row.names":{"type":"integer","attributes":{},"value":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342]}},"value":[{"type":"character","attributes":{},"value":["abind","arrayhelpers","askpass","assertthat","backports","baggr","base","base64enc","bayesplot","bayestestR","bdsmatrix","BMisc","boot","bridgesampling","brms","Brobdingnag","broom","broom.mixed","bslib","cachem","car","carData","caret","cellranger","checkmate","class","cli","cluster","cmdstanr","coda","codetools","collapse","colorspace","colourpicker","compiler","correlation","corrplot","cowplot","crayon","crosstalk","curl","dagitty","data.table","datasets","datawizard","deldir","DEoptimR","DescTools","diagis","dials","DiceDesign","dichromat","digest","distributional","dplyr","dreamerr","DT","dygraphs","e1071","easystats","effectsize","emmeans","ergm","ergm.count","ergm.multi","estimability","estimatr","evaluate","Exact","expm","extrafont","extrafontdb","farver","fastDummies","fastmap","fixest","flextable","fontawesome","fontBitstreamVera","fontLiberation","fontquiver","forcats","foreach","foreign","forestplot","Formula","fs","furrr","future","future.apply","gdtools","generics","geomtextpath","gganimate","ggdag","ggdist","ggforce","ggfortify","gghighlight","ggplot2","ggplotify","ggpubr","ggraph","ggrepel","ggridges","ggsignif","ggstatsplot","ggtext","ggthemes","gld","globals","glue","gmp","gower","GPfit","graphics","graphlayouts","grDevices","grid","gridExtra","gridGraphics","gridtext","gt","gtable","gtExtras","gtools","gtsummary","hardhat","haven","here","HH","Hmisc","hms","htmlTable","htmltools","htmlwidgets","httpuv","httr","huxtable","ICC","igraph","infer","inline","insight","intergraph","interp","ipred","iterators","janitor","jpeg","jquerylib","jsonlite","jtools","kableExtra","knitr","labelled","later","lattice","latticeExtra","lava","lazyeval","leaps","lfe","lhs","lifecycle","listenv","lme4","lmom","lmtest","loo","lpSolveAPI","lubridate","magrittr","markdown","MASS","Matrix","MatrixModels","matrixStats","maxLik","memoise","methods","mime","miniUI","minqa","miscTools","mnormt","modelbased","modeldata","ModelMetrics","multcomp","mvtnorm","network","networkDynamic","networkLite","nlme","nloptr","nnet","numDeriv","officer","openssl","openxlsx","otel","paletteer","pander","parallel","parallelly","parameters","parsnip","patchwork","pbapply","performance","pillar","pkgbuild","pkgconfig","plm","plotly","plotrix","plyr","png","polyclip","posterior","prettyunits","pROC","processx","prodlim","progress","promises","proxy","ps","psych","purrr","qte","quantreg","QuickJSR","R6","ragg","rappdirs","rbibutils","RColorBrewer","Rcpp","RcppParallel","Rdpack","readr","readxl","recipes","reformulas","rematch2","report","repr","reshape2","rethinking","rlang","rle","rmarkdown","Rmpfr","robustbase","rootSolve","rpart","rprojroot","rsample","rstan","rstanarm","rstantools","rstatix","rstudioapi","Rttf2pt1","S7","sandwich","sass","scales","see","shape","shiny","shinyjs","shinystan","shinythemes","sjlabelled","sjmisc","sjPlot","sjstats","skimr","sn","sna","snakecase","SparseM","splines","StanHeaders","statnet","statnet.common","stats","stats4","statsExpressions","stringi","stringmagic","stringr","survival","svglite","svUnit","sysfonts","systemfonts","tailor","tensorA","tergm","texreg","textshaping","TH.data","threejs","tibble","tidybayes","tidygraph","tidymodels","tidyr","tidyselect","tidyverse","timechange","timeDate","tools","trust","tsna","tune","tweenr","tzdb","utils","uuid","V8","vcd","vctrs","viridis","viridisLite","withr","workflows","workflowsets","xfun","xml2","xtable","xts","yaml","yardstick","yulab.utils","zeallot","zip","zoo"]},{"type":"character","attributes":{},"value":["1.4-8","1.1-0","1.2.1","0.2.1","1.5.0","0.8","4.5.2","0.1-6","1.15.0","0.17.0","1.3-7","1.4.8","1.3-32","1.2-1","2.23.0","1.2-9","1.0.12","0.2.9.7","0.10.0","1.1.0","3.1-5","3.0-6","7.0-1","1.1.0","2.3.4","7.3-23","3.6.5","2.1.8.2","0.9.0","0.19-4.1","0.2-20","2.1.6","2.1-2","1.3.0","4.5.2","0.8.8","0.95","1.2.0","1.5.3","1.2.2","7.0.0","0.3-4","1.18.2.1","4.5.2","1.3.0","2.0-4","1.1-4","0.99.60","0.2.3","1.4.2","1.10","2.0-0.1","0.6.39","0.6.0","1.2.0","1.5.0","0.34.0","1.1.1.6","1.7-17","0.7.5","1.0.1","2.0.1","4.12.0","4.1.3","0.3.0","1.5.1","1.0.6","1.0.5","3.3","1.0-0","0.20","1.1","2.1.2","1.7.5","1.2.0","0.13.2","0.9.11","0.5.3","0.1.1","0.1.0","0.2.1","1.0.1","1.5.2","0.8-91","3.1.7","1.2-5","1.6.6","0.3.1","1.69.0","1.20.2","0.5.0","0.1.4","0.2.0","1.0.11","0.2.13","3.3.3","0.5.0","0.4.19","0.5.0","4.0.2","0.1.3","0.6.2","2.2.2","0.9.6","0.5.7","0.6.4","0.13.5","0.1.2","5.2.0","2.6.8","0.19.0","1.8.0","0.7-5.1","1.0.2","1.0-9","4.5.2","1.2.2","4.5.2","4.5.2","2.3","0.5-1","0.1.6","1.3.0","0.3.6","0.6.2","3.9.5","2.5.0","1.4.2","2.5.5","1.0.2","3.1-53","5.2-5","1.1.4","2.4.3","0.5.9","1.6.4","1.6.16","1.4.8","5.8.0","2.4.0","2.2.2","1.1.0","0.3.21","1.4.6","2.0-4","1.1-6","0.9-15","1.0.14","2.2.1","0.1-11","0.1.4","2.0.0","2.3.1","1.4.0","1.51","2.16.0","1.4.6","0.22-9","0.6-31","1.8.2","0.2.2","3.2","3.1.1","1.2.0","1.0.5","0.10.0","1.1-38","3.2","0.9-40","2.9.0","5.5.2.0-17.15","1.9.5","2.0.4","2.0","7.3-65","1.7-4","0.5-4","1.5.0","1.5-2.2","2.0.1","4.5.2","0.13","0.1.2","1.2.8","0.6-30","2.1.2","0.14.0","1.5.1","1.2.2.2","1.4-29","1.3-3","1.20.0","0.11.5","1.1.0","3.1-168","2.2.1","7.3-20","2016.8-1.1","0.7.3","2.3.4","4.2.8.1","0.2.0","1.7.0","0.6.6","4.5.2","1.46.1","0.28.3","1.4.1","1.3.2","1.7-4","0.16.0","1.11.1","1.4.8","2.0.3","2.6-7","4.12.0","3.8-14","1.8.9","0.1-8","1.10-7","1.6.1","1.2.0","1.19.0.1","3.8.6","2025.04.28","1.2.3","1.5.0","0.4-29","1.9.1","2.6.1","1.2.1","1.3.1","6.1","1.9.0","2.6.1","1.5.0","0.3.4","2.4.1","1.1-3","1.1.1","5.1.11-1","2.6.6","2.2.0","1.4.5","1.3.1","0.4.4","2.1.2","0.6.3","1.1.7","1.4.5","2.42","1.1.7","0.10.0","2.30","1.1-2","0.99-7","1.8.2.4","4.1.24","2.1.1","1.3.2","2.32.7","2.32.2","2.6.0","0.7.3","0.18.0","1.3.14","0.2.1","3.1-1","0.4.10","1.4.0","0.13.0","1.4.6.1","1.13.0","2.1.1","2.7.0","1.2.0","1.2.0","2.8.11","2.9.0","0.19.1","2.2.2","2.1.2","2.8","0.11.1","1.84-2","4.5.2","2.32.10","2019.6","4.13.0","4.5.2","4.5.2","1.7.3","1.8.7","1.2.0","1.6.0","3.8-6","2.2.2","1.0.8","0.8.9","1.3.1","0.1.0","0.36.2.1","4.2.2","1.39.5","1.0.4","1.1-5","0.3.4","3.3.1","3.0.7","1.3.1","1.4.1","1.3.2","1.2.1","2.0.0","0.4.0","4052.112","4.5.2","0.1-9","0.3.6","2.0.1","2.0.3","0.5.0","4.5.2","1.2-2","8.0.1","1.4-13","0.7.1","0.6.5","0.4.3","3.0.2","1.3.0","1.1.1","0.56","1.5.2","1.8-4","0.14.1","2.3.12","1.3.2","0.2.4","0.2.0","2.3.3","1.8-15"]}]}]}
</script>
<!--/html_preserve-->