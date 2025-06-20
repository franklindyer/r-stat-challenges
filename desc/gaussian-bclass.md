There are two normally distributed random variables $X\sim\mathcal N(1, 1)$ and $Y\sim\mathcal N(-1,2)$, that is, with respective means $\mu_X = 1$ and $\mu_Y = -1$ and respective standard deviations $\sigma_X = 1$ and $\sigma_Y = \sqrt{2}$. The random parameter $\theta$ is chosen uniformly and at random from the set $\{\mathtt{TRUE},\mathtt{FALSE}\}$. If $\vartheta$ is $\mathtt{TRUE}$, then you are given the value of $X$, and otherwise you are given the value of $Y$. From this information, you need to guess the value of $\vartheta$.

The loss function is $$L(\vartheta,\vartheta^\ast) = \begin{cases}0 & \text{if }\vartheta=\vartheta^\ast \\ 1 & \text{else}\end{cases}$$ You need to choose your guess $\vartheta^\ast$ to minimize the average expected loss.

In the R code below:

- `omega` is the value of either $X$ or $Y$, depending on whether $\vartheta$ is $\texttt{TRUE}$ or $\texttt{FALSE}$
- `decision_fxn` must return a boolean, which is your guess for the value of $\vartheta$
