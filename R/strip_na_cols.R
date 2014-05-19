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
#  d = data.frame(w=seq(0, 10), x=c(rep(NA, 6), seq(5)), 
#                 y=rep(NA, 11), z=seq(0, 20, 2))
#  strip_na_cols(d)
})
