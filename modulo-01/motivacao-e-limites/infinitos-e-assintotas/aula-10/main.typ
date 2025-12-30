#import "conf.typ": *


#show: conf.with(
  author: [Igo da Costa Andrade],
  curso: [Cálculo Essencial],
  modulo: (
    numero: [1],
    tema: [Superando Limites]
  ),
  secao: [Infinitos e Assíntotas],
  aula: (
    numero: [10],
    tema: [Mais infinitos e Assíntotas]
  )
)

#let opts = (
  size: (5, 5), axis-style: "school-book", 

  x-tick-step: 1, y-tick-step: 1,
  x-grid: true, y-grid: "both",
)

#let line-styles = (stroke: 1.2pt+sbm-blue)
#let mark-styles(fill-color) = (stroke: 1.2pt+sbm-blue, fill: fill-color)

#v(1cm)

+ Determinie as assíntotas verticais da função $f(t) = sec(t)$.
  #solution([
    Lembrando que $sec(t) = 1/cos(t)$, a função $f(t)$ possui pontos de indeterminação nos valores de $t$ para os quais $cos(t) = 0$, ou seja, $f(t)$ não está definida para $t$ tal que:
    $ 
      cos(t) = 0 => t =  (2k + 1) pi/2, " para " k = 0, plus.minus 1, plus.minus 2, plus.minus 3, dots
    $

    #figure()[
      #cetz.canvas({
        import cetz.draw: *
        import cetz-plot: *

        plot.plot(
          size: (12, 6), axis-style: "school-book", 
          x-tick-step: none, y-tick-step: none, 
          {
            for i in range(6) {
              let k = 2*i - 5
              let l0 = (k - 1) * calc.pi/2
              let l1 = k * calc.pi/2
              let l2 = (k + 1) * calc.pi/2
              plot.add(
                samples: 100,
                domain: (l0, l1 - 0.2),
                x => 1/calc.cos(x),
                style: line-styles
              )
              plot.add(
                samples: 100,
                domain: (l1 + 0.2, l2),
                x => 1/calc.cos(x),
                style: line-styles
              )
              plot.annotate({
                line((k * calc.pi/2, 5), (k * calc.pi/2, -5), stroke: (dash: "dashed", paint: sbm-green))
                line((k * calc.pi/2, .2), (k * calc.pi/2, -.2), name: "tick")
                
                if k==1 {
                  content("tick.end", [#text(size: 10pt)[$display(pi/2)$]], anchor: "south", padding: "0.4", frame: "rect", stroke: none, fill: white)
                } else if k == -1 {
                  content("tick.end", [#text(size: 10pt)[$display(-pi/2)$]], anchor: "south", padding: "0.4", frame: "rect", stroke: none, fill: white)
                } else if calc.abs(k) > 0 {
                  content("tick.end", [#text(size: 10pt)[$#k display(pi/2)$]], anchor: "south", padding: "0.4", frame: "rect", stroke: none, fill: white)
                }
                
              })
            }
          }
        )
      })
    ]
  ])

+ Calcule os limites abaixo:
  #set enum(numbering: "(a)")
  + $display(lim_(x -> +infinity) ("sen" x)/x)$
    #solution([
      Partimos do fato de que a função $"sen" x$ é limitada:
      $
        -1 <= "sen" x <= 1
      $
      Como estamos tomando o limite $x$ tendendo a $+ infinity$, podemos multipliicar a desigualdade acima por $1\/x$ sem alterar o sentido das desigualdades:
      $
        -1 dot 1/x <= "sen" x dot 1/x <= 1 dot 1/x => -1/x <= ("sen" x)/x <= 1/x
      $
      Finalmente, tomamos o limite $x -> +infinity$ dos três termos na desigualdade:
      $
        lim_(x -> + infinity) (-1/x) <= lim_(x -> + infinity) ("sen" x)/x <= lim_(x -> + infinity) 1/x\
        0 <= lim_(x -> + infinity) ("sen" x)/x <= 0
      $
      Pelo teorema do confronto, 
      $
        lim_(x -> + infinity) ("sen" x)/x = 0
      $
    ])
  + $display(lim_(x -> -infinity) (x^2 + cos x)/(x^2 - 1))$
    #solution([
      $
        lim_(x -> -infinity) (x^2 + cos x)/(x^2 - 1) &= lim_(x -> -infinity) (cancel(x^2)(1 + display((cos x)/x^2)))/(cancel(x^2)(1 - display(1/x^2))) = (1 + display(lim_(x -> - infinity) (cos x)/x^2))/(1 - display(lim_(x -> -infinity)1/x^2 ))\
        &= 1 + lim_(x -> -infinity) (cos x)/x^2
      $
      O último limite pode ser demonstrado lembrando que a função $cos x$ é limitada. 
      $
        -1 <= cos x <= 1 &=> -1 dot (1/x^2) >= cos x dot (1/x^2) >= 1 dot (1/x^2) \
          &=> - 1/x^2 >= (cos x)/x^2 >= 1/x^2\
          &=> lim_(x -> -infinity) (- 1/x^2) >= lim_(x -> -infinity) (cos x)/x^2 >= lim_(x -> -infinity) 1/x^2\
          &=> 0 >=  lim_(x -> -infinity) (cos x)/x^2 >=0 
      $ 

      
      Pelo teorema do confronto, 
      $
        lim_(x -> - infinity) (cos x)/x = 0.
      $
      Portanto, 
      $
        lim_(x -> -infinity) (x^2 + cos x)/(x^2 - 1) = 1 + lim_(x -> -infinity) (cos x)/x^2 = 1
      $
    ])

  + $display(lim_(x -> -infinity) sqrt(x^2 + "sen" x)/x)$
    #solution([
      $
        lim_(x -> -infinity) sqrt(x^2 + "sen" x)/x &= lim_(x -> -infinity) sqrt(x^2 (1 + display(("sen" x)/x^2)))/x = lim_(x -> - infinity) (sqrt(x^2) sqrt(1 + display(("sen" x)/x^2)))/x\
        &= lim_(x -> - infinity) (|x| sqrt(1 + display(("sen" x)/x^2)))/x = lim_(x -> - infinity) (-cancel(x) sqrt(1 + display(("sen" x)/x^2)))/cancel(x)\
        &= lim_(x -> - infinity)  sqrt(1 + display(("sen" x)/x^2))\ 
        &= sqrt(1 + 0)\
        & = 1 
      $
      A desmonstração de que $display(lim_(x -> -infinity) ("sen" x)/x^2) = 0$ é idêntica ao caso $display(lim_(x -> -infinity) (cos x)/x^2)$ mostrado no item anterior.
    ])

+ Resolva os problemas abaixo:
    #set enum(numbering: "(a)")
    + A velocidade de um paraquedista é dada por $v(t) = 60(1 - e^(-0,2 t))$ m/s. Qual é a velocidade terminal?
      #solution([
        $
          v_t = lim_(t -> +infinity) v(t) &= lim_(t -> + infinity) 60(1 - e^(-0,2 t)) = 60 "m/s"
        $
      ])

    + A carga de um capacitor é dada por $Q(t) = 500 (1 - e^(-t/5))$ $mu"C"$. Qual é a carga final do capacitor?
      #solution([
        $
          Q_"final" = lim_(t -> + infinity) Q(t) = lim_(t -> + infinity) 500 (1 - e^(-t/5)) = 500 " "mu"C"
        $
      ])
    
    + Em um movimento mass-mola amortecido, a posição é dada por $x(t) = 3e^(-0.1t) cos(2t)$ cm. Qual é a posição limite quanto $t -> + infinity$?
      #solution([
        $
          x_"limite" = lim_(t -> +infinity) x(t) &= lim_(t -> +infinity) 3e^(-0.1t) cos(2t)
        $
        Para resolver o limite acima, lembremos que a função cosseno é limitada. Então,
        $
          -1 <= cos(2t) <= 1 &=> -1 dot (3e^(-0,1t)) <= cos(2t) dot (3e^(-0,1t)) <= 1 dot (3e^(-0,1t))\
          &=> - 3e^(-0,1t) <= 3e^(-0,1t) cos(2t)  <= 3e^(-0,1t)\
          &=> lim_(t -> +infinity) (- 3e^(-0,1t)) <= lim_(t -> +infinity) 3e^(-0,1t) cos(2t) <= lim_(t -> +infinity) 3e^(-0,1t)\
          &= 0 <= lim_(t -> +infinity) 3e^(-0,1t) cos(2t) <= 0
        $
        Pelo teorema do confronto, $display(lim_(t -> +infinity) 3e^(-0,1t) cos(2t)) = 0$. Portanto, $x_"limite" = 0 " cm"$.
      ])

+ Calcule os limites abaixo:
  #set enum(numbering: "(a)")
  + $display(lim_(x -> +infinity) e^(-2x))$
    #solution([
      $
        lim_(x -> +infinity) e^(-2x) = lim_(x -> +infinity) 1/e^(2x) = 0
      $
    ])

  + $display(lim_(x -> +infinity) ln x)$
    #solution([
      Seja $f(x) = e^x$ e a inversa $f^(-1)(x) = ln x$. Sabemos que:
      #figure()[
        #cetz.canvas({
          import cetz.draw: *

          content((0, 0), [$ lim_(x -> #text(red)[$+infinity$]) e^x = #text(blue)[$+infinity$]  ==> lim_(x -> #text(blue)[$+infinity$]) ln x = #text(red)[$+infinity$] $])

          line((-.8, -0.1), (-.8, -1), (1, -1), (1, -0.3), stroke: blue, mark: (end: ">>", fill: blue))

          line((-2.55, -0.3), (-2.55, -1.5), (3, -1.5), (3, -0.1),  stroke: red, mark: (end: ">>", fill: red))
        })
      ]
    ])

  + $display(lim_(x -> +infinity) "arctan" x)$
    #solution([
      Seja $f(x) = tan x$ e a inversa $f^(-1)(x) = "arctan" x$. Sabemos que:
      #figure()[
        #cetz.canvas({
          import cetz.draw: *

          content((0, 0), [$ lim_(x -> #text(red)[$+pi\/2$]) tan x = #text(blue)[$+infinity$]  ==> lim_(x -> #text(blue)[$+infinity$]) "arctan" x = #text(red)[$+ pi/2$] $])

          line((-.84, -0.1), (-.84, -1), (1.15, -1), (1.15, -0.4), stroke: blue, mark: (end: ">>", fill: blue))

          line((-3.2, -0.5), (-3.2, -1.5), (4, -1.5), (4, -0.4),  stroke: red, mark: (end: ">>", fill: red))
        })
      ]
    ])

  + $display(lim_(x -> +infinity) "arccotg" x)$
    #solution([
      Seja $f(x) = "cotg" x$ e a inversa $f^(-1)(x) = "arccotg" x$. Sabemos que:
      #figure()[
        #cetz.canvas({
          import cetz.draw: *

          content((0, 0), [$ lim_(x -> #text(red)[$0^+$]) "cotg" x = #text(blue)[$+infinity$]  ==> lim_(x -> #text(blue)[$+infinity$]) "arccotg" x = #text(red)[$0$] $])

          line((-.75, -0.1), (-.75, -1), (1.2, -1), (1.2, -0.3), stroke: blue, mark: (end: ">>", fill: blue))

          line((-3.35, -0.4), (-3.35, -1.5), (3.82, -1.5), (3.82, -0.1),  stroke: red, mark: (end: ">>", fill: red))
        })
      ]
    ])

+ Determine todas as assíntotas (verticais e horizontais) das funções abaixo:
  #set enum(numbering: "(a)")
  + $f(x) = display(2e^x)/(e^x + 1)$
    #solution([])

  + $g(x) = display((x^2 - 1)/(x^3 + x))$
    #solution([])
  