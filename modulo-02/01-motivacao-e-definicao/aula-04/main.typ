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
    numero: [04],
    tema: [Funções não Deriváveis]
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

+ Considere a função 
  $f(x) = 
  display(cases(
    x^2 &", se" x < 1,
    3   &", se" x = 1,
    2x  &", se" x > 1
  ))$

  #set enum(numbering: "(a)")
  + Verifique se $f$ é contínua em $x = 1$.
    #solution([
      Calculemos os seguintes limites laterais:
      - Limite à esquerda:
        $
          lim_(x -> 1^-) f(x) = lim_(x -> 1^-) x^2 = 1^2 = 1
        $

      - Limite à direita:
        $
          lim_(x -> 1^+) f(x) = lim_(x -> 1^+) 2x = 2 dot 1 = 2
        $

      Como os limites laterais são diferentes, então não existe o limite de $f$ no ponto $x = 1$. Logo, a função $f$ *não* é contínua em $x = 1$, como observamos no gráfico abaixo:

      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          import cetz-plot: *

          set-style(
            grid: (stroke: (dash: "dashed"))
          )

          plot.plot(
            size: (8, 5), axis-style: "school-book",
            x-grid: true, y-grid: "both",
            x-tick-step: 1, y-tick-step: 1,

            {
              plot.add(
                domain: (-2, 1),
                x => x * x,
                style: (stroke: 1.5pt+sbm-blue)
              )
              plot.add(
                ((1, 1),),
                mark: "o", mark-style: (fill: white, stroke: (1.5pt+sbm-blue))
              )
              plot.add(
                ((1, 3),),
                mark: "o", mark-style: (fill: sbm-blue, stroke: (1.5pt+sbm-blue))
              )
              plot.add(
                domain: (1, 3),
                x => 2 * x,
                style: (stroke: 1.5pt+sbm-blue)
              )
              plot.add(
                ((1, 2),),
                mark: "o", mark-style: (fill: white, stroke: (1.5pt+sbm-blue))
              )
            }
          )
        })
      ]

    ]) 

  + Analise a derivabilidade de $f$ em $x = 1$ calculando os limites laterais da definição de derivada.

    #solution([
      - Limite à esquerda:
      $
        lim_(h -> 0^-) (f(1 + h) - f(1))/h &= lim_(h -> 0^-) ((1+h)^2 - 3)/h = lim_(h -> 0^-) (1 + 2h + h^2 - 3)/h\
        &= lim_(h -> 0^-) (h^2 + 2h - 2)/h = lim_(h -> 0^-) (h + 2 - 2/h) = +infinity
      $

      - Limite à direita:
      $
        lim_(h -> 0^+) (f(1+h) - f(1))/h &= lim_(h -> 0^+) (2(1 + h) - 3)/h = lim_(h -> 0^+) (2h - 1)/h\
        &= lim_(h -> 0^+) (2 - 1/h) = +infinity
      $

      Portanto, a derivada não está definida no ponto $x = 1$.

    ])

+ Considere a função $g(x) = |x - 2|$.
  #set enum(numbering: "(a)")
  + Reescreva $g(x)$ como uma função defiida por partes.
    #solution([
      $
        g(x) = |x - 2| &= 
        cases(
          &x - 2   &", se" x - 2 >= 0,
          -(&x - 2)&", se" x - 2 < 0
        )\

        g(x) &= 
        cases(
           &x - 2&", se" x >= 2,
          -&x + 2&", se" x < 2
        )

      $
    ])

  + Verifique se $g$ é contínua em $x = 2$.
    #solution([
      Determinemos os limites laterias de $g$ em $x = 2$:
      - Limite à esquerda:
      $
        lim_(x -> 2^-) g(x) = lim_(x -> 2^-) (-x + 2) = 0^-
      $
      - Limite à direita:
      $
        lim_(x -> 2^+) g(x) = lim_(x -> 2^+) (x - 2) = 0^+
      $

      Como $ lim_(x -> 2^-) g(x) = lim_(x -> 2^+) g(x) = 0, $ existe o limite: $ lim_(x -> 2) g(x) = 0 $ 

      Além disso, $g(x) = 0$. Portanto, dado que $ lim_(x -> 2) g(x) = g(x), $
      então, $g$ é contínua.
    ])

  + Analise a derivabilidade de $g$ em $x = 2$ usando a definição de derivada.
    #solution([
      - Limite à esquerda:
      $
        lim_(h -> 0^-) (g(2 + h) - g(2))/h = lim_(h -> 0^-) (|(2 + h) - 2| - |2 - 2|)/h = lim_(h -> 0^-) (|h|)/h = lim_(h -> 0^-) - h/h =  -1
      $

      - Limite à direita:
      $
        lim_(h -> 0^+) (g(2 + h) - g(2))/h = lim_(h -> 0^+) (|(2 + h) - 2| - |2 - 2|)/h = lim_(h -> 0^+) (|h|)/h = lim_(h -> 0^+)  h/h =  1
      $

      Como os limites limites laterias sã distintos, a derivada em $x = 2$ não existe.
    ])

  + O que este exercício demonstra sobre a relação entre continuidade e derivabilidade? 
    #solution([
      É um teorema demonstrável que toda função deriável em um ponto é contínua nesse ponto, mas nem toda função contínua é derivável.
    ])

  
+ Observe os gráficos das funções abaixo e analise a derivabilidade non pontos indicados.

  #figure(
    image("assets/images/prob-03.png")
  )

  Para cada gráfico, determine se a função é derivável no ponto $x = 0$ indicado. Justifique sua resposta baseando-se na suavidade ou presença de "bicos" no gráfico.

  #set table(
    stroke: 0.25pt,
    fill: (x, y) => (
      if y == 0 {
        color.mix((black, 80%), white)
      } else if calc.rem(y, 2) == 0 {
        color.mix((black, 20%), white)
      }
    )
  )

  #show table.cell.where(y: 0): set text(weight: "bold", fill: white)

  #align(center, table(
    columns: 3,
    table.header([Gráfico], [Derivável em $x = 0$?], [Justificativa]),
    [A], [Sim], [Função é _suave_ em $x = 0$],
    [B], [Não], [Há um _bico_ em $x = 0$],
    [C], [Não], [Há um _bico_ em $x = 0$],
    [D], [Não], [Há um _bico_ em $x = 0$],
    [E], [Sim], [Função é _suave_ em $x = 0$],
  ))

