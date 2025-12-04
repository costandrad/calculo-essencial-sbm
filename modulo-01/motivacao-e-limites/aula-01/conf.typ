
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"
#import "@preview/lilaq:0.5.0" as lq

#let darkblue = rgb("#1e3a64")
#let lightblue = rgb("#5bc0de")
#let sbm-blue = rgb("#006496")
#let sbm-green = rgb("#35a097")

#let solution(content) = [
  #rect(radius: 6pt, stroke: sbm-blue+1.5pt, inset: 8pt)[
    #text(fill: sbm-blue, weight: "bold")[Solução:]
  ]
  
  #content

  
  #align(right)[
    #rect(width: 10pt, height: 10pt, fill: sbm-blue)
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