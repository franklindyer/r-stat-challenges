You need to estimate the parameter $p$ belonging to the interval $[0,1]$. To estimate it, you are given the value of a random variable $\omega\sim\text{Binom}(10, p)$. The loss function is given by:

$$L(p,p^\ast) = \begin{cases} 1 & \text{if } |p-p^\ast| > 0.02 \\ 0 & \text{else}\end{cases}$$

That is, you suffer a loss of $L(p,p^\ast) = 1$ if you fail to estimate the parameter $p$ with an error less than $0.02$, and you suffer no loss if your estimate is within this threshold. You should minimize the worst-case average loss across all possible values of $p\in [0,1]$ - that is, you should produce a minimax estimate for the parameter $p$.
