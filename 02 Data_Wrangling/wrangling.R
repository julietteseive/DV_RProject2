#' Plot total fish weights by species per country for 2013
df %>% select(SPECIES, COUNTRY, Y2013) %>% filter(Y2013 >= 10000) %>% group_by(SPECIES) %>% ggplot(aes(x=COUNTRY, y = Y2013, color = SPECIES)) + geom_point()

#' Clean up data
alt <- df %>% select(SPECIES, COUNTRY, Y2013, Y2012, Y2011, Y2010, Y2009, Y2008, Y2007)  %>% gather("YEAR", "WEIGHT", 3:9)                                                                     

#' Counted fish weights for various species from 2007 to 2013 for France  
#' Filtered out all weight below 10000 tons.
alt %>% filter(COUNTRY == "FR" & WEIGHT >= 10000) %>% ggplot(aes(x=SPECIES, y= WEIGHT)) +geom_point() + facet_wrap(~YEAR)

#' Comparison of France and Spain over years
#' Filtered out all weights below 10000 tons
alt %>% filter(COUNTRY %in% c("ES", "FR") & WEIGHT > 10000)  %>% ggplot(aes(x = SPECIES, y = WEIGHT, color = COUNTRY)) + geom_point() + facet_wrap(~YEAR)
