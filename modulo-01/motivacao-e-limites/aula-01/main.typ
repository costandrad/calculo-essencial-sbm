#import "conf.typ": *


#show: conf.with(
  author: [Igo da Costa Andrade],
  curso: [Cálculo Essencial],
  modulo: (
    numero: [1],
    tema: [Superando Limites]
  ),
  secao: [Motivação e Limites],
  aula: (
    numero: [01],
    tema: [Motivação]
  )
)

#v(1cm)

+ *Análise de gráficos.* Observe os gráficos das funções abaixo e determine os valores dos limites indicados.
  #set enum(numbering: "(a)")

  #let opts = (
    axis-style: "school-book",
    x-tick-step: 1, y-tick-step: 1, 
    x-grid: true, y-grid: true, 
  )

  + Detemine $display(lim_(x arrow 2)) f(x)$
    #grid(
      columns: (1fr, 2fr), gutter: 10pt,
      align(left)[
        #figure()[
          #cetz.canvas({
            import cetz.draw: *
            import cetz-plot: *
            set-style(
              axes: (
                grid: (
                  stroke: (
                    paint: color.mix(gray, (white, 80%)),
                    dash: "dashed"
                  ),
                )
              )
            )
            plot.plot(..opts, x-equal: "y",  size: (4, 4), x-min: 0, y-min: 0, {
              plot.add(
                ((0, 1), (2, 4), (4, 2)), style: (stroke: sbm-blue+1.2pt),
              )
              plot.add(((2, 4),), mark: "o", mark-style: (fill: white, stroke: sbm-blue+1.2pt))
            })
          })
        ]
      ],

      align(left+horizon)[
        #solution([
          $ lim_(x arrow 2) f(x) = 4 $
        ])
      ]
    )



  + Determine $display(lim_(x arrow 1)) g(x)$

    #grid(
      columns: (1fr, 2fr),
      gutter: 10pt,
      align(left)[
        #figure()[
          #cetz.canvas({
            import cetz.draw: *
            import cetz-plot: *

            set-style(
              axes: (
                grid: (
                  stroke: (
                    paint: color.mix(gray, (white, 80%)),
                    dash: "dashed"
                  ),
                )
              )
            )
            plot.plot(..opts, x-equal: "y",  size: (4, 4), x-min: 0, y-min: 0, x-max: 4, y-max: 4, {
              plot.add(
                ((0, 0.5), (1, 3), (4, 1)), style: (stroke: sbm-blue+1.2pt)
              )
              plot.add(((1, 3),), mark: "o", mark-style: (fill: white, stroke: sbm-blue+1.2pt))
              plot.add(((1, 1.5),), mark: "o", mark-style: (fill: sbm-blue, stroke: sbm-blue+1.2pt))
            })
          })
        ]
      ], 
      align(left+horizon)[
        #solution([

          $ lim_(x arrow 1) g(x) = 3 $

        ])
      ]
    )

    #v(3cm)

  + Determine $display(lim_(x arrow 0)) h(x)$

    #grid(
      columns: (1fr, 1fr),
      gutter: 10pt,
      align(left)[
        #let h(x) = 6/(calc.pow(x, 2) + 2)
        #figure()[
          #cetz.canvas({
            import cetz.draw: *
            import cetz-plot: *

            set-style(
              axes: (
                grid: (
                  stroke: (
                    paint: color.mix(gray, (white, 80%)),
                    dash: "dashed"
                  ),
                )
              )
            )
            plot.plot(..opts, size: (6, 4), x-min: -3, y-min: -1, x-max: 3, y-max: 4, {
              plot.add(domain: (-2, 2), h, style: (stroke: sbm-blue+1.5pt))
              plot.add(((0, 3),), mark: "o", mark-style: (fill: white, stroke: sbm-blue+1.2pt))
              plot.add(((0, 1),), mark: "o", mark-style: (fill: sbm-blue, stroke: sbm-blue+1.2pt))
            })
          })
        ]
      ], 
      align(left+horizon)[
        #solution([

          $ lim_(x arrow 0) h(x) = 3 $

        ])
      ]
    )

  + Determine $display(lim_(x arrow 3)) p(x)$

    #grid(
      columns: (1fr, 2fr), gutter: 
      10pt,
      align(left)[
        #let p(x) = if x < 3 {
          15/(calc.pow(x, 2) + 6) + 1
        } else {
          2/(calc.pow(x - 4, 2) + 1) + 1
        }

        #figure()[
          #cetz.canvas({
            import cetz.draw: *
            import cetz-plot: *

            set-style(
              axes: (
                grid: (
                  stroke: (
                    paint: color.mix(gray, (white, 80%)),
                    dash: "dashed"
                  ),
                )
              )
            )
            plot.plot(..opts, size: (4, 4), x-min: 0, y-min: -1, x-max: 4, y-max: 4, {
              plot.add(domain: (0, 4), p, style: (stroke: sbm-blue+1.5pt))
              plot.add(((3, 2),), mark: "o", mark-style: (fill: sbm-blue, stroke: sbm-blue+1.2pt))
            })
          })
        ]
      ],
      align(left+horizon)[
        #solution([

          $ lim_(x = 3) p(x) = 2 $

        ])
      ] 
    )

+ *Velocidade instantânea.* Uma partícula se move segundo a função posição $s(t) = 2t^2 - t + 1$, onde $s$ é medido em metros e $t$ em segundos.

  #set enum(numbering: "(a)")
  + Calcule a velocidade média da partícula no intervalo $[1, 3]$.
    #solution([
      Sejam $s(1)$ e $s(3)$ as posições da partícula nos instantes $t = 1$ s e $t = 3$ s, respectivamente:
      $
        &s(1) = 2 dot 1^2 - 1 + 1 = " " 2 " m"\
        &s(3) = 2 dot 3^2 - 3 + 1 = 16 " m"
      $
      Então, a velocidade média no intervalo $[1, 3]$ é igual a
      $
        v_m &= (Delta s)/(Delta t) = (s(3) - s(1))/(3 - 1) = (16 - 2) / (2) = 14/2 = 7 " m/s"
      $
    ])

    #v(1cm)

  + Use o método do incremento $h$ para encontrar a velocidade instantânea da partícula no instante $t = 2$.
    #solution([
      Consideremos o intervalo $[2, 2 + h]$. A posição da partícula em cada um desses instantes de tempo é:
      #text(size: 11pt)[
        $
          &s(2) = 2 dot 2^2 - 2 + 1 = " " 7 " m" \
          &s(2+h) =  2 dot (2+h)^2 - (2+h) + 1 = 2 dot (4 + 4h + h^2) - (2+h) + 1 = (7 +7h + h^2) " m"
        $
      ]

      A velocidade média no intervalo considerado é
      $
        v_m &= (Delta s) / (Delta t) = (s(2+h) - s(2)) / ((2+h) - 2) = ((7 + 7h + h^2) - 7)/(h) \
        v_m &=  (7 h + h^2)/h = (h (7 + h))/h = 7 + h

      $
      Finalmente, a velocidade instantânea em $t = 2$ é igual ao limite da velocidade nesse instante de tempo quando o incremento $h$ tende a zero, ou seja, 
      $
        v(2) = lim_(h arrow 0) v_m = lim_(h arrow 0) (7 + h) = 7 " m/s"
      $

    ])

    #v(1cm)

+ *Reta tagente.* Encontre a equação da reta tangente ao gráfico da função $f(x) = x^2 - 4x + 1$ no ponto $(3, f(3))$.
  #solution([
    Seja $y - y_0 = m (x - x_0)$ a equação da reta tangente ao gráfico da função $f$, passando pelo ponto $(x_0, y_0)$. O coeficiente de inclinação $m$ da reta tangente é dado pelo limite:
    $
      m = lim_(h arrow 0) (f(x_0 + h) - f(x_0))/((x_0+h) - x_0)
    $
    em que o incremento $h$ é usado para determinar uma reta secante à função $f$ passando pelos pontos $(x_0, f(x_0))$ e $(x_0+h, f(x_0+h))$.

    Calculemos o valor de $f(x_0)$ e $f(x_0+h)$:

    $
      f(x_0) &= x_0^2 - 4x_0 + 1\
      f(x_0+h) &= (x_0+h)^2 - 4 (x_0 + h) + 1 = x_0^2 + 2 x_0 h + h^2 - 4x_0 - 4h + 1\
      & arrow.double  f(x_0 + h)= (2x_0 - 4)h + h^2 + x_0^2 - 4x_0 + 1
    $

    Substituindo na expressão para o coeficiente angular, temos:
    $
      m &= lim_(h arrow 0) (f(x_0 + h) - f(x_0))/((x_0+h) - x_0)\
       &= lim_(h arrow 0) ([(2x_0 - 4)h + h^2 + x_0^2 - 4x_0 + 1] - (x_0^2 - 4x_0 + 1)) / (h)\
       &= lim_(h arrow 0) ((2x_0 - 4)h + h^2)/h\
       &= lim_(h arrow 0) 2x_0 - 4 + h\
       &= 2x_0 -4
    $

    No ponto $(3, f(3))$, temos:
    $
      x_0 = 3 &arrow.double y_0 = f(x_0) = f(3) = 3^2 - 4 dot 3 + 1 = -2\
      &arrow.double m = 2x_0 - 4 = 2 dot 3 - 4 = 2
    $

    Finalmente, a equação da reta tangente é dada por:
    $
      y - y_0 = m (x - x_0) &arrow.double y - (-2) = 2 (x - 3)\
      &arrow.double y + 2 = 2x - 6\
      &arrow.double y = 2x - 8
    $

    #figure()[
      #cetz.canvas({
        import cetz.draw: *
        import cetz-plot: *

        let f(x) = calc.pow(x, 2) - 4 * x + 1
        let f-prime(x) = 2 * x - 8
        let x_0 = 3 

        set-style(
          axes: (
            grid: (
              stroke: (
                paint: color.mix(gray, (white, 90%)),
                dash: "dashed"
              ),
            )
          )
        )

        plot.plot(
          size: (6, 8), axis-style: "school-book", 
          x-tick-step: 1, y-tick-step: 1,
          x-grid: true, y-grid: true,
          name: "plot",
          {
            plot.add(domain: (-1, 5), f, style: (stroke: sbm-blue+1.5pt))
            plot.add(domain: (2, 5), f-prime)
            plot.add(((x_0, f(x_0)), ), mark: "o", mark-style: (fill: sbm-blue, stroke: none))
            plot.add-anchor("pt", (x_0, f(x_0)))
          }
        )
        content("plot.pt", [$(3, f(3))$], anchor: "west", padding: 0.2)
      })
    ]
  ])

+ *Desafio da aula.* Encontre a equação da reta tangente ao gráfico da função $f(x) = sqrt(x)$ no ponto $(4, f(4))$.
  #solution([
    Seja $y - y_0 = m (x - x_0)$ a equação da reta tangente ao gráfico da função $f$, passando pelo ponto $(x_0, y_0)$. O coeficiente de inclinação $m$ da reta tangente é dado pelo limite:
    $
      m = lim_(h arrow 0) (f(x_0 + h) - f(x_0))/((x_0+h) - x_0)
    $
    em que o incremento $h$ é usado para determinar uma reta secante à função $f$ passando pelos pontos $(x_0, f(x_0))$ e $(x_0+h, f(x_0+h))$.

    Calculemos o valor de $f(x_0)$ e $f(x_0+h)$:
    $
      f(x_0) = sqrt(x_0) " e " f(x_0 + h) = sqrt(x_0 + h)
    $
    Substituindo na expressão para o coeficiente angular, temos:
    $
      m &= lim_(h arrow 0) (f(x_0 + h) - f(x_0)) / ((x_0 + h) - x_0) = lim_(h arrow 0)(sqrt(x_0 + h) - sqrt(x_0))/(h)\
      &= lim_(h arrow 0) ((sqrt(x_0 + h) - sqrt(x_0))/(h)) dot ((sqrt(x_0 + h) + sqrt(x_0))/(sqrt(x_0 + h) + sqrt(x_0)))\
      &= lim_(h arrow 0) ((sqrt(x_0 + h))^2 - (sqrt(x_0))^2) / (h (sqrt(x_0 + h) + sqrt(x_0)))\
      &= lim_(h arrow 0) ((x_0 + h) - x_0) / (h (sqrt(x_0 + h) + sqrt(x_0)))\
      &= lim_(h arrow 0) (h) / (h (sqrt(x_0 + h) + sqrt(x_0)))\
      &= lim_(h arrow 0) (1) / (sqrt(x_0 + h) + sqrt(x_0)) = 1/(2 sqrt(x_0))
    $

    No ponto $(4, f(4))$, temos:
    $
      x_0 = 4 &arrow.double y_0 = f(x_0) = f(4) = sqrt(4) = 2\
      &arrow.double m = 1/(2 sqrt(x_0)) = 1/(2 dot sqrt(4)) = 1/(2 dot 2) = 1/4
    $

    Finalmente, a equação da reta tangente é dada por:
    $
      y- y_0 = m (x - x_0) &arrow.double y - 2 = 1/4 (x - 4)\
      &arrow.double y = x/4 + 1 
    $

    #figure()[
      #cetz.canvas({
        import cetz.draw: *
        import cetz-plot: *

        let f(x) = calc.sqrt(x)
        let f-prime(x) = x/4 + 1
        let x_0 = 4
        let y_0 = f(x_0)

        set-style(
          axes: (
            grid: (
              stroke: (
                paint: color.mix(gray, (white, 80%)),
                dash: "dashed"
              ),
            )
          )
        )

        plot.plot(
          size: (9, 3), axis-style: "school-book",
          x-tick-step: 1, y-tick-step: 1, 
          x-grid: true, y-grid: true,
          name: "plot",
          {
            plot.add(domain: (0, 9), samples: 500, f, style: (stroke: sbm-blue+1.5pt))
            plot.add(domain: (0, 8), f-prime)
            plot.add(((x_0, y_0),), mark: "o", mark-style: (fill: sbm-blue, stroke: none))
            plot.add-anchor("pt", (x_0, y_0))
          }
        )
        content("plot.pt", [$(4, f(4))$], anchor: "south", padding: 0.2)
      })
    ]

  ])

