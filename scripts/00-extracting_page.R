# Loading packages ----
library(tidyverse)

# Authorization
spotify_cred <- readr::read_csv(file = "spotify-credentials.csv")
clientID <- spotify_cred$clientID
secret <-  spotify_cred$secret
