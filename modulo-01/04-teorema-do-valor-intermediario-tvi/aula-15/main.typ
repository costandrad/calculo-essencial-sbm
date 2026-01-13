#import "conf.typ": *


#show: conf.with(
  author: [Igo da Costa Andrade],
  curso: [Cálculo Essencial],
  modulo: (
    numero: [1],
    tema: [Superando Limites]
  ),
  secao: [Teorema do Valor Intermediário],
  aula: (
    numero: [15],
    tema: [Teorema do Valor Intermediário (TVI)]
  )
)

#let opts = (
  size: (5, 5), axis-style: "school-book", 

  x-tick-step: 1, y-tick-step: 1,
  x-grid: true, y-grid: "both",
)

#let line-styles = (stroke: 1.5pt+sbm-blue)
#let mark-styles(fill-color) = (stroke: 1.2pt+sbm-blue, fill: fill-color)

#v(1cm)

+ Enuncie o Teorema do Valor Intermediário (TVI).
  #solution([
    *Teorema do Valor Intermediário (TVI)*: Se uma função $f$ é *contínua* em um intervalo fechado $[a, b]$ e $k$ é um número real entre $f(a)$ e $f(b)$, então, existe pelo menos um ponto $c in (a, b)$ tal que $ f(c) = k. $

    Em palavras: uma função contínua, ao passar de $f(a)$ para $f(b)$, assume *todos os valores intermediários* entre esses dois números.
  ])

+ Use o Teorema do Valor Intermediário para mostrar que a função $f(x) = x^3 - 2x - 5$ possui uma raiz no intervalo $[2, 3]$.
  #solution([
    Sejam os valores:
    $
      f(2) &= 2^3 - 2 dot 2 - 5 &= -&1; #h(1cm) f(3) &= 3^3 - 2 dot 3 - 5 &= &7.
    $
    Sabemos que $f$ é contínua para todo $x in RR$, pois é uma função polinomial. Em particular $f$ é contínua no intervalo fechado $[2, 3]$. Então, pelo Teorema do Valor Intermediário, a função $f$ assume todos os valores entre $f(2) = -1 < 0$ e $f(3) = 7 > 0$. Em especial, como há mudança de sinal, existe um valor $c in (2, 3)$ tal que $f(c) = 0$. O número $c$ será uma raiz de $f$ no referido intervalo.
  ])