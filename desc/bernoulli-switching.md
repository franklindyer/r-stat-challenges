The parameter you need to guess is called $n$ and it belongs to the set $\{1,2,\cdots, 20\}$. You may assume that is has a uniform prior distribution on that set, so that each of those values has a probability of $0.05$. You are given a list of $20$ Bernoulli random variables $X_1,X_2,\cdots, X_{20}$ distributed as follows: $$X_j\sim\begin{cases}\text{Bern}(\tfrac{1}{3}) & \text{if }j < n \\ \text{Bern}(\tfrac{2}{3}) & \text{else}\end{cases}$$ that is, the parameter $n$ specifies when the elements of the sequence "switch distributions" from $\text{Bern}(\tfrac{1}{3})$ to $\text{Bern}(\tfrac{2}{3})$.

The loss function is defined by $$L(n,n^\ast) = \begin{cases}0 & \text{if }n = n^\ast \\ 1 & \text{else}\end{cases}$$ that is, you will suffer a penalty if and only if your guess is *exactly right*. You should minimize the average expected loss.

In the R code below:

- `omega` is a vector of the values of $X_1,X_2,\cdots,X_{20}$
- `decision_fxn` should return a value in $\{1,2,\cdots,20\}$, giving your guess for $n$
