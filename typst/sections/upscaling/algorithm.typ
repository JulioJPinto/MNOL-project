#import "/matlab.typ": *
#import "/utils.typ": *

#let imresize = text(black, weight: "bold")[#smallcaps("Imresize")]

Faremos agora a explicação passo a passo do algoritmo *MATLAB* de #upscaling.

#steps[
+ Tal como no #smoothing, ler a imagem para uma matriz ($cal(M)_(h,w,3)$) de tamanho $h$ (altura da imagem) x $w$ (comprimento da imagem) x $3$ (cor #RGB).
  #matlab(sublines(upscaling_code, 0, 8))

+ Converter os valores _h_ e _w_ da matriz, que estão entre 0 e 255, para valores decimais entre 0.0 e 1.0.
  #matlab(sublines(upscaling_code, 8, 9))

+ Invocar a rotina #matlab_function("imresize") indicando que a interpolação desejada é `bicubic`. 
  #matlab(sublines(upscaling_code, 11, 12))
  Esta interpolação nada mais é que a cúbica, mas aplicada a duas dimensões.
 
  #let pre_upscaling_csv = csv("/img/pre-upscaling.csv").map(row => row.map(value => calc.round(int(value) / 255, digits: 2)))
  #let pos_upscaling_csv = csv("/img/pos-upscaling.csv").map(row => row.map(value => calc.round(int(value) / 255, digits: 2)))
  #let pre_upscaling_csv_str = pre_upscaling_csv.map(row => row.map(value => float_to_string(value)))

  #pagebreak()
  
  Faremos agora a explicação de como funciona a chamada à rotina #imresize.  Na demonstração do exemplo, em semelhança ao exemplo do #smoothing, as cores #RGB também foram convertidas para um único canal de brilho.
  \
  
  #block({
    [Como exemplo, levaremos em conta a primeira submatriz 4x4 (chamemos-lhe de $cal(R)$) da @patch_values:]

    align(center + horizon, 
      [#figure(caption: [Valores da matriz $cal(R)$], grid_image_with_generator(pre_upscaling_csv, smoothed_patch_circle))<matriz_r>]
    ) 
  })

  \
  
  Podemos representar esta matriz num gráfico de dispersão tridimensional, sendo que cada coluna _*i*_ e cada linha _*j*_ é transformado num ponto com coordenadas $(i,j,cal(M)_(i\j))$. O valor da cor, $cal(M)_(i\j)$, foi também redimensionado de $[0,1]$ para $[0,255]$ para melhor visualização.

  #figure(image("/img/original-matrix.png", width: 70%), caption: [Matriz $cal(R)$ representada num gráfico de dispersão 3D])

  \
  #block({
      [Agora, com estes 16 pontos, é possível gerar uma superfície interpoladora desses pontos.
      O cálculo desta superfície pode ser feita com recurso a, por exemplo, _splines_ bicúbicos.]
      figure(image("/img/interpoled-function.png", width: 75%), caption: [Representação da função interpoladora bicúbica da matriz $cal(R)$])
  })

  \
  Com isto, os valores dos _pixels_ da nova imagem redimensionada serão simplesmente amostras desta superfície. Como queremos redimensionar a imagem para duas vezes o seu tamanho ($italic("scale")=2$), pegaremos em $8*8=64$ amostras, separadas uniformemente.

  #figure(image("/img/interpoled-points.png", width: 75%), caption: [Representação das amostras na função interpoladora])

  #block[
    Desta forma, temos os valores dos _pixels_ da submatriz da imagem redimensionada.
    
    #locate(loc => query(<matriz_r>, loc).first())
    #figure(caption: [Valores da matriz $cal(R)$ após #upscaling], grid_image_with_generator(pos_upscaling_csv, smoothed_patch_circle))
  ]

  Agora o mesmo procedimento é aplicado no resto da imagem.

  Para aplicação do algoritmo numa imagem, a interpolação bicúbica em uma matriz de tamanho arbitrário pode ser realizada juntando as várias superfícies bicúbicas 4x4, fazendo com que as derivadas coincidam entre as bordas dessas.

+ Mostrar imagem original e resultado no MATLAB.

  #matlab(sublines(upscaling_code, 13, 22))

+ Guardar a imagem num ficheiro.

  #matlab(sublines(upscaling_code, 23, 25))

  
]

