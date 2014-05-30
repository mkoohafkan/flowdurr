plot_parameters <-
structure(function#Diagnostic plots for flow duration curves
### Create two diagnostic plots for checking distribution fits
(dp,
### a dataframe of parameter values produced by get_parameters()
distr
### the distribution of the supplied parameters. Options are log Pearson type 
### III ('lp3') or 3-parameter lognormal ('ln3').
){
  distr = match.arg(distr, c('lp3', 'ln3'))
  pp = as.data.frame(t(dp))
  pp['flow.duration'] = factor(rownames(pp), levels=rownames(pp))
  if(distr == 'lp3'){
    mv = c("gamma", "sigma")
	xv = 'mu'
  }
  else{
    mv = "sigmalog"
	xv = 'mulog'
  }
  pd = melt(pp, measure.vars=mv, variable.name='yvar', value.name='value') 
  p = ggplot(pd, aes_string(x=xv, y='value', color='flow.duration')) + geom_point() + 
      facet_grid(yvar~., scales="free_y") +
      scale_color_brewer(palette="Set1")
  return(p)
### a ggplot of the parameter space of the supplied flow duration data
}, ex = function(){
data(workedexample)
plot_parameters(usgs.lp3, distr='lp3')
})
