\name{convert_from_cfsd}
\alias{convert_from_cfsd}
\title{Flow to volume conversion}
\description{convert from thousand cubic-feet/second days to cubic feet or acre-feet.}
\usage{convert_from_cfsd(d, to = c("cf", "af"))}
\arguments{
  \item{d}{a dataframe produced by get_forecast() or get_waterdata().}
  \item{to}{convert to cubic feet ('cf') or acre-feet ('af').}
}
\details{CFSD stands for cubic feet per second (cfs) 
averaged over the day (D), i.e. "mean daily flow in cfs". 
Volume is calculated by multiplying flows by the 86400 seconds/day 
to achieve units of cubic feet. Conversion to acre-feet 
is then achieved by multiplying by the ratio of acres to square feet.}
\value{the same dataframe, but with a conversion factor applied.}

\author{Michael Koohafkan}




\examples{
#  d = data.frame(GMT=seq(0,10,1), WYD=seq(2014001, 2014011), 
#                 x=seq(0, 10, 1), y=seq(0, 20, 2))
#  convert_from_cfsd(d, 'cf')
#  convert_from_cfsd(d, 'af')
}
