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
    #let x0 = 0.5/calc.pi


      #figure()[
        #cetz.canvas({
          import cetz.draw: *
          import cetz-plot: *

          plot.plot(size: (8, 8), axis-style: "school-book", x-tick-step: none, y-tick-step: none,   
          legend: (4.1, 8),
          legend-style: (stroke: 0.2pt+sbm-blue, fill: sbm-blue.transparentize(95%)),      
          {
            plot.add(domain: (-x0, x0), x => g(x), style: (stroke: (dash: "dashed", paint: sbm-green, thickness: 1.5pt)), label: [$plus.minus x^2$])
            plot.add(domain: (-x0, x0), x => h(x), style: (stroke: (dash: "dashed", paint: sbm-green, thickness: 1.5pt)))

            plot.add(samples: 1000, domain: (-x0, x0), x=> f(x), style: (stroke: (1pt+sbm-blue)), label: [$x^2 "sen"(1\/x)$])
          })
        })
      ]
    ])

+ *Sobre o limite trigonométrico fundamental.*
  #set enum(numbering: "(a)")
  + Explique por que não podemos calcular diretamente $display(lim_(x -> 0) ("sen" x)/x)$ usando as propriedades de limites.

    #solution([
      Inicialmente, observemos que não podemos meramente substituir o valor $x = 0$ na expressão $display(("sen" x)/x)$ por issoresulta em uma indeterminação de tipo $0\/0$. A mesma indeterminação aparece caso seja aplicada a propriedade do *quociente* de limites.

      Além disso, dado que $"sen" x$ é uma função _transcendente_ -- isto é, não satisfaz nenhuma equação polinomial -- não é possível fatorar a expressão $display(("sen" x)/x)$ de modo a de eliminar a causa da indeterminação por simplificação algébrica.
      
      Portanto, o cálculo desse limite exige métodos adicionais, como argumentos geométricos ou resultados específicos sobre a função seno, não sendo acessível apenas pelas propriedades algébricas dos limites.
    ])

  + Usando a interpretação geométrica, explique como o teorema do confronto pode ser usado para provar que $display(lim_(x -> 0) ("sen" x)/x) = 1$. (Dica: Para $0 < x < pi\/2$, compare as áreas do triângulo, setor circular e triângulo maior no círculo uniário.)

    #solution([
      Dado o círculo trigonométrico abaixo:

      #figure()[
        #cetz.canvas({
          import cetz.draw: *

          let raio = 1
          let x = 50deg 

          let cos-ax = 1.5 * raio
          let sen-ax = 1.5 * raio
          let tan-ax = 1.8 * raio
          
          let cosx = raio * calc.cos(x)
          let senx = raio * calc.sin(x)
          let tanx = raio * calc.tan(x)

          let O = (0, 0)
          let A = (cosx, senx)
          let B = (raio, 0)
          let C = (raio, tanx)



          // =========================
          // Escala
          scale(300%)
          // =========================
          
          content((0, tan-ax), [*Círculo Trigonométrico*])

          // =========================
          // Eixos
          // =========================
          // Eixo Cosseno
          line((- cos-ax, 0), (cos-ax, 0), mark: (end: ">>", fill: black))
          content((cos-ax, 0), [$cos$], anchor: "north-east", padding: 0.2)
          // -------------------------
          // Eixo Seno
          line((0, - sen-ax), (0, sen-ax), mark: (end: ">>", fill: black))
          content((0, sen-ax), [$"sen"$], anchor: "east", padding: 0.2)
          // -------------------------
          // Eixo Tangente
          line((raio, - tan-ax), (raio, tan-ax), mark: (end: ">>", fill: black))
          content((raio, tan-ax), [$"tg"$], anchor: "west", padding: 0.2)
          // =========================
          // 
          // =========================
          // Círculo Unitário
          // =========================
          circle(O, radius: raio)
          // =========================

          // =========================
          // Medida do ângulo
          // =========================
          arc((0.3 * raio, 0), radius: 0.3 * raio, start: 0deg, delta: x, mode: "PIE", stroke: none, fill: color.mix((sbm-blue, 50%), white))
          content((0.4 * raio * calc.cos(x/2), 0.4 * raio * calc.sin(x/2)), [$x$])
          // =========================

          // =========================
          // Marcações de
          // Seno, Cosseno e Tangente
          // =========================
          // Seno
          line(O, (0, A.at(1)), stroke: 2pt+sbm-green, name: "ln-sen")
          content("ln-sen.mid", [$"sen" x$], angle: 90deg, anchor: "south", padding: 0.2)
          // -------------------------
          // Cosseno
          line(O, (A.at(0), 0), stroke: 2pt+sbm-green, name: "ln-cos")
          content("ln-cos.mid", [$cos x$], anchor: "north", padding: 0.1)
          // -------------------------
          // Tangente
          line(B, C, stroke: 2pt+sbm-green, name: "ln-tan")
          content("ln-tan.mid", [$"tg" x$], angle: 90deg, anchor: "north", padding: 0.1)
          // =========================

          // =========================
          // Pontos e Linhas 
          // de orientação
          // =========================
          line((A.at(0), 0), A, (0, A.at(1)), stroke: (dash: "dashed"))
          // -------------------------
          line(O, C)
          line(A, B)
          // -------------------------
          arc(B, radius: raio, start: 0deg, delta: x, stroke: 2.5pt+sbm-blue)
          // -------------------------
          circle(O, radius: 0.8pt, fill: black)
          content(O, [O], anchor: "north-east", padding: 0.1)
          // -------------------------
          circle(A, radius: 0.8pt, fill: black)
          content(A, [A], anchor: "south", padding: 0.25)
          // -------------------------
          circle(B, radius: 0.8pt, fill: black)
          content(B, [B], anchor: "south-west", padding: 0.1)
          // -------------------------
          circle(C, radius: 0.8pt, fill: black)
          content(C, [C], anchor: "south-west", padding: 0.1)
          // =========================
        })
      ]

        #let triangle = polygon.regular(fill: sbm-blue.lighten(80%), stroke: sbm-blue)
        #let sector = cetz.canvas({
          import cetz.draw: *
          arc((0, 12pt), radius: 12pt, start: 0deg, delta: 45deg, mode: "PIE", fill: sbm-blue.lighten(80%), stroke: sbm-blue)
        })

        Consideremos as seguintes áreas:
        $
          cases(
            "Área do triângulo OAB:" &#triangle ("OAB") &= display((1 dot "sen" x)/x) &= display(("sen" x)/x),
            "Área setor OAB:" &#sector ("OAB") &= display(x/(2pi)) dot (pi dot 1^2) &= display(x/2),
            "Área do triângulo OBC:" &#triangle ("OBC") &= display((1 dot "tg" x)/2) &= display(("tg" x)/2)
          )
        $

        $
          #triangle ("OAB") < #sector ("OAB") < #triangle ("OBC") &=> 
          ("sen" x)/2 < x/2 < ("tg" x)/2  #h(0.25cm) (times 2/("sen" x)) \
          & => 1 < x/("sen" x) < 1/(cos x) \
          & => cos x < ("sen" x)/x < 1
        $

        Observemos que $display(lim_(x -> 0) cos x) = display(lim_(x -> 0) 1 = 1)$. Portanto, pelo teorema do confronto, $ display(lim_(x -> 0) ("sen" x)/x) = 1. $
        O gráfico abaixo ilustra esse fato:

        #figure()[
          #cetz.canvas({
            import cetz.draw: *
            import cetz-plot: *

            plot.plot(size: (8, 4), x-tick-step: none, y-tick-step: none, axis-style: "school-book", 
            legend: (4.6, 1.2), 
            legend-style: (stroke: 0.2pt+sbm-blue, fill: sbm-blue.lighten(95%)), 
            {
              plot.add(domain: (-2*calc.pi, 2*calc.pi), x => 1, style: (stroke: (dash: "dotted", paint: sbm-green, thickness: 1.2pt)), label: [#text(size: 10pt)[$g(x) = 1$]])
              plot.add(domain: (-2*calc.pi, 2*calc.pi), x => calc.cos(x), style: (stroke: (dash: "dashed", paint: sbm-green)), label: [#text(size: 10pt)[$h(x) = cos x$]])
              plot.add(domain: (-2*calc.pi, 2*calc.pi), x => calc.sin(x)/x, style: (stroke: (paint: sbm-blue, thickness: 1pt)), label: [#text(size: 10pt)[$f(x) = "sen" x\/x$]])

              plot.annotate({
                content((-0.3, 1.2), [$1$])
              })

              
              
            })
          })
        ]
    ])