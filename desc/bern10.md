The parameter you need to guess is called $p$. You are given a list of the results of $10$ Bernoulli trials $\sim \text{Bern}(p)$ - that is, $10$ unfair coin flips that come up heads with probability $p$.

The loss function is $$L(p,p^\ast) = (p-p^\ast)^2$$ and you need to minimize the expected average loss. You may assume a uniform prior distribution on $p\sim \mathcal U(0,1)$. That is, the true parameter $p$ is uniformly distributed in the interval $[0,1]$.

In the below R code:

- `omega` is an R vector of length 10 containing the Bernoulli trial results
- `decision_fxn` should return a floating point number, namely your estimate $p^\ast$
