### Introdução

Olá a todos. O meu nome é Júlio e hoje estou aqui para apresentar o projeto desenvolvido no contexto da UC de Métodos Numéricos e Otimização não Linear do ano letivo 2022/2023.


### Definição do tema

Optamos por não utilizar muito o ChatGPT nesta fase de desenvolvimento. Isto pois, procurávamos um tema mais genuíno e em que todos os membros do grupo tivessem interesse. Depois de alguma pesquisa, percebemos que as previsões metereológicas têm uma componente matemática muito forte e que, por isso, seria um bom tema para o projeto. No entanto, as equações que descrevem o comportamento da atmosfera (Navier-Stokes) são muito complexas e, portanto, decidimos abandonar a ideia. Encontramos, depois, outra ideia bastante interessante também - processamento de imagem. De facto, grande parte dos softwares utilizados hoje em dia, como o GIMP ou o Photoshop, utilizam métodos numéricos para processar imagens. 
Pensamos que perguntar ao ChatGPT sobre se este conceito aplicava conceitos matemáticos lecionados na UC, faria todo o sentido. A resposta foi positiva.

### Modelação do problema

Uma vez que processamento de imagem é um conceito muito vago, tivemos de nos focar em alguns aspetos mais específicos. Com a ajuda do ChatGPT, percebemos que podíamos abordar o processamento de imagem de duas formas: resizing e smoothing. O primeiro processo consiste em aumentar a dimensão da imagem (não confundir com resolução) e o segundo em diminuir a quantidade de ruído presente na imagem. É interessante relembrar que existem outros tipos de processamento, tais como: filtering (aplicação de filtros), sharpening (aumento da nitidez) e color adjustment (ajuste de cores).

### Codificação MATLAB

Nesta fase, utilizamos bastante o ChatGPT. No entanto, o nosso espírito crítico foi crucial. Aconteceu imensas vezes da ferramenta nos dar código que ou não funcionava ou não realizava o que prometia. Por isso, tivemos de fazer várias alterações ao código que nos foi dado.

### Imagem original

Esta é a imagem inicial que vamos utilizar para demonstrar o funcionamento dos nossos scripts codificados em MATLAB. A imagem contém bastante granularidade e, por isso, é um bom exemplo para demonstrar o funcionamento do smoothing. A imagem tem também as dimensões 256x243 pixels, o que irá dar jeito para demonstrar o funcionamento do resizing.

### Resizing

Como indicado anteriormente, este processo tem como objetivo aumentar a dimensão de uma imagem. Esta é a imagem original depois de passar por esse mesmo processo. Como é possível ver pelo código MATLAB, existe um fator de scaling que é aplicado à imagem. Neste caso, o fator é 2, o que significa que a imagem final terá o dobro da dimensão da imagem original. O MATLAB contém a rotina imresize, que nos ajudou bastante. A mesma recebe como argumentos uma image, um fator de scaling e uma função de interpolação. 
Optamos por utilizar a função bicúbica, que é a mais utilizada para este tipo de processamento. Essencialmente, são calculados coeficientes para cada cada pixel da imagem original (normalmente, recorre-se a funções como a B-spline para esse cálculo) e, com base nesses coeficientes, é possível interpolar o valor de um pixel numa posição qualquer da imagem final.

### Resizing com funções diferentes

Como forma de curiosidade, apresentamos aqui a utilização de outras funções, tais como a bilinear e a nearest neighbor. A primeira é a mais simples de todas, pois apenas calcula a média dos 4 pixels mais próximos. A segunda, por sua vez, apenas copia o valor do pixel mais próximo. Como é possível ver, a imagem final não é tão boa como a anterior. Isto porque, a função bicúbica é a que melhor preserva a informação da imagem original.

### Smoothing

Este processo tem como objetivo diminuir a quantidade de ruído presente numa imagem. Para isso, decidimos utilizar um método _patch-based_. Este método consiste em dividir a imagem em vários _patches_ (pequenas imagens) e, para cada um deles, calcular o valor médio dos seus pixels. O valor médio é, então, atribuído a todos os pixels do _patch_. Este processo é repetido para todos os _patches_ da imagem. O valor médio é obtido calculando a área de cada _patch_ e dividindo-a pela soma dos valores de todos os seus pixels. Uma vez que a expressão analítica da área não é conhecida, optamos por utilizar integração numérica, mais precisamente a regra do trapézio.
Esta imagem é o resultado final do processo de smoothing. Como é possível ver, a granularidade da imagem original foi bastante reduzida. No entanto, o processo não é perfeito e, por isso, ainda é possível ver algum ruído na imagem final. De facto, a existência de um processo perfeito é impossível, já que a granularidade é uma característica inerente a qualquer imagem.

### ChatGPT como ferramenta de aprendizagem

É impressionante a forma como a inteligência artificial tem avançado nos últimos tempos. O ChatGPT é um exemplo disso mesmo. No entanto, é importante referir que o ChatGPT não é perfeito. De facto, é necessário ter algum conhecimento prévio sobre o tema para conseguir filtrar o que é útil e o que não é. Sentimos muito isto aquando do desenvolvimento do código em MATLAB. Uma vez que ele apenas consegue desenvolver o código e não literalmente testá-lo, os resultados dados nem sempre foram os melhores. Acredito que, no futuro, esta barreira irá ser ultrapassada. Para terminar, diria que é inegável dizer que, eventualmente, este tipo de tecnologias irão fazer parte do ensino superior.

### Conclusão

Em suma, este projeto foi bastante interessante. Aprender sobre como softwares de processamento de imagem, que usamos quase diariamente, funcionam foi bastante interessante. Aprendemos também que o ChatGPT é uma ferramenta muito útil, mas que ainda tem muito para evoluir. Obrigado a todos e até à próxima.
