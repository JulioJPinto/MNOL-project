#import "template.typ": *
#import "matlab.typ": *
#import "utils.typ": *

#show: project.with(
  title: "[MNOnL] Processamento de Imagem",
  group: "Grupo 20",
  authors: (
    "Rui Lopes",
    "Francisco Ferreira",
    "Duarte Ribeiro",
    "Júlio Pinto",
    "Daniel Pereira"
  )
)

= Introdução
#include("sections/introduction.typ")

= Definição do tema
#include("sections/theme_definition.typ")

= Modelação do problema
#include ("sections/problem_modeling.typ")

= #smoothing
#include ("sections/smoothing/introduction.typ")

== Algoritmo de #smoothing
#include("sections/smoothing/algorithm.typ")

#pagebreak()

== Resultado final #smoothing
#include("sections/smoothing/results.typ")

#pagebreak()

= #upscaling
#include("sections/upscaling/introduction.typ")

== Algoritmo de #upscaling
#include("sections/upscaling/algorithm.typ")

== Resultado final #upscaling
#include("sections/upscaling/results.typ")

#pagebreak()
= #GPT
#include("sections/chatgpt.typ")

= Conclusão
#include("sections/conclusion.typ")

#pagebreak()

= Código completo #smoothing
#raw(smoothing_code, lang: "matlab"))

#pagebreak()

= Código completo #upscaling
#raw(upscaling_code, lang: "matlab"))

#pagebreak()

#include("sections/references.typ")
