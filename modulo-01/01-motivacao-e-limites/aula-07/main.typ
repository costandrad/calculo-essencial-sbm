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
    numero: [07],
    tema: [Limites Trigonométricos]
  )
)

#let opts = (
  size: (10, 6), axis-style: "school-book", 
  x-tick-step: 1, y-tick-step: 1,
  x-grid: true, y-grid: "both",
)

#let line-styles = (stroke: 1.2pt+sbm-blue)
#let mark-styles(fill-color) = (stroke: 1.2pt+sbm-blue, fill: fill-color)

#v(1cm)

+ Calcule os limites abaixo:
  
  #set enum(numbering: "(a)")
  + $display(lim_(x -> 0) ("sen" 3x)/(2x))$
    #solution([
      Seja $u = 3x$. Observe que $display(lim_(x -> 0) u) = display(lim_(x -> 0) 3x) = 0$. Então,
      $
        lim_(x -> 0) ("sen" 3x)/(2x) = lim_(u -> 0) ("sen" u)/display(2 dot u/3) = 3/2 dot lim_(u -> 0)  ("sen" u)/(u) = 3/2 dot 1 = 3/2
      $

      

      #figure()[
        #cetz.canvas({
          import cetz.draw: *
          import cetz-plot: *
          plot.plot(..opts, x-min:-4, x-max:4, y-min:-1/2, y-max:2, y-minor-tick-step: 0.5, 
          legend: (7.15, 6),
          legend-style: (stroke: (1pt+gray.lighten(50%)), fill: white),
          {
            plot.add(
              samples: 100,
              domain: (-calc.pi, calc.pi),
              x => calc.sin(3*x)/(2*x),
              style: line-styles,
              label: [$script(f(x) =) ("sen" 3x)/(2x)$]
            )

            plot.add-hline(
              3/2,
              style: (stroke: (dash: "dashed", paint: sbm-green, thickness: 1.5pt)),
              label: [$script(y = 3\/2)$]
            )

            plot.add(
                ((0, 3/2),), 
                mark: "o",
                mark-style: mark-styles(white)
            )
          })

        })
      ]
    ])

    \ \ \ \ \
  + $display(lim_(x -> 0) (1 - cos x)/(x^2))$
    #solution([
      $
        lim_(x -> 0) (1 - cos x)/x^2 &= lim_(x -> 0) [((1-cos x)/x^2) ((1+cos x)/(1+cos x))] = lim_(x -> 0) (1 - cos^2 x)/(x^2 (1 + cos x))\
        &= lim_(x -> 0) ("sen"^2 x)/(x^2 (1 + cos x)) = (lim_(x -> 0) ("sen"x)/x)^2(lim_(x -> 0) 1/(1 + cos x))\
        &= 1^2 dot 1/(1 + 1) = 1/2
      $

      #figure()[
        #cetz.canvas({
          import cetz.draw: *
          import cetz-plot: *

          plot.plot(..opts, 
            size: (10, 4),
            x-min: -7, x-max:7,
            y-max:1, y-minor-tick-step: 0.5,
            legend: (6.94, 4),
            legend-style: (stroke: 1pt+gray.lighten(50%), fill: white),
          {
            plot.add(
              samples: 100,
              domain: (-2*calc.pi, 2*calc.pi),
              x => ((1 - calc.cos(x))/calc.pow(x, 2)),
              style: line-styles,
              label: [$script(f(x) =) (1-cos x)/x^2$]
            )

            plot.add-hline(
              1/2, 
              style: (stroke: (dash: "dashed", paint: sbm-green, thickness: 1.5pt)),
              label: [$script(y = 1\/2)$]
            )
            plot.add(
                ((0, 1/2),), 
                mark: "o",
                mark-style: mark-styles(white)
            )
          })
        })
      ]
    ])


  + $display(lim_(x -> 0) (tan 2x)/("sen" 5x))$
    #solution([
      $
        lim_(x -> 0) (tan 2x)/("sen" 5x) &=  lim_(x -> 0) display(("sen" 2x)/(cos 2x))/("sen" 5x) = (lim_(x -> 0) 1/(cos 2x)) dot (lim_(x -> 0) ("sen" 2x)/("sen" 5x))\
        &= 1 dot (lim_(x -> 0) display(2 dot ("sen" 2x)/(2x))/display(5 dot ("sen" 5x)/(5x))) = 2/5 dot (display(lim_(x-> 0) ("sen" 2x)/(2x))/display(lim_(x -> 0) ("sen" 5x)/(5x)))
      $
      Sejam as novas variáveis: $u = 2x$ e $v = 5x$. Note que:
      $
        
        cases(
          display(lim_(x -> 0) u = lim_(x -> 0) 2x = 0) => u -> 0 " quando " x -> 0,,
          display(lim_(x -> 0) v = lim_(x -> 0) 5x = 0) => v -> 0 " quando " x -> 0
        )
      $
      Substituindo as novas variáveis no limite dado, temos:
      $
        lim_(x -> 0) (tan 2x)/("sen" 5x) &= 2/5 dot (display(lim_(u -> 0) ("sen" u)/u)/display(lim_(v -> 0) ("sen" v)/v)) = 2/5 dot 1/1 = 2/5
      $

      #figure()[
        #cetz.canvas({
          import cetz.draw: *
          import cetz-plot: *

          plot.plot(
            ..opts,
            size: (10, 4),
            x-min: -0.5, x-max: 0.5,
            y-min: -0.5, y-max: 2,
            x-tick-step: 0.25, y-tick-step: 1,
            legend: (7.15, 4),
            legend-style: (stroke: 1pt+gray.lighten(50%), fill: white),
            {
              plot.add(
                samples: 100,
                domain: (-0.54, 0.54),
                x => calc.tan(2*x)/calc.sin(5*x),
                style: line-styles,
                label: [$script(f(x) =) (tan 2x)/("sen" 5x)$]
              )

              plot.add-hline(
                2/5,
                style: (stroke: (dash: "dashed", paint: sbm-green, thickness:1.5pt)),
                label: [$script(y = 2\/5)$]
              )

              plot.add(
                ((0, 2/5),), 
                mark: "o",
                mark-style: mark-styles(white)
              )

            }
          )
        })
      ]



    ])

  + $display(lim_(x -> 0) (x "sen" x)/(1 - cos x))$
    #solution([
      $
        lim_(x -> 0) (x "sen" x)/(1-cos x) &= lim_(x -> 0) [((x "sen" x)/(1-cos x)) dot ((1 + cos x)/(1 + cos x))] = lim_(x -> 0) (x "sen" x (1 + cos x))/(1 - cos^2 x)\
        &= [lim_(x -> 0) (1 + cos x)] dot (lim_(x -> 0) (x "sen" x)/("sen"^2 x)) = 2 dot lim_(x -> 0) x/("sen" x) \
        &= 2/display(lim_(x -> 0) ("sen" x)/x) = 2/1\
        &= 2
      $

      #figure()[
        #cetz.canvas({
          import cetz.draw: *
          import cetz-plot: *

          plot.plot(
            ..opts, size: (10, 5),
            x-min:-4, x-max:4, y-max:3, 
            legend: (6.94, 5),
            legend-style: (stroke: (1pt+gray.lighten(50%)), fill: white),
            {
              plot.add(
                samples: 100,
                domain: (-calc.pi, calc.pi),
                x => x * calc.sin(x)/(1 - calc.cos(x)),
                style: line-styles,
                label: [$script(f(x) =) (x "sen" x)/(1 - cos x)$]
              )

              plot.add-hline(
                2,
                style: (stroke: (dash: "dashed", paint: sbm-green, thickness: 1.5pt)),
                label: [$script(y = 2)$]
              )

              plot.add(
                ((0, 2),), 
                mark: "o",
                mark-style: mark-styles(white)
              )
            }
          )
        })
      ]
    ])

  + $display(lim_(x -> pi/2) ("sen" x - 1)/(x - pi/2))$
    #solution([
      Seja a nova variável $t = x - pi/2$. Note que $t -> 0$ quando $x -> pi\/2$. Então,
      $
        display(lim_(x -> pi/2) ("sen" x - 1)/(x - pi/2)) &= lim_(t -> 0)  ("sen"(t + pi/2) - 1)/t = lim_(t -> 0) (("sen" t dot cos pi/2 + cos t dot "sen" pi/2) - 1)/t\
        &= lim_(t -> 0) (("sen" t dot 0 + cos t dot 1) - 1)/1 = lim_(t -> 0) (cos t - 1)/t\
        &= lim_(t -> 0) [((cos t - 1)/t) dot ((cos t + 1)/(cos t + 1))] = lim_(t -> 0) (cos^2 t - 1)/(t (cos t + 1))\
        &= lim_(t -> 0) ("sen"^2 t)/(t (cos t + 1)) = (lim_(t -> 0) ("sen" t)/t) dot (lim_(t -> 0) ("sen" t)/(cos t + 1))\
        &= 1 dot 0/1 = 0
      $

      #figure()[
        #cetz.canvas({
          import cetz.draw: *
          import cetz-plot: *

          plot.plot(..opts, 
            x-max: 3, y-min: -1, y-max: 1,
            y-minor-tick-step: 0.2,
            legend: (6.92, 6),
            legend-style: (stroke: (1pt+gray.lighten(50%)), fill: white),
            {
              plot.add(
                samples: 100,
                domain: (0, calc.pi),
                x => (calc.sin(x) - 1)/(x - calc.pi/2),
                style: line-styles,
                label: [$script(f(x) =) ("sen" x - 1)/(x - pi\/2)$]
              )
              plot.add-vline(
                calc.pi/2, label: [$script(x = pi\/2)$],
                style: (stroke: (dash: "dashed", paint: sbm-green, thickness: 1.5pt))
              )

              plot.add(
                ((calc.pi/2, 0),), 
                mark: "o",
                mark-style: mark-styles(white)
              )
            }
          )
        })
      ]
    ])



