\name{plot_peakflows}
\alias{plot_peakflows}
\title{Flow duration histograms}
\description{Plot histograms for each flow duration}
\usage{plot_peakflows(fd, logscale = TRUE, count = TRUE, facet = TRUE)}
\arguments{
  \item{fd}{Flow duration data generated by get_peakavg()}
  \item{logscale}{Logical: plot flows on log scale?}
  \item{count}{Logical: plot counts (histogram) instead of density?}
  \item{facet}{Logical: Facet the data by flow duration?}
}

\value{ggplot of histograms faceted by flow duration}

\author{Michael Koohafkan}




\examples{
data(esptraces)
esp.ahoc = subset_forecast(esptraces, location='AHOC1')
esp.fd = get_peakavg(esp.ahoc, c(1,3,7))
plot_peakflows(esp.fd)
plot_peakflows(esp.fd, facet=FALSE, count=FALSE)
}
