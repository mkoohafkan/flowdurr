qln3 <-
function#Quantile function of the 3-parameter lognormal distribution
### wrapper function for the 3-parameter lognormal distribution defined in
### package lmomco. Returns NaN vector instead of NULL if parameters are invalid.
(p, 
# probabilities
zeta, 
### see lmomco::qualn3
mulog, 
### see lmomco::qualn3
sigmalog
### see lmomco::qualn3
){
  r = qualn3(p, vec2par(c(zeta, mulog, sigmalog), type='ln3', paracheck=FALSE))
  if(is.null(r))
    return(rep(NaN, length(x)))
  else
    return(r)    
}
