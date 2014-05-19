\name{clean_flowdata}
\alias{clean_flowdata}
\title{Clean up flow data.}
\description{Replace negative, 0 or NA entries in the flow data. }
\usage{clean_flowdata(d, s = c(0, NA, -1), r)}
\arguments{
  \item{d}{a dataframe produced by get_forecast() or get_waterdata().}
  \item{s}{the value targeted for substitution. s = -1 means negative values will be
replaced. s = NA means NA values will be replaced. s = 0 means zero
values will be replaced. }
  \item{r}{the replacement value, either NA or numeric.}
}

\value{the same dataframe, with all zero values replaced.}

\author{Who wrote it}




\examples{
# 
}
