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
    numero: [05],
    tema: [Limites Lateais]
  )
)

#v(1cm)

#let opts = (
  size: (6, 5), axis-style: "school-book", 
  x-tick-step: 1, y-tick-step: 1,
  x-grid: true, y-grid: true,
)

#let line-styles = (stroke: 2pt+sbm-blue)
#let mark-styles(fill-color) = (stroke: 2pt+sbm-blue, fill: fill-color)


+ *Análise de gráficos.* Para cada gráfico abaixo, determine os limites laterais e o limite (caso exista) no ponto indicado.

  #set enum(numbering: "(a)")
  + Deternine $display( lim_(x arrow 2^-) f(x) )$, $display( lim_(x arrow 2^+) f(x) )$ e $display( lim_(x arrow 2) f(x) )$

    #grid(
      columns: (1fr, 1.5fr),
      gutter: 1.5cm, 
      [
        #figure()[
          #cetz.canvas({
            import cetz.draw: *
            import cetz-plot: *

            plot.plot(..opts,   x-min: -1, y-min: -1, x-max: 5, y-max: 4, {
              plot.add(((-1, 1), (2, 3)), style: line-styles)
              plot.add(((2, 3),), mark: "o", mark-style: mark-styles(white))

              plot.add(((2, 2),), mark: "o", mark-style: mark-styles(sbm-blue))
              
              plot.add(((2, 1), (5, 2)), style: line-styles)
              plot.add(((2, 1),), mark: "o", mark-style: mark-styles(white))
            })
          })
        ]
      ],
      [
        #solution([
          Conforme se pode verificar no gráfico, os limites laterais são:


          $ 
            cases(
              display(lim_(x arrow 2^-) f(x) = 3),
              display(lim_(x arrow 2^+) f(x) = 1)
            )
          $

          Como $display(lim_(x arrow 2^-) f(x)) != display(lim_(x arrow 2^+) f(x))$, então o limite $display(lim_(x arrow 2) f(x) )$ não existe.
        ])
      ]
    )




  + Determine $display(lim_(x -> 1^-) g(x))$, $display(lim_(x -> 1^+) g(x))$ e $display(lim_(x -> 1) g(x))$.

    #grid(
      columns: (1fr, 1.5fr),
      gutter: 1.5cm,
      [
        #figure()[
          #cetz.canvas({
            import cetz.draw: *
            import cetz-plot: *

            plot.plot(..opts, x-min: -1, y-min: -1, x-max: 4, y-max: 4, {
              plot.add(((-1, 0.5), (1, 2), (4, 1)), line: "spline", style: line-styles)
              plot.add(((1, 2),), mark: "o", mark-style: mark-styles(white))

            })
          })
        ]
      ],
      [
        #solution([
          Os limites laterais são os seguintes:
          $
            cases(
              display(lim_(x -> 1^-) g(x) = 2),
              display(lim_(x -> 1^+) g(x) = 2)
            )
          $
          Como $display(lim_(x -> 1^-) g(x)) = display(lim_(x -> 1^+) g(x)) = 2$, então o limite no ponto existe e é igual a 
          $
            display(lim_(x -> 1) g(x) = 2).
          $
        ])
      ]
    )

+ *Funções definidas por partes.* Para cada função abaixo, determine se o limite existe no ponto indicado.

  #set enum(numbering: "(a)")
  + $display(
      f(x) = 
      cases(
        x^2 + 1", se " x < 2,
        3x - 1", se " x >= 2
      )
  )$

    Determine $display(lim_(x -> 2) f(x))$.

    #solution([])

  + $display(
      g(x) = 
      cases(
        x^2 - 1", se " x < 0,
        2x+3", se " x >= 0
      )
  )$

    Determine $display(lim_(x -> 0) g(x))$.

    #solution([])

  + $display(
      h(x) = 
      cases(
        display((x^2 - 4)/(x - 2))", se " x != 2,
        5", se " x = 2
      )
  )$

    Determine $display(lim_(x -> 2) h(x))$.

    #solution([
      Limites laterais:
      $
        cases(
          display(lim_(x -> 2^-) h(x)) = display(lim_(x -> 2^-) (x^2 - 4)/(x-2)) =  display(lim_(x -> 2^-) (cancel((x-2)) (x+2))/cancel(x-2)) = display(lim_(x -> 2^-) (x+2)) = 4,
          display(lim_(x -> 2^+) h(x)) = display(lim_(x -> 2^+) (x^2 - 4)/(x-2)) =  display(lim_(x -> 2^+) (cancel((x-2)) (x+2))/cancel(x-2)) = display(lim_(x -> 2^+) (x+2)) = 4,
        )
      $
      Como $display(lim_(x -> 2+) h(x) = lim_(x -> 2+) h(x) = 4)$, então o limite no ponto $x = 2$ existe e é igual a 
      $
        lim_(x -> 2) h(x) = 4.
      $
    ])
