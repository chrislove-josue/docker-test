export default function Home() {
  return (
    <main style={{ padding: 20 }}>
      <h1>🚀 Docker Test App</h1>
      <p>Status: Running</p>
      <p>Env: {process.env.NODE_ENV}</p>
      <p>Build: {process.env.NEXT_PUBLIC_COMMIT_SHA}</p>
      <p>Date: {new Date().toLocaleString()}</p>
    </main>
  );
}