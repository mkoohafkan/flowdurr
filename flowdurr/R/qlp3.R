qlp3 <-
function(p, mu, sigma, gamma) 
  10^quape3(p, vec2par(c(mu, sigma, gamma), type='pe3'))
