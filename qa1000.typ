#set text(font: ("Times New Roman", "SimSun"))
#show heading: set text(font: "SimHei")
#show heading.where(level: 1): set heading(numbering: "1.")
#show heading.where(level: 2): set heading(numbering: "1.1.")
#show math.equation: set text(font: ("New Computer Modern Math", "SimSun"))
#show math.equation: set block(breakable: true)
#set underline(stroke: 1pt, offset: 0.3em)

= 主要概念,符号约定,定理,公式
== 极限和连续性
== 一元函数的微分,积分
== 多元函数的微分
== 二元函数/三元函数的积分
== 无穷级数
== 微分方程
== 线性代数
== 概率论

= 强化篇Q\&A
== 函数的极限与连续
1. $
    lim_(x->0) ((arcsin x)/(x))^(1/(sin^2x)) & =
                                               lim_(x->0) ((x + 1/6 x^3 + o(x^3))/x)^(1/(x^2 + o(x^2))) \
                                             & = lim_(x->0) (1 + 1/6 x^2)^(1/x^2) = e^(1/6)
  $

2. $ lim_(x->0) 1/x integral_0^x (1 + sin 2 t)^(1/t) dif t & = ? $
对任意 $x>0$, 由积分中值定理, 存在 $0 < delta < x$ 使得
$ 1/x integral_0^x (1 + sin 2 t)^(1/t) dif t = (1 + sin 2 delta)^(1/delta) $
故
$
  "原式" = lim_(delta->0) (1 + sin 2 delta)^(1/delta)
  = e^2
$

3. $
    lim_(x->infinity) (x^(2/x) - 1)^(2/(ln x)) & =
                                                 lim_(x->infinity) (e^((2 ln x)/x) - 1)^(2/(ln x)) \
                                               & = lim_(x->infinity) ((2 ln x)/x)^(2/(ln x)) \
                                               & = lim_(x->infinity) e^(2/(ln x) dot (ln (2 ln x) - ln x)) \
                                               & = e^(-2)
  $

4. $
    lim_(x->0) (integral_0^x (e^(t-x)^2 - 1) sin t dif t)/(x^2 (e^x^2 - 1)) &= lim_(x->0) (integral_0^x t (t-x)^2 dif t)/(x^2 dot x^2)\
    &= lim_(x->0) (integral_0^x t^3 - 2 t^2 x + t x^2 dif t) / (x^4)\
    &= lim_(x->0) (1/4 x^4 - 2/3 x^4 + 1/2 x^4)/(x^4)\
    &=1/12
  $

5. 设 $lim_(x->0) (1+2x+3x^2 + f(x)/x)^(1/x) = e^5$, 则 $lim_(x->0) (1 + f(x) / x)^(1/x) = e^3$

6. 设函数 $f(x)$ 在 $x=3$ 某邻域可微, 且 $lim_(x->3) f(x) =0, lim_(x->3) f'(x) = 4016$, 求
$
  lim_(x->3) (integral_3^x (t integral_t^3 f(s) dif s) dif t)/(3-x)^2 & = lim_(x->3) (x integral_x^3 f(s) dif s)/(-2(3-x))\
  &=lim_(x->3) - 1/2 dot (-1) dot (integral_x^3 f(s) dif s + x (-f(x))) = 0
$

7. 设 $f(x), g(x)$ 在 $x=0$ 某邻域内连续, 当 $x->0$ 时, $f(x), g(x)$ 为等价无穷小, 则当 $x->0$ 时, $integral_0^x f(t) (1-cos t) dif t$ 是 $integral_0^x t^2 g(t) dif t$ 的 #underline[(等价无穷小)]

8. 设当 $x->0$ 时, $a integral_0^x^2 cos (t^2) dif t$ 与 $sin x - b ln (1+x)$ 是等价无穷小, 则 $(a,b)=?$

解 $"L.H.S" ~ a x^2, "R.H.S" ~ x + 1/6 x^3 - b (x-1/2 x^2) ~ -1/2 x^2 (b=1)$, 故 $(a,b) = (-1/2 , 1)$

9. 设当 $x->0$ 时, $integral_0^x (e^(t cos (t^2)) - e^t) dif t$ 与 $a x^b$ 是等价无穷小, 则 $(a,b)=(-1/2, 6)$

#text(fill: red)[分析] $e^(t cos (t^2)) \/ e^t ~ e^(t(cos (t^2) - 1)) ~ e^(-1/2 t^5)$

10. 已知 $lim_(x->3) (x^3 - 3x^2 + b x^2 + x - 3 b x - 3)/(x+a) = 25$, 则 $(a,b) = (-3,5)$

分析 $"divident"=(x-3)(x^2 + b x + 1)$, $a->-3,b->5$

11. 设函数 $f(x)$ 在 $0 < |x| < 1$ 上有定义, 且满足 $lim_(x->0) (cos x + f(x)/x)^(1/x^2) = e^(-1)$, 求
$ lim_(x->0) (f(x))/(sin^3 x) = -1/2 $

分析 $f(x)/x ~ -1/2 x^2$

12. 设函数 $f(x)$ 在点 $x=0$ 连续, $f(0)=1/2$, 函数 $ g(x) = cases(
    1/x sin x/2 quad x<0,
    x+ 1/2 quad x >= 0
  ) $ 则
$ lim_(x->0) (x f(x) + g(x) integral_0^(2 x) cos (t^2) dif t)/(x g(x)) & = (1/2 x + 1/2 dot 2 x)/(1/2 x) = 5 $

13. $f(x) = lim_(n->infinity) n^x ((1+1/n)^n - e)$ 在 $x=1$ 处 #underline[
    (左极限存在, 右极限不存在)
  ]

分析 $lim_(x->0) (1+x)^(1/x) ~ e^(1/x ln (1+x)) ~ e^(1 - 1/2 x + 1/3 x^2 -...) ~ e (1 - 1/2 x + ...)$

14. 计算 $ lim_(x->+infinity) (x^(x+1))/(1+x)^x - x/e & =
                                               lim_(x->infinity) x((x/(1+x))^x - 1/e) \
                                             & = -1/2 quad "(根据上文的结论)" $

15. $ lim_(x->0) (|x|^(x+2))/(sqrt(1+x^2) - 1) & = lim_(x->0) (x^2)/(1/2 x^2) |x|^x = 2 $

16. 设 $f(x) = (x+|x|)/2$, 则 $ lim_(x->0) (f(1-x) f(1+x))^(1/x^2) & = e^(-1) $

17. 设函数 $f(x)$ 在 $x=0$ 的某邻域内有定义, 且 $lim_(x->0) (x-f(x))/(ln(1+x)) = 1$ 则:
  - (a) $f(0)=0$ 错, $lim$ 性质与该点无关
  - (b) $lim_(x->0) f(x) = f(0)$ 错
  - (c) $lim_(x->0) (f(x))/x =1$ 错 $=0$
  - (d) 当 $x->0$ 时, $f(x)$ 是 $x$ 的高阶无穷小 对

18. 函数 $f(x)$ 在 $x=0$ 的某邻域内有定义, 则"$lim_(x->0) (|f(x)|)/x$ 存在" 是"$lim_(x->0) (f(x))/x = 0$"的 #underline[
    既非充分也非必要
  ] 条件

19. 当 $x->0$ 时, 以下无穷小量阶数最高的是:
  - (a) $ integral_0^(sin x) ((1+t)^t - 1) dif t ~ x^3 $
  - (b) $ integral_0^(sin (x^2)) (1+t)^(1/t) dif t ~ x^2 $
  - (c) $ integral_0^(sin x) e - (1+t)^(1/t) dif t ~ x^2 $
  - (d) $ integral_0^(sin^2 x) t e^t - t dif t ~ t^3|_(t=x^2) $
  故选(d)

20. 设函数 $f(x)$ 在点 $x=0$ 的某一邻域内可导, 且 $f(0)=0, f'(0)!=0$, 求 $ lim_(x->0) (integral_0^x^2 f(t) dif t)/(x^2 integral_0^x f(t) dif t)
  &= lim_(x->0) (2 x f(x^2))/(x^2 f(x) + 2 x integral_0^x f(t) dif t)\
  &= lim_(x->0) (4x^2 f'(x^2) + 2f(x^2))/(x^2 f'(x) + 2x f(x) + 2x f(x) + 2 integral_0^x f(t) dif t)\
  &= ... "(不可取)" $

$
  "原式" & = lim_(x->0) (integral_0^x^2 k t + o(t) dif t)/(x^2 integral_0^x k t + o(t) dif t) \
         & =lim_(x->0) (1/2 k x^4 + o(x^4))/(x^2 (1/2 k x^2 + o(x^2))) = 1
$

== 数列极限

1. 若 ${x_n}, {y_n}$ 满足 $lim_(n->infinity) x_n y_n = infinity$, 则以下结论:
  - (a) $lim_(n->infinity) x_n = infinity$ 或 $lim_(n->infinity) y_n = infinity$ 对, 易证反命题
  - (b) $lim_(n->infinity) x_n = infinity$ 且 $lim_(n->infinity) y_n = infinity$ 错
  - (c) $x_n, y_n$ 一个是无穷大量, 一个是无界量: 错
  - (d) 当 $x_n$ 是非零无穷小量时, $lim_(n->infinity) y_n = infinity$ 对

2. $ lim_(n->infinity)(sum_(i=1)^n 1/(i(i+1)))^n = lim_(n->infinity) (1 - 1/(n+1))^n= e^(-1) $

3. 已知数列 ${a_n}$ 发散, $b_n = a_n e^(a_n)$, 则:
  $a_n>0$ 时 ${b_n}$ 发散; ($a_n < 0$ 时未必收敛,考察发散的多种情况)

4. 设 $a_n = integral_0^1 x^n sqrt(1-x^2) dif x, b_n = integral_0^(pi/2) sin^n t dif t$, 则极限
  $lim_(n->infinity) (((n+1)a_n)/(b_n))^n = ?$

分析
$ a_n = integral_0^(pi/2) sin^n t cos^2 t dif t = b_(n+2) - b_n $
$
            b_(n+1) & = (-cos t sin^(n+1) t)|_0^(pi/2) \
                    & + integral_0^(pi/2) cos t dot (n+1) sin^n t dot cos t dif t \
                    & = - (n+1)b_(n+1) + (n+1)b_n \
  therefore b_(n+1) & = (n+1)/(n+2)b_n \
   therefore "原式" & = lim_(n->infinity) ((n+1)(n+3 - n - 1))/(n+1) = 2 \
$

实际由Wallis公式 $I_n = (n!!)/((n+1)!!) dot space "("1"或"pi/2")"$

5. 设 $0<=x_1 <= sqrt(c), x_(n+1) = (c(1+x_n))/(c+x_n), c>1$, 证明数列 $x_n$ 收敛, 并求极限值;

证: 更一般的对 $x_(n+1) = f(x_n)$ 不动点 $a=f(a)$,
$|x_(n+1) - a| = |f(x_n) - f(a)| <= L |x_n - a|$, 其中 $L = max f'(x)$,
不等式成立依据中值定理, 不利用中值定理的具体过程
$
  (c(1+sqrt(c) + delta_n))/(c + sqrt(c) + delta_n) - sqrt(c)
  &= ((c - sqrt(c))delta_n)/(c+ sqrt(c) + delta_n)quad (delta_1<=sqrt(c))\
  &<= delta_n
$

6. 设 $x_1 < 0, x_(n+1) = e^(x_n) - 1$, 求 $lim_(n->infinity) (1/x_n - 1/(x_(n+1)))$
解: 可知 $x_n < 0$, $x_(n+1) < 1+x_n - 1 = x_n$, 得 $lim_(n->infinity) x_n = 0$;
$
  "原式" & = - lim_(t->0^-) (1/(e^(1/t) - 1) - t) \
         & = 1
$

7. 设数列 ${x_n}$ 满足 $0< x_n < pi/2, cos x_(n+1) - x_(n+1) = cos x_n$, 证明 $lim_(n->infinity) x_n$ 存在并求值,
并求 $lim_(n->infinity) x_(n+2)/(x_n)$

证明: $cos x_n$ 递增, 数列递减; $|f'(x_n)| = | (sin x_n)/(sin x_(n+1) - 1) | < 1$, 不动点 $x=0$;
$
  lim_(n->infinity) (x_(n+2))/(x_n) & = lim_(x->0) (x)/(arccos (cos(cos x - x) - cos x + x)) \
                                    & = lim_(x->0) x/(arccos(cos 1 - 1)) = 0
$

8. 已知数列 ${x_n}$ 满足 $0<x_1< pi/4, x_(n+1) + tan x_n = 2 x_n$, 证明 $lim_(n->infinity) x_n$ 存在并求值, 求 $lim_(n->infinity) (1/(x_n^2) - 1/(x_n x_(n+1)))$

证明: 略 $lim_(n->infinity) x_n = 0$;
$
  lim_(n->infinity) (1/(x_n^2) - 1/(x_n x_(n+1))) & =
                                                    lim_(n->infinity) (x_(n+1) - x_n)/(x_n^2 x_(n+1)) \
                                                  & = lim_(n->infinity) (x_n - tan x_n)/(x_n^3) dot (x_n)/(x_(n+1))
                                                    = - 1/3 \
$

== 一元函数微分学
