\name{hspftraces}
\docType{data}
\alias{hspftraces}

\title{Sample HSPF trace data}
\description{Sample HSPF trace data. Generated from an HSPF simulation on 5/19/2014.}
\usage{
data(usgstraces)
}
\format{
\enumerate{
  \item GMT. Date in YYYY-MM-DD format.
  \item WYD. Date in water-year day format, i.e. 2014-10-01 is 2014001.
  \item flow. Daily average flow in cubic feet per second. 
}
}
\examples{
data(hspftraces)
summary(hspftraces)
}
\keyword{datasets}
