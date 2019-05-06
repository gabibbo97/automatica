# Linearizzazione

Equazioni di stato

$\dot{x}_1 = -x_1^3+u$

$\dot{x}_2 = x_1^2+-x_2-u$

$y=x_2$

Per trovare i punti di equilibrio pongo le derivate uguali a zero

$x_1^3=u\rightarrow x_1 = \sqrt[3]{u}$

$x_2=\sqrt[3]{u}-u$

Poi faccio la matrice delle derivate parziali

$\frac{\partial A}{\partial x} =
\begin{bmatrix}
-3x_1^2 & 0 \\
2x_1^2 & -1
\end{bmatrix}$

$\frac{\partial f}{\partial u} =
\begin{bmatrix}
1 \\ -1
\end{bmatrix}$

$\frac{\partial y}{\partial x} =
\begin{bmatrix}
0 & 1
\end{bmatrix}$

$\frac{\partial y}{\partial u} =
\begin{bmatrix}
0 & 0
\end{bmatrix}$

Quindi il nuovo sistema

$A_l=
\begin{bmatrix}
-3\sqrt[3]{u^2} & 0 \\
2x\sqrt[3]{u^2} & -1
\end{bmatrix}$

Se scelgo $u_{eq} = 1 \rightarrow
\begin{cases}
x_{1\;eq} = 1 \\
x_{2\;eq} = 0
\end{cases}$

## Su Simulink

- Modello lo schema a blocchi
- Imposto inputs e outputs
- Vado su __trim model__
- Imposto i parametri
- Faccio start trimming
- Lo importo in MATLAB
-