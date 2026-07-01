/* =====================================================
   Spotify Music Intelligence Platform
   Analytics Queries
   Author: Bharath Gopalsamy
   Purpose: Analyze album and track data loaded from
            Spotify API into MySQL.
===================================================== */

USE spotify_music;

/* =========================
   1. KPI QUERIES
========================= */

-- Total albums collected
SELECT COUNT(*) AS total_albums
FROM albums;

-- Total tracks collected
SELECT COUNT(*) AS total_tracks
FROM tracks;

-- Average track duration
SELECT ROUND(AVG(duration_min), 2) AS average_duration_minutes
FROM tracks;


/* =========================
   2. ALBUM ANALYSIS
========================= */

-- Albums with the most tracks
SELECT
    album_name,
    total_tracks
FROM albums
ORDER BY total_tracks DESC;

-- Tracks collected per album
SELECT
    album_name,
    COUNT(*) AS tracks_collected
FROM tracks
GROUP BY album_name
ORDER BY tracks_collected DESC;


/* =========================
   3. TRACK DURATION ANALYSIS
========================= */

-- Top 10 longest tracks
SELECT
    track_name,
    album_name,
    duration_min
FROM tracks
ORDER BY duration_min DESC
LIMIT 10;

-- Top 10 shortest tracks
SELECT
    track_name,
    album_name,
    duration_min
FROM tracks
ORDER BY duration_min ASC
LIMIT 10;

-- Average duration by album
SELECT
    album_name,
    ROUND(AVG(duration_min), 2) AS average_duration_minutes
FROM tracks
GROUP BY album_name
ORDER BY average_duration_minutes DESC;


/* =========================
   4. EXPLICIT CONTENT ANALYSIS
========================= */

-- Explicit vs non-explicit tracks
SELECT
    CASE
        WHEN explicit = 1 THEN 'Explicit'
        ELSE 'Non-Explicit'
    END AS explicit_category,
    COUNT(*) AS total_tracks
FROM tracks
GROUP BY explicit_category;


/* =========================
   5. RELEASE TIMELINE ANALYSIS
========================= */

-- Track count by release date
SELECT
    release_date,
    COUNT(*) AS total_tracks
FROM tracks
GROUP BY release_date
ORDER BY release_date;