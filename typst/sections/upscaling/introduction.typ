#import "/utils.typ": *

O processo  de #upscaling tem por base a *interpolação numérica*, que é utilizada para estimar o valor dos _pixels_ nas novas posições entre _pixels_ da imagem redimensionada.

Existem vários métodos utilizados atualmente, os mais conhecidos sendo: o *método do "vizinho mais próximo"*, o *método bilinear* e o *método bicúbico*:

- O primeiro, o *método do vizinho mais próximo*, é o mais simples de todo e consiste simplesmente em atribuir o valor do _pixel_ mais próximo ao _pixel_ atual. É, portanto, facilmente dedutível que este método irá introduzir bastantes artefactos na imagem. 
O segundo e terceiro métodos já apresentam resultados melhores em grande parte das imagens, mas requerem um poder computacional superior. 

- O *método bilinear* utiliza os 4 pontos (2x2) mais próximos ao _pixel_ que irá ser interpolado, define um polinómio quadrático e estima o valor final do _pixel_. 
- O *método bicúbico* faz o mesmo, com a exceção de utilizar 16 _pixels_ (4x4), definindo assim um polinómio cúbico, dando aso a melhores resultados. 

Decidimos optar por utilizar o *método bicúbico* para o nosso algoritmo de #upscaling.
