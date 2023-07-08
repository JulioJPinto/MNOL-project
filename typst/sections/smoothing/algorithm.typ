#import "/matlab.typ": *
#import "/utils.typ": *

Faremos agora a explicação passo a passo do algoritmo *MATLAB* de #smoothing.

#grid(columns: (45%, 45%),
      gutter: 4%,
      [#figure(image("/img/original.png"), caption: "Imagem original")<original>],
      [#figure(image("/img/selection.png"), caption: "Porção a ser analisada")<selection>])

#v(weak: false, 10pt)

#steps[
+ Ler a imagem para uma matriz ($cal(M)_(h,w,3)$) de tamanho $h$ (altura da imagem) x $w$ (comprimento da imagem) x $3$ (cor #RGB).
  
  #matlab(sublines(smoothing_code, 0, 8))
  
+ Converter os valores $h$ e $w$ da matriz, que estão entre $0$ e $255$, para valores decimais entre $0.0$ e $1.0$.
  
  #matlab(sublines(smoothing_code, 8, 9))

+ Inicializar a matriz resultado, toda a zeros, com o mesmo tamanho da matriz $cal(M)$.

  #matlab(sublines(smoothing_code, 10, 11))

+ Percorrer os três canais de cor (#RGB).
  
  #matlab(sublines(smoothing_code, 12, 13))

+ Para cada um dos canais, percorrer os valores das cores nas coordenadas $i$, $j$ da imagem.

  #matlab(sublines(smoothing_code, 13, 15))

+ Extrair o fragmento do canal de cor atual $c$ para ser aplicado o #smoothing. Este fragmento é uma submatriz de $cal(M)$ com as linhas do intervalo $[i-italic("scale"), i + italic("scale")]$ e com as colunas no intervalo $[j-italic("scale"), j + italic("scale")]$. São usadas as funções #matlab_function("max") e #matlab_function("min") para evitar que os fragmentos não vão para além das bordas da imagem#footnote([O tamanho do _patch_ será menor nessas situações.]).
  
  #matlab(sublines(smoothing_code, 15, 19))
  
  Como exemplo, faremos a aplicação do algoritmo (simplificado#footnote(
    [Para simplificação de demonstração, os três canais de cor foram substituídos por apenas um só, com valor brilho do _pixel_ da imagem em preto e branco. Esse valor foi calculado tendo por base a norma NTSC e a respetiva fórmula da luminância, dada por $Y = 0.2126R + 0.7152G + 0.0722B$ e em que $R$, $G$ e $B$ é o valor de cada um dos canais coloridos do _pixel_. ]
  )) na porção a ser analisada mostrada na @selection.

  #v(-50pt)
  
  #figure(scale(90%, origin: bottom, grid_image_csv("/img/pre-smoothing.csv")), caption: [Valores dos _pixels_ da porção analisada])<patch_values>

  #let pre_smoothing_csv = csv("/img/pre-smoothing.csv").map(row => row.map(value => calc.round(int(value) / 255, digits: 2)))
  #let pos_smoothing_csv = csv("/img/pos-smoothing.csv").map(row => row.map(value => calc.round(int(value) / 255, digits: 2)))
  #let pre_smoothing_csv_str = pre_smoothing_csv.map(row => row.map(value => float_to_string(value)))
  
  #block(breakable:false, width: 100%, {
    [Na execução do algoritmo simplificado, na porção, para $i=3$ e $j=3$, o fragmento $italic("patch")$#footnote([A varíavel _scale_ está com valor $2$, logo a nossa matriz terá de tamanho $5$x$5$ ($2+1+2)$ para coordenadas longe das bordas da imagem.]) terá a seguinte matriz como valor:]

    let matrix = slice_matrix(pre_smoothing_csv_str, (0,0), (4,4))
    
    let map_fuction(value, x, y) = {
      if x == 2 and y == 2 {
        $bold(value)$
      } else {
        value
      }
    }
    
    matrix = math.mat(..map_matrix(matrix, map_fuction))
    
    [$ cal(P) = matrix $]
  })

+ Aplicar o #smoothing na matriz $italic("patch")$. A função #matlab_function("trapz") é usada para integrar ao longo das linhas ($1$) e depois ao longo das colunas ($2$). O resultado é divido pelo número de elementos na matriz para calcular a média.
  #matlab(sublines(smoothing_code, 20, 21))

  \
  Analisando a linha acima passo a passo:
  
  #align(center, simple_matlab("trapz(patch, 1)"))

  A chamada a esta função aplica o método do trapézio ao longo das linhas da matriz.
  Desta forma, a matriz resultado desta função, $cal(T_1)$, será calculada da seguinte forma:
  
  #let mat1 = math.mat(..slice_matrix(pre_smoothing_csv_str, (0,0), (4,0)))
  #let mat2 = math.mat(..slice_matrix(pre_smoothing_csv_str, (0,1), (4,1)))
  #let mat3 = math.mat(..slice_matrix(pre_smoothing_csv_str, (0,2), (4,2)))
  #let mat4 = math.mat(..slice_matrix(pre_smoothing_csv_str, (0,3), (4,3)))
  #let mat5 = math.mat(..slice_matrix(pre_smoothing_csv_str, (0,4), (4,4)))

  #let trapz1 = trapz(..transpose_matrix(slice_matrix(pre_smoothing_csv, (0,0), (4,0))))
  #let trapz2 = trapz(..transpose_matrix(slice_matrix(pre_smoothing_csv, (0,1), (4,1))))
  #let trapz3 = trapz(..transpose_matrix(slice_matrix(pre_smoothing_csv, (0,2), (4,2))))
  #let trapz4 = trapz(..transpose_matrix(slice_matrix(pre_smoothing_csv, (0,3), (4,3))))
  #let trapz5 = trapz(..transpose_matrix(slice_matrix(pre_smoothing_csv, (0,4), (4,4))))
  
  $
  cal(T_1)=
    mat(italic("trapz")mat1, italic("trapz")mat2, italic("trapz")mat3, italic("trapz")mat4, italic("trapz")mat5)
    \
    \
    = mat(#float_to_string(trapz1, decimal_digits: 4), 
          #float_to_string(trapz2, decimal_digits: 4), 
          #float_to_string(trapz3, decimal_digits: 4), 
          #float_to_string(trapz4, decimal_digits: 4), 
          #float_to_string(trapz5, decimal_digits: 4))
  $

  \
  O resultado da chamada da função acima é agora passado novamente para a função #matlab_function("trapz"), mas agora operando ao longo das colunas:
  #align(center, simple_matlab("trapz(trapz(patch, 1), 2)"))

  Desta forma, a matriz resultado da chamada desta função, $cal(T_2)$, será calculada assim:

  #let mat_trapz = (trapz1, trapz2, trapz3, trapz4, trapz5)
  #let trapz_result = trapz(mat_trapz)
  
  $
  #let mattrapzstr = math.mat(mat_trapz.map(v => float_to_string(v, decimal_digits: 4)))
  
  cal(T_2) = italic("trapz")(cal(T_1)) = italic("trapz")mattrapzstr = #trapz_result
  $
  \
  Agora, para calcular a área média, dividindo pelo número de elementos da matriz:
  #align(center, simple_matlab("trapz(trapz(patch, 1), 2) / numel(patch)"))

  #let n = 5*5
  #let smooth_result = trapz_result / n
  
  $
  cal(S)=cal(T_2)/n=#trapz_result/#n=#smooth_result
  $

  Este resultado vai ser o valor final do canal de cor atual que o _pixel_ atual irá ter.
  
  \
  
+ Gravar o resultado $cal(S)$ na matriz resultado nas posições e cor de canal atual.

  #matlab(sublines(smoothing_code, 21, 22))


+ Aplicar o mesmo algoritmo para os restantes _pixels_.

  #matlab(sublines(smoothing_code, 12, 25))
  
  #figure(caption: "Execução do algoritmo numa pequena porção da imagem", grid(columns: 3, gutter: 2%,
    grid_image_with_generator(slice_matrix(pre_smoothing_csv, (6,6), (11,11)), smoothed_patch_circle),
    align(center + horizon, text(size: 3em, $->$)),
    grid_image_with_generator(slice_matrix(pos_smoothing_csv, (6,6), (11,11)), smoothed_patch_circle),
  ))

  #v(10pt)
+ Mostrar imagem original e resultado no MATLAB.

  #matlab(sublines(smoothing_code, 26, 34))

  #v(10pt)
+ Guardar a imagem num ficheiro.

  #matlab(sublines(smoothing_code, 35, 37))

  #pagebreak()
  A aplicação do algoritmo na porção de _pixels_ analisada pode ser vista na @smoothing_algorithm_portion:
  
  #figure(caption: "Execução do algoritmo na porção da imagem", 
    grid_image_csv("/img/pos-smoothing.csv")
  )<smoothing_algorithm_portion>

  \
  Como é possível ver, a porção depois do algoritmo ser aplicado está muito mais suave.
  
  Isto deve-se ao facto de fazermos uma integração numérica nos _patches_ extraídos da imagem. Com isto, estimamos essa área média sob a curva representada pelos valores de cada _patch_ usando a *regra do trapézio*. 
  
  Consideramos que este algoritmo seja o mais adequado, devido à natureza das imagens em que o estamos a aplicar. Entre pontos há muito ruído e não são aproximáveis por uma função suave em que, por exemplo, o algoritmo de Simpson seria mais apropriado.<explicacao_escola_regra_trapezio>
]
