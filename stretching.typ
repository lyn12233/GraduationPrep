#set text(font: ("Times New Roman", "SimSun"))
#show heading: set text(font: "SimHei")
#show heading.where(level: 1): set heading(numbering: "1.")
#show heading.where(level: 2): set heading(numbering: "1.1.")
#show math.equation: set text(font: "New Computer Modern Math")
#let b = it => { block(it, inset: 1em, stroke: 1pt, width: 100%, breakable: true) }

Table of Contents
#outline(title: none)

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

#b[
  *Q* 设 $a_1 > 0, alpha >0$, 迭代公式
  $ a_(n+1) = a_n + (n/(S_n))^alpha quad (S_n = sum_(i=1)^n a_i) $,
  设 $lim_(n->infinity) (n a_n)/(S_n)$ 收敛;
  - 证明存在 $k$ 使 $lim_(n->infinity) a_n/(n^k)$ 收敛且非零, 并求 $k$;
  - 求 $lim_(n->infinity) (n a_n)/(S_n)$;

  *A*

  显然 $a_n$ 递增且增长速度递减(证明: $(n+1)/S_(n+1) < n/S_n <=> S_n < n a_(n+1)$),
  分析增长趋势易得 $k-1 = -k alpha$ 即 $k=1/(1+alpha)$
  且 $(n a_n)/(S_n) -> k+1 = (alpha+2)/(alpha+1)$;

  - 方法1: 利用题设条件; 记 $x_n = (n a_n)/(S_n)$ 并设 $x_n -> L$, 等式变为
    $ a_(n+1)= a_n + (1/(a_n))^alpha x_n^alpha $
    考虑级数 $(a_n^(1+alpha))/n$ 差分 $Delta (n) ->1, Delta (a_n^(1+alpha)) -> ~1$,
    围绕 $f(x) = x^(1/k) = x^(1+alpha)$ 构造微分不等式
    $
      a_(n+1)^(1+alpha) - a_n^(1+alpha) & = (a_(n+1) - a_n) ((1+alpha) xi^(alpha)) quad (a_n < xi < a_(n+1)) \
                                        & = (1+alpha) (xi/(a_n))^alpha x_n^alpha
    $
    由于 $a_(n+1) - a_n < (n/(n a_1))^alpha$ 故 $xi/(a_n) -> 1$ 从而
    $k=1/(1+alpha)$ 时
    $ (a_n)/n^k = (a_(n+1)^(1+alpha) - a_n^(1+alpha))^k -> ((1+alpha) L^alpha)^(1/(1+alpha)) $收敛且非零,
    并得到 $k=1/(1+alpha)$ 是唯一的;
  - 方法2: 不需利用题设, #text(fill: red)[求差/考察可能收敛的值的变化]
    记 $ p = alpha+1,quad k = 1/p\
    d_n = a_(n+1) - a_n = (n/S_n)^alpha,quad q_n = (n a_n)/(S_n),quad y_n = (n d_n)/(a_n) $
    第一步, 发现
    $
      0< y_n = (d_n)/(a_1 + sum d_i) < n/(n-1)\
      0< q_n = (n a_n)/(S_n) < (n a_n)/(n/2 a_1 + n/2 a_n) < 2 quad (a_n "上凸")
    $
    说明 $y_n, q_n$ 有界; #v(0pt)
    第二步, 求 $q_n, y_n$ 递推性质
    $
      q_(n+1) = ((n+1) a_(n+1))/(S_(n+1)), quad
      a_(n+1) = a_n + y_n/n a_n, quad S_(n+1) = (n a_n)/(q_n) + a_(n+1)
    $ $
      therefore q_(n+1) & = ((n+1)(1+ y_n\/n))/(n\/q_n + 1 + y_n\/n) \
                        & = ((1 + 1/n) (1+ y_n/n))/(1\/q_n + 1\/n + y_n\/n^2) \
                        & = q_n (1 + 1/n (1+y_n - q_n) + O(n^(-2)))
    $
    $ y_(n+1) = ((n+1)d_(n+1))/(a_(n+1)), quad d_(n+1) = (((n+1)S_n)/(n S_(n+1)))^alpha d_n $
    $
      therefore y_(n+1) &= ((n+1)^p ((n a_n)/q_n)^alpha d_n)/(a_n (1+ y_n\/n) space n^alpha (((n a_n)/q_n) + a_n (1+y_n\/n))^alpha)\
      &= y_n 1/(1+ y_n\/n) ((n+1)/(n))^p ((n\/q_n)/(n\/q_n + 1 + y_n\/n))^alpha\
      &= y_n (1+ 1/n ((alpha+1) - y_n - alpha q_n) + O(n^(-2)))
    $
    得到时间因子 $t=log n$ 的渐进系统
    $
      cases(
        q' = 1 + y - q,
        y' = alpha+1 -y - alpha q
      )
    $
    不动点 $q_* = 1 + 1/(alpha+1), space y_* = 1/(alpha+1)$
    第二步, 由Lyapunov理论判断稳定性 (略?);
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

#b[
  *Q* 设 $a(t), b(t)$ 为连续恒正的实函数, $beta$ 为常数, 且
  $ lim_(t->infinity) integral_0^t a(t') dif t' = +infinity, quad lim_(t->infinity) a(t)/b(t) = beta $
  证微分方程 $y'(t) = y(t) (a(t) - b(t) y(t))$ 任意正解满足 $lim_(t->infinity) y(t) = beta$
  #h(1fr) (CMC, 2025)

  *A* #text(fill: red)[应先判别方程的形式, 得到通解的形式, 再做分析];
  方程为 $n=2$ 的伯努利方程, 令 $u=y^(-1)$, 方程变为
  $
    u'(t) = -y'/y^2 = - a(t) u(t) + b(t)\
    -> u(t) = exp(-integral_0^t a(x) dif x) (integral_0^t b(s) exp(integral_0^s a(x) dif x) dif s + C)
  $
  记 $A(t) = integral_0^t a(x) dif x$ 则
  $ y(t) = (e^(A(t)))/(integral_0^t b(s) e^(A(s)) dif s + C) $
  由洛必达法则得 $lim_(t->infinity) y(t) = lim_(t->infinity) (a(t) e^(A(t)))/(b(t) e^(A(t))) = beta$
]
