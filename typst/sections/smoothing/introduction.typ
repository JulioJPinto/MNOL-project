#import "/utils.typ": *

O processo de #smoothing, na prática, passa a imagem por um filtro, tal, como por exemplo, se passam sinais por filtros passa-baixo, de forma a _cortar_ as frequências altas. Atualmente, existem vários filtros que são utilizados. Um dos mais utilizado é o _median filter_. Este consiste em dividir a imagem em várias porções e atribuir o resultado da mediana dos _pixels_ ao _pixel_ central da porção. Como é óbvio, existem algumas variações deste filtro, sendo uma delas o _mean area filter_, que consiste, de forma análoga, em atribuir o resultado da área média dos _pixels_ ao _pixel_ central da porção. \
No desenvolvimento do nosso trabalho decidimos optar por uma implementação do segundo filtro.
Este algoritmo usa como base o conceito de _patches_, pequenas áreas da imagem, para calcular o valor de cada _pixel_. De maneira a calcular o valor de cada _pixel_, o algoritmo recorre a tópicos de integração, à regra do trapézio
#footnote([A decisão do uso da regra do trapézio é explicada mais #link(<explicacao_escola_regra_trapezio>)[#underline("abaixo")].])
em específico.
 