#import "@preview/cuti:0.4.0": show-cn-fakebold

#set text(font: ("Times New Roman", "SimSun"), top-edge: 1.2em, bottom-edge: -0.2em, baseline: 0.3em)
#show heading: set text(font: "SimHei")
#show heading.where(level: 1): set heading(numbering: "1.")
#show heading.where(level: 2): set heading(numbering: "1.1.")
#show math.equation: set text(
  font: ("New Computer Modern Math", "SimSun"),
  top-edge: 1em,
  bottom-edge: 0em,
  baseline: 0.3em,
)
#show math.equation.where(block: true): set text(baseline: 0em, top-edge: 1em, bottom-edge: 0em)
#show math.equation: set block(breakable: true)
#set underline(stroke: 1pt, offset: 0.3em)
#set box(stroke: (bottom: 1pt), baseline: 0pt, inset: (bottom: 5pt))
#show outline: set box(stroke: none, inset: 0pt)
#set page(numbering: "1")
#set par(leading: 0pt, spacing: 0pt)
#show math.equation.where(block: true): set par(leading: 10pt, spacing: 10pt)

#show: show-cn-fakebold

#align(center, text(size: 20pt, "<高等代数学>笔记"))
- 参考: ISBN 978-7-309-16336-0 谢/姚 编著, 复旦大学出版社

#heading(level: 1, outlined: false, numbering: none)[目录]
#outline(title: none)

= 行列式
== 二阶行列式
*NOMEN* 矩阵下标约定 (行号,列号); 行变换和列变换;

*Def 1.1* 二阶行列式的定义: 由二元一次方程组解的形式得到.

*PROP 1.1* 二阶行列式的性质 / *一般行列式的性质*
+ 上三角行列式的值等于对角线元素之积
+ 行列式某行/列为零, 则行列式的值为零
+ 常数 $c$ 作用于某行/列, 行列式的值为原来的 $c$ 倍
+ 交换行列式不同2行/列, 行列式值变号
+ 行列式2行/列成比例, 则行列式值为零
+ 行列式按行/列加法拆分
+ 行列式一行/列加到另一行/列, 行列式值不变
+ 行列式转置有值不变
== 三阶行列式
三阶行列式应满足PROP 1, PROP 7, 从而得到按行/列拆分的行/列元素与余子式积和的形式.

*Def 1.2* 余子式: 对 $|a_(i j)|$ 有
$ M_(1 1) = mat(delim: "|", a_( 2 2), a_(2 3); a_(3 2), a_(3 3)), ... $

*PROP 1.2* $|a_(i j)| = a_(1 1) M_(1 1) - a_(2 1) M_(2 1) + a_(3 1) M_(3 1)$

*PROP 1.3* 三元一次方程组的解可以用行列式表示;

== $n$ 阶行列式
*Def 1.3* $n$ 阶行列式的*余子式* $M_(i j)$, 行列式的值定义为
$|A| = a_(1 1) M_(1 1 ) - a_(1 2) M_(1 2) +... = sum_i (-1)^(1+i) a_(1 i) M_(1 i)$

*Def 1.4* *代数余子式* $A_(i j) = (-1)^(i+j) M_(i j)$, 这样
$|A| = sum_i a_(1 i) A_(1 i)$

== 行列式的展开和转置

*Def 1.5* *转置*的定义;

*PROP 1.4* 由二阶行列式的性质可以归纳得到对应的一般性质*PROP 1.1* (1-8)

*Theorem 1.1, 1.2* $ sum_j a_(i j) A_(i j) & = |A| space (forall i) \
sum_j a_(i j) A_(k j) & = 0 space (i !=k) $
同样对列有 $sum_i a_(i j) A_(i j)=|A| space (forall j)$;

分析: 对第一个等式, 由定义并交换 $i-1$ 次行得到; 对第二个等式, 相当于存在同样的2行;

*Theorem 1.3* (Cramer) 法则: 线性方程组的解
$ A x = b -> x_i = abs(A_i)/abs(A) $
其中 $A_i$ 表示 $A$ 第 $i$ 行替换为 $b$

== 行列式的计算

*Example 1.1* (Vandermonde determination)
$ a_(i j) = x_i^j -> |A| = product_(i<j) (x_i - x_j) $
解法: (1) 行/列变换+归纳法; (2) 不动点

== 行列式的等价定义

*Def 1.6* 排列: $(a_1,...,a_n)$ 元素为 (1...n)的数列; 常序排列: (1,...,n); 逆序对: 在排列中出现 $a_i > a_j, i<j$ 的数对;
*逆序数*: 逆序对的个数, 通常记为 $N(k_1,...)$ (或 $epsilon_(a_1,... a_n)$);

*Def 1.7* 根据逆序数定义奇排列/偶排列;

*PROP 1.5* 排列通过其逆序数次交换得到常序排列

*Theorem 1.4* 由逆序数表示行列式的值:
$ |A| = sum_(k_1 ... k_n) (-1)^epsilon a_(k_1 1) ... a_(k_n n) $

== Laplace 定理

*Def 1.8* k阶子式, 即对行列式顺序选取k行k列:
$ A binom(i_1 ... i_k, j_1 ... j_k) $
子式的代数余子式:
$ hat(A) binom(i_1 ... i_k, j_1 ... j_k) = (-1)^(i_1 +... + j_1 + ... + j_n) M binom(i_1 ... i_k, j_1 ... j_k) $

*Theorem 1.5* (Laplace) 行列式的 $k,n-k$ 行/列拆分:
$
  |A| = sum_(j_1 < ... < j_n)
  A binom(i_1 ... i_k, j_1 ... j_k) hat(A)
  binom(i_1 ... i_k, j_1 ... j_k) quad (forall i_1 ... i_k)
$

= 矩阵
== 矩阵的概念
*Def 2.1* 矩阵的定义, 表示, 行/列向量, 方阵, 单位矩阵, 上/下三角矩阵
== 矩阵的运算
*Def 2.2, 2.3* 矩阵的加法, 乘法:
$ C = A + B -> c_(i j) = a_( i j ) + b_(i j),quad C = A B -> c_(i k) = sum_j a_(i j) b_(j k) $

*PROP 2.1* 矩阵的加法, 乘法的交换律,结合律,分配律(乘法不满足交换律)

*Def 2.4* 矩阵的转置; *NOMEN* 矩阵转置的符号本书中为 $A'$, 实际应使用 $A^T$

*Def 2.5* 矩阵的共轭, 共轭转置 (对元素是复数的复矩阵而言)

== 方阵的逆

*Def 2.6* 方阵 $A$ 的逆 $A^(-1)$ 满足 $A A^(-1) = A^(-1) A = I$; 若 $A^(-1)$ 不存在, 则 $A$ 称为奇异阵;

*PROP 2.2* 方阵逆的性质:
+ $(A^(-1))^(-1) = A$
+ $(A B)^(-1) = B^(-1) A^(-1)$
+ $(k A)^(-1) = k^(-1) A^(-1)$
+ $(A^T)^(-1) = (A^(-1))^T$

*NOMEN* 方阵 $A$ 决定一个行列式, 记为 $|A|$ 或 $det A$;

*Def 2.7* 伴随矩阵 $A^* = [ A_(i j) ]$ 则显然 $A A^* = A^* A = |A| dot I$ (由Theorem 1.1, 1.2), 从而:

*Theorem 2.1* 逆矩阵的性质: $A^(-1) = |A|^(-1) A^*$

== 初等变换和初等矩阵
*Def 2.8* 3种*初等行变换*: (1) 对换; (2) 数乘某一行; (3) 数乘某一行加到另一行; 同样定义3种*初等列变换*;

*Def 2.9* *等价性*, 即经过若干初等变换后两矩阵相等;

*Theorem 2.2* 任一 $m times n$ 矩阵必等价于
$ mat(I_r & quad; quad & O) $ 的形式

*Def 2.10* 阶梯点, 阶梯型矩阵

*Theorem 2.3* 任一矩阵都可经初等*行*变换化为阶梯型矩阵;

*Def 2.11* 第一,二,三类初等矩阵,分别对应三种初等变换 (左作用为列变换, 右作用为行变换)

*PROP 2.3* 初等矩阵的性质: (1) 逆的性质, (2) 转置的性质, (3) 不改变奇异性;

*Theorem 2.4* 矩阵等价性的递推关系;

== 矩阵乘积的行列式和初等变换求逆法

*Theorem 2.5* 方阵非奇异阵地充分必要条件是其行列式的值非零

*Theorem 2.6* $abs(A B) = abs(A) abs(B)$

以上定理的依据: (1) 非奇异通过初等变换仍然是非奇异阵; (2)
归纳法得到非奇异阵通过初等变换得到单位阵; (3) 非奇异阵表示为有限初等矩阵的积;
另一方面再由初等矩阵作用下满足定理的等式, 以及奇异阵满足定理得证.

(实际上是Laplace定理的推论? 比如构造 $mat(A, quad; quad, B)$)

*初等变换求逆阵*:
$
                     (A quad & ;quad I) \
  -> (Q_1 ... Q_t A = I quad & ; quad Q_1 ... Q_t I = A^(-1))
$

== 分块矩阵
分块矩阵是矩阵的一种表示形式; 分块矩阵一般的性质包括加法/乘法性质, 分块对角阵的性质,
分块上/下三角阵的特征值, 矩阵乘法按列向量/行向量拆分的表示, 转置/共轭表示等;
这些性质是比较平凡的;
值得注意书中对 $mat(delim: "|", A, C; O, B) = abs(A) abs(B)$ 的证明使用了Laplace定理;

*Theorem 2.7*
$ mat(delim: "|", A, B; C, D) = |A| |A - C A^(-1) B| = |D| |A - B D^(-1) C| $
注意等式成立分别在可逆的条件下;


== Cauchy-Binet 公式
*Theorem 2.8* (Cauchy-Binet) 将方阵行列式乘的性质扩展到一般矩阵;
对 $A B : (m times n) (n times m) -> (m times m)$ 有:
- 若 $m>n$, 则 $abs(A B) = 0$
- 若 $m<=n$, 则 $ abs(A B) = sum_(j_1 < ... < j_m)
  A binom(1 comma ... comma m, j_1 comma ... comma j_m)
  B binom(j_1 comma ... comma j_m, 1 comma ... comma m) $
证明: 构造分块矩阵并做初等变换以构造 $mat(A, ; , B)->mat(A B, ; , ...)$:
$
  mat(A B, quad; quad, I_n) -> mat(A B, quad ; B, I_n)
  -> mat(O_m, -A; B, I_n)
$
另一种形式:
$ C=mat(A, ; -I_n, B) -> M=mat(O, A B; -I_n, O) $
(1) 通过Laplace定理证 $|C| = (-1)^(n(m+1)) "R.H.S"$
$
     C binom(1...m, j_1 ... j_m) & = cases(
                                     A binom(1...m, j_1 ... j_m) & quad j_m <= n,
                                     0 & quad j_m >n
                                   ) \
  hat(C) binom(1...m, j_1...j_m) & = det(((-e_(j_1),..., -e_(j_m))^T, B)_(n times n)) \
                                 & = B binom(j_1...j_m, 1...m) dot (-1)^() ?
$
(2) 通过Laplace定理证 $|M| = (-1)^(n(m+1)) abs(A B) =(-1)^(n(m+1)) "L.H.S"$
$
  M binom(1 comma ... comma m, j_1 ... j_m) & = cases(
                                                (A B) binom(1 ... m, 1 ... m) = abs(A B) & quad (j_i =n+1,...,j_m = n+m),
                                                0 & quad "otherwise"
                                              ) \
               hat(M) binom(1... m, 1... m) & =
                                              (-1)^(n+1 + ... + n+m) (-1)^(1+...+m) dot (-1)^n |I_n| \
                                            & = (-1)^(n(m+1)) \
                therefore abs(M) = abs(A B)
$
对Cauchy-Binet定理的推论有:
*Theorem 2.9*
$
  (A B) binom(i_1 ... i_r, j_1 ... j_r) & =
                                          sum_(k_1< ... < k_r) A binom(i_1 ... i_r, k_1 ... k_r)
                                          B binom(k_1 ... k_r, j_1 ... j_r) quad (forall r<=m) \
                                        & (=0 quad (r>n))
$
*Theorem 2.10*
$
  (A A^T) binom(i_1 ... i_r, i_1 ... i_r)
  = sum_(k_1 < ... < k_r) (A binom(i_1 ... i_r, k_1 ... k_r))^2 >= 0
$

分块矩阵在这里的意义是将待求量视作矩阵的元素/子矩阵, 通过矩阵变换实现待求量的运算.

