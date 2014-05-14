pln3 <-
function(x, zeta, mulog, sigmalog)
  cdfln3(x, vec2par(c(zeta, mulog, sigmalog), type='ln3'))
