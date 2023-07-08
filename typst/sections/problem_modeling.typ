#import "../utils.typ": smoothing, upscaling

O processamento de imagem é uma área imensamente vasta - desde segmentação, passando por filtragem e indo até transformações geométricas. A verdade é que métodos numéricos constituem alta aplicabilidade aqui.

Decidimos optar por uma técnica de #smoothing, uma forma de filtragem, e pela técnica de #upscaling. O primeiro é um processo que visa reduzir o ruído e as imperfeições de uma imagem, tornando-a imagem mais suave e uniforme. Já o #upscaling consiste, como o nome indica, no aumento de resolução de uma imagem.

O nosso objetivo então passa por desenvolver dois _scripts_ *MATLAB* que possam aplicar o processo de #smoothing e #upscaling a imagens. Ou seja, dada uma imagem, gerar uma nova imagem com os processamentos aplicados.
