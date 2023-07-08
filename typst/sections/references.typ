#import "../matlab.typ": *

#show link: underline

#let bib_counter = counter("bib_counter")

#let bib_entry(text, url, date: datetime(day: 24, month: 6, year: 2023)) = {
  bib_counter.step()
  [*[#bib_counter.display()]* #text, #link(url), consultado em #date.display("[day]/[month]/[year]").]
  parbreak()
}

#let include-bib(key) = [
  #set text(0pt)
  #place(cite(key))
]

#bibliography("../bibliography.yml")

#for (key, value) in matlab_functions_dict.pairs() {
  bib_entry([Rotina #key MATLAB], value)
}

#bib_entry("Trapezoidal rule - Wikipedia", "https://en.wikipedia.org/wiki/Trapezoidal_rule")
#bib_entry("Bicubic interpolation - Wikipedia", "https://en.wikipedia.org/wiki/Bicubic_interpolation")