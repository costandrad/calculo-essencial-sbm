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
  size: (7, 7), axis-style: "school-book", 

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

    A tabela abaixo mostra a aplicação de $f$ para diversos valores de $x$. Note que para $x = -2$, $f(x) < 0$, enquanto que para $x = -1$, $f(x) > 0$.  

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

    Consideremoos o intervalo fechado $[-2, -1]$. Como $f$ é uma função polinomial, é contínua nesse intervalo, pois é contínua em toda a reta real. Portanto, visto que $f$ muda de sinal nesse intervalo, pelo Teorema do Valor Intermediário, existe um valor $c in (-2, -1)$ tal que $f(c) = 0$. Esse número $c$ é uma raiz de $f$.
  ])

+ Mostre que a equação $e^x = 3 - x$ possui pelo menos uma solução no intervalo $[0, 2]$.
  #solution([
    Consideremos a função $ f(x) = e^x + x - 3. $
    Note que as raízes de $f$ são soluções da equação $e^x = 3 - x$, pois dado $x^*$ raiz de $f$, temos:
    $
      f(x^*) = 0 => e^x^* + x^* - 3 = 0 => e^x^* = 3 - x^*. 
    $

    Então, dado o intervalo fechado $[0, 2]$, temos:

    $
      f(0) &= e^0 + 0 - 3 = 1 - 3 = -2\
      f(2)&= e^2 + 2 - 3 = e^2 - 1 approx #fmt(calc.pow(calc.e, 2) - 1, digits: 2)
    $
    Note que $f$ é contínua em toda a reta real, visto que é dada pela soma de uma função exponencial e uma função polinomial, ambas contínuas para todo $RR$, Então, pelo Teorema do Valor Intermediário sabemos que $f$ assume todos os valores no intervalo aberto $(0, 2)$.
    Em especial, dados que $f(0) < 0$ enquanto $f(2) > 0$, ou seja, $f$ muda de sinal nesse intervalo, existe $x^* in (0, 2)$ tal que $f(x^*) = 0$. Portanto, $f$ possui uma raiz em $[0, 2]$, o que significa dizer que a equação $e^x = 3 - x$ tem solução no referido intervalo. 

    #let f(x) = [
      #return calc.exp(x) + x - 3 
    ]

    #let X = (0, 2)
    
  
    #for i in range(10) [
      #let n = X.len()
      #let x1 = X.at(n - 2)
      #let x2 = X.at(n - 1)

      #if f(x2) - f(x1) == 0 {
        break
      }

      #let x = x2 - f(x2) * (x2 - x1)/(f(x2) - f(x1))
      #X.push(x)
    ]

    #let x = X.last()

    #grid(
      columns: 2,
      gutter: 50pt,
      align: center,
      [
        #figure()[
          #cetz.canvas({
            import cetz.draw: *
            import cetz-plot: *

            plot.plot(
              ..opts, 
              y-min: -5, y-max: 15,
              x-tick-step: 2, y-tick-step: 5, 
              legend: (0, 6.6),
              legend-style: (stroke: 0.5pt+gray, fill: white),
              {
                plot.add(
                  domain: (-4, 4),
                  x => calc.exp(x),
                  label: [#text(size: 10pt)[$g(x) = e^x$]],
                  style: (stroke: 1.5pt+sbm-blue)
                )
                plot.add(
                  domain: (-4, 4),
                  x => 3 - x,
                  label: [#text(size: 10pt)[$h(x) = 3 - x$]],
                  style: (stroke: 1.5pt+sbm-green)
                )

                plot.annotate({
                  line((x, 0), (x, 3 - x), (0, 3 - x), stroke: (dash: "dashed", paint: gray ))
                  content((x, 0), [$x^*$], anchor: "south", padding: 1)
                  content((0, 3 - x), [$g(x^*) = h(x^*)$], anchor: "east", padding: 0.3)
                })
                plot.add(
                  ((x, 3 - x),),
                  mark: "o",
                  mark-style: (stroke: none, fill: darkblue)
                )
              }
            )
          })
        ]
      ],
      [
        #figure()[
          #cetz.canvas({
            import cetz.draw: *
            import cetz-plot: *

            plot.plot(
              ..opts,
              y-min: -5, y-max: 15,
              x-tick-step: 2, y-tick-step: 5, 
              legend: (0, 6.5),
              legend-style: (stroke: 0.5pt+gray, fill: white),
              {
                plot.add(
                  domain: (-4, 4),
                  x => calc.exp(x) + x - 3,
                  label: [#text(size: 10pt)[$f(x) = e^x + x - 3$]],
                  style: (stroke: 1.5pt+sbm-blue)
                )
                plot.annotate({
                  content((x, 0), [$x^*$], anchor: "south", padding: 1)
                })
                plot.add(
                  ((x, 0),),
                  mark: "o",
                  mark-style: (stroke: none, fill: darkblue)
                )
              }
            )
          })
        ]
      ]
    )
  ])

+ Em qualquer momento do dia, prove que existem dois pontos antípodas na Terra (pontos diametralmente opotos) que possuem a mesma temperatura. Use o TVI considerando a função $f(theta) = T(theta) - T(theta + pi)$, onde $T(theta)$ é a temperatura no ponto de longitude $theta$.