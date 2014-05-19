refine_parameters <-
function#Refine parameter estimates using MLE
### Refine the L-moment parameter estimates using MLE and a genetic algorithm.
(flowdata, 
### flow duration data to be used for fitting, as created by get_peakavg().
paramdata,
### parameter data to be refined, as created by get_parameters() 
distr, 
### distribution to be fitted, either log Pearson III ('lp3') or lognormal ('ln3').
fix.skew=NULL
### optional: If distr='lp3', skewness value to be fixed. If NULL, skewness 
### estimate will be refined with other parameters.
){
  distr = match.arg(distr, c('lp3', 'ln3'))
  if(distr=='ln3'){  # 3-parameter lognormal
	# parameter formatting
	paramfunc = function(p) 
	  return(list(start=list(mulog=p[2], sigmalog=p[3]),
	              fix.arg=list(zeta=p[1])))
	# parameter formatting	
    coerceback = function(f)
      return(c(zeta=0, f$estimate))
	# standard error formatting
	getserr = function(f)
	  if(!is.null(f$sd))
	    return(c(zeta=NA, f$sd))
	  else
	    return(rep(NA, 3))
	} else {# log Pearson III
    # parameter formatting
	if(is.null(fix.skew))
      paramfunc = function(p)
	    return(list(start=list(mu=p[1], sigma=p[2], gamma=p[3]),
	                fix.arg=NULL))
    else
	  paramfunc = function(p)
	    return(list(start=list(mu=p[1], sigma=p[2]),
	                fix.arg=list(gamma=fix.skew)))
	# parameter formatting
    coerceback = function(f)
      return(f$estimate)
	# standard error formatting
	getserr = function(f)
	  if(!is.null(f$sd))
	    if(!is.null(fix.skew))
	      return(c(f$sd, gamma=NA))
	    else
	      return(f$sd)
	  else
	    return(rep(NA, 3))
  }
  ##details<<The function uses the Maximum Likelihood Estimation functionality
  ##provided by the fitdistrplus package in conjunction with the genetic 
  ##optimization algorithm provided by the rgenoud package. Note that most of
  ##rgenoud parameters are hardcoded in the function. If different settings are 
  ##required, refine_parameters() will need to be redefined by the user.
  mygenoud = function(fn, par, ...){
    # helper function-- domains
    get_domain = function(params, m=5){
      fracpar = unlist(params)/m
      multpar = unlist(params)*m
      minpar = pmin(fracpar, multpar)
      maxpar = pmax(fracpar, multpar)
      return(cbind(minpar, maxpar))
    }
    res = genoud(fn, starting.values=par, Domains=get_domain(par), ...)
	names(res$par) = names(par)
	standardres = c(res, convergence=0)
    return(standardres)
  }
  fits = list()
  serrdata = paramdata
  serrdata[,] = NA
  ic = NULL
  for(n in names(flowdata)){
    d = flowdata[[n]]
	p = paramfunc(paramdata[[n]])
	##details<<uses a smaller population but computes the gradient
	##to determine convergence and allows the number of generations to be extended
	##if the algorithm is converging. 
	p['pop.size'] = 2000
	p['hard.generation.limit'] = FALSE
	p['gradient.check'] = TRUE
    p['boundary.enforcement'] = 0	
    fits[[n]] = try(fitdist(d, distr, start=p$start, fix.arg=p$fix.arg, 
                            custom.optim=mygenoud, nvars=length(p$start),
                            pop.size=p$pop.size, print.level=1, hessian=TRUE,
							boundary.enforcement=p$boundary.enforcement,
							hard.generation.limit=p$hard.generation.limit,
							gradient.check=p$gradient.check))
	flush.console()
	# update parameter values
	paramdata[n] = try(coerceback(fits[[n]]))
	serrdata[n] = try(getserr(fits[[n]]))
    ic = cbind(ic, c(loglik=fits[[n]]$loglik, aic=fits[[n]]$aic, bic=fits[[n]]$bic))
  }
  colnames(ic) = names(flowdata)
  icdata = as.data.frame(ic)
  return(list(parameterdata=paramdata, criteriondata=icdata, sterrordata=serrdata))
### a list containing 1) a table of parameter values for each flow duration,
### 2) a table of information criterion values, 3) a table of standard errors. 
}
