#import "utils.typ": float_to_string, smoothed_patch_circle

#let matlab(code) = {
  v(5pt, weak: false)
  box(
    raw(code, lang: "matlab"),
    fill: luma(240), 
    width: 1fr,
    radius: 10pt, 
    outset: (x: 6pt, y: 8pt)
  )
  v(5pt, weak: false)
}

#let simple_matlab(code) = {
  v(5pt, weak: false)
  box(
    raw(code, lang: "matlab"),
    fill: luma(240), 
    radius: 10pt, 
    outset: (x: 6pt, y: 8pt)
  )
  v(5pt, weak: false)
}

#let matlab_functions_dict = (
  max: "https://www.mathworks.com/help/matlab/ref/max.html",
  min: "https://www.mathworks.com/help/matlab/ref/min.html",
  trapz: "https://www.mathworks.com/help/matlab/ref/trapz.html",
  imresize: "https://www.mathworks.com/help/matlab/ref/imresize.html"
)

#let matlab_function(e) = link(matlab_functions_dict.at(e), 
  underline(text(rgb("#d73a49"), weight: "bold", style: "italic", e)))
                                          
#let grid_image_with_generator(image, generator) = {
  grid(
    rows: image.len(),
    columns: image.at(0).len(),
    ..for row in image {
      for color in row {
        (generator(color),)
      }
    }
  )
}

#let grid_image(image) = grid_image_with_generator(image, 
  (color) => square(fill: luma(color), stroke: black + 0.5pt)[
    #set align(center + horizon)
    #text(luma(90%), size: 0.6em, float_to_string(color / 255))]
  )

#let grid_image_csv(file) = grid_image(csv(file).map(row => row.map(value => int(value))))

#let slice_matrix(matrix, start, end) = {
  let (from_x,from_y) = start
  let (to_x,to_y) = end

  range(from_x, to_x + 1).map(x => range(from_y, to_y + 1).map(y => matrix.at(x).at(y)))
}

#let map_matrix(matrix, map_function) = {
  let size_x = matrix.at(0).len()
  let size_y = matrix.len()

  range(0, size_x).map(x => range(0, size_y).map(y => map_function(matrix.at(x).at(y), x, y)))
}

#let transpose_matrix(matrix) = {
  let size_x = matrix.at(0).len()
  let size_y = matrix.len()

  range(0, size_x).map(x => range(0, size_y).map(y => matrix.at(y).at(x)))
}

#let trapz(points) = {
  let result = 0
  
  for (x, fx) in points.enumerate() {
    if x < points.len() - 2 {
      result += points.at(x + 1)
    }
    result += fx
  }
  
  return result / 2
}
