# Extracting song info ----
track_url <- 'https://api.spotify.com/v1/audio-features/'
vec_id_usa <- vector(length = 50)
for (i in 1:50) {
  vec_id_usa[i] <- str_c(track_url, song_id_usa[i])
}
names <- data.frame(artist = character(),
                    title = character ())
names <- as.data.frame(names, ncol = 2)
for (i in 1:50) {
  names[nrow(names) + 1, ] = c(songs_usa$items[[i]]$track$artists[[1]]$name, songs_usa$items[[i]]$track$name)
}
