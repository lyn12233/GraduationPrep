Q: 设曲面 $Sigma : x^2 + y^2 + z^2 = 4, z>=0$, 取上侧;
计算 $ integral.double_Sigma (x dif y dif z + y dif z dif x + z dif x dif y)/(sqrt(x^2 + (y-1)^2 + z^2)) $

A: 设 $Sigma_0: x^2 + y^2 <= 4, z=0$ 取下侧;
记 $P = x/sqrt(x^2 + (y-1)^2 + z^2)$, $Q = y/sqrt(x^2 + (y-1)^2 + z^2)$, $R = z/sqrt(x^2 + (y-1)^2 +z^2)$,
在曲面上 $x^2 + (y-1)^2 + z^2 = 5 - 2y$; $Sigma, Sigma_0$

包围的区域记为 $V$;
由高斯积分公式:

$
  "原式" &= integral.triple_V (P_x + Q_y + R_z) dif x dif y dif z - integral.double_(Sigma_0) P dif y dif z + Q dif z dif x + R dif x dif y\
  &= integral.triple 1/sqrt(5 - 2 y) + 1/sqrt(5-2y) + 1/sqrt(5-2y) + y (-2)/(-2 (5-2y)^(3/2)) dif V - integral.double_(Sigma_0) R dif x dif y\
  &= integral.triple (15-5y)/(5-2y)^(3/2) dif V - 0
$

$V$ 在 $y=y$ 处的截面面积 $S(y) = 1/2 pi r^2 = 1/2 pi (4-y^2)$, 故

$
  "原式" & = integral_(-2)^2 5(3-y)/(5-2y)^(3/2) S(y) dif y \
         & = (5 pi)/2 integral_(-2)^2 (3-y)(4 - y^2)(5 - 2y)^(-3/2) dif y
$

记 $t = 5 - 2y$, 则 $dif y = -1/2 dif t$, $y = -1/2 t + 5/2$, 故

$
  (3-y)(4-y^2) & = 1/8 (6 + t- 5) (16 - (t-5)^2) \
               & = 1/8 (t+1) (-t^2 + 10t - 9) \
               & = 1/8 (-t^3 + 9 t^2 + t - 9) \
        "原式" & = -1/2 dot (5 pi)/16 integral_9^1 (-t^3 + 9 t^2 + t - 9) t^(-3/2) dif t \
               & = - (5 pi)/32 (- 2/5 t^(5/2) + 9 dot (2/3) t^(3/2) + 2 t^(1/2) -9 dot (-2) t^(-1/2)) |_9^1 \
               & = - (5 pi)/32 ( - 2/5 (1-243) + 6 dot (1-27) + 2 dot (1-3) + 18 dot (1- 1/3)) \
               & = - (5 pi)/32 ( - 484/5 + 156 + 4 - 12) \
               & = - pi/32 ( - 484 + 5 dot 148)
                 = pi 256/32 = pi/8
$

一般来讲, 线积分转换为面积分(斯托克斯公式), 面积分转换为体积分(高斯公式)会简化计算;