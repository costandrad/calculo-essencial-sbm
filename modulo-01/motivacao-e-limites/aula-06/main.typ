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
    numero: [06],
    tema: [Teorema do Confronto e Limite Trigonométrico Fundamental]
  )
)

#let opts = (
  size: (6, 5), axis-style: "school-book", 
  x-tick-step: 1, y-tick-step: 1,
  x-grid: true, y-grid: true,
)

#let line-styles = (stroke: 2pt+sbm-blue)
#let mark-styles(fill-color) = (stroke: 2pt+sbm-blue, fill: fill-color)

#v(1cm)



+ *Teorema do confronto.* Enuncie o teoream do confronto (ou teorema do sanduíche).

  #solution([
    *Teorema do Confronto*

    Sejam $f(x)$, $g(x)$ e $h(x)$ funções definidas em um intervalo que contém um ponto $a$ (exceto, possivelmente, em $a$). Suponha que, em para todo $x$ nesse intervalo, $ g(x) <= f(x) <= h(x) $ e que $ display(lim_(x -> a) g(x)) = display(lim_(x -> a) h(x)) = L. $

    Então, $ display(lim_(x -> a) f(x)) = L. $
  ])

+ *Aplicação do teorema do confronto.* Use  teorema do confronto para calcular o limite abaixo. $ display(lim_(x -> 0)) x^2 "sen"(1/x) $

#solution([
  Inicialmente, observemos que para todo $theta in RR$, $-1 <=  "sen" theta <= 1$. Assim, dado $x in [-1, 0) union (0, 1]$, vale a desiqualdade
  $
    -1 <= "sen" (1/x) <= 1 => -x^2 <= x^2 "sen" (1/x) <= x^2,
  $
  em que multiplicamos a expressão original por $x^2$. Definindo as funções:
  $
    cases(
      g(x) = -x^2,
      display(f(x) = x^2 "sen"(1/x)),
      h(x) = x^2
    )
  $
  observemos que $display(lim_(x -> 0) g(x)) = display(lim_(x -> 0) h(x)) = 0$. Portanto, pelo teorema do confronto, 
  $
    display(lim_(x -> 0) f(x)) = display(lim_(x -> 0) x^2 "sen"(1/x)) = 0.
  $
  O gráfico seguinte ilustra o caso:

 
  #let g(x) = -x*x
  #let f(x) = x*x*calc.sin(1/x)
   #let h(x) = x*x


  #figure()[
    #cetz.canvas({
      import cetz.draw: *
      import cetz-plot: *

      plot.plot(size: (10, 10),  {
        plot.add(
          domain: (-0.5, 0.5),
          x => g(x)
        )
        plot.add(
          domain: (-0.5, 0.5),
          x => h(x)
        )

        plot.add(samples: 500, domain: (-0.5, 0.5), x=> f(x), style: (stroke: (1pt+sbm-blue)))
        
      })
    })
  ]
])
