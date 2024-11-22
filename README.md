# Joel Villarreal's Project 7

## Approximating u(x) Such That u′′(x) + 3u′(x) + 2u(x) = 4x^2, u(1) = 1, u(2) = 6

- Using the fact that the following equation:
u′′(x) + P(x)u′(x) + Q(x)u = f(x), u(a) = α, u(b) = β
- can be rewriten as: 
(**) (1 + h/2 * P_i)u_(i+1) + (−2 + h/2 * Q_i)u_i + (1 − h/2 * P_i)u_(i−1) = h^2f_i
- Where: h = (b - a) / N
- Where: P(x) = 3, Q(x) = 2, a = 1, b = 6, u_0 = 1, u_N = 6, h = 1 / N,
- Implies:
c1 * u_(i-1) + c2 * u_i + c3 * u_(i+1) = h^2 * 4x_i^2
- Where c1 = 1 - 3/2 * h, c2 = -2 + 2h^2, c3 = 1 + 3/2 * h
- Implies:
A**u** = **F**
- Where:
  - **u** = (u_1, u_2, ..., u_(n-1))^T
  - A is a diagonal matrix with c1, c2, and c3 along its three centermost top-left to bottom-right digaonals
  - **F** = 4h^2(x_1^2, x_2^2, ..., x_(n-1)^2)^T - (c1, 0, ..., 0, 6c3)
- Now, A**u** = **F**, can be solved in MATLAB

### (a) with N = 10
### (b) with N = 40
