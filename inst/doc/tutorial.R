## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

load("my_linkedInads_data.RData")

## ----setup--------------------------------------------------------------------
library(linkedInadsR)

library(dplyr)
library(ggplot2)

## ---- eval = FALSE------------------------------------------------------------
#  
#  my_linkedInads_data <-
#    fetch_linkedInads(api_key = "your api key",
#             date_from = Sys.Date()-100,
#             date_to = Sys.Date(),
#             fields = c("campaign", "clicks",
#                        "spend", "impressions", "date"))

## -----------------------------------------------------------------------------
str(my_linkedInads_data)

## -----------------------------------------------------------------------------
ggplot(my_linkedInads_data, aes(y = clicks, fill = campaign)) + geom_boxplot()

## -----------------------------------------------------------------------------
lmod <- glm(clicks ~ campaign, data = my_linkedInads_data, family = "poisson")
summary(lmod)

