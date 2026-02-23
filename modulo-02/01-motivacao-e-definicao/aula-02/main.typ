#import "conf.typ": *


#show: conf.with(
  author: [Igo da Costa Andrade],
  curso: [Cálculo Essencial],
  modulo: (
    numero: [2],
    tema: [Derivando Soluções]
  ),
  secao: [Motivação e Definição],
  aula: (
    numero: [02],
    tema: [Motivação II]
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

+ Um skatista profissional quer construir uma rampa de acesso para um half-pipe em formato parabólico. O half-pipe tem o perfil $f(x) = 1/4 x^2 - 4$ metros, onde $x$ é a distância horizontal em  metros. Para garantir a segurança, a rampa deve ser tangente ao half-pipe e chegar ao solo no ponto $(5, 0)$ onde está a plataforma de lançamento.

  #figure()[
    #cetz.canvas({
      import cetz.draw: *
      import cetz-plot: *

      plot.plot(
        size: (10, 8), axis-style: "school-book",
        x-min: -4, x-max: 6,
        y-min: -5, y-max: 1, 
        x-tick-step: 1, y-tick-step: 1,
        {
          plot.add-fill-between(
            domain: (-3.5, 3.5),
            x => calc.pow(x, 2)/4 - 4,
            x => -5, 
            style: (stroke: 3pt+sbm-blue)
          )
          plot.add(
            domain: (-3.5, 6),
            x => 0,
            style: (stroke: 3pt+gray)
          )

          plot.add(
            ((2, -3), (5, 0),),
            style: (stroke: (dash: "dashed", paint: red, thickness: 3pt))
          )

          plot.add(
            ((5, 0),),
            mark: "o",
            mark-style: (fill: sbm-green, stroke: 3pt+sbm-green),
          )

          plot.add(
            ((2, -3),),
            mark: "o",
            mark-style: (fill: orange, stroke: 3pt+orange),
          )

          plot.annotate({
            content((-2.5, 0.3), text(gray)[Solo (chão)])
          })

          plot.annotate({
            content((5, 0.3), text(sbm-green)[Plataforma (5, 0)])
          })

          plot.annotate({
            content((3, -3), text(orange)[$(a, f(a))$])
          })

          plot.annotate({
            content((4.5, -1.5), text(red)[direção])
          })




        }
      )
    })
  ]

  Determine o ponto $(a, f(a))$ onde a rampa dever ser tangente ao half-pipe para que chehe exatamente na plataforma de lançamento.

  #set enum(numbering: "(a)")
  + Encontre uma expressão para o coeficiente angular da reta secante que passa pelos pontos $(a, f(a))$ e $(a + h, f(a+h))$ do falf-pipe.
    #solution([
      $
        m_"sec" &= (Delta y)/(Delta x) = (f(a + h) - f(a))/((a + h) - a)\
        m_"sec" &= ([1/4(a + h)^2 - 4] - (1/4 a^2 - 4))/h\
        m_"sec" &= (1/4 a^2 + 1/4  (2 a h) + 1/4 h^2 - 4 - 1/4 a^2 + 4)/h\
        m_"sec" &= a/2 + h/4
      $
    ])

  + Calcule o limite do coeficiente angular da reta secante quando $h -> 0$ para obter o coeficiente anfular da reta no ponto $(a, f(a))$.
    #solution([
      $
        m &= lim_(h -> 0) m_"sec" = lim_(h -> 0) (a/2 + h/4) = a/2
      $
    ])

  + Escreva a equação da reta tangente ao half-pipe no ponto $(a, f(a))$ em função de $a$.
    #solution([
      $
        y - y_0 = m (x - x_0) &=> y - f(a) = a/2 (x - a)\
        &=> y - (1/4 a^2 - 4) = a/2 x - a^2 /2\
        &=> y = a/2 x - a^2/2 + a^2/4 - 4\
        &=> y = a/2 x - a^2/4 - 4
      $
    ])

  + Determine o valor de $a$ para que esta reta tangente passe pelo ponto $(5, 0)$ da plataforma de lançamento,
    #solution([
      $
        y = a/2 x - a^2/4 - 4 &=> 0 = a/2 dot 5 - a^2/4 - 4 => -a^2 /4 + (5a)/2 - 4 = 0\
        &=> a^2 - 10 a + 16 = 0 => a = (-(-10) plus.minus sqrt((-10)^2 - 4 dot 1 dot 16))/(2 dot 1)\
        &=> a = (10 plus.minus sqrt(36))/2 \
        &=> a = (10 plus.minus 6)/2  => 
        cases(
          a_1 = display((10 - 6)/2) = 2,
          a_2 = display((10 + 6)/2) = 8
        )
      $

      Dado que o ponto a abscissa $a$ deve estar à esquerda de $5$, devemos escolher $a = 2$.
    ])

  + Encontre a inclinação da rampa (coeficiente angular) e calcule o ângulo em radianos que ela faz com a horizontal. Comente sobre a adequação desta inclinação para a prática do skate.

    #solution([
      A inclinação da rampa deve ser $m = a/2 = 1$, o que representa um ângulo 
      $
        alpha = arctan(m) = arctan(1) = pi/4 "rad"
      $
    ])