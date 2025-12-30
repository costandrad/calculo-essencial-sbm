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
    numero: [09],
    tema: [Limites no Infinito]
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

+ Defina matematicamente o que significa $display(lim_(x -> +infinity)) f(x) = L$, onde $L$ é um número real.

  #solution([
    Significa dizer que para todo $epsilon > 0$, existe um número real $M$ tal que, para todo $x > M$, vale:
    $
      |f(x) - L| < epsilon
    $
    Em palavras, podemos tomar valores de $f(x)$ tão próximos de $L$ quanto quisermos, desde que escolhamos $x$ suficientemente grande.
  ])

+ Calcule os limites abaixo:
  #set enum(numbering: "(a)")
  + $display(lim_(x -> + infinity) (1 + 1/x))$
    #solution([
      $
        lim_(x -> + infinity) (1 + 1/x) = 1 + lim_(x -> +infinity) 1/x = 1 + 0 = 1
      $
    ])

  + $display(lim_(x -> + infinity)  (3x+1)/(2x-5)  )$
    #solution([
      $
        lim_(x -> +infinity) (3x+1)/(2x-5) = lim_(x -> +infinity) (cancel(x)(3 + 1/x))/(cancel(x)(2 - 5/x)) = 3/2
      $
    ])

  + $display(lim_(x -> - infinity)   (x^2 - 3x + 1)/(2x^2 + x) )$
    #solution([
      $
        lim_(x -> -infinity) (x^2 + 2x - 1)/(2x^2 + x) = lim_(x -> -infinity) (cancel(x^2)(1 - 3/x + 1/x^2))/(cancel(x^2)(2 + 1/x)) = 1/2
      $
    ])

  + $display(lim_(x -> + infinity)   (x^3 + 2x - 1)/(x^2 + 1) )$
    #solution([
      $
        lim_(x -> + infinity) (x^3 + 2x - 1)/(x^2 + 1) = lim_(x -> +infinity) (cancel(x^2)(x + 2/x - 1/x^2))/(cancel(x^2)(1 + 1/x^2)) = + infinity
      $
    ])

  + $display(lim_(x -> + infinity)  (2x - 1)/(x^2 + 3)  )$
    #solution([
      $
        lim_(x -> + infinity) (2x - 1)/(x^2 + 3) = lim_(x -> +infinity) (cancel(x^2)(2/x - 1/x^2))/(cancel(x^2)(1 + 3/x^2)) = 0/1 = 0
      $
    ])

  + $display(lim_(x -> + infinity)   sqrt(x^2 + 1)/(x + 2) )$
    #solution([
      $
        lim_(x -> +infinity) sqrt(x^2 + 1)/(x + 2) &= lim_(x -> +infinity) (sqrt(x^2 (1 + 1/x^2)))/(x (1 + 2/x)) = lim_(x -> +infinity) (sqrt(x^2)sqrt(1 + 1/x^2))/(x (1 + 2/x)) = lim_(x -> +infinity) (|x|sqrt(1 + 1/x^2))/(x (1 + 2/x))
      $
      Lembremos que 
      $
        |x| = cases(
          &x\, "se" x >= 0,
          -&x\, "se" x < 0
        )
      $
      Como estamos tomando o limite $x -> + infinity$, então vale $|x| = x$. Portanto,
      $
        lim_(x -> +infinity) sqrt(x^2 + 1)/(x + 2) = lim_(x -> +infinity) (cancel(x)sqrt(1 + 1/x^2))/(cancel(x) (1 + 2/x)) = sqrt(1)/1 = 1
      $
    ])

+ Determine todas as assíntotas horizontais das funções abaixo:
  #set enum(numbering: "(a)")
  + $f(x) = display((2x + 3)/(x - 1))$
    #solution([
      $
        L_1 &= lim_(x -> -infinity) (2x + 3)/(x - 1) = lim_(x -> -infinity) (cancel(x)(2 + 3/x))/(cancel(x)(1 - 1/x)) = 2/1 = 2\ 
        L_2 &= lim_(x -> +infinity) (2x + 3)/(x - 1) = lim_(x -> -infinity) (cancel(x)(2 + 3/x))/(cancel(x)(1 - 1/x)) = 2/1 = 2
      $
      Logo, a reta $y = 2$ é um assíntota horizontal.
    ])

  + $g(x) = display((x^2 + 1)/(x^2 - 4))$
    #solution([
      $
        L_1 &= lim_(x -> -infinity) (x^2 + 1)/(x^2 - 4) = lim_(x -> -infinity) (cancel(x^2)(1 + 1/x^2))/(cancel(x^2)(1 - 4/x^2)) = 1/1 = 1\ 
        L_2 &= lim_(x -> +infinity) (x^2 + 1)/(x^2 - 4) = lim_(x -> +infinity) (cancel(x^2)(1 + 1/x^2))/(cancel(x^2)(1 - 4/x^2)) = 1/1 = 1
      $ 

      Logo, a reta $y = 1$ é um assíntota horizontal.
    ])

  + $h(x) = display((3x)/(x^2 + 1))$
    #solution([
      $
        L_1 &= lim_(x -> -infinity) (3x)/(x^2 + 1) = lim_(x -> -infinity) (cancel(x^2) dot 3/x)/(cancel(x^2) (1 + 1/x^2)) = 0/1 = 0\ 
        L_2 &= lim_(x -> +infinity) (3x)/(x^2 + 1) = lim_(x -> +infinity) (cancel(x^2) dot 3/x)/(cancel(x^2) (1 + 1/x^2)) = 0/1 = 0
      $
      Logo, a reta $y = 0$ (eixo-x) é um assíntota horizontal.
    ])
 