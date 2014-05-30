to_wateryear <-
structure(function#Hydrologic date conversion
### converts a date to a water year.
(thedate
### a date created by as.Date('YYYY-MM-DD') or a string of form 'YYYY-MM-DD'.
){
  thedate = as.Date(thedate)
  year = as.integer(substr(thedate, 1, 4))
  cutoff = 	cutoff = as.Date(paste(year, '-10-01', sep=''))
  return(ifelse(thedate < cutoff, 
           year*1000 + thedate - as.Date(paste(year - 1, '-09-30', sep='')),
	       (year + 1)*1000 + thedate - as.Date(paste(year, '-09-30', sep=''))))
### an interger of form YYYYDDD, e.g. 2014-01-01 is 2014001.
}, ex = function(){
to_wateryear(as.Date(Sys.time()))
to_wateryear('2013-10-01')

# leap year behavior
to_wateryear('2012-09-30')
to_wateryear('2013-09-30')
to_wateryear('2012-02-29')
to_wateryear('2013-03-31')
})
