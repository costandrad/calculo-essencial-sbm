
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"
#import "@preview/lilaq:0.5.0" as lq

#let darkblue = rgb("#1e3a64")
#let lightblue = rgb("#5bc0de")
#let sbm-blue = rgb("#006496")
#let sbm-green = rgb("#35a097")


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
  #rect(radius: 6pt, stroke: lightblue, fill: color.mix(lightblue, (white, 70%)), inset: 8pt)[
    #text(fill: darkblue, weight: "bold")[Solução:]
  ]
  
  #content

  #align(right)[
    #h(1fr) #rect(width: 10pt, height: 10pt, fill: lightblue)
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
            #text(fill: darkblue, size: 20pt, weight: "bold")[#curso]\
            #text(fill: sbm-blue, weight: "light")[Professor: Adail Cavalheiro]\
            #text(fill: sbm-blue, weight: "light")[Aluno: #author]
          ],
          align(horizon+center)[
            #set text(fill: darkblue, weight: "bold", size: 10pt)
            #rect(radius: 8pt, inset: 10pt, stroke: lightblue, fill: color.mix(lightblue, (white, 70%)))[
              MÓDULO #modulo.numero \
              #modulo.tema
            ]
          ]
        )
      ]
    }
  )

  rect(width: 100%, radius: 8pt, inset: 10pt, stroke: lightblue, fill: color.mix(lightblue, (white, 70%)))[
    #set text(weight: "bold", fill: darkblue)
    #align(center)[
      Lista de Exercícios - Aula #aula.numero
    ]
  ]

  doc
}