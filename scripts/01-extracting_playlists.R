# Downloading playlists ----
playlist_usa <- 'https://open.spotify.com/playlist/37i9dQZF1DXbJMiQ53rTyJ' %>%
  str_remove(., 'https://open.spotify.com/playlist/')
playlist_japan <- 'https://open.spotify.com/playlist/37i9dQZF1DWYYQb2mqFd5I' %>%
  str_remove(., 'https://open.spotify.com/playlist/')
playlist_italy <- 'https://open.spotify.com/playlist/37i9dQZF1DWUJcZpQ1337Z' %>%
  str_remove(., 'https://open.spotify.com/playlist/')
url_usa <- str_c('https://api.spotify.com/v1/playlists/', playlist_usa, '/tracks')
url_japan <- str_c('https://api.spotify.com/v1/playlists/', playlist_japan, '/tracks')
url_italy <- str_c('https://api.spotify.com/v1/playlists/', playlist_italy, '/tracks')
songs_usa <- GET(url = url_usa,
                config = add_headers(authorization = token))
songs_usa <- httr::content(songs_usa)
songs_usa$items[[1]]$track$artists[[1]]$name
