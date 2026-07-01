import time
import pandas as pd
import spotipy
from spotipy.oauth2 import SpotifyClientCredentials

CLIENT_ID = "Your client ID"
CLIENT_SECRET = "Your secret key"

sp = spotipy.Spotify(
    auth_manager=SpotifyClientCredentials(
        client_id=CLIENT_ID,
        client_secret=CLIENT_SECRET
    ),
    retries=0,
    status_retries=0,
    requests_timeout=10
)

artist_id = "4zCH9qm4R2DADamUHMCa6O"

albums = []
limit = 5
offset = 0
max_pages = 2  # only 10 albums for now

for page in range(max_pages):
    print(f"Fetching albums page {page + 1}")

    results = sp.artist_albums(
        artist_id,
        include_groups="album,single",
        limit=limit,
        offset=offset
    )

    albums.extend(results["items"])

    offset += limit
    time.sleep(5)

track_rows = []

for index, album in enumerate(albums, start=1):
    print(f"Fetching tracks for album {index}/{len(albums)}: {album['name']}")

    tracks = sp.album_tracks(
        album["id"],
        limit=50
    )

    for track in tracks["items"]:
        track_rows.append({
            "track_id": track["id"],
            "track_name": track["name"],
            "album_id": album["id"],
            "album_name": album["name"],
            "release_date": album["release_date"],
            "duration_ms": track["duration_ms"],
            "duration_min": round(track["duration_ms"] / 60000, 2),
            "explicit": track["explicit"],
            "track_number": track["track_number"],
            "artists": ", ".join([artist["name"] for artist in track["artists"]]),
            "track_url": track["external_urls"]["spotify"]
        })

    time.sleep(5)

tracks_df = pd.DataFrame(track_rows)
tracks_df = tracks_df.drop_duplicates(subset=["track_id"])
tracks_df.to_csv("spotify_track_data.csv", index=False)

print("Created spotify_track_data.csv")
print("Total tracks collected:", len(tracks_df))
print(tracks_df.head())