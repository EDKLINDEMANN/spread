% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_data_files.R
\name{convert_blank_seiiar_with_vax}
\alias{convert_blank_seiiar_with_vax}
\title{Convert blank seiiar with vax}
\usage{
convert_blank_seiiar_with_vax(seiiar, vax)
}
\arguments{
\item{seiiar}{SEIIAR data.table representing a fully susceptible population}

\item{vax}{data.table containing proportion of people vaccinated per location code}
}
\description{
Takes a fully susceptible population and
proportion of people vaccinated per location code
and allocates an appropriate amount of people to
recovered.
For more information, look at \code{vignette("including_vax","spread")}.
}
\examples{
vax_measles <- fhidata::norway_childhood_vax_b2020[
  year == 2016 &
    stringr::str_detect(location_code, "^municip") &
    vax == "measles",
  c("location_code", "proportion")
]

norway_seiiar_measles_noinfected_2017_b2020 <- spread::convert_blank_seiiar_with_vax(
  seiiar = spread::norway_seiiar_noinfected_2017_b2020,
  vax = vax_measles
)
}
