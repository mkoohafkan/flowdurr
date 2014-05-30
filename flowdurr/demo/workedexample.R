# generate the data contained in data(workedexample)
data(usgstraces) # or use get_waterdata()
usgs.wyear = split_by_wateryear(usgstraces)
usgs.clean = clean_flowdata(usgs.wyear, -1, NA)
usgs.clean = clean_flowdata(usgs.wyear, 0, 1e-5)
usgs.clean = strip_na_cols(usgs.clean)
usgs.3df = get_flowavg(usgs.clean, 3)
usgs.fd = get_peakavg(usgs.clean)
usgs.pp = get_ppositions(usgs.fd)
usgs.lp3 = get_parameters(usgs.fd, distr="lp3")
## Not run:
##D ## See ?refine_parameters. [[2]] and [[3]] are diagnostics
##D usgs.lp3.ref = refine_parameters(usgs.fd, usgs.lp3, distr="lp3")[[1]]
## End(Not run)
usgs.fit = get_excurves(usgs.lp3, distr='lp3')
usgs.exc = predict_exceedance(usgs.fd, usgs.lp3, distr='lp3')
