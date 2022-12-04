# Creating a table with artist name and song title ----
track_url <- 'https://api.spotify.com/v1/audio-features/'
vec_id_usa <- vector(length = 50)
for (i in 1:50) {
  vec_id_usa[i] <- str_c(track_url, song_id_usa[i])
}
names <- data.frame(id = character(),
                    artist = character(),
                    title = character())
for (i in 1:50) {
  names[nrow(names) + 1, ] = c(song_id_usa[i], songs_usa$items[[i]]$track$artists[[1]]$name, songs_usa$items[[i]]$track$name)
}

# Creating a table with songs features ----
features_usa <- vector(mode = 'list', length = 50)
for (i in 1:50) {
features_usa[[i]] = GET(url = vec_id_usa[i],
                        config = add_headers(authorization = token))
features_usa[[i]] = httr::content(features_usa[[i]])
}
songs_f_usa <- do.call('rbind', features_usa)
songs_f_usa <- songs_f_usa[, -c(12:16)]
usa <- cbind(names, songs_f_usa)
