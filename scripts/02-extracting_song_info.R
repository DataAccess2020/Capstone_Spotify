# Creating a table with artist name and song title USA ----
track_url <- 'https://api.spotify.com/v1/audio-features/'
vec_id_usa <- vector(length = 50)
for (i in 1:50) {
  vec_id_usa[i] <- str_c(track_url, song_id_usa[i])
}
names_usa <- data.frame(id = character(),
                    artist = character(),
                    title = character())
for (i in 1:50) {
  names_usa[nrow(names_usa) + 1, ] = c(song_id_usa[i], songs_usa$items[[i]]$track$artists[[1]]$name, songs_usa$items[[i]]$track$name)
}

# Creating a table with songs features USA ----
features_usa <- vector(mode = 'list', length = 50)
for (i in 1:50) {
features_usa[[i]] = GET(url = vec_id_usa[i],
                        config = add_headers(authorization = token))
features_usa[[i]] = httr::content(features_usa[[i]])
}
songs_f_usa <- do.call('rbind', features_usa)
songs_f_usa <- songs_f_usa[, -c(12:16)]
usa <- cbind(names_usa, songs_f_usa)

# Creating a table with artist name and song title JPN ----
vec_id_japan <- vector(length = 50)
for (i in 1:50) {
  vec_id_japan[i] <- str_c(track_url, song_id_japan[i])
}
names_japan <- data.frame(id = character(),
                    artist = character(),
                    title = character())
for (i in 1:50) {
  names_japan[nrow(names_japan) + 1, ] = c(song_id_japan[i], songs_japan$items[[i]]$track$artists[[1]]$name, songs_japan$items[[i]]$track$name)
}

# Creating a table with songs features JPN ----
features_japan <- vector(mode = 'list', length = 50)
for (i in 1:50) {
  features_japan[[i]] = GET(url = vec_id_japan[i],
                          config = add_headers(authorization = token))
  features_japan[[i]] = httr::content(features_japan[[i]])
}
songs_f_japan <- do.call('rbind', features_japan)
songs_f_japan <- songs_f_japan[, -c(12:16)]
japan <- cbind(names_japan, songs_f_japan)

# Creating a table with artist name and song title IT ----
vec_id_italy <- vector(length = 50)
for (i in 1:50) {
  vec_id_italy[i] <- str_c(track_url, song_id_italy[i])
}
names_italy <- data.frame(id = character(),
                    artist = character(),
                    title = character())
for (i in 1:50) {
  names_italy[nrow(names_italy) + 1, ] = c(song_id_italy[i], songs_italy$items[[i]]$track$artists[[1]]$name, songs_italy$items[[i]]$track$name)
}

# Creating a table with songs features IT ----
features_italy <- vector(mode = 'list', length = 50)
for (i in 1:50) {
  features_italy[[i]] = GET(url = vec_id_italy[i],
                          config = add_headers(authorization = token))
  features_italy[[i]] = httr::content(features_italy[[i]])
}
songs_f_italy <- do.call('rbind', features_italy)
songs_f_italy <- songs_f_italy[, -c(12:16)]
italy <- cbind(names_italy, songs_f_italy)