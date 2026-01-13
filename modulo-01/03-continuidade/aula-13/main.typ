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
    numero: [13],
    tema: [Funções Contínuas]
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

+ Defina o que significa uma função ser contínua em um intervalo aberto $(a, b)$ e em um intervalo fechado $[a, b]$.
  #solution([
    - *Continuidade em um intervalo aberto $(a, b)$*

      A função $f$ é contínua no intervalo aberto $(a, b)$ se ela for contínua em todo ponto $x_0 in (a, b)$.

    - *Continuidade em um intervalo fechado $[a, b]$*

      A função $f$ é contínua no intervalo fechado $[a, b]$ se:
        - $f$ é contínua em todo ponto do intervalo aberto $(a, b)$;
        - $f$ é contínua à direita em $a$; e
        - $f$ é contínua à esquerda em $b$.
      Isto é, além da continuidade em $(a, b)$, deve-se verificar:
        $
          lim_(x -> a^+) f(x) = f(a) " e " lim_(x -> a^-) f(x) = f(b).
        $    
  ])

+ Justifique por que as funções abaixo são contínuas nos seus respectivos domínios:
  #set enum(numbering: "(a)")
  + $f(x) = 3x^4 - 3x^2 + 5x - 1$
    #solution([
      O domínio de $f$ são todos os reais, ou seja,  $D(f) = RR$. Assim, para todo $x_0 in RR$, existe:
      $
        f(x_0) = 3x_0^4 - 2x_0^2 +5x_0 - 1
      $
      Além disso, 
      $
        lim_(x -> x_0) f(x) = lim_(x -> x_0) (3x^4 - 3x^2 + 5x - 1) = 3x_0^4 - 2x_0^2 +5x_0 - 1 = f(x_0)
      $
      Portanto, $f$ é contínua para todo $x$ real, ou seja, para todo $x in D(f)$#footnote[O raciocínio vale para verificar a continuidade de qualquer função polinomial $f(x) = a_x x^n + a_(n - 1)x ^(n - 1) + dots + a_1 x + a_0$.].
    ])

  + $g(x) = display((x^2 + 1)/(x^2 - 4))$
    #solution([
      A função racional $g$ é definida para todo $x$ real tal que o denominador não seja nulo, ou seja,
      $
        x^2 - 4 != 0 => x != plus.minus 2
      $
      Logo, o domínio de $g$ é $D(g) = {x in RR | x != plus.minus 2}$. Assim, tomemos um número arbitrário $x_0 in D(g)$. Temos que existe:
      $
        g(x_0) = (x_0^2 + 1)/(x_0^2 - 4)
      $
      Além disso, o limite de $g$ no ponto $x_0 in D(g)$ é:
      $
        lim_(x -> x_0) g(x) = lim_(x -> x_0) (x^2 + 1)/(x^2 - 4) = display(lim_(x -> x_0) (x^2 + 1))/display(lim_(x -> x_0) (x^2 - 4)) = (x_0^2 + 1)/(x_0^2 - 4) = g(x_0)
      $

      Portanto, $g$ é contínua para todo $x in D(g)$.
    ])

  + $h(x) = "sen" x + cos x$
    #solution([
      Tanto a função seno quanto a função cosseno são contínuas em toda a reta real. Assim, o domínio de $h$ é $D(h) = RR$. Seja $x_0 in D(h)$, então existe 
      $
        h(x_0) = "sen" x_0 + cos x_0
      $
      Por outro lado, 
      $
        lim_(x -> x_0) h(x) = lim_(x -> x_0) ("sen" x + cos x) = lim_(x -> x_0) "sen"x + lim_(x -> x_0) cos x = "sen" x_0 + cos x_0 = h(x_0)
      $

      Portanto, $h$ é contínua para todo $x in D(h)$.
    ])

  + $p(x) = tan x$
    #solution([
      Consideremos a definição da função tangente:
      $
        tan x = ("sen" x)/(cos x)
      $
      Já sabemos que tanto o seno quanto o cosseno são funções contínuas para todos o reais. Entretanto, pela definição da tangente, o denominador acima não pode ser zero, ou seja,
      $
        cos x != 0 => x != pi/2 + k pi, " " k in ZZ
      $
      Então, o domínio de $p$ é $D(p) = {x in RR | x != pi/2 + k pi, " " k in ZZ}$. Tomando $x_0 in D(p)$, temos que existe:
      $
        p(x_0) = tan x_0
      $
      Além disso, 
      $
        lim_(x -> x_0) p(x) = lim_(x -> x_0) tan x = lim_(x -> x_0) ("sen" x)/(cos x) = display(lim_(x -> x_0 "sen" x))/display(lim_(x -> x_0) cos x) = ("sin" x_0)/(cos x_0) = tan x_0
      $
      Portanto, $p$ é contínua para todo $x in D(p)$.
    ])

+ Analise a continuidade das funções nos intervalos dados:
  #set enum(numbering: "(a)")
  + $f(x) = x^3 - 2x + 1$ em $[-2, 3]$
    #solution([
      Sabemos que toda função polinomial é contínua em todo real#footnote[Não há pontos de descontinuidade, pois a função não apresenta denominadores, radicais com restrições ou logaritmos.]. Como o intervalo $[-2, 3]$ é um subconjunto de $RR$, segue que a função $f$ é contínua no intervalo fechado $[-2, 3]$. 
    ])

  + $g(x) = display(1/(x - 1))$ em $(0, 2)$
    #solution([
      O domínio de $g$ é $D(g) = {x in RR | x != 1}$, pois o valor de $x$ para o qual o denominador é nulo, é o único ponto no qual a função não está definida. Note que o ponto $x = 1$ percente ao intervalo aberto $(0, 2)$. Assim, $g$ *não é contínua* no intervalo.
    ])

  + $h(x) = "sen" x$ em $[0, 2pi]$
    #solution([
      A função seno é contínua em toda a reta real. Logo, no intervalo $[0, 2pi] subset RR$, $g$ é contínua.
    ])

  + $p(x) = tan x $ em $[0, pi]$
    #solution([
      A função tangente não está definida em $x = pi\/2 in [0, pi]$. Logo, $h$ não é contínua no intervalo fechado.
    ])

  + $q(x) = display((x ^2 - 4)/(x + 2))$ em $[-3, 1]$
    #solution([
      O domínio de $q$ é $D(q) = {x in RR | x != -2}$. Note que $-2 in [-3, 1]$. Logo, $q$ não é contínua em $[-3, 1]$.
    ])

  + $r(x) = sec x$ em $[-pi, pi]$
    #solution([
      A função secante ($sec(x)$) é uma função trigonométrica definida como o inverso do cosseno, ou seja, $sec x = 1\/cos x$. Por um lado, a função cosseno é contínua em toda a reta real. Entretanto, da defninição da secante, essa função não é definida para os valores de $x$ tais que $cos x = 0$. Assim, o domínio de $r$ é:
      $
        D(r) = {x in RR | cos x != 0}\
        D(r) = {x in RR | x != pi/2 + k pi, k in ZZ}
      $
      Note que $display(pi/2) in [-pi, pi]$ é um ponto em que a função secante não está definida. Portanto, $r$ não é contínua em $[-pi, pi]$. 
    ])

+ Considere a função
  $
    f(x) = 
    cases(
      x^2\, &" se" x <= 1,
      2x - 1\, &" se" x > 1
    )
  $
  Esta função é contínua em $RR$? Justifique sua resposta.
  #solution([
    Consideremos cada região de refinição de $f$:
    - Para $x <= 1$, ou seja, no intervalo $(-infinity, 1]$, $f$ é dada por $x^2$. Como toda função polinomial, $f$ é contínua _nesse_ intervalo. Em particular, 
    $
      cases(
        display(lim_(x -> 1^-)) f(x) = display(lim_(x -> 1^-)) x^2 = 1^2 = 1, ,
        f(1) = 1^2 = 1
      )
    $
    - Para $x > 1$, ou seja, no intervalo $(1, +infinity)$, a função $f$ é definida por $2x - 1$ que é contínua em todo $RR$, Assim, $f$ é contínua no intervalo $(1, +infinity)$. Em particular,
    $
      display(lim_(x -> 1^+)) f(x) = display(lim_(x -> 1^+)) (2x - 1) = 2 dot 1 - 1 = 1
    $
    - Então,
    $
      display(lim_(x -> 1^-)) f(x) = display(lim_(x -> 1^+)) f(x) = f(1) = 1
    $
    Logo, $f$ é contínua em toda a reta real $RR$, como se observa no gráfico seguinte:

    #figure()[
      #cetz.canvas({
        import cetz.draw: *
        import cetz-plot: *

        plot.plot(
          ..opts,
          {
            plot.add(
              domain: (-1, 1),
              x => calc.pow(x, 2),
              style: line-styles
            )
            plot.add(
              domain: (1, 3),
              x => 2 * x - 1,
              style: line-styles
            )
            plot.annotate({
              line((1, 0), (1, 1), (0, 1), stroke: (dash: "dashed", paint: sbm-green))
            })
            plot.add(
              ((1, 1),),
              mark: "o",
              mark-style: mark-styles(sbm-blue)
            )
          }
        )
      })
    ]

  ])