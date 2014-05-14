refine_parameters <-
function(flowdata, paramdata, distr, returnfits=FALSE){
  distr = match.arg(distr, c('lp3', 'ln3'))
  if(distr=='ln3'){  # 3-parameter lognormal
	# parameter formatting
	paramfunc = function(p) 
	  return(list(start=list(mulog=p[2], sigmalog=p[3]),
	         fix.arg=list(zeta=p[1])))
	# parameter formatting	
    coerceback = function(f)
      return(c(zeta=0, f$estimate))
	distype = 'ln3'
	} else {# log Pearson III
    # parameter formatting
    paramfunc = function(p) 
	  return(list(start=list(mu=p[1], sigma=p[2], gamma=p[3]),
	         fix.arg=NULL))
	# parameter formatting
    coerceback = function(f)
      return(f$estimate)
	distype = 'pe3'
  }
  fits = list()
  for(n in names(flowdata)){
    d = flowdata[[n]]
	p = paramfunc(paramdata[[n]])
	fits[[n]] = try(fitdist(d, distr, start=p[['start']], 
	                fix.arg=p[['fix.arg']]))
	# update parameter values
	paramdata[n] = try(coerceback(fits[[n]]))
  }
  if(returnfits)
    return(fits)
  else
    return(paramdata)
}
