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
