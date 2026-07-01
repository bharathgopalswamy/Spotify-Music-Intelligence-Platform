import pandas as pd
import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Bharath@09",
    database="spotify_music"
)

cursor = conn.cursor()

albums_df = pd.read_csv("data/raw/spotify_album_data.csv")
tracks_df = pd.read_csv("data/processed/spotify_track_data.csv")

for _, row in albums_df.iterrows():
    cursor.execute("""
        INSERT IGNORE INTO albums
        (album_id, album_name, album_type, release_date, total_tracks, spotify_url)
        VALUES (%s, %s, %s, %s, %s, %s)
    """, (
        row["album_id"],
        row["album_name"],
        row["album_type"],
        row["release_date"],
        int(row["total_tracks"]),
        row["spotify_url"]
    ))

for _, row in tracks_df.iterrows():
    cursor.execute("""
        INSERT IGNORE INTO tracks
        (track_id, track_name, album_id, album_name, release_date,
         duration_ms, duration_min, explicit, track_number, artists, track_url)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
    """, (
        row["track_id"],
        row["track_name"],
        row["album_id"],
        row["album_name"],
        row["release_date"],
        int(row["duration_ms"]),
        float(row["duration_min"]),
        bool(row["explicit"]),
        int(row["track_number"]),
        row["artists"],
        row["track_url"]
    ))

conn.commit()

print("Albums loaded:", len(albums_df))
print("Tracks loaded:", len(tracks_df))

cursor.close()
conn.close()