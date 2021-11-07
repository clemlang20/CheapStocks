# GET a list of ASX listed companies.
library (tidyverse)
library(tidyquant)

get_stock_list <- read.csv("https://asx.api.markitdigital.com/asx-research/1.0/companies/directory/file?access_token=83ff96335c2d45a094df02a206a39ff4") %>%
  mutate(Code = paste(ASX.code,"AX",sep = ".")) %>%
  mutate(name_code = paste( Company.name, Code,  sep = ", "))%>%
  rename(Company = Company.name) %>%
  select(Code, Company, name_code)




#test code to extract specific companies
get_stock_list[grepl(pattern = "Sayona",x = get_stock_list$Company,ignore.case = T)==TRUE,]

get_stock_list[grepl(pattern = "avz",x = get_stock_list$Company,ignore.case = T)==TRUE,]

get_stock_list[grepl(pattern = "aurora lab",x = get_stock_list$Company,ignore.case = T)==TRUE,]

#Lets nominate a start date to get the initial price
reference_date <- as.Date('2021-02-01') # lets nominate first of Feb 2021 for now
today <- Sys.Date()

#get price on the reference date

#HWK

HWK_reference_price <-tq_get("HWK.AX",get = 'stock.prices') %>%
                      filter(date == reference_date) %>%
                      select(close)

#getting today's price - cannot be a weekend
today <- if(format(Sys.Date(), "%u") > 5) {
  today <- Sys.Date()-2
}else{
  today <- Sys.Date()
}

# #HWK

HWK_today_price <-  tq_get("HWK.AX",get = 'stock.prices') %>%
                    filter(date == today) %>%
                    select(close)

# error check, should always be false.
is.na(HWK_today_price)


#Difference between reference price and latest price.
change_in_Price <- HWK_today_price - HWK_reference_price

percentage_change <- (HWK_today_price - HWK_reference_price)/HWK_reference_price * 100

#%difference


#next will write a function that takes in a stock code an& reference date and spits out the percentage change in price

percentage_change_function <- function(stock = 'AVZ.AX', start_date = '20210201' ){}
  
