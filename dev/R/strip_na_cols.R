strip_na_cols <-
structure(function#Remove NA columns.
### remove columns that only contain NA values.
(d
### a dataframe.
){
  keep = rep(TRUE, length=length(names(d)))
  for(n in seq(length(keep)))
    if(all(is.na(d[, n])))
	  keep[n] = FALSE
  return(d[, keep])
### the supplied dataframe, but with NA columns removed.
}, ex = function(){
data(usgstraces)
usgs.wyear = split_by_wateryear(usgstraces)
strip_na_cols(usgs.wyear)
})
