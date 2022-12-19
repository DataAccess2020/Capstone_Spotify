# Downloading playlists ----
playlist_usa <- 'https://open.spotify.com/playlist/XXXXXXXXXXXXXXXXXXXX' %>%
  str_remove(., 'https://open.spotify.com/playlist/')
playlist_japan <- 'https://open.spotify.com/playlist/XXXXXXXXXXXXXXXXXXXX' %>%
  str_remove(., 'https://open.spotify.com/playlist/')
playlist_italy <- 'https://open.spotify.com/playlist/XXXXXXXXXXXXXXXXXXXX' %>%
  str_remove(., 'https://open.spotify.com/playlist/')
url_usa <- str_c('https://api.spotify.com/v1/playlists/', playlist_usa, '/tracks')
url_japan <- str_c('https://api.spotify.com/v1/playlists/', playlist_japan, '/tracks')
url_italy <- str_c('https://api.spotify.com/v1/playlists/', playlist_italy, '/tracks')

# Creating a table with USA song IDs ----
songs_usa <- GET(url = url_usa,
                config = add_headers(authorization = token))
songs_usa <- httr::content(songs_usa)
song_id_usa <- vector(length = 50)
for (i in 1:50) {
  song_id_usa[[i]] = songs_usa$items[[i]]$track$id
}

# Creating a table with JPN song IDs ----
songs_japan <- GET(url = url_japan,
                 config = add_headers(authorization = token))
songs_japan <- httr::content(songs_japan)
song_id_japan <- vector(length = 50)
for (i in 1:50) {
  song_id_japan[[i]] = songs_japan$items[[i]]$track$id
}

# Creating a table with IT song IDs ----
songs_italy <- GET(url = url_italy,
                   config = add_headers(authorization = token))
songs_italy <- httr::content(songs_italy)
song_id_italy <- vector(length = 50)
for (i in 1:50) {
  song_id_italy[[i]] = songs_italy$items[[i]]$track$id
}
