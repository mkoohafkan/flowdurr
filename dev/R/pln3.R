pln3 <-
function#Distribution function of the 3-parameter lognormal distribution
### wrapper function for the 3-parameter lognormal distribution defined in
### package lmomco. Returns NaN vector instead of NULL if parameters are invalid.
(q,
### quantiles
zeta, 
### see lmomco::cdfln3
mulog, 
### see lmomco::cdfln3
sigmalog
### see lmomco::cdfln3
){
  r = cdfln3(q, vec2par(c(zeta, mulog, sigmalog), type='ln3', paracheck=FALSE))
  if(is.null(r))
    return(rep(NaN, length(q)))
  else
    return(r)    
}
