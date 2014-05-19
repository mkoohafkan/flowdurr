dlp3 <-
function#Density function of the (log) Pearson Type III distribution
### wrapper function for the (log) Pearson type III distribution defined in
### package lmomco. Returns NaN vector instead of NULL if parameters are invalid.
(x, 
### quantiles
mu, 
### see lmomco::pdfpe3
sigma, 
### see lmomco::pdfpe3
gamma
### see lmomco::pdfpe3
){ 
  r = pdfpe3(log10(x), vec2par(c(mu, sigma, gamma), type='pe3', paracheck=FALSE))
  if(is.null(r))
    return(rep(NaN, length(x)))
  else
    return(r)    
}
