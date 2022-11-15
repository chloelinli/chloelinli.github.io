/*
Queries made using personal BigQuery project named myportfolio-110818 under dataset spotify_trends.

Tables used:
official_1_year for all official personal Spotify stats for past year
official_1_year_genre_langage from first query, with added genre and language columns
*/


-- 1. total times listened to a song in the past year, limited to top 50 excluding podcasts
SELECT
  Title,
  Artist,
  COUNT(Title) AS Times_Listened
FROM `myportfolio-110818.spotify_trends.official_1_year`
WHERE ARTIST != 'Rotten Mango'
GROUP BY Title, Artist
ORDER BY Times_Listened DESC
LIMIT 50;

-- 2. grouping total listenings for each language
SELECT
  Language,
  COUNT(Times_Listened) AS Total_Language_Listened
FROM `myportfolio-110818.spotify_trends.official_1_year_genre_language`
GROUP BY Language
ORDER BY Total_Language_Listened DESC;

-- 3. grouping total listenings for each genre
SELECT
  Genre,
  COUNT(Times_Listened) AS Total_Genre_Listened
FROM `myportfolio-110818.spotify_trends.official_1_year_genre_language`
GROUP BY Genre
ORDER BY Total_Genre_Listened DESC;