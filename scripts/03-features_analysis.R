# Extracting the tables from CSV files ----
usa <- rio::import('songs/usa.csv')
italy <- rio::import('songs/italy.csv')
japan <- rio::import('songs/japan.csv')

# Creating the copies of tables for analysis ----
usa_mod <- data.frame(usa)
it_mod <- data.frame(italy)
jpn_mod <- data.frame(japan)

# Adding the column with the country code ----
usa_mod <- add_column(usa_mod, country = 'US', .after = 1)
it_mod <- add_column(it_mod, country = 'IT', .after = 1)
jpn_mod <- add_column(jpn_mod, country = 'JPN', .after = 1)

# Creating the table with all the data ----
data <- rbind(usa_mod, it_mod, jpn_mod)

# Counting means for the features
all_means <- data %>% group_by(country) %>% summarise_if(is.numeric, mean)
all_means$position <- NULL  # we do not need the mean for the position
all_means$duration_ms <- apply(all_means[, 'duration_ms'], 1, function(x) (x/60000))  # turning ms to minutes
names(all_means)[names(all_means) == 'duration_ms'] <- 'duration_mins'  # renaming the column

# Leaving only relevant columns ----
all_means_main <- all_means %>% select(country, danceability, energy, loudness, speechiness, acousticness,
                                       instrumentalness, liveness, valence, tempo)

# t-test on danceability IT-JPN ----
filter(data, country %in% c('IT', 'JPN')) %>% t.test(danceability ~ country, .)

# Table 3 for report ----
it_jpn <- filter(data, country %in% c('IT', 'JPN')) %>% t.test(danceability ~ country, .)
it_jpn.p <- it_jpn$p.value
it_jpn.p <- round(it_jpn.p,4)

t <- it_jpn$statistic
df <- it_jpn$parameter
df <- round(df)
t <- round(t,3)
df.t <- paste(t,df, sep = ", ")

it_jpn_rownames <- c('P value', 't and df')
statoutput <- c(it_jpn.p, df.t)
table_it_jpn <- data.frame(it_jpn_rownames,statoutput)
names(table_it_jpn) <- c('', '')

names(table_it_jpn) <- c("Table 3. t-test on Italy - Japan danceability","")

# ANOVA on the remaining variables ----
summary(aov(loudness ~ country, data))  # significant
summary(aov(speechiness ~ country, data))  # significant
summary(aov(instrumentalness ~ country, data))  # insignificant
summary(aov(liveness ~ country, data))  # insignificant
summary(aov(valence ~ country, data))  # significant
summary(aov(tempo ~ country, data))  # insignificant
summary(aov(duration_ms ~ country, data))  # significant

# ANOVA table ----
anova_all <- data.frame(variable = c('loudness', 'speechiness', 'instrumentalness', 'liveness',
                                     'valence', 'tempo', 'duration_min'),
                        p = c('0.000', '0.008', '0.461', '0.052', '0.025', '0.614', '0.000'))
