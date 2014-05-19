\name{get_forecast}
\alias{get_forecast}
\title{Download ESP traces from CNRFC.}
\description{download forecast data from the internet and get it into R.}
\usage{get_forecast(datestring)}
\arguments{
  \item{datestring}{the date to download, represented by the string YYYY-MM-DD or R date class.
e.g. October 12, 1980 is "1980-10-12"}
}
\details{The California Nevada River Forecast Center provides daily flow 
predictions generated for ensemble forecasting. Daily flows are reported 
as daily average instantaneous flow in thousand cubic feet per second, or 
kcfsd (i.e. 1 kcfs = 1000 cfs (d)aily). Flow values are multiplied by a 
factor of 1,000 so that the data is returned in cfsd.}
\value{a dataframe containing the trace data.}

\author{Who wrote it}




\examples{
#  get_forecast(as.Date(Sys.time()))
}
