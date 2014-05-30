get_flowavg <-
structure(function#Flow duration traces
### calculate flow duration for traces using moving window average.
(d,
### trace data as produced by get_forecast() or split_by_*year()
duration
### flow duration length in days
){
  if(nrow(d) < duration)
    stop('Flow duration window is larger than length of dataset.')
  # helper function
  ##details<<see stats::filter
  rollingmean = function(x, k)
    as.numeric(filter(x, rep(1/k, k), sides=1))
  duration = as.integer(duration)
  # get GMT dates
  res = data.frame(GMT=zoo::as.Date.numeric(rollingmean(as.numeric(d$GMT), 
                                                        duration)))
  for(n in names(d)[names(d)!='GMT'])
    res[n] = rollingmean(d[[n]], duration)
  return(res[!is.na(res$GMT), ])
### trace timeseries for specified flow duration
}, ex = function(){
data(esptraces)
esp.ahoc = subset_forecast(esptraces, location='AHOC1')
get_flowavg(esp.ahoc, 1) # identity
get_flowavg(esp.ahoc, 7) # 7-day flow
})
