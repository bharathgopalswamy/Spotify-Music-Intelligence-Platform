import pandas as pd

df = pd.read_csv("spotify_track_data.csv")

print(df.shape)
print(df.columns)
print(df.isnull().sum())
print(df.duplicated(subset=["track_id"]).sum())
print(df["album_name"].value_counts())