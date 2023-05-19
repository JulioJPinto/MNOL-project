## Presentation Script: Solving the Image Processing Problem with Numerical Techniques

### Introdução

Olá Boa tarde o meu nome é Júlio e estou aqui para apresentar o trabalho realizado por mim e pelos meus colegas, Duarte, Francisco, Rui e Daniel na unidade curricular de Métodos Numéricos e Otimizações Não Lineares.

### Definição do tema

Originalmente pensamos em falar sobre previsões meteorológicas, porém foi nos aconselhado escolher outro tema devido à dificuldade do mesmo.
Por esse motivo decidimos seguir o tema **Processamento de Imagem**. Este tema aplica diversos conceitos da UC porém achamos mais relevante focarmo nos nos temas de integrais numéricos, interpolação numérica e sistemas não lineares de equações.

### Modelação do problema

De maneira a desenvolver este tema decidimos modelar um problema. Com ajuda do ChatGPT, chegamos a um problema que o objetivo é desenvolver um algoritmo para imagens pretas e brancas de *upscaling* e *denoising* das mesmas. Para isto é necessário aplicar os conceitos aprendidos na Unidade Curricular definidos previamente.

Originalmente tinhamos como objetivo focar nos sobretudo na parte de integração numérica e sistemas não lineares de equações. Porém deparamo nos com alguns problemas no desenvolvimento do código Matlab.

Sendo assim decidimos alterar o nosso foco para um algoritmo que principalmente aplica conceitos de interpolação e integração númerica.

De maneira a desenvolver o nosso código precisamos de arranjar uma imagem que tenha dimensões pequenas e que tenha bastante ruído.
Para isso vamos utilizar esta imagem de um homem a olhar por um telescópio.

### Solução

Da primeira vez que tentamos desenvolver uma solução para o problema deparamo nos que não estavamos a conseguir desenvolver um código que preenchesse todos os requesitos que definimos na modelação do problema. Por esse motivo decidimos fazer uma pesquisa mais avançada nos métodos usados para os efeitos de *upscailing* e *denoising*.

Deparamo nos com bastantes conhecimentos que são desenvolvidos na unidade curricular ao longo da nossa pesquisa. 

Como podemos ver no nosso código, utilizamos interpolação bicúbica. Esta interpolação deriva diretamente do conceito de splines. Ainda mais esta é bastante utilizada no *upscaling* de imagens. 

Na matemática a interpolação bicúbica é uam extensão da interpolação spline cúbica para interpotlar pontos de daos numa grelha bidimensional. Comparada a interpolação bilinear a superfície interpolada fica mais suave. Podemos desenvolver esta utilizando polinómios de Lagrange, splines cúbicos ou o algoritmo de convolução cúbico.

Ainda mais maneira a criar diminuir o ruído utilizamos um filtro mediano.
Este filtro ao contrário de outros filtros, usa a mediana da vizinhança para trocar o valor do píxel onde está a iterar.

Depois disso aplicamos um Filtro Gaussiano, este ao contrário do filtro mediano utiliza uma média pesada para substituir os valores do píxel.

De maneira a concluir este algoritmo ainda aplicamos integração numérica de maneira a aumenta o efeito de *smoothing*. Para isto utilizamos a regra do trapézio de maneira a estimar o valor médio de uma área de pixeis.

Ainda mais no código temos simplesmente comandos de maneira a demonstrar e a guardar o output dos ficheiros no sistema.

### Resultados

Como podemos observar nos slides temos aqui alguns dos resultados do processamento do algoritmo, incluindo alguns dos passos intermédios do mesmo.

### Otimizações ChatGPT

De maneira a utilizar o ChatGPT o melhor possível achamos que seria interessante recorrer ao mesmo de forma a melhorar o nosso código. Para isso demos lhe o contexto do trabalho e o código desenvolvido, porém mesmo assim deparamo nos com o facto que este confudia temas como integração numérica e acabava por retirar usos da mesma, por exemplo como podemos ver no código este retira a utilização da regra do trapézio.

Desta forma achamos que seria então melhor mantermo nos pelo nosso código.

### Conclusões

Como podemos ver pelo desenvolvimento do algoritmo acreditamos que cumprimos o objetivo, porém durante este processo apercebemo-nos que no contexto de Processamento de Imagem, os conceitos lecionados na UC podem ser muito úteis.

Ainda mais, ao longo do projeto conseguimos formar uma melhor apreciação pelo ChatGPT como uma ferramenta de auxílio no desenvolvimento de trabalhos, algo bastante refrescante do que simplesmente limitar o uso do mesmo. Porém chegamos a conclusão que nem sempre este está correto por isso devemos levar as informações concluídas através do mesmo não como uma verdade absoluta. Desta forma consideramos que este é uma ferramenta bastante útil mas como qualquer ferramenta é necessário saber usá-la.

Para concluir creio que este trabalho foi bastante inovador nos métodos que nos pediram para o desenvolver e a nosso ver foi um trabalho bastante engraçado de fazer. Acreditamos que o que aprendemos relativamente ao uso do ChatGPT como aos conceitos da unidade curricular virão a ser uteis no nosso futuro académico e profissional.

