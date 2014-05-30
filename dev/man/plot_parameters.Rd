\name{plot_parameters}
\alias{plot_parameters}
\title{Diagnostic plots for flow duration curves}
\description{Create two diagnostic plots for checking distribution fits}
\usage{plot_parameters(dp, distr)}
\arguments{
  \item{dp}{a dataframe of parameter values produced by get_parameters()}
  \item{distr}{the distribution of the supplied parameters. Options are log Pearson type 
III ('lp3') or 3-parameter lognormal ('ln3').}
}

\value{a ggplot of the parameter space of the supplied flow duration data}

\author{Michael Koohafkan}




\examples{
data(workedexample)
plot_parameters(usgs.lp3, distr='lp3')
}
