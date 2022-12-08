# Loading packages ----
library(tidyverse)
library(httr)
library(stringr)

# Authorization
spotify_cred <- readr::read_csv(file = "spotify-credentials.csv")
clientID <- spotify_cred$clientID
secret <-  spotify_cred$secret
r <-  POST(
  url = 'https://accounts.spotify.com/api/token',
  accept_json(),
  body = list(grant_type = 'client_credentials',
              client_id = clientID,
              client_secret = secret, 
              content_type = "application/x-www-form-urlencoded"),   
  encode = 'form',
  verbose()
)
cnt <- httr::content(r)
token <- str_c(cnt$token_type, cnt$access_token, sep =' ')
