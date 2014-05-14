plot_empirical_exceedance <-
structure(function#Plot empirical exceedance curves.
### plot the empirical cumulative distribution function using plotting positions.
(flows, 
### a dataframe produced by get_peakavg().
ppos
### a dataframe produced by get_ppositions().
){
  require(ggplot2)
  require(reshape2)
  pd = cbind(melt(flows, measure.vars=names(flows), variable.name='flow.duration', 
                  value.name='volume'),
             melt(ppos, measure.vars=names(flows), variable.name='flow.duration', 
			      value.name='p.exceedance')['p.exceedance'])
  p = ggplot(pd, aes(y=volume, x=p.exceedance, color=flow.duration)) + 
      geom_line() + geom_point() + scale_color_grey()
  return(p)
### a ggplot plot.
}, ex = function(){
#  d1 = add_wateryear(get_forecast(as.Date(Sys.time()) ))
#  d2 = split_by_calendaryear(add_wateryear(get_waterdata(startdate='2010-10-01')))
#  p1 = get_peakavg(d1, c(1,3,7,15,30,60,90))
#  p2 = get_peakavg(d2, c(1,3,7,15), na.rm=TRUE)
#  plot_empirical_exceedance(p1, get_ppositions(p1))
#  plot_empirical_exceedance(p2, get_ppositions(p2, 0.4))
})
