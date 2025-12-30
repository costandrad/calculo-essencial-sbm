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
    numero: [04],
    tema: [Divisão de Polinômios]
  )
)

#v(1cm)



+ *Divisão de Polinômios.* Use divisão de polinômios para calcular os limites abaixo.
  #set enum(numbering: "(a)")
  + $display(lim_(x arrow 3) (x^3 - 5x^2 + 8x - 6)/(x - 3))$
    #solution([
      Substituindo o valor $x = 3$ no numerador e no denominador da fração dada, obtemos a indeterminação $0\/0$. Logo, tanto o polinômio no numerador quanto o polinômio no denominador são divisíveis por $x - 3$. 
      
      Utilizemos o algorítmo de Briot-Ruffini para dividir o polinômio $x^3 - 5x^2 + 8x - 6$ por $x - 3$:

      #let numerador = (1, -5, 8, -6)
      #let r = 3

      #let (q, _) = briot-ruffini(numerador, r)

      #briot-ruffini-table(numerador, r)

      Observamos que o polinômio $x^3 - 5x^2 + 8x - 6$, quando dividido por $x - 3$, apresenta quociente $x^2 - 2x + 2$, com resto zero. Portanto, podemos fatorar a a expressão dada da sequinte forma:

      $
        lim_(x arrow 3) (x^3 - 5x^2 + 8x - 6)/(x - 3) &= lim_(x arrow 3) (cancel((x - 3)) (x^2 - 2x + 2))/cancel(x - 3)\
        &= lim_(x arrow 3) (x^2 - 2x + 2) \
        &= 3^2 - 2 dot 3 + 2 \
        & = 5
      $
      
    ])


    \ \
  + $display(lim_(x arrow -1) (x^3 + 2x^2 - x - 2)/(x^2 + 3x + 2))$
    #solution([
      Substituindo o valor $x = -1$ no numerador e no denominador da fração dada, obtemos a indeterminação $0\/0$. Logo, tanto o polinômio no numerador quanto o polinômio no denominador são divisíveis por $x - (-1) = x + 1$. 
      
      Utilizemos o algorítmo de Briot-Ruffini para dividir o polinômio $x^3 + 2x^2 - x - 2$ por $x - (-1)$:

      #let numerador = (1, 2, -1, -2)
      #let denominador = (1, 3, 2)
      #let r = -1

      #let (q1, _) = briot-ruffini(numerador, r)
      #let (q2, _) = briot-ruffini(numerador, r)

      \

      #briot-ruffini-table(numerador, r)

      Para o denominador, o algoritmo de Briot-Ruffini resulta em:

      #briot-ruffini-table(denominador, r)

      Portanto, podemos fatorar a a expressão dada da sequinte forma:

      $
        lim_(x arrow -1) (x^3 + 2x^2 - x - 2)/(x^2 + 3x + 2) &= lim_(x arrow -1) (cancel((x + 1)) (x^2 + x - 2))/(cancel((x + 1)) (x + 2)) \
        &= lim_(x arrow -1) (x^2 + x - 2)/(x + 2)\
        &= ((-1)^2 + (-1) - 2)/(-1 + 2)\
        &= -2
      $
      
    ])

  + $display(lim_(x arrow 2) (x^4 - 3x^3 + x^2 + 4x - 4)/(x^3 - 4x^2 + 5x - 2))$
    #solution([
      
      Substituindo o valor $x = 2$ no numerador e no denominador da fração dada, obtemos a indeterminação $0\/0$. Logo, tanto o polinômio no numerador quanto o polinômio no denominador são divisíveis por $x - 2$. 
      
      Utilizemos o algorítmo de Briot-Ruffini para dividir o polinômio $x^4 - 3x^3 + x^2 + 4x - 4$ por $x - 2$:

      #let numerador = (1, -3, 1, 4, -4)
      #let denominador = (1, -4, 5, -2)
      #let r = 2

      #let (q1, _) = briot-ruffini(numerador, r)
      #let (q2, _) = briot-ruffini(numerador, r)

      #briot-ruffini-table(numerador, r)

      Para o denominador, o algoritmo de Briot-Ruffini resulta em:

      #briot-ruffini-table(denominador, r)

      Portanto, podemos fatorar a a expressão dada da sequinte forma:

      $
        lim_(x arrow 2) (x^4 - 3x^3 + x^2 + 4x - 4)/(x^3 - 4x^2 + 5x - 2) &= lim_(x arrow 2)  (cancel((x-2)) (x^3-x^2-x + 2))/(cancel((x-2)) (x^2 - 2x + 1))\
        &= lim_(x arrow 2) (x^3 - x^2 - x + 2)/(x^2 - 2x + 1)\
        &= (2^3 - 2^2 - 2 + 2)/(2^2 - 2 dot 2 + 1)\
        &= 4
      $


    ])

  + $display(lim_(x arrow -2) (x^5 + 2x^4 + 4x^3 + 8x^2 + 16x + 32)/(x^4 + 4x^3 + 6x^2 + 4x))$
    #solution([
      Substituindo o valor $x = -2$ no numerador e no denominador da fração dada, obtemos a indeterminação $0\/0$. Logo, tanto o polinômio no numerador quanto o polinômio no denominador são divisíveis por $x - (-2) = x+2$. 
      
      Utilizemos o algorítmo de Briot-Ruffini para dividir o polinômio $x^5 + 2x^4 + 4x^3 + 8x^2 + 16x + 32$ por $x - (-2)$:

      #let numerador = (1, 2, 4, 8, 16, 32)
      #let denominador = (1, 4, 6, 4, 0)
      #let r = -2

      #let (q1, _) = briot-ruffini(numerador, r)
      #let (q2, _) = briot-ruffini(numerador, r)

      #briot-ruffini-table(numerador, r)

      Para o denominador, o algoritmo de Briot-Ruffini resulta em:

      #briot-ruffini-table(denominador, r)

      Portanto, podemos fatorar a a expressão dada da sequinte forma:

      $
        lim_(x arrow -2) (x^5 + 2x^4 + 4x^3 + 8x^2 + 16x + 32)/(x^4 + 4x^3 + 6x^2 + 4x) &= lim_(x arrow -2)  (cancel((x+2)) (x^4 + 4x^2 + 16))/(cancel((x+2)) (x^3 + 2x^2 + 2x))\
        &= lim_(x arrow -2) (x^4 + 4x^2 + 16)/(x^3 + 2x^2 + 2x)\
        &= ((-2)^4 + 4 dot (-2)^2 + 16)/((-2)^3 + 2 dot (-2)^2 + 2 dot (-2))\
        &= -12
      $

    ])




