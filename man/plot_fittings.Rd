\name{plot_fittings}
\alias{plot_fittings}
\title{Diagnostic plots for fittings}
\description{Wrapper function for the fitdistrplus::plotdist function.}
\usage{plot_fittings(flowdata, paramdata, distr = c("lp3", "ln3"), ...)}
\arguments{
  \item{flowdata}{flow duration data produced by get_peakavg() }
  \item{paramdata}{parameter data produced by get_parameters() or refine_parameters()}
  \item{distr}{distribution used for fitting, either log Pearson III ('lp3') or lognormal ('ln3').}
  \item{\dots}{other arguments to be passed to fitdistrplus::plotdist}
}



\author{Who wrote it}




\examples{
#
}
