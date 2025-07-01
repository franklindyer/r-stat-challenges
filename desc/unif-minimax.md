You need to estimate an unknown parameter $\theta$ belonging to the interval $[0,1]$. You are given the value of a random variable $\omega\sim \mathcal U(0,\vartheta)$, that is, uniformly distributed in the interval $[0,\vartheta]$.

The loss function for your estimate is the usual squared-difference loss: $$L(\vartheta,\vartheta^\ast) = (\vartheta - \vartheta^\ast)^2$$ and you need to minimize the worst case expected loss (i.e. the minimax loss).

In the R code below:

- `omega` is a number in the interval $[0,1]$ distributed according to $\mathcal U(0,\vartheta)$
- `decision_fxn` should return your estimate for the unknown parameter $\vartheta\in [0,1]$
