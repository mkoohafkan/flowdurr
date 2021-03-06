plot_boxcounts <-
structure(function#Box plot and density
### Create box plots for multiple flow durations
(d,
### flow data generated by get_forecast() or to_*year()
flowdurations=c(1,3),
### numeric vector of flow durations in days,
violin=FALSE,
### Logical: make violin plot instead of box plot?
...
### additional variables passed to geom_boxplot() or geom_violin() 
){
  flowcols = !(grepl('WYD', names(d)) | grepl('GMT', names(d)))
  dfs = NULL
  for(f in flowdurations){
    # loop through each flow duration
	n = paste(f, 'day', 'flow', sep='.')
	fd = get_flowavg(d, f)
	fd['month'] = format(fd$GMT, "%b")
	fd['flow.duration'] = n
	# but we just want the max flows for each trace'
	mfd = NULL
    for(m in unique(fd$month)){
	  monthdat = fd[fd$month==m, ]
	  maxflows = suppressWarnings(data.frame(t(apply(monthdat[, c(flowcols, FALSE, FALSE)], 2, max, na.rm=TRUE))))
	  maxflows['month'] = m
	  maxflows['flow.duration'] = n
	  mfd = rbind(mfd, maxflows)
    }
	dfs = rbind(dfs, mfd)
  }
  # start plotting
  pd = melt(dfs, id.var=c('flow.duration', 'month'),
            variable.name='trace', value.name='max.flow')
  pd['month'] = factor(pd$month, levels=unique(pd$month))
  pd['flow.duration'] = factor(pd$flow.duration, 
                               levels=unique(pd$flow.duration))
  pd[pd$max.flow < 0, 'max.flow'] = NA
  p = ggplot(pd, aes(x=month, y=max.flow, fill=flow.duration)) + 
      scale_y_log10() + scale_fill_brewer(palette="Set1") +
	  xlab('')
  if(violin)
    p = p + geom_violin(...)
  else 
    p = p + geom_boxplot(...)
  return(p)
### a ggplot box plot  
}, ex = function(){
data(hspftraces)
hspf.wyear = split_by_wateryear(hspftraces)
plot_boxcounts(hspf.wyear, c(1,3,7))
plot_boxcounts(hspf.wyear, 7, violin=TRUE)
})
