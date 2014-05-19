clean_flowdata <-
structure(function#Clean up flow data.
### Replace negative, 0 or NA entries in the flow data. 
(d, 
### a dataframe produced by get_forecast() or get_waterdata().
s=c(0, NA, -1), 
### the value targeted for substitution. s = -1 means negative values will be
### replaced. s = NA means NA values will be replaced. s = 0 means zero
### values will be replaced. 
r
### the replacement value, either NA or numeric.
){
  s = match.arg(as.character(s), as.character(c(0, NA, -1)))
  if(!(is.numeric(r) | is.na(r)))
    error('Argument "r" must be NA or numeric.')
  colmask = !(grepl('GMT', names(d)) | grepl('WYD', names(d)))
  m = as.matrix(d[, colmask])
  if(is.na(s)) # remove NA values
	m[is.na(m)] = r
  else if(s < 0) # remove negative values
    m[m < 0] = r
  else # remove zero values
    m[m == 0] = r
  d[, colmask] = m
  return(d)
### the same dataframe, with all zero values replaced.
}, ex = function(){
# 
})
