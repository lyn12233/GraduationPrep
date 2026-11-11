#import "@preview/cuti:0.4.0": show-cn-fakebold
#show: show-cn-fakebold

#align(center)[#text(size: 20pt)[概率论主要表述拾遗]]

#set heading(numbering: "1.1.")

= 随机事件和概率

事件的运算: 相等, 包含, 交, 并, 互斥, 对立, 差

事件的运算规律: 交换律, 结合律, 分配律, 对偶律

概率公理: P是定义在样本空间 $Omega$ 上的实值函数

事件的独立性;
条件概率;
概率运算的5个公式(全概率公式, Bayes公式);

古典概型和几何概型

= 随机变量的概率分布

随机变量也是定义在样本空间上的实值函数 $X: Omega -> RR$,
$X<=x$ 表示一个事件, 概率分布函数 $ F(x) = P(X <= x) $

关键性质: 右连续, 即x处取值等于向右逼近的极限

离散型随机变量的表示
$ X ~ binom(x_1 ... x_n, p_1 ... p_n) $

连续型随机变量的表示(概率密度):
$ F(x) = integral_(-infinity)^x f(t) dif t $

常用离散分布: 0-1分布, 二项分布, 超几何分布, 泊松分布, 均匀分布, 指数分布

泊松定理: $lim_(n->infinity) n p_n = lambda$ 则 $lim_(n->infinity) binom(k, n) p^k (1-p)^(1-k) = e^(-lambda) lambda^k / k!$

= 多维随机变量分布

独立性判据: $F(x,y) = F_X(x) F_Y(y)$, $p_(i j) = p_(i dot) p_(dot j)$

n维均匀分布的定义; n维正态分布;

= 随机变量的数字特征

主要概念: 期望, 方差, 原点矩, 中心距, 混合矩, 协方差, 相关系数; 独立一定不相关;

相关系数的性质 $|rho_(X Y)| = 1 <=> exists a b != 0 "s.t." P(Y = a X + b) = 1$

= 大数定律和中心极限定理

依概率收敛: $forall epsilon > 0, lim_(n->infinity) P(|X_n - A| < epsilon) = 1$

切比雪夫不等式 $P(|X - mu| >= epsilon) <= sigma^2/epsilon^2$ 仅当 $|X-mu| >= epsilon -> |X-mu| = epsilon$,
$|X-mu| < epsilon -> X = mu$ 时取等;

切比雪夫大数定律: 两两不相关的随机变量序列均值依概率收敛到期望的均值;

伯努利大数定律: 二项分布随着 $n->infinity$ 依概率收敛到 $p$;

辛钦大数定律: 独立同分布序列均值依概率收敛到期望;

中心极限定理: $ lim_(n->infinity) (1/n sum_(i=1)^n X_i - mu)/(sigma \/ sqrt(n) <= x) = Phi(x) $

= 数理统计的基本概念

统计量: 关于(简单随机)样本的不含未知参数的函数;

样本的数字特征: 均值, 方差 $$;

抽样分布: $chi^2$, $t$, $F$

= 参数估计

点估计和区间估计;

矩估计法和最大似然估计法, 似然函数的传递性;

估计量的评选标准: 无偏, 有效, 一致;

$
  cases(
    "置信水平" quad 1-alpha,
    "显著性水平" quad alpha,
  )
$

= 假设检验

$
  cases(
    H_0 quad "原假设" quad "拒绝实际为真的假设为第一类错误",
    H_1 quad "备择假设" quad "接受实际不真的假设为第二类错误"
  )
$

步骤: 提出假设, 构造检验统计量, 确定拒绝域, 计算统计量

= 推导内容

== 概率分布的数学性质汇总

二项分布 $B(n,p)$:
- $ E[x] = n p\
  D[X] = n p (1-p) $ (方法: $B(n,p)$ 可以视作 $B(1,p)$ 独立同分布的叠加)
- $ lim_(n->infinity, n p -> lambda) B(k ;n,p) = "Poisson" (k; lambda) $

泊松分布 $"Poisson" (k; lambda) = e^(-lambda) (lambda^k)/(k!)$ :
- $
    E[X] = sum_(k=0)^infinity k e^(-lambda) (lambda^k)/(k!) = e^(-lambda) (x e^x )_(x=lambda) = lambda\
    D[x] = sum_(k=0)^infinity (k^2 - k + k) e^(-lambda) (lambda^k)/(k!) - (E[X])^2 = lambda^2 +lambda - lambda^2 = lambda
  $

指数分布 $"Exp" (x; lambda) = lambda e^(-lambda x) quad (x>=0)$:
- $
    E[X] &= integral_0^infinity x lambda e^(-lambda x) dif x = 1/lambda ( - x + 1)e^(-x) |_0^infinity = 1/lambda\
    D[X] &= integral_0^1 x^2 lambda e^(-lambda x) dif x - (E[X])^2 = lambda ( - 1/(lambda) x^2 + 2/lambda^2 x - 2/lambda^3 ) e^(-lambda x) |_0^infinity - 1/lambda^2\
    &= 1/lambda^2
  $

正态分布 $N(x; mu, sigma^2) = 1/(sqrt(2 pi) sigma) exp(- (x-mu)^2/(2 sigma^2))$:
- $
    integral_(-infinity)^(+infinity) f(x) dif x = (sqrt(2 sigma^2))/(sqrt(2 pi) sigma) integral_(-infinity)^(+infinity) e^(-t^2) dif t = sqrt(pi)/sqrt(pi) = 1
  $

卡方($chi^2$)分布: 若 $X_i ~ N(0,1)$ 独立同分布, 则 $X^2 ~ chi^2_(1)$, $sum_(i=1)^n X^2 ~ chi^2_n$
- 概率密度: $Y = X^2, X ~ N(0,1)$, 则
  $
    f_Y (y) = 2 |(partial x)/(partial y)| f_X (sqrt(y)) quad (y>0) = 2/ (2 sqrt(y)) 1/sqrt(2 pi) e^(-x^2 / 2) = 1/sqrt(2 pi y) e^(-1/2 y)
  $
- 特征函数: $ phi_Y (omega) &= E(e^(i omega Y)) = integral_0^infinity e^(i omega y) 1/sqrt(2 pi y) e^(-1/2 y) dif y = 1/sqrt(2 pi) integral_0^infinity y^(-1/2) e^(- (1/2 - i omega) y) dif y \
  &= 1/sqrt(2 pi) Gamma(1/2) (1/2 - i omega)^(1/2 - 1) quad (Gamma (x) = integral_0^infinity x^(t-1) e^(-x) dif x )\
  &= 1/sqrt(2) (1/2 - i omega)^(-1/2)= (1 - 2 i omega)^(-1/2) $
  更简单的方法 $phi_Y (omega) = 1/sqrt(2 pi) integral_0^infinity e^(-(1/2 - i omega)x^2) dif x$

  进一步推广到 $chi^2_n$:
  $ phi_n (omega) = E[e^(i omega sum_(i=0)^n Y_i)] = product_(i = 1)^n E[e^(i omega Y_i)] = (1- 2 i omega)^(-n/2) $
  相应的, 概率密度:
  $
    f_n (y) &= 1/(2 pi) integral_(-infinity)^(+infinity) e^(-i omega y) (1 - 2 i omega)^(- n / 2) dif omega\
    &= 1/(2 pi) integral_(L) e^(-(1/2 - 1/2 s)y) s^(-n/2) 1/( - 2 i) dif s quad (s = 1-2 i omega)\
    & = i/(4 pi) e^(-1/2 y) integral_L e^(1/2 y s) s^(-n/2) dif s quad (L: 1+i infinity -> 1 - i infinity)\
    &= i/(4 pi) e^(-1/2 y) cases(- 2 pi i "Res"[e^(1/2 y s) s^(-n/2) | s=0] quad y > 0, 0 quad y <= 0 quad ("右半平面围道内无极点"))
  $
  由 $e^(1/2 y s) = sum 2^(-m)/(m!) y^m s^m$, 取 $m = n/2 -1$, 得 $"Res"[e^(1/2 y s) s^(-n/2) | s= 0] = 1/(Gamma(n/2)) (1/2 y)^(n/2 - 1)$,
  综合得到 $ f_n (y) = 1/(2^(n/2) Gamma(n/2)) y^(n/2 - 1) e^(-1/2 y) $
- 期望, 方差:
  $
    E[sum_(i=1)^n Y_i] = (-i) space phi'(0) = n\
    D[sum_(i=1)^n Y_i] = (-i)^2 space phi''(0) = n^2 - 2n
  $

t分布(用于估计均值): 若 $X ~ N(0,1)$, $Y ~ chi^2_n$, 则 $ X/sqrt(Y\/n) ~ t(n) $

F分布(用于估计方差): 若 $X ~ chi^2_m$, $Y ~ chi^2_n$, 则 $ (X\/ m)/( Y\/ n) ~ F(m, n) $
- 若 $X ~ chi^2_n$, 则 $X\/n ~ F(n, infinity)$
- 若 $T ~ t(n)$, 则 $T^2 ~ F(1,n)$
- 若 $F ~ F(m,n)$, 则 $1/F ~ F(n,m)$

== 大数定理和中心极限定理

== 区间估计和统计量的构造

*分位数的约定*: 设分布函数为 $F$, 满足 $P(X > u_alpha) = alpha$ (即 $F(u_alpha) = 1 - alpha$) 的 $u_alpha$ 称为*上$alpha$分位数* (上侧分位数). 下文记 $Phi_alpha = Phi^(-1)(1 - alpha)$, $t_alpha (n)$, $chi^2_alpha (n)$, $F_alpha (m, n)$ 分别为标准正态, $t$, $chi^2$, $F$ 分布的*上* $alpha$ 分位数 (与分布函数 $Phi(x)$ 区分). 于是 $alpha$ 越小分位数越大, 对称分布有 $u_(1-alpha) = -u_alpha$, 所以双侧区间一律写成 $plus.minus u_(alpha/2)$, 而不是 $u_(1-alpha/2)$.

*(1) 方差已知的正态总体均值*: $X_i ~ N(mu, sigma^2)$, $overline(X) ~ N(mu, sigma^2 / n)$,
- 构造统计量 $ (overline(X) - mu)/(sigma\/sqrt(n)) ~ N(0,1) $
- 构造置信区间 $ P{-Phi_(alpha/2) < (overline(X) - mu)/(sigma\/sqrt(n)) < Phi_(alpha/2)} = 1-alpha\
  therefore P{ mu - Phi_(alpha/2) sigma/sqrt(n) < overline(X) < mu + Phi_(alpha/2) sigma/sqrt(n)} = 1-alpha $

*(2) 方差未知的正态总体均值*: $S^2 = 1/(n-1) sum_(i=1)^n (X_i - overline(X))^2$

$
  sum_(i=1)^n (X_i - overline(X))^2 &= sum_(i=1)^n X_i^2 - n overline(X)^2\
  &= sigma^2 sum_(i=1)^n (Z_i + mu)^2 - n sigma^2 (overline(Z)+mu)^2 quad (Z = 1/sigma (X - mu))\
  &= sigma^2 (sum_(i=1)^n Z_i^2 - n overline(Z)^2)\
  &= sigma^2 sum_(i=1)^n (Z_i -overline(Z))^2
$
而 $sum (Z_i - overline(Z)) + n overline(Z)^2 = sum Z_i^2 ~ chi^2(n)$, $n overline(Z)^2 ~ chi^2(1)$,
要证明 $sum (Z_i - overline(Z))^2 ~ chi^2(n-1)$ 只需
$
  "cov"(Z_i - overline(Z), n overline(Z)) & ="cov"(Z_i, n overline(Z)) -"cov"(overline(Z), n overline(Z)) \
                                          & = 1/n - 1/n =0
$
- 构造统计量
  $
    T & = (overline(X) - mu)/(sigma/sqrt(n)) (((n-1)S)/(sigma (n-1)))^(-1/2) \
      & =(overline(X) - mu)/(S \/ sqrt(n))
  $
- 构造置信区间
  $
    P{-t_(alpha/2) < (overline(X) - mu)/(S \/sqrt(n)) < t_(alpha/2)} = 1-alpha\
    therefore P{mu - t_(alpha/2) S/sqrt(n) < overline(X) < mu + t_(alpha/2) S/sqrt(n)} = 1 -alpha
  $

*(3) 均值已知的方差*
- 构造统计量 $ chi^2 = 1/sigma^2 sum_(i=1)^n (X_i - mu)^2
  = sum_(i=1)^n Z_i^2 ~ chi^2(n) $
- 置信区间: 参考(4), 略;

*(4) 均值未知的方差*
- 构造统计量 $ chi^2 = (n-1)/sigma^2 S^2 = 1/sigma^2 sum_(i=1)^n (X_i - overline(X))^2 ~ chi^2(n-1) $
- 置信区间 $ P{chi^2_(1-alpha/2) (n-1) < (n-1)/sigma^2 S^2 < chi^2_(alpha/2) (n-1)} = 1 - alpha\
  therefore P{((n-1)S^2)/(chi^2_(alpha/2) (n-1)) < sigma^2 < ((n-1)S^2)/(chi^2_(1-alpha/2) (n-1))
  }=1-alpha $
*(5) 方差已知的2个总体均值之差*: $overline(X) - overline(Y) ~ N(mu_1 - mu_2, sigma_1^2/n_1 +sigma_2^2/n_2)$
- 构造统计量 $ U = (overline(X) - overline(Y) - (mu_1 - mu_2))/(sqrt(sigma_1^2/n_1 + sigma_2^2/n_2)) ~ N(0,1) $
- 置信区间 $ P{overline(X) - overline(Y) - u_(alpha/2) sqrt(sigma_1^2/n_1 + sigma_2^2/n_2) < mu_1 - mu_2 < overline(X) - overline(Y) + u_(alpha/2) sqrt(sigma_1^2/n_1 + sigma_2^2/n_2)} = 1- alpha $

*(6) 方差未知的2个总体均值之差*
由于 $(n_1 - 1)/sigma_1^2 S_1^2 ~ chi^2 (n_1 - 1)$, $(n_2 - 1)/sigma_2^2 S_2^2 ~ chi^2 (n_2 - 1)$, 得 $(n_1 - 1)/sigma_1^2 S_1^2 + (n_2 - 1)/sigma_2^2 S_2^2 ~ chi^2 (n_1 + n_2 - 2)$, 则分母部分:
$
  &((n_1 - 1)/sigma_1^2 S_1^2 + (n_2 - 1)/sigma_2^2 S_2^2) (n_1 + n_2 - 2)^(-1)(sigma_1^2/n_1 + sigma_2^2/n_2)\
  &= ((n_1 - 1) S_1^2 (1/n_1 + sigma_2^2/sigma_1^2 1/n_2) + (n_2 - 1) S_2^2 (sigma_1^2/sigma_2 1/n_1 + 1/n_2)) (n_1 + n_2 -2)^(-1)\
  &= (((n_1 - 1) S_1^2 + (n_2 - 1) S_2^2) (1/n_1 + 1/n_2) - (sigma_1^2 - sigma_2^2)/(sigma_1^2) (n_1 - 1)/(n_2) S_1^2 -(sigma_2^2 - sigma_1^2)/(sigma_2^2) (n_2 - 1)/(n_1) S_2^2 ) (n_1 + n_2 - 2)^(-1)
$
考虑*近似*, 即在 $sigma_1 = sigma_2$ 附近, 有 $ ((n_1 - 1)/sigma_1^2 S_1^2 + (n_2 - 1)/sigma_2^2 S_2^2)(sigma_1^2/n_1 + sigma_2^2/n_2) ~chi^2(n_1 + n_2 -2) $ 从而:
- 构造统计量 $ T = (overline(X) - overline(Y) - (mu_1 - mu_2)) / (S_omega sqrt(1/n_1 + 1/n_2)) ~ t(n_1 + n_2 - 2) $ 其中 $ S_omega = sqrt(((n_1 - 1)S_1^2 + (n_2 - 1) S_2^2)/(n_1 + n_2 -2)) $ 称为标准合并差;
- 置信区间 $ P{overline(X) -overline(Y) - t_(alpha/2)(n_1 + n_2 -2) S_omega sqrt(1/n_1 + 1/n_2) < mu_1 - mu_2 < overline(X) - overline(Y) + t_(alpha/2)(n_1 + n_2 -2) S_omega sqrt(1/n_1 + 1/n_2)} = 1-alpha $

*(7) 均值已知的2总体方差比*
- 构造统计量: (利用F的定义与(4)的结论)
  $ F= sigma_1^2/sigma_2^2 = (n_2 sum_(i=1)^(n_1) (X_i - mu_1)^2)/(n_1 sum_(i=1)^(n_2) (Y_i-mu_2)^2) $
  则 $ sigma_2^2/sigma_1^2 F ~ F(n_1, n_2) $
- 构造置信区间: 参考(8), 略; *注意只能用于 $sigma_1^2 <=> sigma_2^2 space ?$ 的假设检验, 否则统计量不满足F分布*;

*(8) 均值未知的2总体方差比*
- 构造统计量: $ F = S_1^2/S_2^2 $ 则 $ sigma_2^2/sigma_1^2 F ~ F(n_1 - 1, n_2 - 1) $
- 构造置信区间 $ P{F_(1-alpha/2) (n_1 - 1, n_2 - 1) < sigma_2^2/sigma_1^2 S_1^2/S_2^2 < F_(alpha/2) (n_1 - 1, n_2 - 1)} = 1-alpha\
  therefore P{(S_2^2/S_1^2) F_(1-alpha/2) (n_1 - 1, n_2 - 1) < sigma_2^2/sigma_1^2 < (S_2^2/S_1^2) F_(alpha/2) (n_1 - 1, n_2 - 1)} = 1-alpha\
  "等价地" quad P{(S_1^2/S_2^2)/F_(alpha/2) (n_1 - 1, n_2 - 1) < sigma_1^2/sigma_2^2 < (S_1^2/S_2^2)/F_(1-alpha/2) (n_1 - 1, n_2 - 1)} = 1-alpha $
