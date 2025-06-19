The parameter you need to estimate is called $\mu$. You can assume that it has a prior distribution of $\mu \sim \mathcal{N}(0,1)$, that is, the unit normal distribution. You are given a measurement $\omega \approx \mu$ whose error is also normally distributed $\sim\mathcal{N}(0,0.25)$, with standard deviation $\sigma = 0.5$.

The loss-function is $$L(\mu, \mu^\ast) = (\mu - \mu^\ast)^2$$ and you should choose your estimate $\mu^\ast$ to minimize the *average expected loss*. 
