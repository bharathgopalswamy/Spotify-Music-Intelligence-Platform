DROP DATABASE IF EXISTS spotify_music;
CREATE DATABASE spotify_music;
USE spotify_music;

CREATE TABLE albums (
    album_id VARCHAR(50) PRIMARY KEY,
    album_name VARCHAR(255) NOT NULL,
    album_type VARCHAR(50),
    release_date VARCHAR(20),
    total_tracks INT,
    spotify_url TEXT
);

CREATE TABLE tracks (
    track_id VARCHAR(50) PRIMARY KEY,
    track_name VARCHAR(255) NOT NULL,
    album_id VARCHAR(50),
    album_name VARCHAR(255),
    release_date VARCHAR(20),
    duration_ms INT,
    duration_min DECIMAL(6,2),
    explicit BOOLEAN,
    track_number INT,
    artists TEXT,
    track_url TEXT,

    CONSTRAINT fk_tracks_album
        FOREIGN KEY (album_id)
        REFERENCES albums(album_id)
);