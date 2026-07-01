USE spotify_music;

-- Drop existing views
DROP VIEW IF EXISTS vw_album_summary;
DROP VIEW IF EXISTS vw_kpi_summary;
DROP VIEW IF EXISTS vw_release_timeline;
DROP VIEW IF EXISTS vw_explicit_summary;
DROP VIEW IF EXISTS vw_track_details;

-- 1. Album Summary
CREATE VIEW vw_album_summary AS
SELECT
    album_id,
    album_name,
    MIN(release_date) AS release_date,
    YEAR(MIN(release_date)) AS release_year,
    COUNT(track_id) AS total_tracks,
    ROUND(AVG(duration_min), 2) AS avg_duration,
    ROUND(SUM(duration_min), 2) AS total_duration,
    ROUND(MIN(duration_min), 2) AS shortest_track,
    ROUND(MAX(duration_min), 2) AS longest_track,
    SUM(CASE WHEN explicit = 1 THEN 1 ELSE 0 END) AS explicit_tracks,
    SUM(CASE WHEN explicit = 0 THEN 1 ELSE 0 END) AS non_explicit_tracks
FROM tracks
GROUP BY album_id, album_name;

-- 2. KPI Summary
DROP VIEW IF EXISTS vw_kpi_summary;

CREATE VIEW vw_kpi_summary AS
SELECT
    (SELECT COUNT(*) FROM albums) AS total_albums,
    (SELECT COUNT(*) FROM tracks) AS total_tracks,
    (SELECT COUNT(DISTINCT artists) FROM tracks) AS total_artist_entries,
    (SELECT ROUND(AVG(duration_min), 2) FROM tracks) AS average_track_duration_minutes,
    (SELECT ROUND(SUM(duration_min), 2) FROM tracks) AS total_music_minutes,
    (SELECT COUNT(*) FROM tracks WHERE explicit = 1) AS explicit_tracks,
    (SELECT COUNT(*) FROM tracks WHERE explicit = 0) AS non_explicit_tracks;

-- 3. Release Timeline
CREATE VIEW vw_release_timeline AS
SELECT
    release_date,
    YEAR(release_date) AS release_year,
    MONTH(release_date) AS release_month,
    COUNT(*) AS total_tracks,
    ROUND(AVG(duration_min), 2) AS avg_duration
FROM tracks
GROUP BY release_date
ORDER BY release_date;

-- 4. Explicit Summary
CREATE VIEW vw_explicit_summary AS
SELECT
    CASE
        WHEN explicit = 1 THEN 'Explicit'
        ELSE 'Non Explicit'
    END AS explicit_type,
    COUNT(*) AS total_tracks,
    ROUND(
        COUNT(*) * 100 / (SELECT COUNT(*) FROM tracks),
        2
    ) AS percentage
FROM tracks
GROUP BY explicit;

-- 5. Track Details
CREATE VIEW vw_track_details AS
SELECT
    track_id,
    track_name,
    album_name,
    release_date,
    YEAR(release_date) AS release_year,
    duration_min,
    explicit,
    track_number,
    artists,
    track_url
FROM tracks;