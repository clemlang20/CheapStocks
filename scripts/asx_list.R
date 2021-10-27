# GET a list of ASX listed companies.
library (tidyverse)

get_stock_list <- read.csv("https://asx.api.markitdigital.com/asx-research/1.0/companies/directory/file?access_token=83ff96335c2d45a094df02a206a39ff4") %>%
  mutate(Code = paste(ASX.code,"AX",sep = ".")) %>%
  mutate(name_code = paste( Company.name, Code,  sep = ", "))%>%
  rename(Company = Company.name) %>%
  select(Code, Company, name_code)