require(lmomco)
require(reshape2)
require(ggplot2)
require(RColorBrewer)
require(scales)
require(fitdistrplus)

setwd('C:\\Users\\Michael\\Dropbox\\SFPUC\\volume duration frequency\\CODE')

source("get_forecast.r")
source("get_waterdata.r")
source("plot_traces.r")
source("get_excprobabilities.r")
source("generate_curves.r")


### test with waterdata or forecastdata?
sourcedata = 'waterdata'
#sourcedata = 'forecast'

# get data
### YOU MAY NEED TO RUN THIS BLOCK TWICE
testdate = as.Date('2014-04-11')
if(sourcedata == 'waterdata'){
  # test with waterdata
  testdata = get_waterdata()
  #testdata = add_wateryear(testdata)
  testdata = split_by_wateryear(testdata)
  testdata = strip_na_cols(testdata)
} else if(sourcedata == 'forecast'){
  # OR test with forecastdata
  testdata = get_forecast(testdate)
  #testdata = add_wateryear(testdata)
  testdata = subset_forecast(testdata, sc='WYD', enddate=2014273, location='AHOC1')
}
###
dev.new()
plot_all_traces(testdata)
testdata = clean_flowdata(testdata, -1, NA) # replace negative flows with NA
padata = get_peakavg(testdata, flowduration=c(1,3,7,15,30,60,90,120,183))
ppos = get_ppositions(padata)
ln3estims = get_parameters(padata, 'ln3')
ln3params = refine_parameters(padata, ln3estims, 'ln3')
lp3estims = get_parameters(padata, 'lp3')
lp3params = refine_parameters(padata, lp3estims, 'lp3')

ln3estc = get_excurves(ln3estims, distr='ln3')
ln3curves = get_excurves(ln3params, distr='ln3')
plot_curves(padata, ppos, ln3estc, '3-parameter lognormal', units='cf', logscale=FALSE)
dev.new()
plot_curves(padata, ppos, ln3curves, '3-parameter lognormal', units='cf', logscale=FALSE)



lp3curves = get_excurves(lp3params, distr='lp3')
plot_curves(padata, ppos, ln3curves, '3-parameter lognormal', units='cf', logscale=FALSE)
dev.new()
plot_curves(padata, ppos, lp3curves, 'log Pearson III', units='cf', logscale=FALSE)
dev.new()
