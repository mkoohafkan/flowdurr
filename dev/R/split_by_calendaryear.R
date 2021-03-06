split_by_calendaryear <-
structure(function#Split a timeseries by calendar year.
### splits a timeseries downloaded using the waterData package by calendar year.
(d
### a dataframe generated by get_waterdata().
){
  years = unique(substr(d$GMT, 1, 4))
  days = seq(as.Date('0000-01-01'), as.Date('0000-12-31'), by=1)
  dl = vector('list', length=length(years))
  for(i in seq(length(dl))){
     rowmask = d$GMT >= as.Date(paste(years[i], '-01-01', sep='')) & 
	           d$GMT <= as.Date(paste(years[i], '-12-31', sep=''))
    dl[[i]] = d[rowmask, ]
  }
  names(dl) = paste('gmt', years, sep='')
  # turn back into dataframe
  warning('Splitting by calendar year negates use of WYD for subsetting.')
  yrtable = data.frame(GMT=days, WYD=rep(NA, 366))
  for(n in names(dl)){
    yrdata = dl[[n]]$flow
    dmin = as.Date(paste('0000-', substr(min(dl[[n]]$GMT), 6, 10), sep=''))
	dmax = as.Date(paste('0000-', substr(max(dl[[n]]$GMT), 6, 10), sep=''))
	# pad start of record
	if(dmin > as.Date('0000-01-01'))
	  yrdata = c(rep(NA, as.integer(dmin - as.Date('0000-01-01'))), yrdata)
	# pad end of record
	if(dmax < as.Date('0000-12-31'))
	  yrdata = c(yrdata, rep(NA, as.integer(as.Date('0000-12-31') - dmax)))
	# deal with leap year
	if(length(yrdata) < 366)
	  yrdata = c(yrdata[seq(60)], NA, yrdata[seq(61, 365)])
	yrtable[n] = yrdata
  }
  return(yrtable)
### a dataframe with each column containing data from each 
### calendar year in the record. Missing values are NA.
}, ex = function(){
data(usgstraces)
split_by_calendaryear(usgstraces)

data(hspftraces)
split_by_calendaryear(hspftraces)
})
