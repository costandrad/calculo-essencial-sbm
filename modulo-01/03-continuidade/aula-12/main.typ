#import "conf.typ": *


#show: conf.with(
  author: [Igo da Costa Andrade],
  curso: [Cálculo Essencial],
  modulo: (
    numero: [1],
    tema: [Superando Limites]
  ),
  secao: [Continuidade],
  aula: (
    numero: [12],
    tema: [Continuidade]
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

+ Enuncie, mais rigorosamente, as três condições que devem ser satisfeitas para que uma função $f(x)$ seja contínua em um ponto $x = a$.

  #solution([
    Uma função $f$ é *contínua* no ponto $x = a$ se e somente se as seguintes condições forem satisfeitas:
      #set enum(numbering: "i.")
      + $f(a)$ existe;
      + $display(lim_(x -> a) f(x))$ existe;
      + $display(lim_(x -> a) f(x) = f(a))$.
    Se pelo menos uma dessas condições não forem verificadas em $x = a$, a função $f$ é dita *descontínua* em $a$.
  ])

+ Determine o valor da constante $k$ para que as funções abaixo sejam contínuas no ponto indicado:
  #set enum(numbering: "(a)")
  + $f(x) = display(cases(
    x^2 + 3x\, &" se" x < 2, ,
    k x - 1\, &" se" x >= 2
  )) " em " x = 2$
    #solution([
      $
        lim_(x -> 2^-) f(x) = lim_(x -> 2^+) f(x) &=> lim_(x -> 2^-) (x^2 + 3x) = lim_(x -> 2^+) (k x - 1)\
        &=> 2^2 + 3 dot 2 = k dot 2 - 1\
        &=> 10 = 2 k - 1\
        &=> k = 11/2
      $

      #let f(x) = [
        #let y = if x < 2 {
        calc.pow(x, 2) + 3 * x
        } else {
          (11/2) * x - 1
        }
        #return y
      ]

      #figure()[
        #cetz.canvas({
          import cetz.draw: *
          import cetz-plot: *

          set-style(
            grid: (
              stroke: (dash: "dashed", paint: gray)
            )
          )

          plot.plot(
            size: (5, 5), axis-style: "school-book",
            x-tick-step: 1, y-tick-step: 5,
            x-grid: true, y-grid: true,
            y-max: 20, 
            {
              plot.add(
                domain: (0, 4),
                x => f(x),
                style: line-styles
              )
              
              plot.add(
                ((2, 0), (2, f(2)), (0, f(2))),
                style: (
                  stroke: (dash: "dashed", paint: sbm-green, thickness: 1.5pt)
                )
              )

              plot.add(
                ((2, f(2)), ),
                mark: "o",
                mark-style: mark-styles(sbm-blue)
              )
            }
          )
        })
      ]
    ])

  + $display(g(x) = cases(
    ("sen" x)/x\, &" se" x != 0, ,
    k\, &" se" x = 0
  )) " em " x = 0$
    #solution([
      $
        lim_(x -> 0^-) g(x) = lim_(x -> 0^+) g(x) &=> lim_(x -> 0^-) ("sen" x)/x = lim_(x -> 0^+) k\
        &=> 1 = k\
        &=> k = 1
      $

      #let g(x) = [
        #let y = if x != 0 {
        calc.sin(x)/x
        } else {
          1
        }
        #return y
      ]

      #figure()[
        #cetz.canvas({
          import cetz.draw: *
          import cetz-plot: *

          set-style(
            grid: (
              stroke: (dash: "dashed", paint: gray)
            )
          )

          plot.plot(
            size: (10, 5), axis-style: "school-book",
            x-tick-step: 1, y-tick-step: 0.25,
            x-grid: true, y-grid: true,
            y-max: 1.25,
            {
              plot.add(
                domain: (-5, 5),
                x => g(x),
                style: line-styles
              )
              


              plot.add(
                ((0, g(0)), ),
                mark: "o",
                mark-style: mark-styles(sbm-blue)
              )
            }
          )
        })
      ]
    ])

  + $display(h(x) = cases(
    display((x^2 - 4)/(x - 2))\, &" se" x != 2, ,
    k\, &" se" x = 2
  )) " em " x = 2$

    #solution([
      $
        lim_(x -> 2^-) h(x) = lim_(x -> 2^+) h(x) &=> lim_(x -> 2^-) (x^2 - 4)/(x - 2) = lim_(x -> 2^+) k\
        &=> lim_(x -> 2^-) ((cancel(x - 2)) (x + 2))/cancel(x - 2) = lim_(x -> 2^+) k\
        &=> lim_(x -> 2^-) x + 2 = k\
        &=> k = 4
      $

      #let h(x) = [
        #let y = if x != 2 {
        (calc.pow(x, 2) - 4)/(x - 2)
        } else {
          4
        }
        #return y
      ]

      #figure()[
        #cetz.canvas({
          import cetz.draw: *
          import cetz-plot: *

          set-style(
            grid: (
              stroke: (dash: "dashed", paint: gray)
            )
          )

          plot.plot(
            size: (5, 5), axis-style: "school-book",
            x-tick-step: 1, y-tick-step: 1,
            x-grid: true, y-grid: true,
            {
              plot.add(
                domain: (0, 4),
                x => h(x),
                style: line-styles
              )
              
              plot.add(
                ((2, 0), (2, h(2)), (0, h(2))),
                style: (
                  stroke: (dash: "dashed", paint: sbm-green, thickness: 1.5pt)
                )
              )

              plot.add(
                ((2, h(2)), ),
                mark: "o",
                mark-style: mark-styles(sbm-blue)
              )
            }
          )
        })
      ]
    ])










