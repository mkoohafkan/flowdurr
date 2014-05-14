dlp3 <-
function(x, mu, sigma, gamma) 
  pdfpe3(log10(x), vec2par(c(mu, sigma, gamma), type='pe3'))
