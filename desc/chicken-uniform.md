This problem is called "chicken" because it is about daring to get as close as you can to a value, without going *too far* and exceeding it.

The unknown parameter you need to estimate is called $\vartheta$. You can assume that it has the prior distribution $\vartheta\sim\mathcal{U}(0,1)$, that is, it is uniformly distributed on the interval $[0,1]$. You are given the value of another random variable $\omega\sim\mathcal U(0,\vartheta)$ and you need to use it to make an estimate $\vartheta^\ast$ for $\vartheta$. The loss function is: $$L(\vartheta, \vartheta^\ast) = \begin{cases}\vartheta-\vartheta^\ast & \text{if } \vartheta > \vartheta^\ast \\ \tfrac{1}{4} & \text{else}\end{cases}$$ As you can see, if your guess is less than the true value $\vartheta$, you will suffer less loss if you get closer to the true value $\vartheta$. But if your guess is *greater* than the true value, you will suffer a considerable loss regardless of how close your estimate is.

In the R code below:

- `omega` is a floating point number between $0$ and $1$
- `decision_fxn` should return a floating point number giving your estimate $\vartheta^\ast$
