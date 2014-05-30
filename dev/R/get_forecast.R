get_forecast <-
structure(function#Download ESP traces from CNRFC
### download forecast data from the internet and get it into R.
(datestring=Sys.Date()
### the date to download, represented by the string YYYY-MM-DD or R date class.
### e.g. October 12, 1980 is "1980-10-12"
){
  # create the url
  forecasturl = paste('http://www.cnrfc.noaa.gov/csv/', gsub('-', '', datestring), 
                      '12_CentralCoast_hefs_csv_daily.zip', sep='')
  # download the data to a temporary file
  td = tempdir()
  tf = tempfile(tmpdir=td, fileext=".zip")
  download.file(forecasturl, tf)
  # extract the file
  fname = as.character(unzip(tf, list=TRUE)$Name[1])
  message('extracting ', fname, '...')
  flush.console()
  unzip(tf, files=fname, exdir=td, overwrite=TRUE)
  fpath = file.path(td, fname)
  # read file into dataframe. Drop second row, which contains units.
  d = read.csv(fpath, header=TRUE, row.names=NULL, 
               stringsAsFactors=FALSE)
  forecast = d[seq(2, nrow(d)), ]
  # rename columns
  locs = unique(unlist(strsplit(readLines(fpath, n=1), ',')))
  locs = locs[locs != 'GMT']
  numtraces = ncol(d) - 1
  numyears = numtraces/length(locs)
  years = seq(1950, length=numyears)
  tracenames = NULL
  message('traces span ', years[1], ' to ', tail(years, 1))
  for(n in locs)
    tracenames = c(tracenames, paste(n, '.', years, sep=''))
  names(forecast) = c('GMT', tracenames)
  # convert GMT column to date  
  forecast[, 'GMT'] = as.Date(substr(forecast$GMT, 1, 10))
  message('Data record spans ', forecast[1, 'GMT'], ' to ', 
          forecast[nrow(forecast), 'GMT'])
  flush.console()
  # convert flows to numeric
  ##details<< The California Nevada River Forecast Center provides daily flow 
  ##predictions generated for ensemble forecasting. Daily flows are reported 
  ##as daily average instantaneous flow in thousand cubic feet per second, or 
  ##kcfsd (i.e. 1 kcfs = 1000 cfs (d)aily). Flow values are multiplied by a 
  ##factor of 1,000 so that the data is returned in cfsd.
  flowcols = seq(2, ncol(forecast)) 
  forecast[, flowcols] = 1000*as.numeric(as.matrix(forecast[, flowcols]))
  message('Flows are in cubic feet per second')
  message('Data imported successfully.')
  flush.console()
  return(add_wateryear(forecast))
### a dataframe containing the trace data.
}, ex = function(){
get_forecast()

## Not run:
## # will fail
## get_forecast(Sys.Date() + 7)
## # old ESP traces are not stored permanently
## get_forecast(Sys.Date() - 365)
## End(Not run)
})
