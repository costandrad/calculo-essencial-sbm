#import "conf.typ": *


#show: conf.with(
  author: [Igo da Costa Andrade],
  curso: [Cálculo Essencial],
  modulo: (
    numero: [1],
    tema: [Superando Limites]
  ),
  secao: [Infinitos e Assíntotas],
  aula: (
    numero: [08],
    tema: [Limites Infinitos]
  )
)

#let opts = (
  size: (5, 5), axis-style: "school-book", 

  x-tick-step: 1, y-tick-step: 1,
  x-grid: true, y-grid: "both",
)

#let line-styles = (stroke: 1.2pt+sbm-blue)
#let mark-styles(fill-color) = (stroke: 1.2pt+sbm-blue, fill: fill-color)

#v(1cm)

+ Defina matematicamente o que significa $display(lim_(x -> a)) f(x) = +infinity$.

  #solution([
    Significa dizer que os valores de $f(x)$ crescem indefinidamente quando $x$ se aproxima de $a$. A definição formal é:

    $
      lim_(x -> a) f(x) = +infinity <==> forall M > 0, exists delta > 0 " tal que, se " 0 < |x - a| < delta, " então " f(x) > M,
    $
    ou seja, para qualquer escolha de  $M > 0$ (arbitrariamente grande), existe algum $delta > 0$ suficientemente próximo de $a$ tal que $f(x) > M$.
  ])

+ Calcule os limites abaixo:
  #set enum(numbering: "(a)")
  + $display(lim_(x -> 2^+) 1/(x - 2)) $
    #solution([
      #grid(
        columns: (1fr, 1fr),
        gutter: 5pt,
        [
          Observemos que, quando $x$ tende a $2$ por valores superiores, o denominador da expressão tende a zero, *por valores maiores que zero*. Dividir o numerador constante por valores arbitrariamente pequenos positivos, resulta em números arbitrariamente grandes, também positivos. Logo,
                $
                  lim_(x -> 2^+) 1/(x-2) = +infinity
                $
        ],
        [
          #figure()[
            #cetz.canvas({
              import cetz.draw: *
              import cetz-plot: *


              plot.plot(..opts, x-tick-step: 2, y-tick-step: none, x-grid: none,  
              legend: (3, 5.5),
              legend-style: (stroke: (1pt+gray.lighten(50%)), fill: white),
              {
                plot.add(
                  samples: 100,
                  domain: (-0.5, 1.9),
                  x => 1/(x - 2),
                  style: line-styles,
                  label: [$script(y = 1\/(x - 2))$]
                )
                plot.add(
                  samples: 100,
                  domain: (2.1, 4.5),
                  x => 1/(x - 2),
                  style: line-styles
                )
                plot.add-vline(
                  2,
                  style: (stroke: (dash: "dashed", paint: gray)),
                  label: [$script(x = 2)$]
                )
              })
            })
          ]
        ]
      )
    ])


  + $display(lim_(x -> 0^-) x/x^2) $
    #solution([
      #grid(
        columns: (1fr, 1fr),
        gutter: 5pt,
        [
          $
            lim_(x -> 0^-) x/x^2 = lim_(x -> 0^-) 1/x = -infinity,
          $
          visto que o denominador assumindo valores arbitrariamente pequenos, mas negativos, enquanto o numerador é constante e positivo.
        ],[
          #figure()[
            #cetz.canvas({
              import cetz.draw: *
              import cetz-plot: * 

              plot.plot(..opts, x-tick-step: none, y-tick-step: none, 
              legend: (3, 5.5),
              legend-style: (stroke: (1pt+gray.lighten(50%)), fill: white),
              {
                plot.add(
                    domain: (-2, -.1),
                    x => x/calc.pow(x, 2),
                    style: line-styles,
                    label: [$script(y = x\/x^2)$]
                )
                plot.add(
                    domain: (0.1, 2),
                    x => x/calc.pow(x, 2),
                    style: line-styles,
                )
                plot.add-vline(
                  0,
                  style: (stroke: (dash: "dashed", paint: gray)),
                  label: [$script(x = 0)$]
                )
              })
            })
          ]
        ]
      )
    ])

  + $display(lim_(x -> 3^-) (x + 1)/(x - 3)^2) $
    #solution([
      #grid(
        columns: (1fr, 1fr),
        gutter: 5pt, 
        [
          $
            lim_(x -> 3^-) (x + 1)/(x - 3)^2 = display(lim_(x -> 3^-) x + 1)/display(lim_(x -> 3^-) (x - 3)^2) = 4/display(lim_(x -> 3^-) (x - 3)^2)
          $
          Como $display(lim_(x -> 3^-) (x - 3)^2) = 0^+$,
          $
            lim_(x -> 3^-) (x + 1)/(x - 3)^2 = + infinity.
          $
        ],
        [
          #figure()[
            #cetz.canvas({
              import cetz.draw: *
              import cetz-plot: *

              plot.plot(..opts, y-max: 15, 
              x-tick-step: 3, y-tick-step: none,
              legend: (0.5, 5.5),
              legend-style: (stroke: (1pt+gray.lighten(50%)), fill: white),
              x-grid: none,
              {
                plot.add(
                  samples: 100,
                  domain: (-0.5, 2.6),
                  x => (x + 1)/calc.pow((x - 3), 2),
                  style: line-styles,
                  label: [$script(y = (x+1)\/(x-3)^2)$]
                )
                plot.add(
                  samples: 100,
                  domain: (3.5, 5.5),
                  x => (x + 1)/calc.pow((x - 3), 2),
                  style: line-styles,
                )
                plot.add-vline(
                  3, 
                  style: (stroke: (dash: "dashed", paint: gray)),
                  label: [$script(x = 3)$]
                )
              })
            })
          ]
        ]
      )
    ])

    #v(3cm)

  + $display(lim_(x -> 1) (x^2 - 1)/(x - 1)^3) $
    #solution([
      #grid(
        columns: (1fr, 1fr),
        gutter: 5pt,
        [
          $
            lim_(x -> 1) (x^2 - 1)/(x - 1)^3 &= lim_(x -> 1) ((x - 1)(x + 1))/(x - 1)^3\
            &= lim_(x -> 1) (x + 1)/(x - 1)^2 = display(lim_(x -> 1) x + 1)/display(lim_(x -> 1) (x - 1)^2)\
            &= 1/display(lim_(x -> 1) (x - 1)^2) = +infinity
          $
        ],
        [
          #figure()[
            #cetz.canvas({
              import cetz.draw: *
              import cetz-plot: *

              plot.plot(..opts, 
              y-max: 20, 
              x-tick-step: 1, y-tick-step: none,
              x-grid: none,
              legend: (2., 5.5),
              legend-style: (stroke: (1pt+gray.lighten(50%)), fill: white),
              {
                plot.add(
                  samples: 100,
                  domain: (-1, 0.8),
                  x => (calc.pow(x, 2) - 1)/calc.pow((x - 1), 3),
                  style: line-styles,
                  label: [$script(y = (x^2 - 1)\/(x-1)^3)$]
                )
                plot.add(
                  samples: 100,
                  domain: (1.2, 2.9),
                  x => (calc.pow(x, 2) - 1)/calc.pow((x - 1), 3),
                  style: line-styles,
                )
                plot.add-vline(
                  1, 
                  style: (stroke: (dash: "dashed", paint: gray)),
                  label: [$script(x = 1)$]
                )
              })
            })
          ]
        ]
      )
    ])

  + $display(lim_(x -> 0^+) sqrt(x)/x) $
    #solution([
      #grid(
        columns: (1fr, 1fr), 
        gutter: 5pt,
        [
          Consideremos a seguinte mudança de variáveis: $y = sqrt(x)$, tal que $y^2 = x$. Observe que quando $x$ tende a zero por valores superiores, $y$ também tende a zero por valores positivos. Logo,
          $
            lim_(x -> 0^+) sqrt(x)/x = lim_(y -> 0^+) y/y^2 = lim_(y -> 0^+) 1/y = + infinity
          $
        ],
        [
          #figure()[
            #cetz.canvas({
              import cetz.draw: *
              import cetz-plot: *

              plot.plot(..opts, 
              x-min: -0.5, y-min: -0.5,
              x-tick-step: none, y-tick-step: none,
              legend: (3., 5.5),
              legend-style: (stroke: (1pt+gray.lighten(50%)), fill: white),
              {
                plot.add(
                  samples: 100,
                  domain: (0.1, 5),
                  x => calc.sqrt(x)/x,
                  label: [$script(y = sqrt(x)\/x)$]
                )
                plot.add-vline(
                  0, 
                  style: (stroke: (dash: "dashed", paint: gray)),
                  label: [$script(x = 0)$]
                )
              })
            })
          ]
        ]
      )
    ])
    #v(4cm)

  + $display(lim_(x -> (pi/2)^-) tan x) $
    #solution([
      #grid(
        columns: (1fr, 1fr),
        gutter: 5pt,
        [
          $
            lim_(x -> (pi/2)^-) tan x = display(lim_(x -> (pi/2)^-) "sen" x)/display(lim_(x -> (pi/2)^-) cos x)
          $
          Observemos que $display(lim_(x -> (pi/2)^-) "sen" x) = 1$, enquanto $display(lim_(x -> (pi/2)^-) cos x) = 0^+$. Assim, dividir um valor constante positivo  por valores arbitrariamente pequenos também positivos resulta em números positivos arbitrariamente grandes. Logo,
          $
            lim_(x -> (pi/2)^-) tan x = + infinity
          $
        ],
        [
          #figure()[
            #cetz.canvas({
              import cetz.draw: *
              import cetz-plot: *

              plot.plot(..opts, 
              x-min: -calc.pi, x-max: calc.pi,
              x-tick-step: none, y-tick-step: none,
              legend: (-.1, 5.25),
              legend-style: (stroke: (1pt+gray.lighten(50%)), fill: white),
              {
                plot.add(
                  samples: 100,
                  domain: (-1.49, 1.49),
                  x => calc.tan(x),
                  label: [$script(y = tan x)$]
                )
                plot.add-vline(
                  -calc.pi/2, calc.pi/2,
                  label: [$script(x = plus.minus pi\/2)$],
                  style: (stroke: (dash: "dashed", paint: gray))
                )
              })
            })
          ]
        ]
      )

    ])

+ Determine todas as assíntotas verticais das funções abaixo:
  #set enum(numbering: "(a)")
  + $f(x) = display((x+1)/(x^2 - 4))$
    #solution([

      - Pontos de indeterminação: os candidatos são os valores de $x$ para os quais o denominador igual a zero:
      $
        x^2 - 4 = 0 => x^2 = 4 => x = plus.minus 2
      $
      - Para cada candidato, verificar os limites laterais com atenção à análise de sinais:
        - $x -> -2^-$
        $
          lim_(x -> -2^-) (x+1)/(x^2 - 4) = overbrace(display(lim_(x -> -2^-) x + 1), -1)/underbrace(display(lim_(x -> -2^-) (x^2 - 4)), 0^+) = - infinity
        $

        - $x -> -2^+$
        $
          lim_(x -> -2^+) (x+1)/(x^2 - 4) = overbrace(display(lim_(x -> -2^+) x + 1), -1)/underbrace(display(lim_(x -> -2^+) (x^2 - 4)), 0^-) = + infinity
        $

        - $x -> +2^-$
        $
          lim_(x -> +2^-) (x+1)/(x^2 - 4) = overbrace(display(lim_(x -> +2^-) x + 1), +3)/underbrace(display(lim_(x -> +2^-) (x^2 - 4)), 0^-) = - infinity
        $

        - $x -> +2^+$
        $
          lim_(x -> +2^+) (x+1)/(x^2 - 4) = overbrace(display(lim_(x -> +2^+) x + 1), +3)/underbrace(display(lim_(x -> +2^+) (x^2 - 4)), 0^+) = + infinity
        $

        Portanto, as retas $x = -2$ e $x = 2$ são assíntotas verticais da função.

        #figure()[
          #cetz.canvas({
            import cetz.draw: *
            import cetz-plot: *

            let f(x) = (x + 1)/(calc.pow(x, 2) - 4)
            plot.plot(..opts, 
            x-tick-step: 2, y-tick-step: none,
            x-grid: none, 
            y-min: -2, y-max: 2, 
            legend: (-2, 5.25),
            legend-style: (stroke: (1pt+gray.lighten(50%)), fill: white),
            {
              plot.add(
                domain: (-5.9, -2.1),
                x => f(x),
                style: line-styles,
                label: [$script(y = (x+1)\/(x^2 - 4))$]
              )
              plot.add(
                domain: (-1.9, 1.9),
                x => f(x),
                style: line-styles
              )
              plot.add(
                domain: (2.1, 5.9),
                x => f(x),
                style: line-styles
              )
              plot.add-vline(
                -2, 2,
                label: [$script(x = plus.minus 2)$],
                style: (stroke: (dash: "dashed", paint: gray))
              )
            })
          })
        ]
    ])

  + $g(x) = display((x^2 - 1)/(x^2 + x - 6))$
    #solution([
      - Pontos de indeterminação: os candidatos são os valores de $x$ para os quais o denominador igual a zero:
      $
        x^2 + x - 6 = 0 &=> x = (-1 plus.minus sqrt(1^2 - 4 dot 1 dot (-6)))/2\
        &=> x = (-1 plus.minus sqrt(25))/2\
        &=> x = (-1 plus.minus 5)/2 => 
        cases(
          x = display((-1 - 5)/2) = -3,
          x = display((-1 + 5)/2) = +2,
        )
      $
      - Para cada candidato, verificar os limites laterais com atenção à análise de sinais:
        - $x -> -3^-$
        $
          lim_(x -> -3^-) (x^2 - 1)/(x^2 + x - 6) = overbrace(display(lim_(x -> -3^-) (x^2 - 1)), +8)/underbrace(display(lim_(x -> -3^-) (x^2 + x - 6)), 0^+) = + infinity
        $

        - $x -> -3^+$
        $
          lim_(x -> -3^+) (x^2 - 1)/(x^2 + x - 6) = overbrace(display(lim_(x -> -3^+) (x^2 - 1)), +8)/underbrace(display(lim_(x -> -3^+) (x^2 + x - 6)), 0^-) = - infinity
        $

        - $x -> +2^-$
        $
          lim_(x -> +2^-) (x^2 - 1)/(x^2 + x - 6) = overbrace(display(lim_(x -> +2^-) (x^2 - 1)), +3)/underbrace(display(lim_(x -> +2^-) (x^2 + x - 6)), 0^-) = - infinity
        $

        - $x -> +2^+$
        $
          lim_(x -> +2^+) (x^2 - 1)/(x^2 + x - 6) = overbrace(display(lim_(x -> +2^+) (x^2 - 1)), +3)/underbrace(display(lim_(x -> +2^+) (x^2 + x - 6)), 0^+) = + infinity
        $

        Portanto, as retas $x = -3$ e $x = 2$ são assíntotas verticais da função.

        #figure()[
          #cetz.canvas({
            import cetz.draw: *
            import cetz-plot: *

            let g(x) = (calc.pow(x, 2) - 1)/(calc.pow(x, 2) + x - 6)
            plot.plot(..opts, 
            x-tick-step: none, y-tick-step: none,
            x-grid: none, 
            y-min: -8, y-max: 8, 
            legend: (-3.25, 5.25),
            legend-style: (stroke: (1pt+gray.lighten(50%)), fill: white),
            {
              plot.add(
                domain: (-6, -3.1),
                x => g(x),
                style: line-styles,
                label: [$script(y = (x^2-1)\/(x^2 + x - 6))$]
              )
              plot.add(
                domain: (-2.9, 1.97),
                x => g(x),
                style: line-styles
              )
              plot.add(
                domain: (2.03, 5.9),
                x => g(x),
                style: line-styles
              )
              plot.add-vline(
                -3,
                label: [$script(x = -3)$],
                style: (stroke: (dash: "dashed", paint: gray))
              )
              plot.add-vline(
                +2,
                label: [$script(x = +2)$],
                style: (stroke: (dash: "dotted", paint: gray))
              )
            })
          })
        ]

    ])

  + $h(x) = display(1/sqrt(4 - x^2))$
    #solution([
      - Pontos de indeterminação: os candidatos são os valores de $x$ para os quais o denominador igual a zero:
      $
        4 - x^2= 0 => x^2 = 4 => x = plus.minus 2
      $
      - Condições de definição da função:
      $
        4 - x^2 > 0 => x^2 < 4 => -2 < x < +2
      $
      - Para cada candidato, verificar os limites laterais com atenção à análise de sinais, considerando a condição de existência acima.
        - $x -> -2^+$
        $
          lim_(x -> -2^+) 1/sqrt(4 - x^2) = 1/underbrace(display(lim_(x -> -2^+) sqrt(4 - x^2)), 0^+) = + infinity
        $

        - $x -> +2^-$
        $
          lim_(x -> +2^-) 1/sqrt(4 - x^2) = 1/underbrace(display(lim_(x -> +2^-) sqrt(4 - x^2)), 0^+) = + infinity
        $

        Portanto, as retas $x = -2$ e $x = 2$ são assíntotas verticais da função.

        #figure()[
          #cetz.canvas({
            import cetz.draw: *
            import cetz-plot: *

            plot.plot(..opts, 
            x-min: -2.5, x-max: 2.5, 
            y-min: -0.5, y-max: 4,
            x-tick-step: none, y-tick-step: none,
            legend: (2.7, 5.25),
            legend-style: (stroke: (1pt+gray.lighten(50%)), fill: white),
            {
              plot.add(
                samples: 100,
                domain: (-1.98, 1.98),
                x => 1/calc.sqrt(4 - calc.pow(x, 2)),
                label: [$script(y = 1\/sqrt(4 - x^2))$],
                style: line-styles
              )
              plot.add-vline(
                -2, 2,
                style: (stroke: (dash: "dashed", paint: gray)),
                label: [$script(x = plus.minus 2)$]
              )
            })
          })
        ]
    ])

