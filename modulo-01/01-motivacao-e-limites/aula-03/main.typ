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
    numero: [03],
    tema: [Fatoração e Limites]
  )
)

#v(1cm)

+ *Diferença de quadrados e racionalização com raiz quadrada.* Calcule os limites abaixo:
  #set enum(numbering: "(a)")
  + $display(lim_(x arrow 3) (x^2 - 9) / (x - 3))$
    #solution([
      Inicialmente, observemos que, se tentarmos substituir diretamente o valor $x = 3$ na expresão $display((x^2 - 9)/(x - 3))$, obteremos a forma indeterminada $0\/0$. Assim, para resolver o problema, devemos fatorar o numerador como segue:
      $
        lim_(x arrow 3) (x^2 - 9) / (x - 3) &= lim_(x arrow 3) (cancel((x - 3)) (x + 3)) / (cancel(x - 3)) = lim_(x arrow 3) (x + 3).
      $
      Note que eliminamos a causa da indeterminação e podemos aplicar as propriedades básicas de limite:
      $
        lim_(x arrow 3) (x^3 - 9)/(x - 3) = lim_(x arrow 3) (x + 3) = 3 + 3 = 6.
      $
    ])

  + $display(lim_(x arrow 4) (sqrt(x) - 2) / (x - 4))$
    #solution([
      Substituindo diretamente $x = 4$ na expressão dada, chegamos à indeterminação de tipo $0\/0$. Para resolver o problema, procedemos da seguinte forma:
      $
        lim_(x arrow 4) (sqrt(x) - 2) / (x - 4) &= lim_(x arrow 4) [((sqrt(x) - 2))/((x - 4)) dot ((sqrt(x) + 2))/((sqrt(x) + 2))] = lim_(x arrow 4) cancel(x - 4) / (cancel((x - 4)) (sqrt(x) + 2)) = lim_(x arrow 4) 1 / (sqrt(x) + 2).
      $
      Como a causa da indeterminação foi _removida_, podemos aplicar as propriedades básicas de limites:
      $
        lim_(x arrow 4) (sqrt(x) - 2)/ (x - 4) = lim_(x arrow 4) 1/(sqrt(x) + 2) = 1/(sqrt(4) + 2) = 1 / 4.
      $
    ])

  + $display(lim_(x arrow -2) (4 - x^2) / (x + 2))$
    #solution([
      $
        lim_(x arrow -2) (4 - x^2)/(x + 2) &= lim_(x arrow -2) ((2 - x)cancel((2 + x)))/cancel(x + 2) = lim_(x arrow -2) (2 - x) = 2 - (-2) = 4.
      $
    ])

+ *Diferença de cubos e racionalização com raiz cúbica.* Calcule os limites abaixo.
  #set enum(numbering: "(a)")
  + $display(lim_(x arrow 2) (x^3 - 8)/(x - 2))$
    #solution([
      $
        lim_(x arrow 2) (x^3 - 8)/(x - 2) &= lim_(x arrow 2) (x^3  - 2^3)/(x - 2) = lim_(x arrow 2) (cancel((x - 2)) (x^2 + 2x + 2^2))/cancel(x - 2)\
        &= lim_(x arrow 2) (x^2 + 2x + 4) = 2^2 + 2 dot 2 + 4 = 12
      $
    ])

  + $display(lim_(x arrow 8) (root(3, x) - 2)/(x - 8))$
    #solution([
      $
        lim_(x arrow 8) (root(3, x) - 2)/(x - 8) &= lim_(x arrow 8) (root(3, x) - 2)/((root(3, x))^3 - 2^3) =  lim_(x arrow 8) cancel(root(3, x) - 2)/(cancel((root(3, x) - 2)) (root(3, x^2) + 2 root(3, x) + 2^2))\
        &= lim_(x arrow 8) 1/(root(3, x^2) + 2 root(3, x) + 4) = 1 / (root(3, 8^2) + 2 root(3, 8) + 4)\
        &= 1 / ((root(3, 8))^2 + 2 root(3, 8) + 4) = 1 / (2^2 + 2 dot 2 + 4) = 1/12
      $
    ])

  + $display(lim_(x arrow -1) (x^3 + 1)/(x + 1))$
    #solution([
      $
        lim_(x arrow -1) (x^3 + 1)/(x + 1) &= lim_(x arrow -1) (x^3 - (-1))/(x - (-1)) = lim_(x arrow -1) (cancel((x - (-1))) (x^2 + x dot (-1) + (-1)^2))/cancel(x - (-1))\
        &= lim_(x arrow -1) (x^2 - x + 1) = (-1)^2 - (-1) + 1 = 3
      $
    ])

+ *Fatoração de equações do segundo grau.* Calcule os limites abaixo.
  #set enum(numbering: "(a)")
  + $display(lim_(x arrow 2) (x^2 - 5x + 6)/(x - 2))$
    #solution([
      Ao substituir $x = 2$ na expressão dada, obtemos uma indeterminação de tipo $0\/0$. Para eliminá-la, vamos fatorar o polinômio do segundo grau no numerador, aplicando a fórmula de Báskara:
      $
        x^2 - 5x + 6 = 0 &arrow.double x = (-(-5) plus.minus sqrt((-5)^2 - 4 dot 1 dot 6))/(2) arrow.double x = (5 plus.minus sqrt(25 - 24))/2\
        &arrow.double x = (5 plus.minus sqrt(1))/2 arrow.double x = (5 plus.minus 1)/2 arrow.double 
        cases(
          display(x_1 = (5 - 1)/2 = 4/2 = 2),
          display(x_2 = (5 + 1)/2 = 6/2 = 3)
        )
      $
      A forma fatorada do numerador é: $x^2 - 5x + 6 = (x - 2)(x - 3)$. Logo, o limite da expressão dada é
      $
        lim_(x arrow 2) (x^2 - 5x + 6)/(x - 2) &= lim_(x arrow 2) (cancel((x - 2))(x - 3))/cancel(x - 2) = lim_(x arrow 2) (x - 3) = 2 - 3 = -1
      $
    ])

  + $display(lim_(x arrow 1) (x^2 - 3x + 2)/(x^2 - 1))$
    #solution([
      Ao substituir $x = 1$ na expressão dada, obtemos uma indeterminação de tipo $0\/0$. Para eliminá-la, vamos fatorar o polinômio do segundo grau no numerador, aplicando a fórmula de Báskara:
      $
        x^2 - 3x + 2 = 0 &arrow.double x = (-(-3) plus.minus sqrt((-3)^2 - 4 dot 1 dot 2))/2 arrow.double x = (3 plus.minus sqrt(9 - 8))/2\
        &arrow.double x = (3 plus.minus 1)/2 arrow.double
        cases(
          display(x_1 = (3 - 1)/2 = 2/2 = 1),
          display(x_2 = (3 + 1)/2 = 4/2 = 2)
        )
      $
      A forma fatorada do numerador é: $ x^2 - 3x + 2 = (x - 1)(x - 2). $ Quanto ao denominador, podemos fatorá-lo usando diferença de quadrados: $ x^2 - 1 = (x-1)(x+1). $ Logo, o limite da expressão dada é
      $
        lim_(x arrow 1) (x^2 - 3x + 2)/(x^2 - 1) &= lim_(x arrow 1) (cancel((x - 1))(x - 2))/(cancel((x - 1))(x + 1)) = lim_(x arrow 1) (x - 2)/(x + 1) = (1 - 2)/(1 + 1) = - 1/2
      $
    ])


+ *Técnicas mistas.* Calcule os limites abaixo usando as diferentes técnicas de fatoração.
  #set enum(numbering: "(a)")
  + $display(lim_(x arrow 4) (2 - sqrt(x))/(sqrt(x + 5) - 3))$
    #solution([ 
      $
        lim_(x arrow 4) (2 - sqrt(x))/(sqrt(x + 5) - 3) &= lim_(x arrow 4) [((2 - sqrt(x)))/((sqrt(x + 5) - 3)) dot ((sqrt(x + 5) + 3))/((sqrt(x + 5) + 3))] = lim_(x arrow 4) [((2 - sqrt(x)) (sqrt(x + 5) + 3))/((sqrt(x + 5))^2 - 3^2)]\
        &= lim_(x arrow 4) ((2 - sqrt(x)) (sqrt(x + 5) + 3))/(x + 5 - 9) = lim_(x arrow 4) ((2 - sqrt(x)) (sqrt(x + 5) + 3))/(x - 4)\
        &= lim_(x arrow 4) (-cancel((sqrt(x) - 2)) (sqrt(x + 5) + 3))/(cancel((sqrt(x) - 2)) (sqrt(x) + 2)) = lim_(x arrow 4) (-(sqrt(x + 5) + 3)/(sqrt(x) + 2))\
        &= - (sqrt(4 + 5) + 3)/(sqrt(4) + 2) = - (sqrt(9) + 3)/(sqrt(4) + 2)\
        &= - (3 + 3)/(2 + 2) = -6/4\
        &= -3/2
      $ 
    ])

  + $display(lim_(x arrow 8) (root(3, x) - 2)/(x^2 - 10x + 16))$
    #solution([
      $
        lim_(x arrow 8) (root(3, x) - 2)/(x^2 - 10x + 16) &= lim_(x arrow 8) (root(3, x) - 2)/((x - 2)(x - 8)) = lim_(x arrow 8) cancel((root(3, x) - 2))/((x - 2) [cancel((root(3, x) - 2)) (root(3, x^2) + 2 root(3, x) + 2^2)])\
        &= lim_(x arrow 8) 1/ ((x - 2) (root(3, x^2) + 2 root(3, x) + 4)) = 1/ ((8 - 2) (root(3, 8^2) + 2 root(3, 8) + 4))\
        &= 1/ (6 dot (2^2 + 2 dot 2 + 4))  = 1/(6 dot 12) = 1/72
      $
    ])

  + $display(lim_(x arrow 3) (sqrt(x + 1) - 2)/(x^2 - 9))$
    #solution([
      $
        lim_(x arrow 3) (sqrt(x + 1) - 2)/(x^2 - 9) &= lim_(x arrow 3) [((sqrt(x + 1) - 2))/((x^2 - 9)) dot ((sqrt(x + 1) + 2))/((sqrt(x + 1) + 2))] = lim_(x arrow 3) [ ((sqrt(x + 1))^2 - 2^2) / ((x^2 - 9) (sqrt(x + 1) + 2)) ]\
        &= lim_(x arrow 3) [(x + 1 - 4)/((x^2 - 9)(sqrt(x + 1) + 2))] = lim_(x arrow 3) (x - 3)/((x^2 - 9)(sqrt(x + 1) + 2))\
        &= lim_(x arrow 3) cancel(x - 3)/(cancel((x - 3)) (x + 3) (sqrt(x + 1) + 2)) = lim_(x arrow 3) (1)/((x + 3) (sqrt(x + 1) + 2))\
        &= 1/((3 + 3) (sqrt(3 + 1) + 2)) = 1/(6 dot (sqrt(4) + 2))\
        &= 1/(6 dot (2 + 2)) = 1/(6 dot 4)\
        &= 1/24
      $
    ])


