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
    numero: [06],
    tema: [Regras Básicas de Derivação]
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

+ Calcule as derivadas das seguintes funções polinomiais:
  #set enum(numbering: "(a)")
  + $f(x) = 3x^4 - 2x^3 + 5x - 7$
    #solution([
      $
        f'(x) &= 3 dot (x^4)' - 2 dot (x^3)' + 5 dot (x)' - 7 dot (1)'\
        &= 3 dot (4x^3) - 2 dot (3x^2) + 5 dot 1 - 7 dot 0\
        &= 12x^3 - 5x^2 + 5
      $
    ]) 

  + $g(x) = x^5 + 4x^2 - 3x + 1$
    #solution([
      $
        g'(x) &= (x^5)' + 4 dot (x^2)' - 2 dot (x)' + 1 dot (1)'\
        &= 5x^4 + 4 dot (2x) - 2 dot 1 + 1 dot 0\
        &= 5x^4 + 8x - 2
      $
    ])

  + $h(x) = 2x^3 - x^2 + 6$. Calcule também $h''(x)$ e $h'''(x)$.
    #solution([
      #set text(size: 11pt)
      #grid(
        columns: 3,
        gutter: 10pt,
        align: center+horizon,
        [
          $
            h'(x) &= 2 dot (x^3)' - (x^2)' + 6 dot (1)'\
            &= 2 dot (3x^2) - (2x) + 6 dot 0\
            &= 6x^2 - 2x
          $
        ],
        [
          $
            h''(x) &= 6 dot (x^2)' - 2 dot (x)'\
            &= 6 dot (2x) - 2 dot 1\
            &= 12 x - 2
          $
        ],
        [
          $
            h'''(x) &= 12 dot (x)'- 2 dot (1)'\
            &= 12 dot 1 - 2 dot 0\
            &= 12
          $
        ]
      )





    ])

+ Use a regra do produto para calcular as derivadas das seguintes funções:
  #set enum(numbering: "(a)")
  + $f(x) = (x^2 + 1)(x^3 - 2x)$

    #solution([
      #set text(size: 11pt)
      $
        f'(x) &= (x^2 + 1)' dot (x^3 - 2x) + (x^2 + 1) dot (x^3 - 2x)'\
        &= (2x) dot (x^3 - 2x) + (x^2 + 1) dot (3x^2 - 2)\
        &= 2x^4  - 4x^2 + 3x^4 - 2x^2 + 3x^2 - 2\
        &= 5x^4 -3x^2 - 2
      $
    ])

  + $g(x) = sqrt(x) (x^2 + 3x - 1)$
    #solution([
      #set text(size: 11pt)
      $
        g'(x) &= (sqrt(x))' dot (x^2 + 3x - 1) + sqrt(x) dot (x^2 + 3x - 1)'\
        &= (x^(1\/2))' dot (x^2 + 3x - 1) + (x^(1\/2)) dot (x^2 + 3x - 1)'\
        &= (1/2 x^(-1\/2)) dot (x^2 + 3x -1) + x^(1\/2) dot (2x + 3)\
        &= (1/2 x^(-1\/2)) [(x^2 + 3x - 1 ) + 2x dot (2x + 3)]\
        &= (1/2 x^(-1\/2)) (x^2 + 3x - 1 + 4x^2 + 6x)\
        &= (1/2 x^(-1\/2)) (5x^2 + 9x - 1)\
        &= (5x^2 + 9x -1)/(2 sqrt(x))
      $
    ])

    \ \ \ \ \

  + $h(x) = (2x-5) (x^4 + x^2)$
    #solution([
      #set text(size: 11pt)
      $
        h'(x) &= (2x - 5)' dot (x^4 + x^2) + (2x-5) dot (x^4 + x^2)'\
        &= 2 dot (x^4 + x^2) + (2x+ 5) dot (4x^3 + 2x)\
        &= 2x^4 + 2x^2 + 8x^4 + 4x^2 + 4x^3 + 10x\
        &= 10x^4 + 4x^3 + 6x^2 + 10x
      $
    ])

+ Use a regra do quociente para calcular as derivadas das seguintes funções racionais:

  #set enum(numbering: "(a)")
  + $f(x) = display((x^2 + 1)/(x - 2))$
    #solution([
      $
        f'(x) &= ((x^2 + 1)' (x - 2) - (x^2 + 1) (x - 2)')/(x - 2)^2 = (2x (x - 2) - (x^2 + 1))/(x - 2)^2\
        &= (2x^2 - 4x - x^2  - 1)/(x - 2)^2 = (x^2 - 4x - 1)/(x-2)^2 = (x^2 - 4x + 1 - 2)/(x - 2)^2 = ((x - 2)^2 - 2)/(x - 2)^2\
        &= 1 - 2/(x - 2)^2

      $
    ])

  + $g(x) = display((2x^3 - x)/(x^2 + 3))$
    #solution([
      $
        g'(x) &= ((2x^3 - x)' dot (x^2 + 3) - (2x^3 - x ) dot (x^2 + 3)')/(x^2 + 3)^2\
        &= ((6x^2 - 1) dot (x^2 + 3) - (2x^3 - x) dot (2x))/(x^2 + 3)^2\
        &=  ((6x^4 + 18x^2 - x^2 - 3) - (4x^4 - 2x^2))/(x^2 + 3)^2\
        &= (2x^4 + 19x^2 - 3)/(x^2 + 3)^2
      $
    ])

  + $h(x) = display((x + 1)/sqrt(x))$ 
    #solution([
      $
        h'(x) &= ((x + 1)' dot sqrt(x) - (x + 1) dot (sqrt(x))')/(sqrt(x))^2 =  (1 dot sqrt(x) - (x + 1) dot (x^(1\/2))')/x^2\
        &= (sqrt(x) - (x + 1) dot display((1/2 x^(-1\/2))))/x^2 = display(sqrt(x) - (x + 1)/(2 sqrt(x)) )/x^2 \
        &= (2x - (x + 1))/(2x sqrt(x)) = (x - 1)/(2x sqrt(x))\
        &= (x - 1) / (2 x^(3\/2))
      $
    ])

+ Calcule as derivadas das seguintes dunções usando as regras apropriadas:
  #set enum(numbering: "(a)")
  + $f(x) = x^3 + 2/x - sqrt(x)$
    #solution([
      #set text(size: 11pt)
      $
        f'(x) &= (x^3)' + 2 dot (x^(-1))' - (x^(1\/2))' =  3x^2 - 2 dot (-x^(-2)) - (1/2 x^(-1\/2)) = 3x^2 + 2/x^2 - 1/(2sqrt(x))
      $

    ])

  + $g(x) = (x^2 - 1) display((1/x + 2))$
    #solution([
      $
        g'(x) &= (x^2 - 1)' dot (1/x + 2) + (x^2 - 1) dot (1/x + 2)'\
        &= (2x) dot (1/x + 2) + (x^2 - 1) dot (-1/x^2) = (2x + 4x^2)/x - (x^2 - 1)/x^2\
        &= (2x^2 + 4x^3)/x^2 - (x^2 - 1)/x^2 = (2x^2 + 4x^3 - x^2 + 1)/x^2 = (4x^3 + x^2 + 1)/x^2\
        &= 4x + 1 + 1/x^2
      $
    ])

  + $h(x) = display((x^3 - 2x^2 + x)/x^2)$
    #solution([
      $
        h(x) = display((x^3 - 2x^2 + x)/x^2) = x - 2 + 1/x => h'(x) = 1 - 1/x^2
      $
    ])

  + $p(x) = display(sqrt(x) dot (x + 1)/(x - 1))$
    #solution([
      $
        p'(x) &= (sqrt(x))' dot ((x + 1)/(x - 1)) + sqrt(x) dot ((x + 1)/(x - 1))'\
        &= (1/(2 sqrt(x))) dot ((x + 1)/(x - 1)) + sqrt(x) dot [((x + 1)' dot (x - 1) - (x + 1) dot (x - 1)')/(x - 1)^2]\
        &= 1/(2 sqrt(x)) dot (x + 1)/(x - 1) + sqrt(x) dot [((x - 1) - (x + 1))/(x - 1)^2] = 1/(2 sqrt(x)) dot (x + 1)/(x - 1) - sqrt(x) dot (2)/(x - 1)^2\
        &= ((x + 1) (x - 1) - 4x)/(2 sqrt(x)(x - 1)^2)\
        &= (x^2 - 4x - 1)/(2 sqrt(x) (x - 1)^2)
      $
    ])
