#set text(font: ("Times New Roman","SimSun"))
#show heading: set text(font: "SimHei")
#show heading.where(level: 1): set heading(numbering: "1.")
#show heading.where(level: 2): set heading(numbering: "1.1.")
#show math.equation: set text(font:"New Computer Modern Math")

*Q* $arcsin x$ 的泰勒展开

*A* $ arcsin x  = x + 1/6 x^2 + ... = sum_(n=0)^(infinity) ((2 n)!)/(4^n (n!)^2 (2 n + 1)) x^(2 n + 1) $
证明:
+ 利用导数 $ f'(x) = (1-x^2)^(-1/2) = sum_(n=0)^(infinity) binom(-1/2,n)(-x^2)^n $

