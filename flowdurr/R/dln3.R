dln3 <-
function(x, zeta, mulog, sigmalog) 
  pdfln3(x, vec2par(c(zeta, mulog, sigmalog), type='ln3'))
