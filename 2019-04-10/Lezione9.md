# Lezione 9

## Osservatore di Luemberger

### Condizioni

- Sistema completamente controllabile
- Sistema completamente osservabile

### Svolgimento

Dato un sistema

$\begin{cases}
  \dot{x} = Ax + Bu
    \\
  y = Cx
\end{cases}$

Costruendo un sistema

$\begin{cases}
  \hat{\dot{x}} = A \hat{x} + B u + H (y - \hat{y})
    \\
  \hat{y} = C \hat{x}
\end{cases}$

Si ha che

$\delta \dot{x} = (A-HC)dx$

$\delta x = x - \hat{x}$

Il sistema interconnesso sara'

$\begin{cases}
  \dot{x} = (A-Bk)x + Bk \delta{x} + Bu
    \\
  \delta \dot{x} = (A-HC) \delta x
\end{cases}$

Quindi

$y=Cx=\begin{bmatrix}C \\ 0 \end{bmatrix}\begin{bmatrix}x && \delta x \end{bmatrix}$

$\begin{bmatrix} \dot{x} \\ \delta x \end{bmatrix} =
\begin{bmatrix} A-Bk && Bk \\ 0 && A-HC \end{bmatrix}
\begin{bmatrix}x \\ \delta x \end{bmatrix}+
\begin{bmatrix}B \\ 0\end{bmatrix}u$

## Istruzione `place`

`k = place(A,B,p)` ci dice il guadagno `k` tale per avere i poli del sistema caratterizzato da `A` e `B` uguali a `p`.

## Esempio

- Matrice `A = [ 0 1; -1 3 ]`
- Matrice `B = [ 0;1 ]`
- Matrice `C = [ 1 0 ]`
- Autovalori `eig(A) = [~0.3 ~2.6]`
- Polinomio `poly(A) = [1 -3 1] = s^2 - 3s + 1`
- Desidero poli `p = [-3 -4]`
- Prendo il guadagno `k = place(A, B, k) = [ 10 11 ]`
- Autovalori nuovi `eig(A-B*k) = [ -3 -4 ]`
- Calcolo `H = place(A', C', [-1 -6])`
- Traspongo H: `H = H'`
- Ho piazzato i poli `eig(A-H*C) = [ -6 -1 ]`

## Prestazioni

La costante piu' lenta dell'osservatore condiziona in quanto tempo il sistema viene stabilizzato
