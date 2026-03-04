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
    numero: [03],
    tema: [Definição de Derivada]
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

+ Escreva a definição de derivada de uma função $f(x)$ no ponto $x = a$.

  #solution([
    A derivada de uma função $f$ no ponto $x = a$ é definida como o *limite da razão incremental*, quando esse limite existe. Formalmente,
    $
      f^prime (a) = lim_(h -> 0) (f(a + h) - f(a))/(h)
    $
    se o limite existir.

    Equivalentemente, também pode ser escrita como:
    $
      f^prime (a) = lim_(x -> a) (f(x) - f(a))/(x - a)
    $

  ])

+ Um objeto se move ao longo de uma reta segundo a função posição $s(t) = t^2 + 3t$ metros. onde $t$ é o tempo em segundos. Usando a definição de derivada, calcule a velocidade instantânea do objeto no instante $t = 2$ segundos.
  #solution([
    Seja um incremento $h$ em relação ao instante $t = 2$. Então,
    $
      v(2) &= lim_(h -> 0) (s(2 + h) - s(2))/(h) = lim_(h -> 0) ([(2 + h)^2 + 3 dot (2+h)] + [2^2 + 3 dot 2])/(h)\
           &= lim_(h -> 0) ([(2 + h)^2 - 2^2] + 3 dot [(2 + h) - 2])/(h) = lim_(h -> 0) (cancel(h) (4 + h) + 3 dot cancel(h))/cancel(h) = lim_(h -> 0)  (7 + h)\ 
           &= 7 "m/s"
    $
  ])

+ Um navio de patrula detecta uma embarcação suspeita localizada no ponto $(6, 0)$ em águas territoriais. O navio está posicionado no ponto $(a, 4/a)$ sobre a trajetória $y = 4/x$ e precisa disparar um projétil que seja tangente à trajetória para neutralizar a embarcação suspeita.

  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      import cetz-plot: *

      plot.plot(
        size: (10, 6),
        axis-style: "school-book", 
        x-min: 0, x-max: 7.,
        y-min: 0, y-max: 4.,
        x-tick-step: 1, y-tick-step: 1,
        x-grid: true, y-grid: "both",
        name: "plot",
        {
          plot.add(
            domain: (1, 7),
            x => 4/x,
            style: (stroke: 2pt+sbm-blue)
          )
          plot.add(
            domain: (1, 7),
            x => -4*x/9 + 8/3,
            style: (stroke: (dash: "dashed", paint: orange, thickness: 1.5pt))
          )
          plot.add(
            domain: (3, 4.5),
            x => -4*x/9 + 8/3,
            style: (stroke: (paint: orange, thickness: 2pt), mark: (end: "stealth", fill: orange))
          )
          plot.add-anchor("navio", (3, 4/3))
          plot.add-anchor("susp", (6, 0))
        }
      )
      
      polygon("plot.navio", 3, radius: 8pt, fill: orange, stroke: none)
      content("plot.navio", [$(a, 4/a)$], anchor: "south-west", padding: 0.2)
      polygon("plot.susp", 3, radius: 8pt, fill: blue, stroke: none)
    })
  ]

  #set enum(numbering: "(a)")
  + Usando a definição de derivada, encontre o coeficiente angular da reta tangente à trajetória $y = 4/x$ em um ponto genérico $(a, 4/a)$.
    #solution([
      $
        f^prime (a) &= lim_(h -> 0) (f(a + h) - f(a))/h = lim_(h -> 0) display(4/(a+h) - 4/a)/h =  lim_(h -> 0) 1/h dot [(4 dot a - 4 dot (a + h))/(a dot (a + h))]\
        &= lim_(h -> 0) 1/cancel(h) dot (-4 cancel(h))/(a dot (a+h)) = lim_(h -> 0) - 4/(a (a + h))\
        &= - 4/a^2
      $
    ])

  + Escreva a equação da reta tangente à trajetória no ponto $(a, 4/a)$.
      #solution([
        Em geral, a equação da reta tangente de uma função $f(x)$ no ponto $a, f(a)$ é 
        $
          y - f(a) = f^prime (a) (x - a)
        $
        em que $f^prime (a)$ é a derivada no ponto $x = a$. Então,
        $
          y - f(a) = f^prime (a) (x - a) &=> y - 4/a = -4/a^2 (x - a)\
          &=> y - 4/a = - 4/a^2 x + 4/a\
          &=> y = -4/a^2 x + 8/a
        $
      ])

  + Determine o valor de $a$ para que esta reta tangente passe pelo ponto $(6, 0)$ onde está a embarcação suspeita.
    #solution([
      $
        y = -4/a^2 x + 8/a &=> 0 = -4/a^2 dot 6 + 8/a => 6/a^2 = 2/a  => 2a^2 = 6a => a = 3
      $
      Observe que desconsideramos a solução $a = 0$.
    ])

  + Com o valor de $a$ encontrado, determine as coordenadas exatas do navio e escreva a equação da trajetória do projétil.

    #solution([
      A coordenada do navio é:
      $
        (a, 4/a) = (3, 4/3)
      $
      A equação da trajetória do projétil é:
      $
        y = -4/a^2 x + 8/a &=> y = -4/3^2 x + 8/3\
        &=> y = -4/9 x + 8/3
      $
    ])