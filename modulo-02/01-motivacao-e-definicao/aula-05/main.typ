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
    numero: [05],
    tema: [Derivadas de Potências]
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

+ Calcule as derivadas das seguintes funções usando a definição de derivada:

  #set enum(numbering: "(a)")
  + $f(x) = x^2$

    #solution([
      $
        f^prime (x) &= lim_(h -> 0) (f(x + h) - f(x))/h = lim_(h -> 0)((x + h)^2 - x^2)/h = lim_(h -> 0) ((x^2 - 2x h + h^2) - x^2)/h\
        &= lim_(h -> 0) (2x h + h^2) / h = lim_(h -> 0) (cancel(h) (2x + h))/cancel(h) = lim_(h -> 0) (2x + h)\
        &= 2x
      $
    ])

  + $g(x) = x^(-2) = display(1/x^2)$
    #solution([
      $
        g^prime (x) &= lim_(h -> 0) (g(x + h) - g(x))/h = lim_(h -> 0) display(1/(x + h)^2 - 1/x^2)/h = lim_(h -> 0) 1/h 1/(x + h)^2 - 1/x^2] \
        &= lim_(h -> 0) 1/h [(x^2 - (x + h)^2)/(x^2 (x + h)^2)] = lim_(h -> 0) 1/cancel(h) [(-cancel(h) (2x + h))/(x^2 (x + h)^2)] = lim_(h -> 0) [- (2 x + h)/(x^2 (x + h)^2)]\
        &= -(2x)/x^4 = -2/x^3\
        &= -2 x^(-3) 
      $

    ])

    \

  + $h(x) = sqrt(x)$

    #solution([
      $
        h^prime (x) &= lim_(h -> 0) (sqrt(x + h) - sqrt(x))/h = lim_(h -> 0) [ ((sqrt(x + h) - sqrt(x))/h) dot ((sqrt(x + h) + sqrt(x))/(sqrt(x + h) + sqrt(x)))]\
        &= lim_(h -> 0) [ 1/h dot ((sqrt(x + h)) ^2 - (sqrt(x))^2)/(sqrt(x + h) + sqrt(x)) ] = lim_(h -> 0) [ 1/h dot (x + h - x)/ (sqrt(x + h) + sqrt(x))]\
        &= lim_(h -> 0) [1/ cancel(h) dot cancel(h)/(sqrt(x + h) + sqrt(x))] = lim_(h -> 0) 1/(sqrt(x + h) + sqrt(x))\
        &= 1/(2 sqrt(x)) = 1/2 x^(-1\/2)
      $
    ])
+ Para demonstrar a regra da derivada de potências, vamos provar que se $x(x) = x^n$ onde $n$ é um número natural, então $f' (x) = x x^(n - 1)$.

  #set enum(numbering: "(a)")
  + Escreva a definição da derivada aplicada à função $f(x) = x^n$.

  + Calcule $f(x + h)$ e simplifique usando o binômio de Newton:

    $
      (x + h)^n = x^n + n x^(n - 1) h + (n (n-1))/2! x^(n - 2)h^2 + dots + h^n
    $


  + Calcule $f(x + h) - f(x)$ e coloque $h$ em evidência.

  + Forme a razão incremental $display((f(x+ h) - f(x))/h)$ e simplifique.

  + Calcule o limite quando $ h -> 0$ para obter $f' (x)$.

#pagebreak()

    #solution([
      $
        f'(x) &= lim_(h -> 0) (f(x + h) - f(x))/h\
        f' (x) &= lim_(h -> 0) ((x + h)^n - x^n)/h\
        f' (x) &= lim_(h-> 0) display([x^n + n x^(n - 1) h + (n (n-1))/2! x^(n - 2)h^2 + dots + h^n] - x^n)/h\
        f' (x) &= lim_(h -> 0) display(n x^(n - 1) h + (n (n-1))/2! x^(n - 2)h^2 + dots + h^n)/h\
        f' (x) &= lim_(h -> 0) (cancel(h) dot [display(n x^(n - 1) + (n (n - 1))/2! x^(n - 2) h + dots + h^(n - 1))])/cancel(h)\
        f' (x) &= lim_(h -> 0) [n x^(n - 1) + (n (n - 1))/2! x^(n - 2) h + dots + h^(n - 1)]\
        f' (x) &= n x^(n - 1)
      $
    ])

#set enum(start: 3)
+ Usando a regra da derivada de potências $display(d/(d x) [x^n]) = n x^(n - 1)$, calcule as derivadas das seguintes funções:

  #set enum(numbering: "(a)")
  + $f(x) = x^7$
    #solution([
      $
        f' (x) = 7 x^6
      $
    ])

  + $g(x) = x^(-5)$
    #solution([
      $
        f'(x) = -5 x^(-6)
      $
    ])

  + $h(x) = display(1/sqrt(x))$
    #solution([
      $
        f'(x) = (x^(-1\/2))' = -1/2 x^(-3\/2)
      $
    ])

  + $p(x) = x^(3\/4)$
    #solution([
      $
        f' (x) = 3/4 x^(-1\/4)
      $
    ])

  + $q(x) = root(5, x^2)$
    #solution([
      $
        f'(x) = (x^(2\/5))' = 2/5 x^(-3\/5)
      $
    ])

  + $r(x) = display(1/x^3)$
    #solution([
      $
        f'(x) = (x^(-3))' = -3 x^(-4)
      $
    ])

