subset_forecast <-
structure(function#Subset ESP trace data
### pull time interval and/or specific locations from forecast data.
(d, 
### a dataframe generated by get_forecast.
sc=c('GMT', 'WYD'), 
### name or index of column to use for date, e.g. 'GMT' or 'WYD'. 
### Default is 'GMT'.
startdate=NULL, 
### the start of interval, date format e.g. as.Date('2012-01-15')
### or string 'YYYY-MM-DD', or numeric water year date, 
### e.g. October 1st, 2013 is 2014001.
enddate=NULL, 
### the last entry in interval, same format as startdate.
location=NULL
### the region identifier, e.g. Arroyo Hondo is 'AHOC1'.
){
  sc = match.arg(sc, c('GMT', 'WYD'))
  # define row mask
  if(is.null(startdate))
    startdate = d[1, sc]
  if(is.null(enddate))
    enddate = d[nrow(d), sc]
  if(sc == 'GMT'){
    startdate = as.Date(startdate)
	enddate = as.Date(enddate)
  }
  rowmask = d[, sc] >= startdate & d[, sc] <= enddate
  # define column mask
  if(is.null(location)){
    colmask = seq(ncol(d))
  } else {
    colmask = c(grep('GMT', names(d)), grep('WYD', names(d)))
    for(loc in location)
      colmask = c(colmask, grep(loc, names(d)))
  }
  return(d[rowmask, colmask])
### return subset of data.
}, ex = function(){
data(esptraces)
subset_forecast(esptraces, location='AHOC1')
subset_forecast(esptraces, sc='GMT', startdate=Sys.Date()+7, enddate=Sys.Date()+183)
subset_forecast(esptraces, sc='WYD', enddate=to_wateryear(Sys.Date()+183))
})
