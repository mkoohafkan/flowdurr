plot_fittings <-
structure(function#Diagnostic plots for fittings
### Wrapper function for the fitdistrplus::plotdist function.
(flowdata, 
### flow duration data produced by get_peakavg() 
paramdata, 
### parameter data produced by get_parameters() or refine_parameters()
distr=c('lp3', 'ln3'),
### distribution used for fitting, either log Pearson III ('lp3') or lognormal ('ln3').
...
### other arguments to be passed to fitdistrplus::plotdist
){
  distr = match.arg(distr, c('lp3', 'ln3'))
  for(n in names(flowdata)){
    pd = as.list(paramdata[[n]])
	names(pd) = rownames(paramdata)
    dev.new()
    plotdist(flowdata[[n]], distr, pd, ...)
  }
}, ex = function(){
#
})
