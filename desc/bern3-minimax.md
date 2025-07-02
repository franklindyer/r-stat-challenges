The parameter you need to guess is called $p$. You are given a list of the results of $3$ Bernoulli trials $\sim \text{Bern}(p)$ to inform your estimate with. Alternatively, you could consider this to be a binomially distributed random variable $\sim \text{Binom}(3, p)$ in terms of the number of 1s. 

The loss function is $$L(p,p^\ast) = (p-p^\ast)^2$$ and you need to minimize the *maximum* expected loss. That is, you need to make the *worst-case* expected loss as small as possible across all possible values of $p\in [0,1]$. 

In the below R code:

- `omega` is an R vector of length 3 containing the Bernoulli trial results
- `decision_fxn` should return a floating point number, namely your estimate $p^\ast$
