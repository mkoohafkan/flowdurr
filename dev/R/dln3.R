dln3 <-
function#Density function of the 3-parameter lognormal distribution
### wrapper function for the 3-parameter lognormal distribution 
### defined in package lmomco. Returns NaN vector instead of NULL 
### if parameters are invalid.
(x, 
### quantiles
zeta, 
### see lmomco::pdfln3
mulog, 
### see lmomco::pdfln3
sigmalog
### see lmomco::pdfln3
){
  r = pdfln3(x, vec2par(c(zeta, mulog, sigmalog), type='ln3', paracheck=FALSE))
  if(is.null(r))
    return(rep(NaN, length(x)))
  else
    return(r)    
}
