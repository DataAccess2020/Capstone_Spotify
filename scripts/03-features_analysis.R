# Extracting the tables from CSV files
usa <- rio::import('songs/usa.csv')
italy <- rio::import('songs/italy.csv')
japan <- rio::import('songs/japan.csv')

# Creating the copies of tables for analysis
usa_mod <- data.frame(usa)
it_mod <- data.frame(italy)
jpn_mod <- data.frame(japan)

# Adding the column with the country code
usa_mod <- add_column(usa_mod, country = 'US', .after = 1)
it_mod <- add_column(it_mod, country = 'IT', .after = 1)
jpn_mod <- add_column(jpn_mod, country = 'JPN', .after = 1)

# Creating the table with all the data
data <- rbind(usa_mod, it_mod, jpn_mod)
rio::export(data, 'songs/data.csv', 'csv')
data <- rio::import('songs/data.csv')
# Counting means for the features
all_means <- data %>% group_by(country) %>% summarise_if(is.numeric, mean)
all_means_pos <- data %>% group_by(position) %>% summarise_if(is.numeric, mean)
all_means$position <- NULL  # we do not need the mean for the position
all_means$duration_ms <- apply(all_means[, 'duration_ms'], 1, function(x) (x/60000))  # turning ms to seconds
names(all_means)[names(all_means) == 'duration_ms'] <- 'duration_mins'  # renaming the column

# Leaving only relevant columns
all_means_main <- all_means %>% select(country, danceability, energy, loudness, speechiness, acousticness,
                                       instrumentalness, liveness, valence, tempo)
all_means_pos_main <- all_means_pos %>% select(position, danceability, energy, loudness, speechiness, acousticness,
                                        instrumentalness, liveness, valence, tempo)
# cor_usa <- cor(usa[, c(5, 6, 8, 10:15)])
# cor_it <- cor(italy[, c(5, 6, 8, 10:15)])
# cor_jpn <- cor(japan[, c(5, 6, 8, 10:15)])
# 
summary(aov(energy ~ country, data))

# t-test on danceability IT-JPN
filter(data, country %in% c('IT', 'JPN')) %>% t.test(danceability ~ country, .)

# boxplot on energy
data %>% group_by(country) %>% ggplot(., aes(country, energy)) + geom_boxplot() + coord_flip() + theme_bw()

# Creating the variables with danceability and instrumentalness data
us_dance <- usa$danceability
it_dance <- italy$danceability
jpn_dance <- japan$danceability

us_inst <- usa$instrumentalness
it_inst <- italy$instrumentalness
jpn_inst <- japan$instrumentalness

model <- lm(energy ~ loudness, usa)
summary(model)
ggplot(usa, aes(loudness, energy)) + geom_point() + geom_smooth(method = 'lm')
