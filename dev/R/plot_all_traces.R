plot_all_traces <-
structure(function#Plot ESP traces.
### plot traces in dataset, as well as mean and median flows.
(d
### a dataframe generated by get_forecast() or split_by_*year(get_waterdata() ).
){
  # plot all traces
  namean = function(x) 
    mean(x, na.rm=TRUE)
  namedian = function(x)
    median(x, na.rm=TRUE)
  volcols = !(grepl('WYD', names(d)) | grepl('GMT', names(d)))
  summarydat = data.frame(GMT=d$GMT, WYD=d$WYD,
                          trace=d[, rev(which(volcols==1))[1]],
						  mean=apply(d[, volcols], 1, namean), 
						  median=apply(d[, volcols], 1, namedian))
  msd = melt(summarydat, id.vars=c('GMT', 'WYD'), variable.name='trace', 
             value.name='flow')
  msd['size'] = 1
  msd[msd$trace=='trace', 'size'] = 0
  traces = vector('list', length=sum(volcols) - 1)
  tracenames = names(d)[volcols]
  tracecolors = scales::grey_pal(0.2, 0.8)(sum(volcols))
  for(i in seq(length(traces)))  
    traces[[i]] = geom_line(data=d[,c('GMT', 'WYD', tracenames[i])], 
	                        aes_string(y=tracenames[[i]]), 
							color=tracecolors[i], size=0)
  colorvals = c(tracecolors[1], 'red', 'blue')
  names(colorvals) = c('trace', 'mean', 'median')
  p = ggplot(msd, aes(x=GMT, y=flow)) + traces + 
      geom_line(aes(color=trace, size=size)) + 
	  scale_colour_manual('', values=colorvals) + 
	  scale_size(range=c(0.1, 1), guide=FALSE) +
	  scale_x_date('', breaks=scales::date_breaks("months"), 
                   labels=scales::date_format("%b"))
	  
  return(p)		
### a ggplot plot of all traces, the mean flow, and the median flow.
}, ex = function(){
data(esptraces)
plot_all_traces(subset_forecast(esptraces, location='AHOC1'))

data(hspftraces)
plot_all_traces(split_by_wateryear(hspftraces))
})
