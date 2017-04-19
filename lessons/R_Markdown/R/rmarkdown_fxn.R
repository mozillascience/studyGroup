### RMarkdown_fxn.R
###
### Functions to support the R Markdown workshop.
###

np_commodity_lookup <- function(data, com2prod) {
  ### check for commodities in data frame m not found in lookup, per 
  ### product by keyword.  Prints results, nothing returned.
  ###   note: mammal oils excluded per supplemental info, Nature 2012
  ###   Powder and waste of shells?
  
  commodities <- sort(as.character(unique(data$commodity)))
  keywords <- c(
    'sponges'     = 'sponge', 
    'fish_oil'    = 'oil', 
    'seaweeds'    = 'seaweed', 
    'ornamentals' = 'ornamental', 
    'corals'      = 'coral', 
    'shells'      = 'shell')
  for (i in 1:length(keywords)) { 
    # i=1
    prod <- names(keywords)[i]
    keyword <- keywords[i]
    d_missing_l <- setdiff(
      commodities[str_detect(commodities, ignore.case(keyword))], 
      subset(com2prod, product==prod, commodity, drop=T))
    if (length(d_missing_l) > 0) {
      cat(sprintf("\nMISSING in the lookup the following commodites in product='%s' having keyword='%s' in data file %s:\n    %s\n", 
                  prod, keyword, basename(f), paste(d_missing_l, collapse='\n    ')))
    }
  }
  
  ### check for commodities in lookup not found in data
  l_missing_d <- anti_join(com2prod, data, by='commodity')
  if (length(l_missing_d) > 0) {
    cat(sprintf('\nMISSING: These commodities in the lookup are not found in the data %s:\n    ', basename(f)))
    print(l_missing_d)
  }
  return(NULL)
}



np_fix_antilles <- function(harvest_data) {
  ### FAO reports Netherlands Antilles as a single block, but OHI reports the
  ### four islands as separate regions.  This function divides the FAO reported
  ### harvest value across the four separate islands.
  
  if(sum(c('Bonaire', 'Saba', 'Sint Maarten', 'Sint Eustatius') %in% harvest_data$country) != 0) {
    cat('Netherlands Antilles regions already defined! Value not divided.\n')
  } else {
    cat('Dividing Netherlands Antilles value across subregions...\n')
    ### divide Neth Antilles values across four subregions
    ant_data <- harvest_data %>% 
      filter(country == 'Netherlands Antilles') %>%
      mutate(value            = value / 4,
             'Bonaire'        = value,
             'Saba'           = value,
             'Sint Maarten'   = value,
             'Sint Eustatius' = value) %>%
      select(-value, -country) %>% 
      gather(country, value, -commodity, -product, -year) %>%
      mutate(country = as.character(country))
    ### Remove Neth Antilles from list, and bind the subregions instead
    harvest_data <- harvest_data %>%
      filter(country != 'Netherlands Antilles') %>% 
      bind_rows(ant_data)
  }
  return(harvest_data)
}





np_harvest_cat <- function(h_tonnes, h_usd) {
  ### Merge harvest in tonnes to harvest in USD.  
  ### * forces 'commodity' variable to character, to avoid issues with 
  ###   mutate() and join() and such.
  
  
  h1 <- merge(
    h_tonnes %>%
      group_by(rgn_id, product),
    h_usd %>%
      group_by(rgn_id, product),
    by=c('rgn_name', 'rgn_id', 'commodity', 'product', 'year'), all=T) 
  
  h1 <- h1 %>%
    mutate(commodity = as.character(commodity)) %>%
    arrange(rgn_id, product, commodity, year)
  
  return(h1)
}



np_harvest_preclip <- function(h) {
  ### * Identify years with neither tonnes nor USD data (NAs for both),
  ###     use this to determine first reporting year.
  ### * Eliminate all years prior to first reporting year.
  ### * Returns cleaned data with same columns
  
  h1 <- h %>%
    group_by(rgn_id, commodity) %>% 
    mutate(no_data = is.na(tonnes) & is.na(usd)) %>%
    arrange(rgn_id, commodity, no_data, year) %>%
    mutate(
      year_last = max(year, na.rm=T),    
      ### note: currently year_latest is always most recent year of whole dataset
      year_beg  = as.integer(ifelse(no_data[1], (year_last + 1), year[1]))) %>%
    ### Since ordered by (is.na(tonnes) & is.na(usd)) before year, should pickup first non-NA year.
    ###   If no non-NA years, no_data[1] == TRUE, assign year_beg to be beyond the time series. 
    ### Note: The "as.integer" is there to get around an "incompatible types" error.
    
    filter(year>=year_beg) %>%
    ### eliminates years prior to first reporting
    
    select(-year_beg, -year_last, -no_data) %>%
    ### cleans up all columns created in this function
    
    arrange(rgn_id, product, commodity, year)
  
  return(h1)
}

fao_clean_data <- function(m, sub_0_0 = 0.1) {
### Swaps out FAO-specific codes for analysis:
### * FAO_commodities (Natural Products goal)
###
### Note separate calls to mutate() may not be necessary, but ensures proper sequence of flag-replacing, just in case...
###
  
  m1 <- m %>%
    mutate(  
      value = str_replace(value, fixed( ' F'),    ''),
      # FAO denotes with F when they have estimated the value using best available data
      value = ifelse(value == '...', NA, value), 
      # FAO's code for NA
      value = str_replace(value, fixed('0 0'), sub_0_0),  
      # FAO denotes something as '0 0' when it is > 0 but < 1/2 of a unit. 
      # Replace with lowdata_value.
      value = str_replace(value, fixed(  '-'),   '0'),  
      # FAO's code for true 0
      value = ifelse(value =='', NA, value)) %>%
    mutate(
      value = as.numeric(as.character(value)),
      year  = as.integer(as.character(year)))       # search in R_inferno.pdf for "shame on you"
  
  return(m1)
}