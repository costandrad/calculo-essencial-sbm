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
                style: (stroke: none),
                mark-style: mark-styles(sbm-blue),
                
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

+ Defina matematicamente o que significa:
  #set enum(numbering: "(a)")
  + Uma função ser contínua à direita em $x = a$.

    #solution([
      Dizemos que uma função $f$ é contínua à direita em $x = a$ se satizfaz simultaneamente as seguintes condições:

        #set enum(numbering: "i.")
        + $f(a)$ está definida;
        + existe o limite à direita de $f(x)$ em $a$, isto é,
          $
            lim_(x -> a^+) f(a) " existe;"
          $
        + o valor do limite à direita coincide com o valor da função em $a$:
          $
            lim_(x -> a^+) f(a) = f(a)
          $
        De forma compacta:

        $
          f " é contínua à direita em " a <==> lim_(x -> a^+) f(a) = f(a).
        $
    ])

  + Uma função ser contínua à esquerda em $x = a$.

    #solution([
      Dizemos que uma função $f$ é contínua à esquerda em $x = a$ se satizfaz simultaneamente as seguintes condições:

        #set enum(numbering: "i.")
        + $f(a)$ está definida;
        + existe o limite à esquerda de $f(x)$ em $a$, isto é,
          $
            lim_(x -> a^-) f(a) " existe;"
          $
        + o valor do limite à esquerda coincide com o valor da função em $a$:
          $
            lim_(x -> a^-) f(a) = f(a)
          $
        De forma compacta:

        $
          f " é contínua à esquerda em " a <==> lim_(x -> a^-) f(a) = f(a).
        $
    ])

+ Para a função 
  $
    f(x) = 
    cases(
      x + 1\,   &" se" x < 0,
      2\,       &" se" x = 0\,,
      x^2 + 1   &" se" x > 0
    )
  $
  analise:
  #set enum(numbering: "(a)")
  + A continuidade à esquerda em $x = 0$.
    #solution([
      Inicialmente, observemos a primeira condição de continuidade à esquerda, definida no item (b) do problema anterior: no ponto $x = 0$, a função $f$ está definida e vale $f(0) = 2$.

      Em seguida, determinemos o limite à esquerda de $f$ em $x = 0$:
      $
        lim_(x -> 0^-) f(x) = lim_(x -> 0^-) (x + 1) = 0 + 1 = 1 != 2 = f(0).
      $
      Note que o limite à esquerda não coincide com o valor de $f$ em $x = 0$. Portanto, a função $f$ não é contínua à esquerda em $x = 0$.
    ])

  + A continuidade à direita em $x = 0$.
    #solution([
      A primeira condição de continuidade à direita, definida no item (a) do problema anterior é satisfeita, pois no ponto $x = 0$, a função $f$ está definida e vale $f(0) = 2$.

      O limite à direita de $f$ em $x = 0$ existe e é igual a:
      $
        lim_(x -> 0^+) f(x) = lim_(x -> 0^+) (x^2 + 1) = 0^2 + 1 = 1 != 2 = f(0).
      $
      Como o limite à direira é diferente do valor de $f$ em $x = 0$ a função $f$ não é contínua à direita em $x = 0$.
    ])

  + A continuidade em $x = 0$.
    #solution([
      Dos itens anteriores, temos os seguintes fatos:
      - A função $f$ está definida no ponto $x = 0$, ou seja, $f(0)$ existe. No caso, $f(0) = 2$;
      - O limite de $f$ em $x = 2$ existe. De fato, 
        $
          lim_(x -> 0^-) f(x) = lim_(x -> 0^+) f(x) = 1 => lim_(x -> 0) f(x) = 1
        $
      - O limite de $f$ em $x = 0$ não é igual ap valor de $f$ no referido ponto. 
      
      Dos fatos acima, conclumos que a função não é contínua em $x = 0$ como ilustra o gráfico abaixo:


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
            size: (4, 6), axis-style: "school-book",
            x-tick-step: 1, y-tick-step: 1,
            x-grid: true, y-grid: true, 
            x-min: -2, x-max: 2, 
            y-min: -1, y-max: 5,
            {
              // x < 0
              plot.add(
                domain: (-3, 0),
                x => x + 1,
                style: line-styles
              )
              // x = 0
              plot.add(
                ((0, 2),),
                mark: "o",
                mark-style: mark-styles(sbm-blue)
              )
              // x > 0
              plot.add(
                domain: (0, 3),
                x => calc.pow(x, 2) + 1,
                style: line-styles
              )
              // descontionuidade em x = 0
              plot.add(
                ((0, 1),),
                mark: "o",
                mark-style: mark-styles(white)
              )
            }
          )
        })
      ]
    ])

+ Considere a função
  $
    g(x) = 
    cases(
      x^2 - 1\, &" se" x <= 1,
      a x + b\, &" se" x > 1
    )
  $
  Determine os valores das constantes $a$ e $b$ para que $g(x)$ seja contínua em $x = 1$ e $g(2) = 5$.

    #solution([
      Para que $g$ seja contínua em $x = 1$, devemos verificar a condição:
      $
        lim_(x -> 1^-) g(x) = lim_(x -> 1^+) g(x) = g(1)
      $
      Façamos:
      $
        cases(
          display(lim_(x -> 1^-)) g(x) = display(lim_(x -> 1^-)) (x^2 - 1) = 1^2 - 1 = 0, ,
          display(lim_(x -> 1^+)) g(x) = display(lim_(x -> 1^+)) a x + b = a dot 1 + b = a + b, ,
          g(1) = 1^2 - 1 = 0
        )
      $
      Então,
      $
        lim_(x -> 1^-) g(x) = lim_(x -> 1^+) g(x) = g(1) => a + b = 0
      $
      Por poutro lado, da condição $g(2) = 5$, temos:
      $
        g(2) = 5 => a dot 2 + b = 5 => 2a + b = 5
      $

      Note que temos um sistema linear de duas equações:
      $
        cases(
          &a + &b &= &0,
          2&a + &b &= &5
        )
      $ 
      Utilizando a *Regra de Cramer* #footnote[A *Regra de Cramer* (em homenagem a Grabriel Cramer (1707-1752)) é um método de solução de sistemas lineares por determinantes. Envolve calcular o determinante principal ($D$) da matriz dos coeficientes e os determinantes auxiliares ($D_1, D_2, dots, D_n$) substituindo a coluna de $i$-ésima incógnica pelos termos independentes. A $i$-ésima incógnita é encontrada dividindo $D_i\/D$. Se $D != 0$, há uma única solução (Sistema Possível e Determinado - SPD); se $D = 0$ e algum $D_i != 0$, o sistema é impossível (SI); se todos os determinantes forem nulos, há infinitas soluções (Sistema Possível e Indeterminado - SPI).] , temos a seguinte solução:
      
      #set math.mat(delim: "|")
      $
        cases(
          display(
            a &= (D_a)/(D) &= display(mat(0, 1; 5, 1))/display(mat(1, 1; 2, 1)) &= (0 dot 1 - 5 dot 1)/(1 dot 1 - 2 dot 1) &= (-5) / (-1 )= &5
          ),
          display(
            b &= (D_b)/(D) &= display(mat(1, 0; 2, 5))/display(mat(1, 1; 2, 1)) &= (1 dot 5 - 2 dot 0)/(1 dot 1 - 2 dot 1) &= (5)/(-1) = -&5
          )
        )
      $

      Finalmente, a função 
      $
        g(x) = cases(
          x^2 - 1\, &" se" x <= 1,
          5x -5\, &" se" x < 1
        )
      $
      é contínua em $x = 1$ e é tal que $g(2) = 5$, como ilustra o gráfico abaixo:

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
            size: (6, 8), axis-style: "school-book",
            x-tick-step: 1, y-tick-step: 1,
            x-grid: true, y-grid: true,
            x-min: -3, x-max: 3,
            y-min: -2, y-max: 6,
            {
              // x <= 1
              plot.add(
                domain: (-3, 1),
                x => calc.pow(x, 2) - 1,
                style: line-styles
              )
              plot.add(
                domain: (1, 3),
                x => 5*x - 5,
                style: line-styles
              )
              plot.add(
                ((1, 0),),
                mark: "o",
                mark-style: mark-styles(sbm-blue),
              )
              plot.add(
                ((2, 5),),
                mark: "o",
                mark-style: mark-styles(sbm-blue),
              )
            }
          )
        })
      ]
    ])

+ Para cada afirmação, diga se é gerdadeira ou falsa e justifique:
  #set enum(numbering: "(a)")
  + A função $f(x) = 1/x$ é descontínua em $x = 0$.
    #solution([
      A afirmação é *verdadeira* pois o ponto $x = 0$ não pertence ao domínio de definição de $f$:
      $
        D(f) = {x in RR | x != 0}.
      $

      Em $x = 0$, obtemos a indeterinação de tipo $1\/0$.
    ])

  + Se $display(lim_(x -> a)) f(x)$ existe, então, $f$ é contínua em $x = a$.
    #solution([
      A afirmação é *falsa*. De fato, a existência do limite $display(lim_(x -> a) f(x))$ é uma das condições de existência. Além dela, deve-se verificar se $f(a)$ existe e se $display(lim_(x -> a) f(x)) = f(a)$. Por exemplo, consideremos a função definida por partes:
      $
        f(x) = 
        cases(
          x\, &" se" x != 1,
          0\, &" se" x = 1
        )
      $
      Observamos que o limite de $f$ quando $x$ tende a $0$ existe, pois $display(lim_(x -> 0) f(x)) = 1$. A função também está definida no referido ponto. Ou seja, $f(0)$ existe pois $f(0) = 1$. Entretanto,
      $
        display(lim_(x -> 0) f(x)) != f(0).
      $
    ])

  + Se $f$ não é contínua em $x = a$, então, $f(a)$ não existe.
    #solution([
      A afirmação é *falsa*. Basta tomar como contra-exemplo a situação do item anterior: a função $f$ não é contínua em $x = 0$, todavia tanto a função quanto o limite no ponto existem.  

      De forma geral, tomemos a definição com as três condições de continuidade:

      "Se
        #set enum(numbering: "1.")
        + $f(a)$ existe; *e*
        + $display(lim_(x -> a))$ existe; *e*
        + $display(lim_(x -> a)) = f(a)$;
      então, a função $f$ é contínua em $a$".

      A negação seria:
      "Se a função $f$ *não* é contínua em $a$, então
        #set enum(numbering: "1.")
        + $f(a)$ *não* existe; *ou*
        + $display(lim_(x -> a))$ *não* existe; *ou*
        + $display(lim_(x -> a)) != f(a)$."

      Portanto, se $f$ não é contínua em $x = a$, pelo menos uma das condições de continuidade não é verificada.
    ])

+ Observe o gráfico da função $f(x)$ abaixo e analise a continuidade nos pontos indicados:

  #figure()[
    #cetz.canvas({
      import cetz.draw: *
      import cetz-plot: *

      set-style(
        grid: (
          stroke: (dash: "dashed", paint: gray)
        ),
        minor-grid: (
          stroke: (dash: "dashed", paint: gray)
        )
      )

      plot.plot(
        size: (6, 5), axis-style: "school-book",
        x-tick-step: 1, y-tick-step: 1,
        x-minor-tick-step: 0.5, y-minor-tick-step: 0.5, 
        x-min: -1, y-min: -1,
        x-grid: "both", y-grid: "both",
        {
          plot.add(
            domain: (-0.5, 1),
            x => x + 1,
            style: line-styles
          )

          plot.add(
            domain: (1, 3),
            x => 0.5 * calc.pow(x - 2, 2) + 1,
            style: line-styles
          )

          plot.add(
            domain: (3, 5.5),
            x => x - 2,
            style: line-styles
          )

          plot.add(
            ((-0.5, 0.5), (1, 3), (3, 2.5), (4, 2.25), (5.5, 3.5)),
            mark: "o",
            style: (stroke: none),
            mark-style: mark-styles(sbm-blue)
          )

          plot.add(
            ((1, 2), (1, 1.5), (3, 1.5), (3, 1), (4, 2)),
            mark: "o",
            style: (stroke: none),
            mark-style: mark-styles(white)
          )
        }
      )
    })
  ]

  #set enum(numbering: "(a)")
  + A função é contínua em $x = 1$? Justifique verificando as três condições.
    #solution([
      As três condições de continuidade são:
        #set enum(numbering: "1.")
        + $f(a)$ existe; 
        + $display(lim_(x -> a))$ existe;
        + $display(lim_(x -> a)) = f(a)$.

      Em $x = 1$, a primeira condição é verificada pois $f(1) = 3$. Entretanto, a segunda condição não é satisfeita. Apesar de existirem os limites laterais em $x = 1$, eles são distintos:

        $
          lim_(x -> 1^-) f(x) = 2 != 1,5 = lim_(x -> 1^+) f(x)
          
        $

      + A função é contínua à esquerda em $x = 3$? E à direita?
        #solution([
          No ponto $x = 3$, temos que os limites laterais existem:
          $
            cases(
              display(lim_(x -> 3^-)) f(x) = 1\,5, ,
              display(lim_(x -> 3^+)) f(x) = 1
            )
          $
          Entretanto, nenhum desses limites é igual ao valor $f(3) = 2,5$. Portanto,
          $
            display(lim_(x -> 3^-)) f(x) != f(3) &=> f " não é contínua à esquerda em " &x&= 3\
            display(lim_(x -> 3^+)) f(x) != f(3) &=> f " não é contínua à direita em " &x &= 3.
          $
        ])

      + Analise a continuidade em $x = 4$.
        #solution([
          Em $x = 4$, observamos que o limite existe:
          $
            lim_(x -> 4) f(x) = 2
          $
          Além disso, $f(4)$ existe. Entretanto, vemos no gráfico que $f(4) > 2$. Assim,
          $
            lim_(x -> 4) f(x) != f(4)
          $
          Logo, $f$ não é contínua em $x = 4$.
        ])
    ])













