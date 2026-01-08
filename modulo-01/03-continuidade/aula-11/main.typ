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
    numero: [11],
    tema: [Motivação]
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

+ Defina matematicamente o que significa uma função $f(x)$ ser contínua em um ponto $x = a$.

  #solution([
    Uma função $f$ é *contínua* no ponto $x = a$ se e somente se as seguintes condições forem satisfeitas:
      #set enum(numbering: "i.")
      + $f(a)$ existe;
      + $display(lim_(x -> a) f(x))$ existe;
      + $display(lim_(x -> a) f(x) = f(a))$.
    Se pelo menos uma dessas condições não forem verificadas em $x = a$, a função $f$ é dita *descontínua* em $a$.
  ])

+ Em um país fictício, o imposto de renda é calculado pela função:
  $
    I(r) = cases(
      0\, &" se" 0 <= &r < 30.000,
      0\,15 dot r\, &" se" &r >= 30.000
    )
  $
  onde $r$ é a renda bruta mensal em reais e $I(r)$ é o imposto devido.

  #set enum(numbering: "(a)")
  + Analise a continuidade desta função em $r = 30.000$.
    #solution([
      Vamos testar as condições de continuidade na resposta do item 1:
        #set enum(numbering: "i.")
        +  *A função existe no ponto?* Na definição por partes da função $I$, para $r = 30.000$, temos $I(r) = 0,15 dot 30.000 = 4.500$. Portanto, a função existe no ponto considerado.

        + *O limite existe no ponto?* Calculemos os limites laterais:

          $
            &lim_(r -> 30.000^-) I(r) = 0\
            &lim_(r -> 30.000^+) I(r) = 0,15 dot 30.000 = 4.500
          $
          Portanto, 
          $
            lim_(r -> 30.000^-) I(r) != lim_(r -> 30.000^+) I(r),
          $
          o limite não existe em $r = 30.000$.

        Como a segunda condição não foi verificada, podemos concluir que a função $I(r)$ não é *contínua* em $r = 30.000$, como observamos no gráfico abaixo:

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
              size: (8, 6), axis-style: "school-book",
              x-tick-step: 15000, y-tick-step: 1500, 
              x-grid: true, y-grid: true,
              x-label: [$r$], y-label: [$I(r)$],
              {
                plot.add(
                  domain: (0, 30000),
                  x => 0,
                  style: line-styles
                )
                plot.add(
                  domain: (30000, 60000),
                  x => 0.15 * x,
                  style: line-styles
                )
                plot.add(
                  ((30000, 0),),
                  mark: "o",
                  mark-style: mark-styles(white)
                )
                plot.add(
                  ((30000, 4500),),
                  mark: "o",
                  mark-style: mark-styles(sbm-blue)
                )
              }
            )
          })
        ]


    ])

  + Calcule a renda líquida (renda bruta menos imposto) para uma pessoa com renda bruta de R\$ 28.000 e para outra com renda bruta de R\$ 31.000. Explique a anomalia.

    #solution([
      - Pessoa 1: 
      $ 
        r_1 = 28.000 < 30.000 =>  I_1 = I(r_1) = 0 \
        l_1 = r_1 - I_1 = 28.000 - 0 = 28.000
      $
      - Pessoa 2: 
      $ 
        r_2 = 31.000 > 30.000 => I_2 = I(r_2) = 0,15 dot 31.000 = 4.650 \
        l_2 = r_2 - I_2 = 31.000 - 4.650 = 26.350
      $

      A renda bruta da pessoa 2 é $3.000$ superior à renda bruta da pessoa 1. Entretanto, pelo fato de que estes valores encontram-se em regiões distindas do domínio de definição da função $I$, surge uma discrepância no valor do imposto devido. Como consequência, a renda líquida da pessoa 2 acaba sendo inferior à renda líquida da pessoa 1.
    ])

  + Proponha uma nova função de imposto que seja contínua e elimine a anomalia.
    #solution([
      Propomos a nova função de imposto:
      $
        I(r) = cases(
          0\, &" se" 0 <= &r < 30.000,
          0\,15 dot r + c\, &" se" &r >= 30.000
        )
      $
      em que $c$ é uma constante a determinar a fim de satisfazer às condições de continuidade. Como nosso problema inicialmente residia no fato de que os limites laterais eram distintos, então, façamos:
      $
        lim_(r -> 30.000^-) I(r) = lim_(r -> 30.000^+) I(r) &=> 0 = 0,15 dot 30.000 + c\
        &=> 0 = 4.500 + c \
        &=> c = -4.500
      $

      Com a nova função:
      $
        I(r) = cases(
          0\, &" se" 0 <= &r < 30.000,
          0\,15 dot r - 4.500\, &" se" &r >= 30.000
        )
      $
      vemos que o limite $display(lim_(r -> 30.000))$ passa a existir e é igual $0$. 

      Resta confirmar a terceira condição: *O limite no ponto é igual ao valor da função avaliada no ponto?* Façamos:
      $
        cases(
          display(lim_(r -> 30.000)) = 0, ,
          I(30.000) = 0.15 dot 30.000 - 4.500 = 0
        ) => lim_(r -> 30.000) = I(30.000)
      $

      Como ilustra o gráfico seguinte, a nova função de imposto é *contínua*:

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
              size: (8, 6), axis-style: "school-book",
              x-tick-step: 15000, y-tick-step: 1500, 
              x-grid: true, y-grid: true,
              x-label: [$r$], y-label: [$I(r)$],
              {
                plot.add(
                  domain: (0, 30000),
                  x => 0,
                  style: line-styles
                )
                plot.add(
                  domain: (30000, 60000),
                  x => 0.15 * x - 4500,
                  style: line-styles
                )
              }
            )
          })
        ]

        

        #let I(x) = if x < 30000 {
          return 0
        } else {
          return 0.15 * x - 4500
        }

        #show table.cell.where(y: 0): strong
        #show table.cell.where(y: 3): strong

        #set table(
          stroke: (x, y) => if y != 1 {
            (bottom: 0.7pt+black)
          },
          align: (x, y) => (
            if x <= 1 {left}
            else if y == 0 {center} 
            else {right}
          )
        )

        Com essa correção, a situação tributária das pessoas 1 e 2 será a seguinte:

        #figure(
          kind: table
        )[
          #table(
            columns: 4,
            table.header([], [], [Pessoa 1], [Pessoa 2]),
            [], [Renda Bruta], [28000], [31000],
            [($-$)], [ Imposto], [(#I(28000))], [(#I(31000))],
            [($=$)], [ Renda Líquida], [#(28000 - I(28000))], [#(31000 - I(31000))]
          )
        ]



    ])