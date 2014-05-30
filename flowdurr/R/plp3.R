plp3 <-
function#Distribution function of the (log) Pearson Type III distribution
### wrapper function for the (log) Pearson type III distribution defined in
### package lmomco. Returns NaN vector instead of NULL if parameters are invalid.
(q, 
# quantiles
mu, 
### see lmomco::cdfpe3
sigma, 
### see lmomco::cdfpe3
gamma
### see lmomco::cdfpe3
){ 
  r = cdfpe3(log10(q), vec2par(c(mu, sigma, gamma), type='pe3', paracheck=FALSE))
  if(is.null(r))
    return(rep(NaN, length(q)))
  else
    return(r)
}
