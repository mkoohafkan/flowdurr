convert_from_cfsd <-
structure(function#Flow to volume conversion
### convert from thousand cubic-feet/second days to cubic feet or acre-feet.
(d, 
### a dataframe produced by get_forecast() or get_waterdata().
to=c('cf', 'af')
### convert to cubic feet ('cf') or acre-feet ('af').
){
  # get column ids that are not WYD or GMT
  colmask = !(grepl('GMT', names(d)) | grepl('WYD', names(d)))
  # apply conversion factor
  ##details<< CFSD stands for cubic feet per second (cfs) 
  ##averaged over the day (D), i.e. "mean daily flow in cfs". 
  ##Volume is calculated by multiplying flows by the 86400 seconds/day 
  ##to achieve units of cubic feet. Conversion to acre-feet 
  ##is then achieved by multiplying by the ratio of acres to square feet.
  if(to[1] == 'cf')
    d[, colmask] = d[, colmask]*86400
  else if(to[1] == 'af')
    d[, colmask] = d[, colmask]*86400/43560
  else
    stop('value of argument "to" not recognized. Use "cf" or "af".') 
  return(d)
### the same dataframe, but with a conversion factor applied.
}, ex = function(){
#  d = data.frame(GMT=seq(0,10,1), WYD=seq(2014001, 2014011), 
#                 x=seq(0, 10, 1), y=seq(0, 20, 2))
#  convert_from_cfsd(d, 'cf')
#  convert_from_cfsd(d, 'af')
})
