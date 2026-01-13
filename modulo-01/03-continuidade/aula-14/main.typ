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
    numero: [14],
    tema: [Continuidade da Composta]
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

+ Dadas as funções $f(x) = sqrt(x + 1)$ e $g(x) = display((x - 2)/(x + 3))$, determiine:
  #set enum(numbering: "(a)")
  + $(f bullet.stroked f)(x)$
    #solution([
      $
        (f bullet.stroked f)(x) = f(f(x)) = sqrt(sqrt(x + 1) + 1)
      $
    ])

  + $(f bullet.stroked g)(x)$
    #solution([
      $
        (f bullet.stroked g)(x) &= f(g(x)) = sqrt((x - 2)/(x + 3) + 1) = sqrt(((x - 2) + (x + 3))/(x + 3)) = sqrt((2x + 1)/(x + 3))
      $
    ])

  + $(g bullet.stroked f)(x)$
    #solution([
      $
        (g bullet.stroked f)(x) &= g(f(x)) = (sqrt(x + 1) - 2)/(sqrt(x + 1) + 3)
      $
    ])

  + $(g bullet.stroked g)(x)$
    #solution([
      $
        (g bullet.stroked g)(x) = g(g(x)) = (display((x - 2)/(x + 3)) - 2)/(display((x - 2)/(x + 3)) + 3) = display(((x - 2) - 2(x + 3))/cancel(x - 3))/display(((x - 2) + 3(x + 3))/cancel(x + 3)) = ((x - 2) - 2(x + 3))/((x - 2) + 3 (x + 3)) = (-x - 8)/(4x + 7)\
        (g bullet.stroked g)(x) = - (x + 8)/(4x + 7)
      $
      Note que, apesar de termos "cancelado" os denominadores $x  + 3$ acima, devemos ter em mente que o ponto $x = -3$ continua *fora* do domínio da composta $(g bullet.stroked g)(x)$.
    ])

+ Enuncie o teorema sobre continuidade de funções compostas e explique sua aplicação no cálculo de limites.

  #solution([
    *Teorema da Continuidade de Funções Compostas*: Sejam $f$ e $g$ funções tais que:
      - $g$ é contínua em $a$;
      - $f$ é contínua em $g(a)$,
    então, a função composta $(f bullet.stroked g)(x) = f(g(x))$ é contínua em $a$.

    *Explicação e aplicação no cálculo de limites*: A continuidade está diretamente ligada ao cálculo de limites. Uma função $h$ é contínua em $a$ se, e somente se,
    $
      lim_(x -> a) h(x) = h(a)
    $
    Aplicando o teorema às funções compostas, temos:
    $
      lim_(x-> a) f(g(x)) = f(lim_(x -> a) g(x)) = f(g(a))
    $
    Portanto, o teorema garante que, ao calcular limites envolvendo compostas:
    #set enum(numbering: "i.")
    + Primeiro calcula-se o limite da função interna $g(x)$ quando $x -> a$;
    + Em seguida, substitui-se esse valor na função externa $f$.

    Ou seja, é permitido "passar o limite para dentro da função", desde que as condições de continuidade sejam satisfeitas.
  ])

+ Calcule os limites abaixo usando o teorema da continuidade de funções compostas:
  #set enum(numbering: "(a)")
  + $display(lim_(x -> 2)) "sen"(x^2 - 3x + 2)$
    #solution([
      Consideremos as funções 
      $
        f(x) = "sen" x\
        g(x) = x^2 - 3x + 2
      $
      Lembremos que  as funções polinomiais são contínuas para todo $x in RR$. Em particular, para $g$ é contínua em $x = 2$ e vale $ g(2) = 2^2 - 3 dot 2 + 2 = 0. $
      Por sua vez, a função seno também é contínua em toda a reta real. Em particular $f$ é contínua em $ f(g(2)) = f(0) = "sen" 0 = 0. $
      Portanto, pelo teorema da continuidade das funções compostas, 
      $
        (f bullet.stroked g)(x) = f(g(x)) = "sen"(x^2 - 3x + 2)
      $
      é contínua em $x = 2$ e 
      $ display(lim_(x -> 2)) "sen"(x^2 - 3x + 2) = "sen"(lim_(x -> 2) (x^2 - 3x + 2)) = "sen"(0) = 0. $
    ])

  + $display(lim_(x -> 0)) display(cos((x^2 + 1)/(x^2 + 2)))$
    #solution([
      Sejam as funções 
      $
        f(x) = cos x\
        g(x) = (x^2 + 1)/(x^2 + 2)
      $

      tal que $ (f bullet.stroked g)(x) = f(g(x)) = cos((x^2 + 1)/(x^2 + 2)). $
      Observemos que $g$ é contínua em $x = 0$, pois esse ponto não imploca em nenhuma indefinição da função racional. Assim, $ g(0) = (0^2 + 1)/(0^2 + 2) = 1/2. $

      Por sua vez, como a função cosseno é contínua em toda a reta real, $f$ é contínua no ponto $g(0) = 1/2$, tal que:
      $
        f(g(0)) = f(1/2) = cos(1/2)
      $
      Finalmente, pelo teorema da continuidade das funções compostas, $(f bullet.stroked g)(x) = f(g(x))$ é contínua em $f(g(0))$. Portanto, 
      $
        display(lim_(x -> 0)) display(cos((x^2 + 1)/(x^2 + 2))) = cos(lim_(x-> 0) (x^2 - 1)/(x^2 + 2)) = cos(1/2)
      $

    ])

  + $display(lim_(x -> 1)) (x^3 - 2x + 1)^5$
    #solution([
      Sejam as funções $
                         f(x) = x^2\
                         g(x) = x^3 - 2x + 1
                       $

      Como as funções polinomiais são contínuas para todo $x in RR$, podemos conluir, pelo teorema da continuidade das funções compostas, que a função $ (f bullet.stroked g)(x) = f(g(x)) = (x^3 - 2x + 1)^5 $
      é contínua para todo $x$ real. Assim, 
      $
        display(lim_(x -> 1)) (x^3 - 2x + 1)^5 = (lim_(x -> 1) (x^3 - 2x + 1))^5 = (1^3 - 2 dot 1 + 1)^5 = 0^5 = 0
      $
    ])

  + $display(lim_(x -> 3)) sqrt(x^2 - 2x + 6)$
    #solution([
      Sejam as funções
      $
        f(x) = sqrt(x)\
        g(x) = x^2 - 2x + 6
      $
      tal que
      $
        (f bullet.stroked g)(x) = f(g(x)) = sqrt(x^2 - 2x + 6).
      $
      Observemos que $g$ é contínua em $x = 3$, pois as funções polinoniais são contínuas e toda a reta real. 
      
      Seja $g(3) = 3^2 - 2 dot 3 + 6 = 9$. Note que $f$ é contínua no ponto $g(3) = 9$, pois a função "raiz quadrada" é contínua para todo $x >= 0$. Portanto, pelo teorema da continuidade das funções compostas, $(f bullet.stroked g)(x) = f(g(x))$ é contínua em $f(g(3))$ e 
      $
        display(lim_(x -> 3)) sqrt(x^2 - 2x + 6) = sqrt(lim_(x -> 3) (x^2 - 2x + 6)) = sqrt(9) = 3
      $
    ])

  + $display(lim_(x -> pi)) tan("sen" x + cos x)$
    #solution([
      A função $g(x) = "sen" x + cos x$ é contínua para todo $x in RR$. Em particular $g$ é contínua em $x = pi$. Seja $ g(pi) = "sen" pi + cos pi = 0 + (-1) = -1 $.Por sua vez, a função $f(x) = tan x$ é contínua em $g(pi) = -1$.
      Portanto, pelo teorema da continuidade das funções compostas,
      $
        display(lim_(x -> pi)) tan("sen" x + cos x) = tan(lim_(x -> pi) ("sen" x + cos x) ) = tan(-1)
      $ 
    ])

  + $display(lim_(x -> 2)) e^(x^2 - 4x + 4)$
    #solution([
      $
        display(lim_(x -> 2)) e^(x^2 - 4x + 4) = e^((display(lim_(x -> 2) (x^2 - 4x + 4)))) = e^(2^2 - 4 dot 2 + 4) = e^0 = 1
      $
    ])

