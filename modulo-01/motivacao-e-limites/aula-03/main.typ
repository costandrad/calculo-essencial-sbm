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
    numero: [03],
    tema: [Fatoração e Limites]
  )
)

#v(1cm)

+ *Diferença de quadrados e racionalização com raiz quadrada.* Calcule os limites abaixo:
  #set enum(numbering: "(a)")
  + $display(lim_(x arrow 3) (x^2 - 9) / (x - 3))$
    #solution([
      Inicialmente, observemos que, se tentarmos substituir diretamente o valor $x = 3$ na expresão $display((x^2 - 9)/(x - 3))$, obteremos a forma indeterminada $0\/0$. Assim, para resolver o problema, devemos fatorar o numerador como segue:
      $
        lim_(x arrow 3) (x^2 - 9) / (x - 3) &= lim_(x arrow 3) (cancel((x - 3)) (x + 3)) / (cancel(x - 3)) = lim_(x arrow 3) (x + 3).
      $
      Note que eliminamos a causa da indeterminação e podemos aplicar as propriedades básicas de limite:
      $
        lim_(x arrow 3) (x^3 - 9)/(x - 3) = lim_(x arrow 3) (x + 3) = 3 + 3 = 6.
      $
    ])

  + $display(lim_(x arrow 4) (sqrt(x) - 2) / (x - 4))$
    #solution([
      Substituindo diretamente $x = 4$ na expressão dada, chegamos à indeterminação de tipo $0\/0$. Para resolver o problema, procedemos da seguinte forma:
      $
        lim_(x arrow 4) (sqrt(x) - 2) / (x - 4) &= lim_(x arrow 4) [((sqrt(x) - 2))/((x - 4)) dot ((sqrt(x) + 2))/((sqrt(x) + 2))] = lim_(x arrow 4) cancel(x - 4) / (cancel((x - 4)) (sqrt(x) + 2)) = lim_(x arrow 4) 1 / (sqrt(x) + 2).
      $
      Como a causa da indeterminação foi _removida_, podemos aplicar as propriedades básicas de limites:
      $
        lim_(x arrow 4) (sqrt(x) - 2)/ (x - 4) = lim_(x arrow 4) 1/(sqrt(x) + 2) = 1/(sqrt(4) + 2) = 1 / 4.
      $
    ])

  + $display(lim_(x arrow -2) (4 - x^2) / (x + 2))$
    #solution([
      $
        lim_(x arrow -2) (4 - x^2)/(x + 2) &= lim_(x arrow -2) ((2 - x)cancel((2 + x)))/cancel(x + 2) = lim_(x arrow -2) (2 - x) = 2 - (-2) = 4.
      $
    ])

+ *Diferença de cubos e racionalização com raiz cúbica.* Calcule os limites abaixo.
  #set enum(numbering: "(a)")
  + $display(lim_(x arrow 2) (x^3 - 8)/(x - 2))$
    #solution([
      $
        lim_(x arrow 2) (x^3 - 8)/(x - 2) &= lim_(x arrow 2) (x^3  - 2^3)/(x - 2) = lim_(x arrow 2) (cancel((x - 2)) (x^2 + 2x + 2^2))/cancel(x - 2)\
        &= lim_(x arrow 2) (x^2 + 2x + 4) = 2^2 + 2 dot 2 + 4 = 12
      $
    ])

  + $display(lim_(x arrow 8) (root(3, x) - 2)/(x - 8))$
    #solution([
      $
        lim_(x arrow 8) (root(3, x) - 2)/(x - 8) &= lim_(x arrow 8) (root(3, x) - 2)/((root(3, x))^3 - 2^3) =  lim_(x arrow 8) cancel(root(3, x) - 2)/(cancel((root(3, x) - 2)) (root(3, x^2) + 2 root(3, x) + 2^2))\
        &= lim_(x arrow 8) 1/(root(3, x^2) + 2 root(3, x) + 4) = 1 / (root(3, 8^2) + 2 root(3, 8) + 4)\
        &= 1 / ((root(3, 8))^2 + 2 root(3, 8) + 4) = 1 / (2^2 + 2 dot 2 + 4) = 1/12
      $
    ])

  + $display(lim_(x arrow -1) (x^3 + 1)/(x + 1))$
    #solution([
      $
        lim_(x arrow -1) (x^3 + 1)/(x + 1) &= lim_(x arrow -1) (x^3 - (-1))/(x - (-1)) = lim_(x arrow -1) (cancel((x - (-1))) (x^2 + x dot (-1) + (-1)^2))/cancel(x - (-1))\
        &= lim_(x arrow -1) (x^2 - x + 1) = (-1)^2 - (-1) + 1 = 3
      $
    ])

+ *Fatoração de equações do segundo grau.* Calcule os limites abaixo.
  #set enum(numbering: "(a)")
  + $display(lim_(x arrow 2) (x^2 - 5x + 6)/(x - 2))$
    #solution([
      Ao substituir $x = 2$ na expressão dada, obtemos uma indeterminação de tipo $0\/0$. Para eliminá-la, vamos fatorar o polinômio do segundo grau no numerador, aplicando a fórmula de Báskara:
      $
        x^2 - 5x + 6 = 0 &arrow.double x = (-(-5) plus.minus sqrt((-5)^2 - 4 dot 1 dot 6))/(2) arrow.double x = (5 plus.minus sqrt(25 - 24))/2\
        &arrow.double x = (5 plus.minus sqrt(1))/2 arrow.double x = (5 plus.minus 1)/2 arrow.double 
        cases(
          display(x_1 = (5 - 1)/2 = 4/2 = 2),
          display(x_2 = (5 + 1)/2 = 6/2 = 3)
        )
      $
      A forma fatorada do numerador é: $x^2 - 5x + 6 = (x - 2)(x - 3)$. Logo, o limite da expressão dada é
      $
        lim_(x arrow 2) (x^2 - 5x + 6)/(x - 2) &= lim_(x arrow 2) (cancel((x - 2))(x - 3))/cancel(x - 2) = lim_(x arrow 2) (x - 3) = 2 - 3 = -1
      $
    ])

  + $display(lim_(x arrow 1) (x^2 - 3x + 2)/(x^2 - 1))$
    #solution([
      Ao substituir $x = 1$ na expressão dada, obtemos uma indeterminação de tipo $0\/0$. Para eliminá-la, vamos fatorar o polinômio do segundo grau no numerador, aplicando a fórmula de Báskara:
      $
        x^2 - 3x + 2 = 0 &arrow.double x = (-(-3) plus.minus sqrt((-3)^2 - 4 dot 1 dot 2))/2 arrow.double x = (3 plus.minus sqrt(9 - 8))/2\
        &arrow.double x = (3 plus.minus 1)/2 arrow.double
        cases(
          display(x_1 = (3 - 1)/2 = 2/2 = 1),
          display(x_2 = (3 + 1)/2 = 4/2 = 2)
        )
      $
      A forma fatorada do numerador é: $ x^2 - 3x + 2 = (x - 1)(x - 2). $ Quanto ao denominador, podemos fatorá-lo usando diferença de quadrados: $ x^2 - 1 = (x-1)(x+1). $ Logo, o limite da expressão dada é
      $
        lim_(x arrow 1) (x^2 - 3x + 2)/(x^2 - 1) &= lim_(x arrow 1) (cancel((x - 1))(x - 2))/(cancel((x - 1))(x + 1)) = lim_(x arrow 1) (x - 2)/(x + 1) = (1 - 2)/(1 + 1) = - 1/2
      $
    ])



+ *Definição de limite.* Defina o que significa $lim_(x arrow a) f(x) = L$.
  #solution([
    Dado um ponto $x$ pertencente ao intervalo aberto $(b, c)$, com $b < a < c$,
    dizemos que a função $f(x)$ *tende* ao valor $L$ quando $x$ *se aproxima* de $a$
    se, ao tomarmos valores de $x$ cada vez mais próximos de $a$ (mas distintos de $a$),
    os valores de $f(x)$ aproximam-se tanto quanto desejarmos de $L$.

    Em outras palavras, o limite de $f(x)$ quando $x$ se aproxima de $a$ é $L$, o que
    representamos por:

    $ lim_(x arrow a) f(x) = L. $

    Essa notação expressa que o comportamento de $f(x)$ nas vizinhanças de $a$ é bem
    definido, independentemente do valor de $f(a)$ ou mesmo da função estar definida
    em $a$.
  ])

+ *Investigação numérica.* Considere a função $f(x) = 2x² = 3x + 1$ e complete a tabela abaixo usando uma calculadora. Com base nos valores obtidos, qual é a sua estimativa para $lim_(x arrow 2) f(x)$?

  #let rng = (-3, -2, -1, 1, 2, 3)
  #let n = rng.len() + 1
  #let x_rng = rng.map(i => 
    if i > 0 {
      2 + calc.pow(10, -i)
    } else {
      2 - calc.pow(10, +i)
    }
  )
  #solution([
    #let fn_p2(x) = 2 * calc.pow(x, 2) - 3 * x + 1

    #let y_rng = x_rng.map(x => calc.round(fn_p2(x), digits: 6))
    #let y_str = y_rng.map(y => fmt(y, digits: 4))

    Utilizando uma calculadora para deverminar o valor de $f(x)$ em cada um dos pontos dados na tabela abaixo, observamos que há uma tendência quando $x$ se aproxima de 2.

    #align(center, table(
        columns: n,
        [$x$], ..x_rng.map(x => $#str(x).replace(".", ",")$),
        [$f(x)$], ..y_rng.map(y => text(sbm-blue)[$#fmt(y, digits: 4)$]),
      )
    )

    Coforme se observa na tabela acima, a medida que $x$ se aproxima de $2$, tanto à direita quanto à esquerda, o valor de $f(x)$ _tende_ a $3$. Portanto, temos a seguinte estivativa para o limite:


    Estimativa: $lim_(x arrow 2) f(x) approx #rect(width: 75pt, height: 25pt)[
      #align(center+horizon)[
        #text(sbm-blue)[$#fmt(fn_p2(2), digits: 1)$]
      ]
    ]$ 
  ])

+ *Calculando limites com propriedades.* Use as propriedades de limites para calcular os limites abaixo.

  #set enum(numbering: "(a)")
  + $lim_(x arrow 3) (2x + 5)$
    #solution([
      $
        lim_(x arrow 3) (2x + 5) &= lim_(x arrow 3) (2x) + lim_(x arrow 3) 5 = 2 underbrace((lim_(x arrow 3)  x ), 3) + underbrace((lim_(x arrow 3) 5), 5) = 2 dot 3 + 5 = 11
      $
    ])

  + $lim_(x arrow 4) sqrt(x^2 + 9)$
    #solution([
      $
        lim_(x arrow 4) sqrt(x^2 + 9) &= sqrt(lim_(x arrow 4) (x^2 + 9)) = sqrt([lim_(x arrow 4) (x^2)] + (lim_(x arrow 4) 9))\
         &= sqrt([underbrace((lim_(x arrow 4) x), 4)]^2 + underbrace((lim_(x arrow 4) 9), 9))  = sqrt(4^2 + 9) \
         &= sqrt(16 + 9) = sqrt(25) = 5
      $
    ])

  + $lim_(x arrow 2) (x - 1)^3$
    #solution([
      $
        lim_(x arrow 2) (x - 1)^3 &= [lim_(x arrow 2) (x - 1)]^3 = [ underbrace((lim_(x arrow 2) x), 2) - underbrace((lim_(x arrow 2) 1), 1) ]^3 = (2^2 - 1)^3  = 27
      $

    ])

  + $lim_(x arrow 1) display((x^2 + 2x - 1) / (x + 3))$
    #solution([
      $
        lim_(x arrow 1) display((x^2 + 2x - 1) / (x + 3)) &= (lim_(x arrow 1) (x^2 + 2x - 1)) / (lim_(x arrow 1) (x + 3)) = ((lim_(x arrow 1) x)^2 + 2 (lim_(x arrow 1) x) + 1)/ ((lim_(x arrow 1) x) + 3)\
        &= (1^2 + 2 dot 1  - 1)/(1 + 3) = 2/4 = 1/2
      $
    ])

  + $lim_(x arrow 1) [3(x^2 + 1) - 2(x - 3)]$
    #solution([
      $
        lim_(x arrow 1) [3(x^2 + 1) - 2(x - 3)] &= 3 [lim_(x arrow 1) (x^2 + 1)] - 2 [lim_(x arrow 1) (x - 3)]\
        &= 3[(lim_(x arrow 1) x)^2 + 1] - 2 [(lim_(x arrow 1) x) - 3]\
        &= 3 dot (1^2 + 1) - 2 (1 - 3)\
        &= 3 dot 2 - 2 dot (-2)\
        & = 10
      $
    ])

  + $lim_(x arrow 2) [(x + 1)(x^2 - 3x + 2)]$
    #solution([
      $
        lim_(x arrow 2) [(x + 1)(x^2 - 3x + 2)] &= [lim_(x arrow 2) (x + 1)] [lim_(x arrow 2) (x^2 - 3x + 2)]\
        &= [(lim_(x arrow 2) x) + 1] [(lim_(x arrow 2) x)^2 - 3 (lim_(x arrow 2) x) + 2]\
        &= (2 + 1) (2^2 - 3 dot 2 + 2)\
        &= 3 dot 0\
        &= 0
      $
    ])

+ *Desafio da aula.* Analise o limite $display(lim_(x arrow 1)) (x^2 - 1)/(x - 1)$.

  #set enum(numbering: "(a)")
  + Por que não podemos aplicar diretamente a propriedade do quociente de limites?
    #solution([
      Ao aplicar diretamente a propriedade do quociente de limites, obtemos uma *forma indeterminada* do tipo $display(0/0)$.
    ])

  + Você consegue imaginar uma corma de "contornar" esse problema? (Dica: pense em fatoração!)
    #solution([
      No caso em questão, podemos fatorar o numerador usando a identidade algébrica de *diferença de quadrados*:

      $ a^2 - b^2 = (a - b)(a + b). $

      Portanto, desde que $x != 1$, temos:

      $
        lim_(x arrow 1) (x^2 - 1)/(x - 1) &= lim_(x arrow 1) (cancel((x - 1)) (x + 1))/cancel(x - 1) = lim_(x arrow 1) (x + 1) = 1 + 1 = 2.
      $

      A figura a seguir mostra o gráfico da função $f(x) = display((x^2 - 1)/(x - 1))$, cujo domínio é $DD = {x in RR| x != 1}$.

      #figure(
        caption: [Gráfico],
        cetz.canvas({
          import cetz.draw: *
          import cetz-plot: *

          let opts = (
            size: (4.5, 4.5), axis-style: "school-book",
            x-tick-step: none, y-tick-step: none,
          )

          plot.plot(..opts, name: "plot", {
            plot.add(
              domain: (-1.25, 2.5),
              style: (stroke: sbm-blue+1.7pt),
              x => (x, (calc.pow(x, 2) - 1)/(x - 1))
            )
            plot.add-anchor("pt", (1, 2))
            plot.add-anchor("pt-x", (1, 0))
            plot.add-anchor("pt-y", (0, 2))

            plot.add-anchor("pt-x0", (0.2, -0.3))
            plot.add-anchor("pt-x1", (0.8, -0.3))

            plot.add-anchor("pt-x3", (1.2, -0.3))
            plot.add-anchor("pt-x4", (1.8, -0.3))

            plot.add-anchor("pt-y0", (-0.25, 1.2))
            plot.add-anchor("pt-y1", (-0.25, 1.8))

            plot.add-anchor("pt-y3", (-0.25, 2.2))
            plot.add-anchor("pt-y4", (-0.25, 2.8))
          })

          
          line("plot.pt-x", "plot.pt", "plot.pt-y", stroke: (dash: "dashed"), name: "ln")
          content("ln.start", [$1$], anchor: "north", padding: 0.2)
          content("ln.end", [$2$], anchor: "east", padding: 0.2)
          circle("plot.pt", radius: 0.12, fill: white, stroke: sbm-blue+1.7pt)

          line("plot.pt-x0", "plot.pt-x1", mark: (end: ">>", fill: sbm-blue), stroke: 0.8pt+sbm-blue)

          line("plot.pt-x4", "plot.pt-x3", mark: (end: ">>", fill: sbm-blue), stroke: 0.8pt+sbm-blue)

          line("plot.pt-y0", "plot.pt-y1", mark: (end: ">>", fill: sbm-blue), stroke: 0.8pt+sbm-blue)

          line("plot.pt-y4", "plot.pt-y3", mark: (end: ">>", fill: sbm-blue), stroke: 0.8pt+sbm-blue)
        })
      )
      Note que no ponto $x = 1$, a função $f$ não está definida. Entretanto, quando $x$ aproxima-se de $1$, $f(x)$ tende ao valor $2$, que corresponde ao limite calculado acima.
    ])


