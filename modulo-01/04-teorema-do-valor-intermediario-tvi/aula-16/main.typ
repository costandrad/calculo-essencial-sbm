#import "conf.typ": *


#show: conf.with(
  author: [Igo da Costa Andrade],
  curso: [Cálculo Essencial],
  modulo: (
    numero: [1],
    tema: [Superando Limites]
  ),
  secao: [Teorema do Valor Intermediário (TVI)],
  aula: (
    numero: [16],
    tema: [Aplicações do TVI]
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

+ Use o Teorema do Valor Intermediário para provar que todo polinômio de grau ímpar possui pelo menos uma raiz real.
  #solution([
    Seja $p: RR -> RR$, um  polinômio de grau ímpar $2n+1$:
    $
      p(x) = a_(2n+1) x^(2n + 1) + a_(2n) x^(2n) + dots + a_1 x + a_0
    $

    Calculemos os seguinte limites:
    $
      lim_(x -> - infinity) p(x) &= lim_(x -> - infinity ) (a_(2n+1) x^(2n + 1) + a_(2n) x^(2n) + dots + a_1 x + a_0)\
      &= lim_(x -> - infinity) a_(2n + 1)x^(2n+1) (1 + a_(2n)/(a_(2n+1)) dot 1/x + dots + a_1/(a_(2n+1)) dot 1/x^(2n) + a_0/(a_(2n+1)) dot 1/x^(2n + 1))\
      &= lim_(x -> - infinity) a_(2n + 1)x^(2n+1) = cases(
        - infinity\, &" se" a_(2n+1) > 0, ,
        + infinity\, &" se" a_(2n+1) < 0
      )\
      lim_(x -> + infinity) p(x) &= lim_(x -> + infinity ) (a_(2n+1) x^(2n + 1) + a_(2n) x^(2n) + dots + a_1 x + a_0)\
      &= lim_(x -> + infinity) a_(2n + 1)x^(2n+1) (1 + a_(2n)/(a_(2n+1)) dot 1/x + dots + a_1/(a_(2n+1)) dot 1/x^(2n) + a_0/(a_(2n+1)) dot 1/x^(2n + 1))\
      &= lim_(x -> + infinity) a_(2n + 1)x^(2n+1) = cases(
        + infinity\, &" se" a_(2n+1) > 0, ,
        - infinity\, &" se" a_(2n+1) < 0
      )\
    $
    em que aplicamos o seguinte limite:
    $
      lim_(x -> plus.minus infinity) 1/x^k = 0
    $
    para todo $k > 0$.

    Note que em qualquer caso, $p(x)$ assume todos os valores arbitrariamente grandes tanto positivos quanto positivos. Então, seja $A >> 0$ um número real suficientemente grante. Como $p(x)$ é uma função polinomial, é contínua para todo $RR$, em especial, é contínua no intervalo fechado $[-A, +A]$. Temos que $0 in [-A, +A]$. Pelo Teorema do Valor Intermediáriom deve existir um um número $c in (-A, +A)$ tal que $p(c) = 0$. Esse valor $c$ será uma raiz de $p$.
  ])

+ Determine um intervalo de comprimento 1 que contenha uma raiz da função $f(x) = x^4 - 3x + x + 2$.
  #solution([
    #let f(x) = [
      #return calc.pow(x, 4) - 3 * calc.pow(x, 2) + x + 2
    ]

    #let X = range(-5, 5)
    #let Y = X.map(x => f(x))

    #let sinal = if Y.at(0) > 0 {"+"} else if Y.at(0) < 0 {"-"} else {"0"}
    #let row = ((X.at(0), Y.at(0), sinal), )

    #for i in range(1, X.len()) {
      let sinal = if Y.at(i) > 0 {"+"} else if Y.at(i) < 0 {"-"} else {"0"}
      row.push((X.at(i), Y.at(i), sinal))
      if Y.at(i - 1) * Y.at(i) < 0 {
        break
      }
    }

    A tabela abaixo mostra a aplicação de $f$ para diversos valores de $x$. Note que para $x = -2$, $f(x) < 0$, enquanto que para $x = -1$, $f(x) > 0$.  Consideremoos o ontervalo fechado $[-2, -1]$. Como $f$ é uma função polinomial, é contínua nesse intervalo. Portanto, pelo Teorema do Valor Intermediário, existe um valor $c in (-2, -1)$ tal que $f(c) = 0$. Esse número $c$ é uma raiz de $f$.

    #set table(
      stroke: (x, y) => {
        if y == 0 {
          (top: 0.7pt + black)
          (bottom: 0.7pt + black)
        } else if y == row.len() {
          (bottom: 0.7pt + black)
        }
      },
      fill: (x, y) => {
        if y == 0 {
          sbm-blue.transparentize(50%)
        } else if calc.rem(y, 2) == 0 {
          sbm-blue.transparentize(70%)
        }
      }
    )

    #figure(
      kind: table
    )[
      #table(
        columns: 3,
        align: (right, right, center),
        table.header([$x$], [$f(x)$], [Sinal]),
        ..row.flatten().map(x => [$#x$])
      )
    ]
  ])