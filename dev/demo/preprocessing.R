# ESP traces
data(esptraces)  # or use get_forecast()
esp.ahoc = subset_forecast(esptraces, location='AHOC1')
esp.subset = subset_forecast(esptraces, startdate=Sys.Date()+10, enddate=Sys.Date()+193)
# can also subset by date. See ?subset_forecast
esp.clean = strip_na_cols(clean_flowdata(esp.subset, -1, NA))
# USGS traces
data(usgstraces)  # or use get_waterdata()
usgs.cyear = split_by_calendaryear(usgstraces)
usgs.wyear = split_by_wateryear(usgstraces)
usgs.subset = subset_waterdata(usgs.wyear, sc="GMT", 
                               startdate="11-01", enddate="06-30")
usgs.clean = strip_na_cols(clean_flowdata(usgs.subset, -1, NA))
# HSPF traces
data(hspftraces)  # or use get_hspf("path/to/file.csv")
hspf.wyear = split_by_wateryear(hspftraces)
hspf.subset = subset_waterdata(hspf.wyear, sc="GMT", 
                               startdate="11-01", enddate="06-30")
hspf.clean = strip_na_cols(clean_flowdata(hspf.subset, -1, NA))
