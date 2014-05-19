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
  if(distr == 'lp3')
    p1 = ggplot(pp, aes(x=mu, y=gamma, color=flow.duration)) + geom_point() + 
	     scale_color_brewer(palette="Set1") + ggtitle(distr)
  else
    p1 = ggplot(pp, aes(x=mu, y=zeta, color=flow.duration)) + geom_point() + 
	     scale_color_brewer(palette="Set1") + ggtitle(distr)
  p2 = ggplot(pp, aes(x=mu, y=sigma, color=flow.duration)) + geom_point() + 
	   scale_color_brewer(palette="Set1") + ggtitle(distr)
  dev.new()
  print(p1)
  dev.new()
  print(p2)
}, ex = function(){
#
})
