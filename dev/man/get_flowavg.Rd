\name{get_flowavg}
\alias{get_flowavg}
\title{Flow duration traces}
\description{calculate flow duration for traces using moving window average.}
\usage{get_flowavg(d, duration)}
\arguments{
  \item{d}{trace data as produced by get_forecast() or split_by_*year()}
  \item{duration}{flow duration length in days}
}
\details{see stats::filter}
\value{trace timeseries for specified flow duration}

\author{Michael Koohafkan}




\examples{
data(esptraces)
esp.ahoc = subset_forecast(esptraces, location='AHOC1')
get_flowavg(esp.ahoc, 1) # identity
get_flowavg(esp.ahoc, 7) # 7-day flow
}
