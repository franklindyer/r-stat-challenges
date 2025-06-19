A particle is moving along a line with unknown initial position $x_0$ and unknown velocity $v$. You need to estimate these paremeters $x_0, v$. You may assume that they both have unit normal prior distributions: $$\begin{align*}x_0 &\sim \mathcal{N}(0, 1) \\ v &\sim \mathcal{N}(0, 1)\end{align*}$$ You are given a sequence of $10$ measurements of the particle's position at times $t=0,1,\cdots, 9$. Each measurement has a certain error $\epsilon_i$. You may assume that these measurement errors are normally distributed with standard deviation $\sigma = 0.5$, so that $$\epsilon_i \sim \mathcal{N}(0, \tfrac{1}{4})$$

The loss function for your estimate $x_0^\ast, v^\ast$ is $$L(\langle x_0, v\rangle, \langle x_0^\ast, v^\ast\rangle) = (x_0 - x_0^\ast)^2 + (v - v^\ast)^2$$ and you should minimize the average expected loss of your estimates.

In the below R code:

- `omega` is a vector of the $10$ measurements of the particle's position at $t=0,1,\cdots,10$
- `pos0` is your estimate of the particle's initial position
- `vel` is your estimate of the particle's velocity
- `decision_fxn` should return an R vector of length $2$, with respective entries `pos0` and `vel`
