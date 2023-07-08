#align(center, 
  grid(rows: (30%, 10%, 50%), //na footnnote deixamos que é puramente representativo
      align(horizon, figure(image("/img/smoothed.png"), caption: [Imagem original (216 x 228)])),
      align(center + horizon, text(size: 3em, $arrow.b$)),
      align(center + horizon, figure(image("/img/upscaled.jpg"), caption: [Imagem redimensionada com `scale = 2` (432 x 456)#footnote([O tamanho da imagem presente visualmente neste ficheiro é meramente representativo. O verdadeiro tamanho da imagem está entre parênteses.])]))
    )
  )