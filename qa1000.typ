#set text(font: ("Times New Roman", "SimSun"))
#show heading: set text(font: "SimHei")
#show heading.where(level: 1): set heading(numbering: "1.")
#show heading.where(level: 2): set heading(numbering: "1.1.")
#show math.equation: set text(font: ("New Computer Modern Math", "SimSun"))
#show math.equation: set block(breakable: true)
#set underline(stroke: 1pt, offset: 0.3em)
#set box(stroke: (bottom: 1pt), baseline: 0pt, inset: (bottom: 5pt))
#show outline: set box(stroke: none, inset: 0pt)
#set page(numbering: "1")

#heading(level: 1, outlined: false, numbering: none)[目录]
#outline(title: none)

= 主要概念,符号约定,定理,公式
== 极限和连续性
- #text(fill: red)[极限求解的书写规范: 乘除法中同阶无穷小可替换,加减法中不行]
- 导数极限定理: (成立条件: 原函数连续可导)
- 高阶/低阶/同阶/等价无穷小; 无穷小表示和极限表示的等价性;
== 一元函数的微分,积分
- 第一类间断点: 左右极限都存在, 分为可去间断点和跳跃间断点
- 隐函数定理: $(dif y)/(dif x) = - (phi_x)/(phi_y)$
- 常见微分: $tan' = (sin/cos)' = (cos dot cos - sin dot (- sin))/(cos^2) = sec^2$
- 常见积分:
  $
    integral 1/(x^2 + a^2) dif x &= 1/a arctan x/a +C quad ("order of" 1/a "from" 1-2)\
    integral 1/(x^2 - a^2) dif x &= 1/(2 a) ln abs((x-a)/(x+a)) +C\
    integral 1/(a x^2 + b x + c) dif x
    &= 1/a integral 1/((x+b/(2a))^2 + c/a - (b^2)/(4 a^2)) dif x quad (Delta = b^2 - 4 a c, a!=0)\
    &= cases(
      1/(2 sqrt(a Delta)) ln abs((2a x + b - 2 sqrt(a Delta))/(2 a x + b + 2 sqrt(a Delta))) +C & quad a Delta > 0,
      1/(sqrt(-a Delta)) arctan (2 a x + b)/(2 sqrt(-a Delta)) +C & quad a Delta <0,
      - 1/(a x + 1/2 b) & quad Delta = 0
    )\
    integral arctan x dif x &= x arctan x - integral x/(x^2 + 1) dif x = x arctan x - 1/2 ln abs(x^2 +1) +C
  $
- 中值定理和不等式
- Jensen Inequality (and deduction): 在 $[a,b]$ 下凸的函数 $f(lambda a + (1-lambda) b) <= lambda f(a) + (1-lambda) f(b)$
  可以推出: 在连续区间上下凸函数极大值/上凸函数极小值在边界取得.
  #text(fill: red)[这只是推论], 参考 @jensen_ineq_example_1 中的38问
== 多元函数的微分
- 二元函数连续, 可导(偏导数存在), 可微的定义 $ Delta z = f'_x|_(x_0) Delta x + f'_y|_(y_0) Delta y
  + o(sqrt((Delta x)^2 + (Delta y)^2)) $
  关系: 可微->连续,
  可微->可导, 可导+偏导数连续->可微; 反之均不成立?
- 多元函数极限 $lim_((x,y)->(x_0,y_0))$ 的含义: 在去心领域内均成立, 包含从任意方向上趋近成立;
- Schwarz Theorem: 二阶混合偏导对称的必要条件:
  在某点二阶混合偏导均存在且其中一个连续
- 偏微分方程的解法: (1) 一阶齐次化为常微分方程(特征线法);
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

7. 设 $f(x), g(x)$ 在 $x=0$ 某邻域内连续, 当 $x->0$ 时, $f(x), g(x)$ 为等价无穷小,
则当 $x->0$ 时, $integral_0^x f(t) (1-cos t) dif t$ 是 $integral_0^x t^2 g(t) dif t$ 的 #underline[(等价无穷小)]

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

20. 设函数 $f(x)$ 在点 $x=0$ 的某一邻域内可导, 且 $f(0)=0, f'(0)!=0$,
求 $ lim_(x->0) (integral_0^x^2 f(t) dif t)/(x^2 integral_0^x f(t) dif t)
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

8. 已知数列 ${x_n}$ 满足 $0<x_1< pi/4, x_(n+1) + tan x_n = 2 x_n$, 证明 $lim_(n->infinity) x_n$ 存在并求值,
求 $lim_(n->infinity) (1/(x_n^2) - 1/(x_n x_(n+1)))$

证明: 略 $lim_(n->infinity) x_n = 0$;
$
  lim_(n->infinity) (1/(x_n^2) - 1/(x_n x_(n+1))) & =
                                                    lim_(n->infinity) (x_(n+1) - x_n)/(x_n^2 x_(n+1)) \
                                                  & = lim_(n->infinity) (x_n - tan x_n)/(x_n^3) dot (x_n)/(x_(n+1))
                                                    = - 1/3 \
$

== 一元函数微分学
1. 函数 $f(x)=(e^x -1)|x^3 - x^2 + x|$ 的不可导点个数为 #underline[2]

2. 设 $f(x+x_0) = alpha f(x)$ 成立, $f'(0)=beta$, $alpha, beta$ 为非零常数, 则 $x_0$ 处 #underline[($f(x)$ 可导且 $f'(x_0) = alpha beta$)]

3. 设 $ f (x) = cases(x^2 sin t/x &quad x!= 0, 0 &quad x=0) quad (t!=0) $, 在 $x=0$ #underline[可导且 $f'(x)$ 不连续]

4. 设函数 $f(x)$ 在区间 $(-1,1)$ 有定义, 在 $x=0$ 连续, 则:
  - 当 $lim_(x->0) x^(-1/3) f(x) =0$ 时, $f(x)$ 在 $x=0$ 可导 错
  - 当 $lim_(x->0) x^(-2) f(x) =0$ 时, $f(x)$ 在 $x=0$ 可导 对
  - 当 $f(x)$ 在 $x=0$ 可导时, $lim_(x->0) x^(-1/3) f(x) =0$ 对

#text(fill: red)[注: 导数出现了第二类间断点]

5. 设 $ f(x)= cases(x^2 sin 1/x &quad x!=0, 0 &quad x=0) $, 记 $F(x) = g(f(x))$, $g(x)$ 可导, 则 $F(x)$ 在 $x=0$ 处 #underline[(可导且 $F'(0)=0$)]

6. 设函数 $y=f(x)$ 由参数方程 $ cases(x=t^3 + pi/2 - 1, y=e^t^2) $ 确定, 则 $ lim_(n->infinity) n (f(pi/2 + 2/n) - f(pi/2)) & = 2 f'(pi/2) = 2 (2 t e^t^2)/(3t^2)|_(t=1) = (4 e) /3 $

7.设 $f(0)=a>0, f'(0) = b$, 求 $ lim_(x->0) (f(x)^(f(x)) - f(0)^(f(x)))/x
&= ((a+b x + o(x))^(a + b x + o(x)) - a^(a+ b x + o(x)))/x\
&=( e^( ( ln a + ln (1+ b/a x + o(x)) )(a+b x+o(x)) ) - e^(ln a (a+ b x + o(x))) )/x\
&= ( e^( ln a thin a + ln a thin b x + ln(b/a) a x + o(x) ) - e^(ln a thin a + ln a thin b x + o(x)) )/x \
&= (e^(ln a thin a) (ln(b/a) a x + o(x)))/x\
&=a^(a+1) ln(b/a) $

8. 已知函数 $g(x)$ 连续, 设 $f(x) = integral_0^x^2 g(x t ) dif t$, 求 $f'(x)$, 判断 $f'(x)$ 在 $x=0$ 的连续性;

解
$ f(x) = 1/x integral_0^x^3 g(t) dif t $

$ f'(x) = 3x^2 g(x^3) - 1/x^2 integral_0^x^3 g(t) dif t $

$ |f'(x)| <= |3x^2 g(x^3)| + |1/x^2 dot x^3 max_(0<t<x) g(t)| -> 0 $
故连续

9. 设函数 $f(x)$ 在 $x=a$ 邻域内可导且 $f(a)=0$, 证明 $g(x) = |f(x)|$ 在 $x=a$ 可导

#text(fill: red)[???]

10. 设 $ f(x) = cases((g(x)-e^x)/x &quad x!=0, a &quad x=0) $, 其中 $g(x)$ 有二阶连续导数, $g(0)=1, g'(0)=-1$:
  - 确定 $a$ 使 $f(x)$ 在 $(-infinity,+infinity)$ 连续
  - 此时 $f(x)$ 是否可导? 求 $f'(x)$

解: $a=-2$, $ f'(x) = cases(
  (x g'(x) - x e^x - g(x) + e^x)/x^2 & quad x!=0,
  (x(-2 + (g''(0)-1)x + o(x)) + 2 x + 1/2 x^2 - 1/2 g''(0) x^2 + o(x^2))/x^2 = 1/2 g''(0) - 1/2 & quad x=0
) $

11. 设 $f(x)$ 有二阶连续导数, $f(0)=0$, 令 $ g(x) = cases((f(x))/x &quad x!=0, f'(0) &quad x=0) $
  - 求 $g'(x)$
  - $g'(x)$ 在 $x=0$ 的连续性?
解: $g(x)$ 连续, 在 $x in (-infinity,0) union (0,+infinity)$, $g'(x) = (x f'(x) - f(x))/x^2$
$
  lim_(x->0) g'(x) = lim_(x->0) (x(f'(0)+f''(x) x + o(x)) - f(0) - f'(0) x - 1/2 f''(x) x^2 + o(x^2))/x^2\
  =1/2 f''(0)
$

12. 设 $ f(x) = cases(
    x arctan (1/sqrt(x)) & quad x>0,
    pi/2 (e^(sin x) -1) & quad x<=0
  ) $
  - 讨论 $f(x)$ 在 $x=0$ 的连续性和可导性
  - $f'(x)$ 在 $x=0$ 的连续性
解: 易证连续,
$ f'(x) = cases(
  x dot -1/2 x^(-3/2) x/(x+1) + arctan 1/sqrt(x) & quad x>0,
  pi/2 cos x e^(sin x) & quad x<=0
) -> 0 quad (x->0) $ 可导且导数连续

13. 设 $f(x)$ 在 $x=a$ 可导, 则 $|f(x)|$ 在 $x=a$ 不可导的充要条件是: #underline[($f(a)=0, f'(a)!=0$)]

== 一元函数微分的计算
1. 若 $y = sin(e^(-sqrt(x)))$, 则 $ (dif y)/(dif x)|_(x=1) & = 1/2 1/sqrt(x) dot - e^(-sqrt(x)) cos(e^(-sqrt(x)))|_(x=1) = -1/(2 e) cos (1/e) $


2. 设 $f(x)$ 在 $x=0$ 某邻域内具有连续导数, 且 $f(0)=1$, $f'(0)=1/2, f'(x) = 1/2 f(f(x)-1)$, 求 $f''(0)$

$ f''(x) = 1/2 f'(x) f'(f(x)-1) -> 1/2 dot 1/2 dot 1/2 = 1/8 $

3. 设 $y=y(x)$ 由方程 $y^3 + x y + x^2 - 2 x +1 = 0$ 确定并且 $y(1) = 0$, 则
$
  lim_(x->1) (x-1)^3/(integral_1^x y(t) dif t) & = lim_(x->1) (3(x-1)^2)/(y(x)) = lim_(x->1) 6(x-1) (dif x)/(dif y) \
                                               & = -6 lim_(x->1) (x-1) phi_y / phi_x \
                                               & = -6 lim_(x->1) (x-1) (3 y^2 + x)/(y + 2x -2)|_(x=1,y=0) \
                                               & = -6 lim_(x->1) (x-1)/(y+2x-2) dot 1 \
                                               & = -6 lim_(x->1) (1)/(y'+2) quad (y'(1) = 0) \
                                               & =3
$

4. 设函数 $y=y(x)$ 由方程 $arctan x/y = ln (y^2 + x^2)$ 确定, 求 $(dif y)/(dif x)$
$
  (dif y)/(dif x) & = - (phi_x)/(phi_y) \
                  & = - (1/y 1/((x/y)^2+1) - 2x/(x^2+y^2))/(-x/y^2 1/((x/y)^2+1) - 2y/(x^2+y^2)) \
                  & = (y-2x)/(x-2y)
$

$
  (dif^2 y)/(dif^2 x) & = ((x-2y)(y'-2) + (1-2y')(y-2x))/(x-2y)^2 \
                      & =(-4 y y' - 3 x y' - 4 x -3 y)/(x-2y)^2 \
                      & = (-(4y+3x)(y-2x)-(3y+4x)(-2y+x))/(x-2y)^3 \
                      & =(2y^2 + 10 x y + 2 x^2)/((x-2y)^3)
$

5. 设 $y = 2x + sin x$, 求反函数的二阶导数
$ (dif x) / (dif y) = 1/(2+ cos x) $
$
  (dif^2 x)/(dif^2 y) & = - x' dot sin x 1/(2+ cos x)^2 \
                      & = - (sin x)/(2 + cos x)^3
$

== 一元函数的微分学几何应用

1. 设 $f(x) = |ln|x||$, 则:
  - $x=1$ 不是极值点: 错
  - $x=1$ 不是拐点: 错
  - $x=-1$ 不是驻点: 对 #text(fill: red)[定义是导数为零]
  - $x=0$ 不是渐近线: 错

2. 设 $f(x)$ 在 $x=0$ 连续, 且 $lim_(x->0) ((f(x)+1)x^2)/(x - sin x) = 2$, 则曲线 $y=f(x)$ 在 $(0,f(0))$ 的切线方程为:

解: $f(0)=-1, (f'(0))/(-1/6)=2 -> f'(0) = -12$, $therefore -> y+1 = -12 x$

3. 设 $f(x)$ 在 $[a,b]$ 可导, 在 $x=a$ 取最小值, 在 $x=b$ 取最大值, 则: #underline[($f'_+(a) >= 0, f'_-(b)>=0$)]

4. 设函数 $f(x)=(x^2+a)e^x$, 若 $f(x)$ 既没有极值点也没有拐点, 则 $a$ 的取值范围: #underline[($[1,+infinity)$)]

解: $f'(x) = (x^2 + 2x + a)e^x -> a>=1$

5. 使得 $ln x <= a sqrt(x)$ 恒成立的最小整数 $a$ 为: #underline[1]

解: $f' = 1/x - a/(2 sqrt(x)) -> x_0 = sqrt(2/a)$, $ln(sqrt(2/a)) - sqrt(2a) < 0$

== 一元函数的微分学-中值定理和微分不等式
1. 设 $f(x)$ 在 $(0,+infinity)$ 可导, 则:
  - (a) 若 $lim_(x->infinity) f(x)$ 存在, 则 $lim_(x->infinity) f'(x)$ 存在: 错, $1/x sin (e^x)$
  - (b) 若 $lim_(x->infinity) f'(x)$ 存在, 则 $lim_(x->infinity) f(x)$ 存在: 错
  - (c) 若 $lim_(x->infinity) f'(x) = a != 0$, 则 $f(x)$ 在 $x->+infinity$ 时无界: 对
  - (d) 若 $lim_(x->infinity) f'(x) = 0$, 则 $f(x)$ 在 $x->+infinity$ 时有界: 错, $ln x$

2. 设 $f(x)$ 在 $(0,+infinity)$ 可导, 则:
  - (1) 若 $lim_(x->+infinity) f(x)$ 存在, $lim_(x->+infinity) f'(x)$ 存在, 则 $lim_(x->+infinity) f'(x) = 0$: 对
  - (2) 若 $lim_(x->+infinity) f(x) + f'(x)$ 存在, 则 $lim_(x->+infinity) f'(x) = 0$: ?
解析: #text(fill: red)[问题(2)不易证明].
$
  f'(x) + f(x) = g(x) quad g(x) -> L\
  f(x) = e^(-x)(C + integral_0^x e^t g(t) dif t)\
  f(x) - L = e^(-x) (C + integral_0^x e^t (g(t)-L) dif t)\
$
由极限的定义, 对任意 $delta>0$
$
  exists N>0 space "s.t." space |g(t)-L|<delta\
  "let" space x>N,\
  |f(x)-L| = | e^(-x) (C + integral_0^N e^t (g(t)-L) dif t) + e^(-x) integral_N^x e^t (g(t) - L) dif t |\
  <= e^(-x) |C| + e^(-x) (e^N - 1) M + (1 - e^(N-x)) delta quad (M= |max g(x) - L|)
$
固定 $N, delta$, 令 $x->infinity$, 从而 $lim_(x->infinity) |f(x)-L| <= delta$, 再令 $delta->0$, $lim_(x->infinity) |f(x) - L| = 0$.

3. 设 $f(x)$ 在 $[0,1]$ 可导, $f(0)=0,f(1)=1$, 且 $f(x)$ 不恒等于 $x$, 证明: 存在 $epsilon in (0,1)$, 使得 $f'(epsilon) > 1$;
反证法, 若 $f'(x) <=1 thin space forall x in (0,1)$, 则 $1 = f(1) = f(0) + integral_0^1 f'(x) dif x <= 0+1$, 等式当且仅当 $f'(x) = 1 space forall x in (0,1)$ 时成立, 与题设矛盾, 得证.

4. 设函数 $f(x)$ 在 $[0,+infinity)$ 可导:
  - (1) 若 $f(0) = lim_(x->infinity) f(x) = 0$, 求证: 存在 $epsilon in (0,+infinity)$, 使得 $f'(epsilon) = 0$
  - (2) 若 $0 <= f(x) <= ln (2x+1)/(x+sqrt(1+x^2))$, 求证: 存在 $epsilon in (0,+infinity)$, 使得 $ f'(epsilon) = 2/(2epsilon + 1) - 1/sqrt(1+epsilon^2) $

  证: (1) #text(fill: red)[广义中值定理不在正文中, 另需证明]: 任取 $x_0 >0$, 若 $f(x_0)=0$, 由中值定理即得;
  若 $f(x_0)!=0$, 不妨 $f(x_0)>0$, 由极限的定义 $exists x_1 thin "s.t." thin |f(x)| < f(x_0) space forall x > x_1$,
  进一步 $exists epsilon_1 in (0, x_0) thin "s.t." thin f'(epsilon_1) > 0, thin exists epsilon_2 in (x_0, x_1)
  thin "s.t." thin f'(epsilon_2) < 0 thin (x_0 < x_1)$, $therefore thin exists epsilon_3 in
  (epsilon_1, epsilon_2) thin "s.t." f'(epsilon_3) = 0$.

5. 设正值函数 $f(x)$ 二阶可导且 $ (f'(x))^2 >= f(x) f''(x) $ $f(x)-x$ 在 $x=0$ 取得极值 $1$, 证明 $f(x) <= e^x$.

证明: 考察要点类似微分方程变形能力; 注意到 $(f/f')' = (f'^2 - f f'')/(f'^2) = 1 - (f f'')/(f'^2) <0$

6. 设 $f(x)$ 在 $(-infinity,+infinity)$ 二阶可导, $f''(x) >= 0$, 证明:
  - $f(x) >= f(x_0) + f'(x_0) (x-x_0) space forall x, x_0$
  - 若存在 $M>0$, 使 $|f(x)|<M space forall x$, 则 $f(x)$ 为常值函数
证: (1)
$
  f(x) & = f(x_0) + integral_(x_0)^(x) f'(x) dif x \
       & <= cases(
           f(x_0) + integral_(x_0)^x f'(x_0) dif x quad x>=x_0,
           f(x_0) - integral_(x)^(x_0) f'(x_0) dif x quad x<x_0
         )
$

(2) $f'(x_0)<=0 space forall x_0$ 否则 $lim_(x->+infinity) f(x) >= lim_(x->+infinity) f(x_0) + f'(x_0) (x-x_0) =+infinity$,
同理 $f'(x_0)>= 0 space forall x_0$

19. 设 $e<a<b$, 证明 $ a^2 < a b (ln a)/(ln b) < b^2 $
证: 左侧即 $a/(ln a) < b/(ln b)$, 即需要证 $f(x) = x/(ln x) space (x>e)$ 递增, 略

== 一元函数的微分学-物理应用
1. 质点P沿抛物线 $x=y^2$ 移动, P的横坐标变化速度 $v_x = 5 "m/s"$, 当 $x=9$ 时, P到原点 O 的距离变化速度为 $sqrt(((dif x)/(dif t))^2 + ((dif y)/(dif t))^2) = v_x sqrt(1 + ((partial y)/(partial x))^2) = 5 sqrt(1+ (1/(2 y))^2) space (y=3) = 5/6 sqrt(37)$

2. 球的半径以 $5 "m/s"$ 速度均匀增长, 当 $r = 50 "m"$ 时, 表面积和体积的增长速度? $V = (4 pi)/3 r^3, (dif V)/(dif t) = 4 pi r^2 (dif r)/(dif t)=5 times 10^4 pi space "m"^3"/s"$, $(dif S)/(dif t) = 8 pi r (dif r)/(dif t) = 2 times 10^3 pi space "m"^2"/s"$

3. 已知曲线 $L:space y = ln(sqrt(x)) quad (2<=x<=4)$, 在 $L$ 上做任意点 $P(x,y)$ 的切线, 切线与曲线在 $2<=x<=4$ 围成的面积为 $S$.
  - 求一点 $P$ 使 $S$ 变化率为零

解: $(dif y)/(dif x)|_(x=x_0) = 1/(2 x_0)$, $L: space y = 1/(2 x_0) (x - x_0) + 1/2 ln x_0 >= 1/2 ln x$,
$ S(x_0) = integral_2^4 1/(2 x_0) x - 1/2 + 1/2 ln x_0 - 1/2 ln x dif x $
$
  (dif S)/(dif x_0) = integral_2^4 - 1/(2 x_0^2) x + 1/2 1/(x_0) dif x = - (16 - 4)/(4 x_0^2) + 1/(x_0) = 1/x_0 - 3/x_0^2
$
$ -> x_0 = 3 $

== 一元积分学

1. $
    lim_(n->infinity) sum_(i=1)^n (1 - cos pi/sqrt(n))/(1+ cos (i pi)/(2 n))
    &= lim_(n->infinity) 1/2 (pi^2)/n sum_(i=0)^n 1/(1 + cos pi/2 i/n)\
    &= (pi^2)/2 integral_0^1 1/(1 + cos pi/2 x) dif x\
    &= pi integral_0^(pi/2) 1/(1+ cos x) dif x\
    &= pi integral_0^1 (1+t^2)/(2) 2/(t^2+1) dif t\
    & = pi
  $

主要结论: $t = tan x/2, cos x = (1-t^2)/(1+t^2), dif x = 2/(t^2+1)$, $integral 1/(1+cos x) dif x = tan x/2 + C$

2. 设 $f(x)$ 连续, 则
$
  lim_(n->infinity) sum_(i=0)^n (i - 1/2 + n)/n^2 f((2 i - 1)/(2n))
  &= lim_(n->infinity) sum_(i=0)^n 1/n (i-1/2 +n)/n f(i/n - 1/(2 n))\
  &=integral_0^1 (x+1) f(x) dif x
$

3. 设 $f(x)$ 在 $(0,1)$ 上可积, 则
$
  lim_(n->infinity) sum_(i=0)^n ln (1 + 1/n f(i/n))
  &= lim_(n->infinity) sum_(i=0)^n 1/n f(i/n) = integral_0^1 f(x) dif x
$

4. 比较大小
$
  I_1 = integral_0^(2 pi) (sin x)/x dif x, I_2 = integral_0^(2 pi) (sin x)/(2 pi - x) dif x, I_3 = integral_0^(2 pi) (sin x)/(x (2 pi - x)) dif x
$
$I_2 < 0=I_3 < I_1$

5. 比较大小
$ I_1 = integral_0^(sqrt(2 pi)) sin (x^2) dif x, I_2 = integral_(- pi/4)^(pi/4) 1/ (1+sin x) dif x $

计算 $integral 1/(1+sin x) dif x = -2 / (tan x/2 + 1) + C$, 也可以 $integral 1/(1+sin x) dif x = integral (1- sin x)/(cos^2 x) dif x= integral sec^2 x - sec x tan x dif x = tan x - sec x +C$

6. 设 $f(x)$ 在 $[0,1]$ 连续, $integral_0^1 2 x^2 f(x) dif x>= integral_0^1 f^2 (x) dif x + 1/5$, 则 $f(x)=?$

考察各分量, 设 $f(x)= x^k$, $2/(k+3) >= 1/(2 k + 1) + 1/5 -> 20 k + 10 >= 5k + 15 + 2 k^2 +7 k + 3 -> 0>= 2 k^2 -8 k + 8 -> k=2$,
进一步做差 $g(x) = f(x) - x^2$
$ integral_0^1 2x^2 g(x) >= integral_0^1 2x^2 g(x) + g^2(x) dif x -> g(x) = 0 $

7. 设 $f(x) =integral_0^(|sin x|) e^t^2 dif t, g(x) = integral_0^(|x|) sin (t^2) dif t$, 则在 $(-pi,pi)$:
  - $f(x)$ 是可导的奇函数
  - $g(x)$ 是可导的偶函数 ✓
  - $f(x)$ 是奇函数且 $f'(0)$ 不存在 ✓
  - $g(x)$ 是偶函数且 $g'(0)$ 不存在
分析: $f(x) approx |sin x|, g(x) approx 1/3 |x|^3$

8. $f(x) = 3 x - sqrt(1-x^2) integral_0^1 f^2 (t) dif t$
$f(x) = 3x - C sqrt(1-x^2)$, $C = integral_0^1 f^2(x) dif x = integral_0^1 9 x^2 + C/(1+x^2) dif x = 3 + pi/4 C$, $therefore C = 12/(4 - pi)$

9. 分析敛散性 $integral_0^n sqrt(x) floor(m/x) dif x$ #underline[只与 $n$ 有关]

10. 设 $p,q$ 为正常数, $ integral_0^1 1/(x^p abs(ln x)^q) dif x $ 收敛点条件: $p<1, q<1$

== 一元函数积分的计算

1. $integral_0^1 ln 1/(1-x) dif x = - integral_0^1 ln (1-x) dif x = (1-x) ln (1-x) + integral_0^1 1 dif x = 1$

2.
$
  integral (x+2)/((2 x+ 1)(x^2 + x+1)) dif x &= integral 2/(2x+1) - x/(x^2+x+1) dif x \
  &= ln |x+1/2| + C + integral (t- 1/2)/(t^2 + 3/4) dif t quad (t=x+1/2)\
  &=ln |x + 1/2| + 1/2 ln |t^2 + 3/4| - 1/2 sqrt(4/3) arctan ( x dot sqrt(4/3))+C
$

知识点: 有理分式, $1/(a x^2 + b x + c)$ 形式的积分

3.
$
  integral_0^e cos (ln x) dif x & = (x cos(ln x))|_0^e - integral_0^e x dot 1/x (-sin (ln x)) dif x \
                                & = e cos 1 + integral_0^e sin (ln x) dif x \
  integral_0^e sin (ln x) dif x & = (x sin (ln x))_0^e - integral_0^e x dot 1/x dot cos (ln)x dif x \
                                & =e sin 1 - integral_0^e cos (ln x) dif x
$
故 $integral_0^e cos (ln x) dif x = 1/2 e (sin 1+ cos 1)$

4. 设函数 $f(x)$ 满足方程 $x f(x) + f(1-x) = x^2$, 求 $integral f(x) dif x$
$therefore (1-x) f(1-x) + f(x) = (1-x)^2, therefore [x(1-x) - 1] f(x) = x^2 (1-x) - (1-x)^2$,
$therefore f(x) = ((2 x-1) dot 1 dot (1-x))/((-x^2 + x - 1)) = (2 x^2 - 3 x +1)/(x^2 - x + 1)$,
$therefore f(x) = 2 + (-x - 1)/(x^2 - x + 1)$.

$
  integral f(x) dif x & = 2x + integral (-t - 3/2)/(t^2 + 3/4) dif t quad (t=x-1/2) \
                      & =2 x - 1/2 ln abs(t^2 + 3/4) - 3/2 sqrt(4/3) arctan (x dot sqrt(4/3))+C
$

5.
$
  sum_(n=1)^infinity integral_n^(n+1) 2^(-sqrt(x)) dif x
  &= integral_1^infinity 2^(-sqrt(x)) dif x\
  &= integral_1^infinity 2^(-t) dot 2 t dif t quad (x=t^2)\
  &= 2 integral_1^infinity e^(- ln 2 space t) t dif t\
  &= 2 dot (-1/(ln 2) thin t thin 2^(-t) + 1/(ln 2)^2 2^(-t))_1^infinity\
  &= (2 (1 - ln 2))/(ln 2)^2
$

6. 已知 $f(x)$ 是连续的偶函数, 且 $integral_0^1 f(x) dif x = 2$, 则 $ integral_0^2 x f(1-x) dif x & = integral_0^1 x f(1-x) dif x + integral_1^2 x f(x-1) dif x \
                              & = integral_0^1 (1-t) f(t) dif t + integral_0^1 (t+1) f(t) dif t \
                              & = 2 dot 2 = 4 $

7. 已知 $f(x)$ 连续, $f(x^2+1) - f(x^2) = x space (x>0)$, $integral_0^1 f(x) dif x =1$, 则
$ integral_0^2 f(x) dif x & = 1+ integral_0^1 f(t) + sqrt(t) dif t & = 2 + 2/3 = 8/3 $

8. 设 $f(t)=integral_0^1 t |t-x| dif x$ 求 $integral_(-1)^2 f(t) dif t$
$
  integral_(-1)^2 f(t) dif t &= integral_0^1 integral_x^2 t(t-x) dif t dif x + integral_0^1 integral_(-1)^x t (x-t) dif t dif x\
  &= integral_0^1 1/3 t^3|_x^2 - 1/2 t^2|_x^2 x - 1/3 t^3|_(-1)^x + 1/2 t^2|_(-1)^x x dif x\
  &=integral_0^1 8/3 - 1/3 - 2/3 x^3 -2 + 1/2 + x^2 dif x\
  &= 7/3 - 3/2 - 1/6 + 1 = 5/3
$

9. 设 $f(x)$ 是以2为周期的连续函数, $integral_0^2 f(x) dif x =1$, $g(x)$ 是过 $(-1/2,0)$ 和 $(0,1)$ 的直线, 则
$
  integral_0^2 f(g(x)) dif x & = integral_0^2 f(2 x+1) dif x quad (g(x) = 2 x + 1) \
                             & = 1/2 integral_1^5 f(t) dif t = 1
$

10. 已知 $f'(x) = arctan (x-1)^2$, $f(0)=0$ 则
$
  integral_0^1 f(x) dif x & =integral_0^1 integral_0^x arctan (t-1)^2 dif t dif x \
                          & = integral_0^1 integral_t^1 arctan (t-1)^2 dif x dif t \
                          & = integral_0^1 (1-t) arctan (1-t)^2 dif t \
                          & =1/2 integral_0^1 arctan u dif u quad (u=(1-t)^2) \
                          & = 1/2 (u arctan u - 1/2 ln (u^2 +1))_0^1 \
                          & =1/2 (pi/4 - 1/2 ln 2) = pi/8 - 1/4 ln 2
$

== 一元函数积分学-几何应用
1. 曲线 $e^y + x y + x^3 = e$ 在点 $(0,1)$ 的切线与坐标轴围成的三角形面积为:

解: $(dif y)/(dif x) = - phi_x/phi_y = (y+ 3 x^2)/(e^y + x) = 1/e -> S = e/2$

== 一元函数积分学-不等式
1. 设 $f(x)$ 在 $[0,1]$ 可导, 当 $0<=x<=1$ 时, $f'(x) + f^2 (x) >=0, f(0)>0$, 则:
分析: 特征 $y' + y^2=0, -1/y^2 dif y = 1 dif x, y = 1/(x+C)$.
能保证恒正.?
$f >= - f'/f, integral_0^1 f(x) dif x >= ln (f(0))/(f(1))$

2. 设函数 $f(x)$ 在 $[0,1]$ 连续, 证明:
$ integral_0^1 integral_(x^2)^(sqrt(x)) f(t) dif t dif x = integral_0^1 (sqrt(x) - x^2) f(x) dif x $
由 $sqrt(x), x^2$ 显然.
(如何利用分布积分法证明?)

3. 设 $f(x)$ 在 $[0,1]$ 可导, $f(0)=f(1) = 1$, $|f'(x)| <=1$, 则 $integral_0^1 f(x) dif x$ 的取值范围?
$5/4, 3/4$, 存在性, 必要性, 显然.

4. 证明:
$
    & integral_0^1 integral_(x)^(sqrt(x)) (sin t)/t dif t dif x = 1 - sin 1 \
  = & integral_0^1 integral_(t^2)^t (sin t)/t dif x dif t = integral_0^1 sin t - t sin t dif t \
  = & (-cos t)|_0^1 + (t cos t - sin t)|_0^1 \
  = & -cos 1 + 1 + cos 1 - sin 1
$

5. 设函数 $f(x), g(x)$ 在 $[a,b]$ 连续, 满足 $integral_a^x g(t) dif t <=integral_a^x f(t)
  dif t$, 且 $integral_a^b g(t) dif t = integral_a^b f(t) dif t$. 证明
$ integral_a^b x f(x) dif x <= integral_a^b x g(x) dif x $
证: 记 $u(x) = integral_a^x f(t) dif t$, $v(x) = integral_a^x g(t) dif t$,
由题 $u(b)=v(b), u(x)<=v(x) space forall x in [a,b]$, $u(a) = v(a) = 0$; 故
$"L.H.S" = integral_a^b x dif u(x) = x u(x) |_a^b - integral_a^b u(x) dif x
= u(b) - integral_a^b u(x) dif x <= v(b) - integral_a^b v(x) dif x = x v(x)|_a^b
- integral_a^b v(x) dif x = integral_a^b x dif v(x) = "R.H.S"$

== 一元函数积分-物理应用

== 多元函数微分学 <jensen_ineq_example_1>

1. 设 $f(x)= |x| + y |y|$,
  则: #box[C. $f'_x(0,0)$ 不存在, $f'_y(0,0)$ 存在]

2. 设 $f(x,y)$ 具有一阶偏导数, $partial_x f >0$,
  $partial_y <0$, 则 #box[$f(0,1) < f(1,0)$]

3. 已知 $F(a,b) = integral_0^(pi/2) (a sin x - sin^2 x + b)^2 cos x dif x$,
  使 $F(a,b)$ 最小则 $(a,b)$ = #box[$(pi/4, pi^2/24)$]
$partial_a F(a,b) = integral_0^(pi/2) 2 (a sin x - sin^2 x + b) sin x cos x dif x
= 2/3 a (pi/2)^3 - 1/2 (pi/2)^4 + b (pi/2)^2$,
$partial_b F(a,b) = integral_0^(pi/2) 2 (a sin x - sin^2 x + b) cos x dif x = a (pi/2)^2 - 2/3 (pi/2)^3 + b (pi/2)$,
$2/3 A + B = 1/2, A +B = 2/3$, $A=1/2, B=1/6$, $a = pi/4, b= pi^2/24$

4. 若 $f(x,y)$ 在 $(0,0)$ 邻域内有定义, $f(0,0)=0$,
  $lim_((x,y)->(0,0)) (f(x,y) - sqrt(x^2 + y^2))/sqrt(x^2 + y^2) = a$,
  - 讨论 $f(x,y)$ 在 $(0,0)$ 的连续性
  - $a$ 为何值时可微, 求 $dif f|_(0,0)$
解: (1) $lim_((x,y)->(0,0)) (f(x,y)-f(0,0)) = lim (f(x,y))/(sqrt(x^2 + y^2)) dot
lim sqrt(x^2 + y^2) = (a+1) dot 0 = 0$,\
对任意 $a$ 在 $(0,0)$ 连续;
(2) a=-1

5. 设函数 $u(x,y)$ 的全微分 $dif u = (e^x + f'(x)) y dif x + f'(x) dif y$, 其中 $f(x)$ 在 $$ 内具有二阶连续导数,
  $f(0)=4$, $f'(0)=3$, 求 $dif f|_((0,0))$
解: $f''_(x y), f''_(y x)$ 均在 $(0,0)$ 存在且连续(Schwarz),
$e^x + f'(x) = f''(x)$, $f'(x) = C e^x + x e^x = 3 e^x + x e^x$,
$f(x) = (x+2)e^x + C = (x+2) e^x + 2$

6. 已知 $f(u)$ 在 $(0,+infinity)$ 有二阶连续导数,
  且 $z = f(y/x)$ 满足 $partial_x^2 z + partial_y^2 z = 0$, 求 $f(u)$;
  解: $partial_x z = -y/x^2 f', partial^2_x z = (2y)/x^3 f' + y^2/x^4 f''$,
$partial_y z = 1/x f', partial_y^2 z = 1/x^2 f''$,
$therefore 2u f' + u^2 f'' + f'' = 0$,
$f'(u) = C exp(-ln(u^2 + 1)) = C/(u^2+1)$, $f(u) = C arctan u + C'$,
其中 $C, C'$ 为任意常数

36. 设 $D={(x,y)| x+ y<=3, x>=0, y>=0}$, 求 $f(x,y) = 2 x^3 + 2 y^3 -6x -6y +5$
  在 $D$ 上的最大值和最小值; #box[$(-3,41)$]
解: $f_x = 6 x^2 - 6, f_y = 6 y^2 - 6$, $f_(x x)(1,1) = 12, f_(y y)(1,1) = 12, f_(x y) = f_(y x) = 0$,
$B^2 - 4 A C <0$ 极小值 $f(1,1)=-3$; 在 $x+y=3$ 上: $f(x,y) = 2 dot 3 dot (x^2 - x y + y^2)
- 6 dot 3 + 5 <= 6 dot ((x+y)^2 - 0) - 13 = 41$,
在 $x=0$, $f(x,y) = 2 y^3 - 6 y + 5 <= max (f(0,0),f(0,3)) = 41$

37. $f(x,y)= 4 x^2 (x-2 y) + 16 y (x y -3)- 33x$ 在 $D={(x,y)|0<=y<=x <=3}$ 的取值范围
$f_x = 12 x^2 - 16 x y + 16 y^2 - 33, f_y = -8 x^2 + 32 x y - 48$,
$-x^2+ 4 x y - 6 = 0$, $35/2 x^2 - 38 x y + 16 y^2 = 0$, $x= (38 plus.minus 18)/35 y$,
$x=8/5 y, -64/25 + 4 dot 8/5 = 96/5 -> 5/16 , y=sqrt(5)/4, x= 2/sqrt(5)$,
; $x = 4/7 y$ 舍弃; 此时 $f(x,y) = -1 x^3 + 25/4 x^3 - 10x - 33 x = 2/sqrt(5) dot (21/4 dot 4/5 - 43) = - 388/(5 sqrt(5))$
在 $y=0$, $f(x,y)=4 x^3 -33 x <= max(f(0,0), f(3,0)) = 3 dot (36-33) = 9$;
在 $x=3$, $f(x,y) = 48 y^2 - (4 dot 9 dot 2 + 16 dot 3) y + 4 dot 27 - 33 dot 3
= 48 y^2 - 120 y +9 <= max(9, 81)=81$, 在 $x=y$, $f(x,y) = 12 x^2 - 48 x - 33x
= 12 x^2 - 81 x<=0$; 综上 $(-388/(5 sqrt(5)), 81)$

38. $-2 partial_x^2 u - 3 partial_y^2 u = u^2$, 在边界 $2x^2 + 3 y^2 =4$ 上
  $u>=0$; 证明 $u>=0$ 当 $2x^2 + 3 y^2 <= 4$
证: 给定 $phi$ 在 $x=t cos phi, y= t sin phi$ 方向
$(2 cos^2 phi + 3 sin^2 phi) partial_t^2 u =-u^2$,
记 $K = 2 cos^phi + 3 sin^2 phi >=0$, 则
$u(plus.minus sqrt(4/K)) >= 0,
u''(t) = - 1/K u^4<0$, 从而
$ u(t) & >= lambda u(-sqrt(4/K)) + (1-lambda) u(sqrt(4/K)) quad (0<=lambda<=1) \
     & >= lambda M + (1-lambda) M quad (M= min {u(plus.minus sqrt(4/K))}) \
     & =M >=0 $ 遍历 $phi in [0,2 pi], t in [plus.minus sqrt(4/K)]$
得到 $u(x,y) >=0space forall (x,y) in D$

39. $partial_u f + partial_v f = 6(u+v) - 3 u^2$ 求 $f(u,v)$

40. $partial_u f + partial_v f = 6u + 6 v - 3 u^2$,
  $f(u,0) = 3 u^2 -u^3$, 求 $f(u,v)$
