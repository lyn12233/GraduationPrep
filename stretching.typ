#set text(font: ("Times New Roman", "SimSun"))
#show heading: set text(font: "SimHei")
#show heading.where(level: 1): set heading(numbering: "1.")
#show heading.where(level: 2): set heading(numbering: "1.1.")
#show math.equation: set text(font: "New Computer Modern Math")
#let b = it => { block(it, inset: 1em, stroke: 1pt, width: 100%, breakable: true) }
= 级数, 微积分

#b[
  *Q* $arcsin x$ 的泰勒展开

  *A* $ arcsin x = x + 1/6 x^2 + ... = sum_(n=0)^(infinity) ((2 n)!)/(4^n (n!)^2 (2 n + 1)) x^(2 n + 1) $
  证明:
  + 利用导数 $ f'(x) = (1-x^2)^(-1/2) = sum_(n=0)^(infinity) binom(-1/2, n)(-x^2)^n $
]

#b[
  *Q* $integral_0^1 ln (1 + x^2) dif x$ #h(1fr) (CMC, 2024)
  *A* $ integral_0^1 ln (1+x^2) dif x & = (x ln(1+x^2))|_0^1 - integral_0^1 x 1/(1+x^2) dot 2x dif x \
                                & = ln 2 - integral_0^1 2 dif x + 2 integral_0^1 1/(1+x^2) dif x \
                                & = ln 2 - 2 + 2 arctan(x)|_0^1 \
                                & = ln 2 - 2 + pi/2 $
  很简单, 不需要复杂的变换; 是否可以从留数的角度分析呢? (否)
  在复分析的视角下:

  $
    integral_0^1 ln(1+x^2) dif x&=
    (x plus.minus i) ln (x plus.minus i) - 2x |_0^1\
    &= (1+i) (ln sqrt(2) + pi/4 i) + (1-i) (ln sqrt(2) - pi/4 i) - 2 - i (pi/2 i) - (-i) (- pi/2 i)\
    &= ln 2 - 2 - pi/4 dot 2 + pi/2 dot 2 = ln 2 - 2 + pi/2
  $
]

#b[
  *Q* prove that $ sum_(n=0)^infinity sum_(k=0)^infinity ((-1)^(sqrt(n)))/(n^2+k^2) $ converges.

  *A* 考虑特征 $integral.double 1/(x^2 + y^2) dif x dif y = pi/2 integral_0^infinity 1/r dif r$ 恰好条件不收敛? 复分析告诉我们收敛圆上条件收敛, 且恰好一点不收敛; 与之类似的一个随机变化的 "方向" 通常也会带来条件收敛;
  #text(fill: red)[核心是在相同的 "方向" 上做差, 余项易证绝对收敛, 同时得到更易求解答序列]
]

= 多元函数的微积分
#b[
  *Q* 在 $L: x^2 + y^2 =9$ 上逆时针积分:
  $ integral_L (-y dif x + x dif y)/(4x^2 + y^2) $

  *A* $ integral_0^(2pi) (sin^2 t + cos^2 t)/(4 cos^2 t + sin^2 t) dif t &
  = integral_0^(2 pi) (sec^2 t)/(4 + tan^2 t) dif t\
  &= (2 integral_0^(infinity) + 2 integral_(-infinity)^0) 1/(u^2 + 4) dif u quad (u=tan t)\
  &= pi $
  分析: 由次数知积分路径任意半径均成立; 注意变元时积分区间的分割
]

= 微积分不等式

#b[
  *Q* $f(x) >= 0 space forall x in (-infinity,+infinity)$, $f(x)$ has 1st order derivative, given $M$, $|f'(x) - f'(y)| <= M|x-y|$, prove that $ (f'(x))^2 <= 2M f(x) $.
  #h(1fr) CMC2024

  *A* 这道题并没有并没有给出二阶导的存在, 考察对特殊情况的处理.
  $
    <- lim_(Delta x -> 0) (f'(x+Delta x))^2 - (f'(x))^2 dot 1/(Delta x) <= 2M (f(x+Delta x) - f(x))dot 1/(Delta x) quad (f'(x)>0) \
    <- f'(x) lim_(Delta x ->0) (f'(x + Delta x) - f'(x)) dot 1/(Delta x) <= M f'(x)\
    <- lim_(Delta x->0) (f'(x+Delta x) - f'(x)) dot 1/(Delta x) <= lim_(Delta x -> 0) M(x+Delta x - x) dot 1/(Delta x) = M
  $
  方法2:
  $
    0<= f(x+Delta x) = f(x) + integral_x^(Delta x) f'(x+t) - f'(x) dif t + Delta x f'(x)\
    -Delta x f'(x) <= f(x) + 1/2 M Delta x^2 quad (Delta x>=0)\
    |f'(x)| <= f(x)/(Delta x) + 1/2 M Delta x <= 2 sqrt(1/2 M f(x))
  $
]

= 微分方程

#b[
  *Q* $(x^3 - y^2) dif x + (x^2 y + x y) dif y = 0$

  *A* 观察y项发现: $(x^3 - u) dif x + (1/2 x^2 + 1/2 x) dif u = 0$, 即
  $ (dif u)/(dif x) = 2 (u-x^3)/(x (x+1)) $
  方法1: 设线性方程解具有形式 $P(x) u + Q(x) = C$, 则
  $
    P(x) dif u + P'(x) u dif x + Q'(x) dif x = 0\
    (dif u)/(dif x) = - (P'(x) u + Q'(x))/(P(x))
  $
  得
  $
    P'(x) \/ P(x) = - 2/(x(x+1))\
    (ln P(x))' = -2 (1/x - 1/(x+1))\
    P(x) = ((x+1)/x)^2\
    Q(x) = ...
  $

  方法2: 利用乘积因子构造隐函数:
  对 $M dif x + N dif u = 0$, $partial_u M != partial_x N$ 时, 应有 $partial_u (mu M) + partial_x (mu N) = 0$ 即 $mu partial_u M = mu' N + mu partial_x N$, 进而也能得到 $y'/y = P(x)$ 形式的方程;
]
