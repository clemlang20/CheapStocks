library(rvest)
library(tidyverse)
library(rvest)
library(tm)
library(proxy)

#scrape the ASX data for market data
#starwars <- read_html("https://rvest.tidyverse.org/articles/starwars.html")

#url <- "https://www.police.wa.gov.au/Traffic/Cameras/Camera-locations"

#url <- "https://www2.asx.com.au/markets/trade-our-cash-market/directory"

url <- "https://www.marketindex.com.au/asx-listed-companies"

#//*[@id="page-content"]/article/span/div[4]
#//*[@id="page-content"]/article/span/div[4]/div/table

# pol_cams <- url %>%
#   xml2::read_html() %>%
#   html_nodes(xpath = '//*[@id="page-content"]/article/span/div[4]/div/table') %>%
#   html_table()
# 
# 
# pol_cams_df <- as.data.frame(pol_cams) %>% 
#   rename(suburb = Red.light.speed.camera.locations, intersection = Red.light.speed.camera.locations.1)

#//*[@id="results-container_5"]/table/tbody

mkt_list <- url %>%
  xml2::read_html() %>%
  html_nodes(xpath = '//*[@id="custom-content-root"]/div/div/div/div/div/table') %>%
  html_table()
