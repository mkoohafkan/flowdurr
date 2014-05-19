qlp3 <-
function#Quantile function of the (log) Pearson Type III distribution
### wrapper function for the (log) Pearson type III distribution defined in
### package lmomco. Returns NaN vector instead of NULL if parameters are invalid.
(p, 
### probabilites
mu, 
### see lmomco::quape3
sigma, 
### see lmomco::quape3
gamma
### see lmomco::quape3
){
  r = 10^quape3(p, vec2par(c(mu, sigma, gamma), type='pe3', paracheck=FALSE))
  if(is.null(r))
    return(rep(NaN, length(q)))
  else
    return(r)
}
