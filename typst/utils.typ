#let RGB = [#text(red, "R")#text(green, "G")#text(blue, "B")]

#let smoothing = {  
  text(red, weight: "bold")[#smallcaps("Smoothing")]
}

#let upscaling = {  
  text(orange, weight: "bold")[#smallcaps("Upscaling")]
}

#let GPT = {  
  text(black, weight: "bold")[#smallcaps("ChatGPT")]
}


#let smoothing_code = read("code/smoothing.txt")

#let upscaling_code = read("code/upscaling.txt")

#let float_to_string(f, decimal_digits: 2) = {
  let decimal_part = str(calc.round(calc.fract(f), digits: decimal_digits)).slice(2)

  decimal_part += "0" * (decimal_digits - decimal_part.len())

  return str(calc.trunc(f)) + "." + decimal_part
}

#let sublines(string, start, end) = string.split("\n")
                                          .slice(start, end)
                                          .join("\n")

#let steps = (children) => {
  show enum: (e) => for (i, item) in e.children.enumerate() [
    *Passo #(i+1).* #(item.body)
    
  ]
  children
}

#let smoothed_patch_circle(color) = {
    square(fill: luma(int(color * 255)), stroke: black + 0.5pt)[
        #set align(center + horizon)
        #let text_color = if color < 0.6 {
          luma(245)
        } else {
          luma(10)
        }
        #text(text_color, float_to_string(color))
    ]
  }