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
    numero: [01],
    tema: [Motivação I]
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

+ A autonomia de um drone de entrega é dada pela função $A(m) = 50 - 1/2 m^2$ quilômetros, onde $m$ é a massa em quilogramas que ele carrega. Analise como a autonomia do drone com um pacote de 4 kg é afetada por pequenas variações na massa que ele carrega.

  #set enum(numbering: "(a)")
  +  Calcule a taxa média de variação da autonomia quando a massa varia de 4 kg para 5 kg (ou seja, $h = 1$).
    #solution([
      Seja $m$ a massa em quilogramas que o drone carrega. Então, a taxa média de variação de autonomia para uma variação $h$ é:
      $
        T_m = (Delta A)/(Delta m) = (A(5) - A(4))/(5 - 4) = ((50 - 1/2 dot 5^2) - (50 - 1/2 dot 4^2))/1 = (50 - 12\,5) - (50 - 8)\
        T_m = - 4,5 "km/kg"
      $ 
    ])

  + Calcule a taxa média de variação da autonomia quando a massa varia de 4 kg para 4,1 kg (ou seja, $h = 0,1$).
    #solution([
      $
        T_m  = (A(4,1) - A(4))/(4,1 - 4) = ((50 - 1/2 dot 4,1^2) - (50 - 1/2 dot 4^2))/(0,1) = ((50 - 8,405) - (50 - 8))/(0,1)\
        T_m = - 4,05 "km/kg"
      $ 
    ])

  + Determine a taxa de variação instantânea da autonomia para uma massa de 4 kg, calculando o limite:

  $
    lim_(h -> 0) (A(4 + h) - A(4))/h
  $

    #solution([
      $
        T_i &= lim_(h -> 0) (A(4 + h) - A(4))/h\
        T_i &= lim_(h -> 0) ([50 - 1/2 (4 + h)^2] - (50 - 1/2 4^2))/h\
        T_i &= lim_(h -> 0) (cancel(50) - 1/2 (4 + h)^2 - cancel(50) + 1/2 4^2)/h\
        T_i &= lim_(h -> 0) (-1/2 [(4 + h)^2 - 4^2])/h\
        T_i &= lim_(h -> 0)  (-1/2 [(8 + h) cancel(h)])/cancel(h)\
        T_i &= lim_(h -> 0) -1/2 (8 + h) \
        T_i &= 4 "km/kg"
      $
    ])