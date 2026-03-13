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

+ Dado um comprimento $P$, determinar o número de lados do polígono regular com perímetro $P$ e maior área.

  #solution([

Seja $n$ a quantidade de lados do polígono. Então, cada lado mede $l = display(P/n)$. Consideremos o triângulo isósceles central $alpha = display((2pi) /n)$, tal como mostrado na figura abaixo.


#align(center)[
  #cetz.canvas({
    import cetz.draw: *

    circle((0,0), radius: 3, stroke: (dash: "dashed"))
    circle((0,0), radius: 0.05, fill: black)

    arc((1 * calc.cos(255deg), 1 * calc.sin(255deg)), radius: 1, start: 255deg, delta: 30deg, mode: "PIE", stroke: none, fill: gray)

    
    

    line((0, 0), (3 * calc.cos(255deg), 3 * calc.sin(255deg)), (3 * calc.cos(285deg), 3 * calc.sin(285deg)), (0, 0), stroke: 0.5pt)

    content((0, -1), [$alpha$], anchor: "north")

    content((0, -3), [$l$], anchor: "north", padding: 0.2)

    content((1.5 * calc.cos(255deg), 1.5 * calc.sin(255deg)), [$R$], anchor: "east", padding: 0.2)

  })
]

Ainda de acordo com a figura acima, o polígono está inscrito em uma circunferência de raio $R$, tal que:

$
  "sen"(alpha/2) = (l\/2) / R => R = l / (2 "sen"(alpha\/2))
$

Por outro lado, a altura do triângulo mede $h$, tal que:
$
tan(alpha/2) = (l\/2)/h => h = l/2 cot(alpha\/2)
$

A área desse triângulo é:

$
a = 1/2 dot l h => a(n) = l^2/4 cot(alpha\/2) = P^2/(4n^2) cot(pi\/n)
$

Finalmente, a área total do polígono é:

$
A(n) = n dot a(n) => A(n) =  P^2/(4n) cot(pi\/n)
$



#let A(n) = (1/(4*n)) / calc.tan(calc.pi / n)

#let points = range(3, 21).map(n => (n, A(n)))


#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    import cetz-plot: *

    set-style(
      grid: (stroke: (dash: "dashed"))
    )

    plot.plot(
      size: (8, 5),
      axis-style: "school-book",
      x-min: 0, y-min: 0, 
      y-tick-step: 0.01,
      y-max: 0.08,
      x-label: $n$, y-label: $A(n)$,
      x-grid: true, y-grid: "both",
      {
        plot.add(
          domain: (0.01, 20),
          x => A(x),
          style: (stroke: (dash: "dashed", paint: blue))
        )
        plot.add(
          points, 
          mark: "o",
          mark-style: (fill: blue, stroke: blue),
          mark-size: 4pt,
          style: (stroke: none)
        )
      }
    )
  })
]

O gráfico acima indica que $A_(n)$ possui um _assíntota_ horizontal para $n -> infinity$. Para demonstrar esse fato, façamos a seguinte mudança de variável. Seja $t = display(pi/n)$. Então,

$
  A(t) = P^2/(4 pi) dot t cot(t)
$

Assim, $ lim_(n -> infinity) A(n) = lim_(t -> 0) A(t) $

Para determinarmos esse último limite, consideremos a desigualdade trigonométrica:

$
  "sen" t < t < tan t &=> 1 < t/ ("sen" t) < 1/(cos t)\
    &=> cos t < t dot (cos t)/("sen"t) < 1\
    &=> cos t < t cot t < 1\
    &=> P^2 /(4 pi) cos t < P^2 /(4 pi) t cot t < P^2 /(4 pi)\
    &=> P^2 /(4 pi) cos t < A(t) < P^2 /(4 pi)\
    &=> lim_(t -> 0) P^2 /(4 pi) cos t < lim_(t -> 0) A(t) < lim_(t -> 0) P^2 /(4 pi)\
    &=> P^2 /(4 pi) < lim_(t -> 0) A(t) < P^2 /(4 pi)\
$

Pelo _*Teorema do Confronto*_,

$
  lim_(t -> 0) A(t) = P^2 /(4 pi) => lim_(n -> infinity) A(n) = P^2 /(4 pi)
$

Resta provar que $A(n)$ é estritamente crescente. Para tanto, apliquemos o teste da derivada:

$
  A(n) = P^2/(4 n) cot(pi/n) &=> A^prime (n) = -P^2 /(4 n^2) cot(pi/n) - P^2 /(4 n) (- pi/n^2) "cosec"^2 (pi/n) \
  &=> A^prime (n) = P^2 / (4 n^2) [pi/n "cosec"^2 (pi/n) - cot(pi/n)]\
  &=> A^prime (n) = (P/(2n))^2 [(pi/n) 1/("sen"^2 (pi\/n)) - (cos (pi\/n))/("sen"(pi\/n))]\
  &=> A^prime (n) = (P/(2n))^2 [((pi\/n) - "sen"(pi\/n) cos (pi\/n))/("sen"^2(pi\/n))]
$

Note que para qualquer $t > 0$ vale a desigualdade:

$
  "sen" t < t => "sen" t cos t < t cos t < t
$

Logo, $display((pi\/n) - "sen"(pi\/n) cos (pi\/n) > 0)$ para todo $n >= 3$. Como os demais termos de $A^prime (n)$ estão elevados ao quadrado, concluímos que $A^prime (n) > 0$ para todo $n >= 3$. Isso prova que $A(n)$ é estritamente crescente.

Finalmente, como $A(n)$ é estritamente crescente e possui limite

$
lim_(n -> infinity) A(n) = P^2 (4 pi),
$

seque que as áreas dos polígonos regulares de perímetro $P$ aproximam-se desse valor à medida que o número de lados cresce. Quando $n -> infinity$, o polígono regular tende a uma circunferência. Observando que uma circunferência de perímetro $P$ possui área

$
  A = P^2 / (4 pi)
$

concluímos que entre todas as figuras planas com perímetro fixo $P$, a circunferência é a que possui a maior área.


  ])