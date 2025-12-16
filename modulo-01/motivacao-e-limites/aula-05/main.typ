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

    #solution([
      Limites laterais:
      $
        cases(
          display(lim_(x -> 2^-) f(x)) = display(lim_(x -> 2^-) (x^2 + 1)) = 2^2 + 1 = 5,
          display(lim_(x -> 2^+) f(x)) = display(lim_(x -> 2^+) (3x-1)) = 3 dot 2 - 1 = 5
        )
      $
      Como os limites laterais existem e são iguais, concluimos que o limite de $f$ quando $x$ tende a $2$ existe e é igual a $ display(lim_(x -> 2) f(x) = 5), $ como se observa no gráfico abaixo:

      #figure()[
        #cetz.canvas({
          import cetz.draw: *
          import cetz-plot: *

          plot.plot(..opts, {
            plot.add(
              domain: (-1, 4),
              x => if x < 2 {
                calc.pow(x, 2) + 1
              } else {
                3 * x - 1
              },
              style: line-styles
            )
            plot.add(((2, 0), (2, 5), (0, 5)), style: (stroke: (dash: "dashed", paint: black)))
            plot.add(((2, 5),), mark: "o", mark-style: mark-styles(sbm-blue))
          })
        })
      ]
    ])

  + $display(
      g(x) = 
      cases(
        x^2 - 1", se " x < 0,
        2x+3", se " x >= 0
      )
  )$

    Determine $display(lim_(x -> 0) g(x))$.

    #solution([
      Limites lateriais:
      $
        cases(
          display(lim_(x -> 0^-) g(x)) = display(lim_(x -> 0^-) (x^2 - 1)) = -1 ,
          display(lim_(x -> 0^+) g(x)) = display(lim_(x -> 0^+) (2x+3)) = 3
        )
      $
      Os limites lateriais existem. Entretanto, são diferentes. Portanto, o limite no ponto $x = 0$ não existe:
      $
        display(lim_(x 0^-) g(x)) != display(lim_(x -> 0^+) g(x)) => exists.not display(lim_(x -> 0) g(x))
      $

      O gráfico abaixo ilustra o caso:

      #figure()[
        #cetz.canvas({
          import cetz.draw: *
          import cetz-plot: *

          plot.plot(..opts, y-min: -2,  {
            plot.add(
              style: line-styles,
              domain: (-2, 0),
              x => calc.pow(x, 2) - 1
            )
            plot.add(((0, -1),), mark: "o", mark-style: mark-styles(white))

            plot.add(
              style: line-styles,
              domain: (0, 2),
              x => 2*x+3
            )
            plot.add(((0, 3),), mark: "o", mark-style: mark-styles(sbm-blue))
          })
        })
      ]
    ])

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
      Portanto, omo $display(lim_(x -> 2+) h(x) = lim_(x -> 2+) h(x) = 4)$, então o limite no ponto $x = 2$ existe e é igual a 
      $
        lim_(x -> 2) h(x) = 4,
      $
      como se observa no gráfico abaixo.

      #figure()[
        #cetz.canvas({
          import cetz.draw: *
          import cetz-plot: *

          plot.plot(..opts, size: (4, 4), {
            plot.add(
              style: line-styles,
              domain: (0, 4), 
              x => (x, (calc.pow(x, 2) - 4)/ (x - 2))
            )
            plot.add(((2, 4),), mark: "o", mark-style: mark-styles(white))
            plot.add(((2, 5),), mark: "o", mark-style: mark-styles(sbm-blue))
          })
        })
      ]
    ])


+ *Determinação de constantes.* Para cada função abaixo, determine o valor da constante para que o limite exista.

  #set enum(numbering: "(a)")
  + $display(
    f(x) = 
    cases(
      k x + 1", se " x < 2,
      x^2 - 1", se " x >= 2
    )
  )$
    
    Determine $k$ para que $display(lim_(x -> 2) f(x))$ exista.

    #solution([
      Para que o limite $display(lim_(x -> 2) f(x))$ exista, os limites laterais devem existir e ser iguais. Assim, 
      $
        cases(
          display(lim_(x -> 2^-)) f(x) = display(lim_(x -> 2^-)) (k x + 1) = 2k + 1,
          display(lim_(x -> 2^+) f(x)) = display(lim_(x -> 2^+)) (x^2 - 1) = 2^2 - 1 = 3
        )
      $
      Devemos ter:
      $
        display(lim_(x -> 2^-)) f(x) = display(lim_(x -> 2^+)) f(x) => 2k + 1 = 3 => k = 1.
      $
      Redefinindo a função $f$ com o valor de $k$ encontrado acima, o limite em $x = 2$ existe, conforme verificamos no gráfico seguinte:

      #figure()[
        #cetz.canvas({
          import cetz.draw: *
          import cetz-plot: *

          plot.plot(..opts, size: (4, 4), {
            plot.add(
              style: line-styles,
              domain: (0, 3),
              x => if x < 2 {x + 1} else {calc.pow(x, 2) - 1} 
            )
            
            plot.add(((2, 0), (2, 3), (0, 3)), style: (stroke: (dash: "dashed")))
            plot.add(((2, 3),), mark: "o", mark-style: mark-styles(sbm-blue))
          })
        })
      ]

      $
        display(
          f(x) = 
          cases(
            x + 1&", se " x < 2,
            x^2 - 1&", se " x >= 2
          )
        )
      $

    ])  

  + $display(
    g(x) = cases(
      x + 3&", se " x < 1,
      a x^2&", se " x >= 1
    )
  )$

    Determine $a$ para que $display(lim_(x -> 1) g(x))$ exista.

    #solution([
      Para que o limite $display(lim_(x -> 1) g(x))$ exista, os limites laterais devem existir e ser iguais, ou seja,

      $
        display(lim_(x -> 1^-) g(x)) = display(lim_(x -> 1^+) g(x)) &=> display(lim_(x -> 1^-) (x + 3)) = display(lim_(x -> 1^+) a x^2)\
        &=> 1 + 3 = a dot 1^2\
        &=> 4 = a\
        &=> a = 4
      $

      Redefinindo a função $g$ como:

      $
        display(
          g(x) = cases(
            x + 3&", se " x < 1,
            4 x^2&", se " x >= 1
          )
        )
      $

      o limite no ponto $x = 1$ existe e é igual a $display(lim_(x -> 1) g(x)) = 4$, como se observa no gráfico abaixo:

      #figure()[
        #cetz.canvas({
          import cetz.draw: *
          import cetz-plot: *

          plot.plot(..opts, y-tick-step: 4, size: (6, 5), {
            plot.add(
              style: line-styles,
              domain: (-1, 2),
              x => if x < 1 {x + 3} else {4*calc.pow(x, 2)}
            )
            plot.add(((1, 0), (1, 4), (0, 4)), style: (stroke: (dash: "dashed")))
            plot.add(((1, 4),), mark: "o", mark-style: mark-styles(sbm-blue))
          })
        })
      ]

    ])
