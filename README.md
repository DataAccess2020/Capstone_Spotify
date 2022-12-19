# Analysis of Spotify Top 50 Songs of 2022: US, Italy, Japan

This project is devoted to analyzing the features of Spotify Top-50 songs of year 2022 in the United States, Italy and Japan. Using the Spotify API, I obtained the data for the features for each song. I was interested to see if there are any features that make a song popular, and if such features are the same around the world.

**NB:** According to Spotify Development Terms, I am not allowed to publish any data collected during the interaction with the Spotify API and the project development. Because of that, the CSV files with data are not published here, and the final report does not have any tables with data or playlists/tracks' IDs.

## Hypotheses
1. The most popular songs are high in **danceability** and **energy**.
2. The most popular songs' features **are not different** in the three countries analyzed.

## Data
The tasks for my project are the following:

1. Extract the data for playlists with the most popular songs in the USA, Japan and Italy;
2. Extract the data (artist, title, position, features) for each song in the playlist;
3. Create the table with all the songs and three tables for each country's songs;
4. Perform tests (ANOVA, t-test) on the variables;
5. Visualize the data.

## Results
One of my hypothesis proved to be right, and the other one wrong. People in three different parts of the world *do* love energetic music which they can dance to. What is more, for each of top 50 songs (2022) in all the three countries such features as *acousticness*, *speechiness*, *liveness* and *instrumentalness* are low.

There are some differences in features' scores across the countries as well. For instance, songs in the Japanese playlist on average are longer, less danceable, and more 'happy' than those in American and Italian playlists. At the same time, American people prefer less energetic songs than Italians and the Japanese. Mean scores for some other features (*loudness*, *speechiness*) have statistically significant difference, but in practice the difference in values is negligible.

## References
1. Al-Beitawi, Zayd, Mohammad Salehan, and Sonya Zhang. *"What makes a song trend? Cluster analysis of musical attributes for Spotify top trending songs."* Journal of Marketing Development and Competitiveness 14.3 (2020): 79-91.
2. IFPI. *Global Music Report.* URL: https://globalmusicreport.ifpi.org/
3. Spotify Web API | Spotify for Developers. Get Track's Audio Features. URL: https://developer.spotify.com/documentation/web-api/reference/#/operations/get-audio-features

## Folders
- `figures`: plots used in the final report
- `output`: final report
- `scripts`: R scripts containing the code for data transformation, analysis and visualization
