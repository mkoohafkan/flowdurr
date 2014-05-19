\name{plot_empirical_exceedance}
\alias{plot_empirical_exceedance}
\title{Plot empirical exceedance curves.}
\description{plot the empirical cumulative distribution function using plotting positions.}
\usage{plot_empirical_exceedance(flows, ppos)}
\arguments{
  \item{flows}{a dataframe produced by get_peakavg().}
  \item{ppos}{a dataframe produced by get_ppositions().}
}

\value{a ggplot plot.}

\author{Who wrote it}




\examples{
#  d1 = add_wateryear(get_forecast(as.Date(Sys.time()) ))
#  d2 = split_by_calendaryear(add_wateryear(get_waterdata(startdate='2010-10-01')))
#  p1 = get_peakavg(d1, c(1,3,7,15,30,60,90))
#  p2 = get_peakavg(d2, c(1,3,7,15), na.rm=TRUE)
#  plot_empirical_exceedance(p1, get_ppositions(p1))
#  plot_empirical_exceedance(p2, get_ppositions(p2, 0.4))
}
