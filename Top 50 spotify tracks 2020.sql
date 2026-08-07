-- Dataset: Spotify top 50 songs in 2020
-- Source: https://www.kaggle.com/datasets/atillacolak/top-50-spotify-tracks-2020



-- Retrieve the names of tracks with a danceability score higher than 0.8.

SELECT track_name
FROM spotifytoptracks
WHERE danceability > 0.8;

-- List the tracks with a tempo over 140.

SELECT track_name
FROM spotifytoptracks
WHERE danceability > 0.8;

-- List the tracks with a duration longer than 4 minutes (240 seconds).

SELECT track_name
FROM spotifytoptracks
WHERE duration_ms > 240000;

-- Find the track names that have both high danceability (above 0.7) and low energy (below 0.5).

SELECT track_name
FROM spotifytoptracks
WHERE danceability > 0.7 AND energy < 0.5;

-- List the top 10 tracks with the highest valence scores

SELECT track_name, valence
FROM spotifytoptracks
ORDER BY valence DESC
LIMIT 10;

-- Calculate average energy and danceability by genre

SELECT genre,
       ROUND(AVG(energy), 3) AS avg_energy,
       ROUND(AVG(danceability), 3) AS avg_danceability
FROM spotifytoptracks
GROUP BY genre
HAVING avg_energy > 0.7 AND avg_danceability > 0.7;

-- Calculate total duration of "Pop" genre tracks in minutes

SELECT SUM(duration_ms) / 60000.0 AS total_duration_minutes
FROM spotifytoptracks
WHERE genre = 'Pop';

-- List the tracks that have a higher tempo than the average tempo of all tracks in the dataset.

SELECT track_name
FROM spotifytoptracks
WHERE tempo > (SELECT AVG(tempo));

-- Find the artist who has the most tracks with a popularity score above 80, and list those tracks.

SELECT artist_name, COUNT(*) AS track_count
FROM spotifytoptracks
WHERE popularity > 80
GROUP BY artist_name
ORDER BY track_count DESC
LIMIT 1;

-- Find the tracks with the same key signature as "The Weeknd's" track "Blinding Lights."

SELECT track_name
FROM spotifytoptracks
WHERE key = (SELECT key FROM spotifytoptracks WHERE track_name = 'Blinding Lights' AND artist_name = 'The Weeknd');

-- Calculate the cumulative popularity score of each artist and list the top 5 artists with the 

highest cumulative popularity.
SELECT artist_name, SUM(popularity) AS cumulative_popularity
FROM spotifytoptracks
GROUP BY artist_name
ORDER BY cumulative_popularity DESC
LIMIT 5;

-- Find the artist with the most tracks in the "Hip-Hop/Rap" genre and list those tracks.

SELECT artist_name, COUNT(*) AS track_count
FROM spotifytoptracks
WHERE genre = 'Hip-Hop/Rap'
GROUP BY artist_name
ORDER BY track_count DESC
LIMIT 1;

