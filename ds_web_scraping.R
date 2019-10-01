library(tidyverse)
library(rvest)

indeed <- "https://www.indeed.com"

search_result_base <- "https://www.indeed.com/jobs?q=data+scientist&l=San+Francisco+Bay+Area%2C+CA"
page_num <- seq(0, 2940, by = 10)
search_result <- paste0(search_result_base, "&start=", page_num)
search_result[1]
search_result[295]

page0 <- read_html(search_result)

page1 <- read_html(search_results[1])

pages <- list()
for (i in seq_along(search_results)) {
  pages[[i]] <- read_html(search_results[i])
}
pages

partial_urls0 <- page0 %>%
  html_nodes("#resultsCol .jobtitle") %>%
  html_attr("href")

ds0 <- paste0(indeed, partial_urls0)

ds0[3]

job1 <- read_html(ds0[1])
job2 <- read_html(ds0[2])
job3 <- read_html(ds0[3])

title1 <- job1 %>%
  html_nodes(".jobsearch-JobInfoHeader-title") %>%
  html_text()
title1
title2 <- job2 %>%
  html_nodes(".jobsearch-JobInfoHeader-title") %>%
  html_text()
title2

info1 <- job1 %>%
  html_nodes(".icl-u-xs-mr--xs") %>%
  html_text()
info1
info2 <- job2 %>%
  html_nodes(".icl-u-xs-mr--xs") %>%
  html_text()
info2

company1 <- info1[1]
company1
company2 <- info2[1]
company2

salary1 <- info1[3]
salary1
salary2 <- info2[3]
salary2

address1 <- job1 %>%
  html_nodes(".jobsearch-DesktopStickyContainer-companyrating") %>%
  html_text() %>%
  str_extract("(?<=\\-).+")
address1
address3 <- job3 %>%
  html_nodes(".jobsearch-DesktopStickyContainer-companyrating") %>%
  html_text() %>%
  str_extract("(?<=\\-).+")
address3

description1 <- job1 %>%
  html_nodes("#jobDescriptionText") %>%
  html_text()
description1
description2 <- job2 %>%
  html_nodes("#jobDescriptionText") %>%
  html_text()
description2

get_ds <- function(url) {
  
  job <- read_html(url)
  
  title <- job %>%
    html_nodes()
  
}























