# 🎵 Spotify Music Intelligence Platform

> An end-to-end Data Analytics project that extracts real-world Spotify music data, transforms it through an ETL pipeline, stores it in MySQL, performs analytical SQL queries, and visualizes business insights using Power BI.

<p align="center">
  <img src="assets/dashboard.png" alt="Spotify Music Intelligence Dashboard" width="900">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Python-3.11-blue?logo=python">
  <img src="https://img.shields.io/badge/MySQL-8.0-orange?logo=mysql">
  <img src="https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?logo=powerbi">
  <img src="https://img.shields.io/badge/SQL-Analytics-success">
  <img src="https://img.shields.io/badge/Spotify-Web_API-1DB954?logo=spotify">
  <img src="https://img.shields.io/badge/License-MIT-green">
</p>

---

# 📖 Overview

The **Spotify Music Intelligence Platform** is a complete data analytics project designed to demonstrate the workflow followed by modern Data Analysts.

Instead of analyzing a static CSV alone, this project connects to the **Spotify Web API**, extracts album and track information, performs data cleaning and validation using Python, stores the processed data in a **MySQL relational database**, creates reusable SQL views for reporting, and builds an interactive dashboard in **Power BI**.

The project showcases the complete analytics lifecycle:

> Data Collection → ETL → Database Design → SQL Analytics → Business Intelligence Dashboard

---

# 🚀 Project Objectives

- Extract real-world Spotify music data using the Spotify Web API
- Build an automated ETL pipeline using Python
- Design a normalized MySQL database
- Perform SQL-based business analysis
- Create reusable SQL Views
- Optimize analytical queries
- Build an interactive Power BI dashboard
- Present actionable music insights visually

---

# 🏗 Project Architecture

```text
                     Spotify Web API
                            │
                            ▼
               Python Data Extraction
                            │
                            ▼
               Data Cleaning & Validation
                            │
                            ▼
                  CSV / Data Staging
                            │
                            ▼
                    MySQL Database
        ┌──────────────┬──────────────┐
        ▼              ▼              ▼
     Tables         SQL Views      Analytics
        │
        ▼
      Power BI Dashboard
        │
        ▼
 Business Insights & Visualization
```

---

# 🛠 Technology Stack

| Category | Technologies |
|----------|--------------|
| Programming | Python |
| Data Processing | Pandas |
| API | Spotify Web API |
| Database | MySQL |
| Query Language | SQL |
| Visualization | Power BI |
| Version Control | Git & GitHub |

---

# 📂 Project Structure

```
Spotify-Music-Intelligence-Platform/
│
├── assets/
│   └── dashboard.png
│
├── data/
│   ├── raw/
│   └── processed/
│
├── notebooks/
│
├── powerbi/
│   ├── Spotify_Dashboard.pbix
│   └── Spotify_Dashboard.pdf
│
├── sql/
│   ├── 01_schema.sql
│   ├── 02_analytics.sql
│   ├── 03_views.sql
│   ├── 04_indexes.sql
│   └── 05_procedures.sql
│
├── src/
│   ├── spotify_api.py
│   ├── etl_pipeline.py
│   ├── data_cleaning.py
│   ├── database_loader.py
│   └── data_quality.py
│
├── requirements.txt
├── README.md
└── LICENSE
```

---

# ⚙ Data Pipeline

## 1️⃣ Data Extraction

The project connects to the Spotify Web API using Python and retrieves:

- Albums
- Tracks
- Artists
- Release Dates
- Duration
- Explicit Content
- Spotify URLs

---

## 2️⃣ Data Cleaning

The ETL pipeline performs:

- Missing value validation
- Duplicate removal
- Data type conversion
- Duration conversion (ms → minutes)
- Data consistency checks

---

## 3️⃣ Database Loading

The cleaned dataset is inserted into a normalized MySQL database.

### Tables

### Albums

| Column |
|---------|
| album_id |
| album_name |
| album_type |
| release_date |
| total_tracks |
| spotify_url |

### Tracks

| Column |
|---------|
| track_id |
| track_name |
| album_id |
| duration_ms |
| duration_min |
| explicit |
| artists |
| release_date |
| track_url |

---

# 📊 SQL Analytics

The project answers several business questions using SQL.

Examples include:

- Total albums
- Total tracks
- Average song duration
- Album with most tracks
- Longest songs
- Shortest songs
- Explicit vs Non Explicit songs
- Average duration per album
- Release timeline analysis

---

# 👁 SQL Views

Reusable SQL Views were created for reporting.

| View | Purpose |
|-------|----------|
| vw_album_summary | Album level KPIs |
| vw_track_details | Track information |
| vw_release_timeline | Release trend analysis |
| vw_explicit_summary | Explicit content statistics |
| vw_kpi_summary | Dashboard KPI cards |

---

# 📈 Power BI Dashboard

The dashboard includes:

### KPI Cards

- Total Albums
- Total Tracks
- Average Track Duration
- Total Listening Time

---

### Visualizations

- Tracks per Album
- Average Track Duration by Album
- Total Listening Time by Album
- Explicit vs Non-Explicit Distribution
- Release Timeline
- Top 10 Longest Tracks
- Interactive Track Details Table

---

# 📸 Dashboard Preview

<p align="center">
<img src="assets/dashboard.png" width="1000">
</p>

---

# 📊 Key Insights

### Music Library

- 10 Albums
- 124 Tracks
- 307 Minutes of Music

### Duration

Average song duration:

```
2.48 Minutes
```

### Content

```
Explicit Songs: 2

Non Explicit Songs: 122
```

### Largest Album

```
Coolie (Original Background Score)
```

---

# 📈 Example SQL Query

```sql
SELECT
    album_name,
    COUNT(*) AS total_tracks
FROM tracks
GROUP BY album_name
ORDER BY total_tracks DESC;
```

---

# 💻 Running the Project

## Clone Repository

```bash
git clone https://github.com/YOUR_USERNAME/Spotify-Music-Intelligence-Platform.git
```

---

## Install Requirements

```bash
pip install -r requirements.txt
```

---

## Configure Environment

Create

```
.env
```

```
CLIENT_ID=YOUR_SPOTIFY_CLIENT_ID
CLIENT_SECRET=YOUR_SPOTIFY_CLIENT_SECRET
```

---

## Run ETL

```bash
python src/etl_pipeline.py
```

---

## Create Database

```sql
SOURCE sql/01_schema.sql;
```

---

## Load Data

```bash
python src/database_loader.py
```

---

## Execute Analytics

```sql
SOURCE sql/02_analytics.sql;
```

---

## Create Views

```sql
SOURCE sql/03_views.sql;
```

---

## Open Power BI

Load the SQL Views and interact with the dashboard.

---

# 🎯 Skills Demonstrated

- Python Programming
- REST API Integration
- ETL Development
- Data Cleaning
- MySQL Database Design
- SQL Analytics
- SQL Views
- Query Optimization
- Business Intelligence
- Dashboard Design
- Data Storytelling
- Git Version Control

---

# 🔮 Future Improvements

- Real-time Spotify streaming analytics
- Artist popularity trends
- Genre analysis
- Playlist analytics
- User listening behavior
- Scheduled ETL automation
- Docker deployment
- Cloud-hosted MySQL database
- Interactive web dashboard

---

# 📚 Learning Outcomes

This project demonstrates practical experience with:

- Data Engineering fundamentals
- Database modeling
- SQL analytics
- Power BI reporting
- API integration
- ETL pipeline development
- End-to-end analytics workflow

---

# 👨‍💻 Author

## Bharath Gopalsamy

Master of Applied Computer Science  
St. Francis Xavier University

📧 bharathgopalswamy09@gmail.com

🌐 Portfolio: https://bharathgopalsamy.vercel.app

💼 LinkedIn: https://linkedin.com/in/bharathgopalsamy

🐙 GitHub: https://github.com/bharathgopalswamy

---

# ⭐ If you found this project interesting, consider giving it a star!