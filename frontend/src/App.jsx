const stats = [
  { value: "10", label: "Albums" },
  { value: "124", label: "Tracks" },
  { value: "2.48", label: "Avg Duration" },
  { value: "307.49", label: "Total Minutes" },
];

const cards = [
  {
    title: "Data Pipeline",
    text: "Spotify API → Python ETL → CSV staging → MySQL → SQL views → Power BI",
  },
  {
    title: "Technologies",
    text: "Python, Pandas, Spotipy, MySQL, SQL, Power BI, GitHub",
  },
  {
    title: "Dashboard Features",
    text: "KPI cards, album analytics, listening time analysis, explicit content split, and longest tracks.",
  },
  {
    title: "Business Value",
    text: "Transforms raw music metadata into clear insights for artist, album, and track-level analysis.",
  },
];

function App() {
  return (
    <main>
      <section className="hero">
        <div className="hero-content">
          <span className="badge">Power BI • Spotify API • MySQL</span>

          <h1>Spotify Music Intelligence Platform</h1>

          <p>
            An end-to-end analytics platform that extracts Spotify album and
            track data, processes it through a Python ETL pipeline, stores it in
            MySQL, analyzes it with SQL, and visualizes insights using Power BI.
          </p>

          <div className="hero-buttons">
            <a
              href="https://github.com/bharathgopalswamy/Spotify-Music-Intelligence-Platform.git"
              target="_blank"
              rel="noreferrer"
            >
              View GitHub
            </a>
            <a
              href="../../dashboard/powerbi/Spotify_Music_Intelligence_Dashboard.pbix.pdf"
              download
            >
              Download Report
            </a>
          </div>
        </div>

        <div className="hero-card">
          <img
            src="/screenshots/main-dashboard.png"
            alt="Spotify Music Intelligence Dashboard"
          />
        </div>
      </section>

      <section className="stats" aria-label="Project statistics">
        {stats.map((stat) => (
          <div key={stat.label}>
            <h3>{stat.value}</h3>
            <p>{stat.label}</p>
          </div>
        ))}
      </section>

      <section className="details">
        <div className="panel">
          <h2>Project Overview</h2>
          <p>
            Built a complete music analytics workflow from live Spotify API
            extraction to dashboard reporting. The project demonstrates API
            integration, ETL, SQL analytics, relational database loading, and
            business intelligence dashboarding.
          </p>
        </div>

        <div className="grid">
          {cards.map((card) => (
            <div className="card" key={card.title}>
              <h3>{card.title}</h3>
              <p>{card.text}</p>
            </div>
          ))}
        </div>

        <div className="buttons">
          <a
            href="/dashboard/powerbi/Spotify_Music_Intelligence_Dashboard.pbix.pdf"
            download
          >
            Download Report
          </a>

          <a
            href="/dashboard/powerbi/Spotify_Music_Intelligence_Dashboard.pbix"
            download
          >
            Download PBIX
          </a>
        </div>
      </section>
    </main>
  );
}

export default App;
