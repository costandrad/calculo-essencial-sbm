
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"
#import "@preview/lilaq:0.5.0" as lq

#let darkcolor = rgb("#ffe23b")
#let lightcolor = rgb("#ffff99")
#let sbm-blue = rgb("#006496")
#let sbm-green = rgb("#35a097")




// Aplica o método de Briot–Ruffini (divisão sintética)
// dividend: coeficientes do polinômio (ordem decrescente)
// r: raiz candidata
// Retorna: (coeficientes do quociente, resto)
#let briot-ruffini(dividend, r) = [
  // Número de coeficientes do polinômio
  #let n = dividend.len()

  // Inicializa o quociente com o primeiro coeficiente
  #let quotient = (dividend.at(0),)

  // Calcula iterativamente os coeficientes do quociente
  #for i in range(1, n - 1) {
    quotient.push(quotient.at(i - 1) * r + dividend.at(i))
  }

  // Calcula o resto da divisão
  #let remainder = quotient.last() * r + dividend.last()

  // Retorna quociente e resto
  #return (quotient, remainder)
]

// Gera a tabela do método de Briot–Ruffini
// com formatação visual do processo
#let briot-ruffini-table(dividend, r) = [
  // Número de coeficientes
  #let n = dividend.len()

  // Executa o algoritmo de Briot–Ruffini
  #let (quotient, remainder) = briot-ruffini(dividend, r)

  // Define o estilo das linhas da tabela
  #set table(
    stroke: (x, y) => (
      top: if y == 1 { 1pt } else {},
      left: if (x == 1 or x == n) { 1pt } else {} 
    )
  )

  // Monta a tabela com coeficientes, quociente e resto
  #align(center, table(
    columns: n + 1,
    [$#r$], ..dividend.map(a => $#a$),
    [], ..quotient.map(q => $#q$), [$#remainder$]
  ))
]



// -------------------------------------------------------------
// 
// Função: fmt(x, digits)
// Formata um número no padrão brasileiro:
// - Arredonda para 'digits' casas decimais
// - Usa vírgula como separador decimal
// - Usa ponto como separador de milhar na parte inteira
// -------------------------------------------------------------
#let fmt(x, digits: 1) = [

  #if digits == 0 {
    return str(calc.round(x))
  }

  // 1) Arredonda o número para a quantidade de casas pedida
  #let x = calc.round(x, digits: digits)

  // 2) Converte para string e troca "." por ","
  #let str_x = str(x).replace(".", ",")

  #if x == calc.round(x) {
    str_x += ",0"
  }

  // 3) Separa em parte inteira e decimal
  //    split(",") retorna array; flatten() garante (a, b)
  #let (parte_inteira, parte_decimal) = str_x.split(",").flatten()


  // 4) Garante que a parte decimal tenha exatamente 'digits' caracteres,
  //    completando com zeros à direita.
  #while parte_decimal.len() < digits {
    parte_decimal = parte_decimal + "0"
  }

  // 5) Pega o tamanho da parte inteira
  #let n = parte_inteira.len()

  // 6) Calcula quantos blocos de três haverá (m)
  //    e quantos dígitos sobrão na esquerda (b)
  #let m = calc.floor(n / 3)
  #let b = calc.rem(n, 3)

  // 7) Começa a parte inteira formatada
  //    Se b = 0 → string vazia; senão → primeiros b dígitos
  #let str_parte_inteira = parte_inteira.slice(0, b)

  // 8) Adiciona os grupos de 3 dígitos
  #for i in range(m) {

    // Caso especial: se não houver bloco inicial (b = 0)
    // e este for o primeiro bloco, não coloca ponto antes.
    if b == 0 and i == 0 {
      str_parte_inteira += parte_inteira.slice(
        b + 3*i,
        b + 3*(i + 1)
      )
    }

    // Caso normal: adiciona "." + grupo de 3 dígitos
    else {
      str_parte_inteira += "." + parte_inteira.slice(
          b + 3*i,
          b + 3*(i + 1)
        )
    }
  }

  // 9) Retorna parte inteira com pontos + vírgula + parte decimal
  #return str_parte_inteira + "," + parte_decimal
]

#let solution(content) = [
  #rect(radius: 6pt, stroke: darkcolor, fill: color.mix(lightcolor, (white, 70%)), inset: 8pt)[
    #text(fill: sbm-blue, weight: "bold")[Solução:]
  ]
  
  #content

  #align(right)[
    #h(1fr) #rect(width: 10pt, height: 10pt, fill: lightcolor)
  ]
]

#let conf(
  author: [],
  curso: [],
  modulo: (
    numero: [],
    tema: []
  ),
  secao: [],
  aula: (
    numero: [],
    tema: []
  ),
  doc
) = {



  set page(
    paper: "a4",
    margin: (top: 3cm, bottom: 2cm, left: 2cm, right: 2cm),
    header: context {
      if here().page() == 1 {
        []
      } else {
        [
          #set text(size: 10pt)
          #rect(width: 100%, stroke: (bottom: 0.6pt))[
            #text(weight: "bold")[#curso]
            #h(1fr) #counter(page).display()
          ]
        ]
      }
    },
    footer: [
      #set text(size: 10pt)
      #rect(width: 100%, stroke: (top: 0.6pt))[
        #text(weight: "bold")[Módulo #modulo.numero - #modulo.tema]
        #h(1fr) #secao: Aula #aula.numero - #aula.tema
      ]

    ]
  )

  set text(
    lang: "pt",
    font: "Arial",
    size: 12pt
  )

  set par(
    //first-line-indent: (amount: 1.25cm, all: true),
    justify: true,
    leading: 1.0em
  )

  place(
    top+center,
    float: true,
    scope: "parent",
    clearance: 2em,
    {
      rect(width: 100%, radius: 10pt, stroke: color.mix(gray, (white, 70%)), inset: 10pt)[
        #grid(
          columns: (4fr, 8fr, 4fr),
          align(horizon+left)[
            #image("assets/images/icone.png", height: 2.5cm)
          ],
          align(horizon+center)[
            #text(fill: sbm-blue, size: 20pt, weight: "bold")[#curso]\
            #text(fill: sbm-blue, weight: "light")[Professor: Adail Cavalheiro]\
            #text(fill: sbm-blue, weight: "light")[Aluno: #author]
          ],
          align(horizon+center)[
            #set text(fill: sbm-blue, weight: "bold", size: 10pt)
            #rect(radius: 8pt, inset: 10pt, stroke: darkcolor, fill: color.mix(lightcolor, (white, 70%)))[
              MÓDULO #modulo.numero \
              #modulo.tema
            ]
          ]
        )
      ]
    }
  )

  rect(width: 100%, radius: 8pt, inset: 10pt, stroke: darkcolor, fill: color.mix(lightcolor, (white, 70%)))[
    #set text(weight: "bold", fill: sbm-blue)
    #align(center)[
      Lista de Exercícios - Aula #aula.numero
    ]
  ]

  doc
}