get_waterdata <-
structure(function#Download daily flow data from USGS.
### download flowdata from a USGS gauge using the waterData package.
(startdate=NULL, 
### start date of record, string of form "YYYY-MM-DD".
enddate=NULL, 
### end date of record, same format as startdate.
locid='11173200'
### the station id, default is Arroyo Hondo '11173200'.
){
##details<< flow data is downloaded using the waterData package for R.
##Daily mean flow data (parameter code 00060, stat code 00003) is specified.
  if(is.null(startdate))
    startdate = "1851-01-01"
  if(is.null(enddate))
    enddate = as.Date(Sys.Date(), format = "%Y-%m-%d")
  # parameter code is daily mean flow (00060)
  pc = '00060'
  # stat code is mean daily value (00003)
  sc = '00003'
  # import data
  cat('Downloading data from site', locid, '...\n')
  flush.console()
  d = importDVs(locid, code=pc, stat=sc, sdate=startdate, edate=enddate)
  names(d) = c('staid', 'flow', 'GMT', 'qualcode')
  # convert dates to R date format
  d['GMT'] = as.Date(d$GMT)
  cat('Data downloaded successfully.\n')
  flush.console()
  return(add_wateryear(d[, c('GMT', 'flow')]))
### a continuous time series from the waterData package.
}, ex = function(){
#  get_waterdata()
#  get_waterdata(startdate='2011-10-01', enddate='2013-09-30')
})
