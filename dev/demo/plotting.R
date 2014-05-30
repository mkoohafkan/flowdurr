# plotting demo
data(workedexample)
# plotting trace data
plot_all_traces(usgs.clean)
plot_trace(usgs.clean, 'wy2010')
plot_boxcounts(usgs.clean, flowdurations=c(1, 3, 7))
plot_boxcounts(usgs.clean, flowdurations=1, violin=TRUE)
plot_countexc(usgs.clean, flowexceeds=c(1500, 2000, 3000))
# plotting flow duration curves
plot_peakflows(usgs.fd, logscale=TRUE)
plot_peakflows(usgs.fd, count=FALSE, facet=FALSE)
# plotting exceedance curves
plot_curves(usgs.fd, usgs.pp, distr='empirical exceedance', 
            logscale=TRUE)
plot_curves(curvedata=usgs.fit, distr='lp3 fit', 
            logscale=TRUE)
plot_parameters(usgs.lp3, "lp3")
