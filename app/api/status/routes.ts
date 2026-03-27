// app/api/status/route.ts
export async function GET() {
  return Response.json({
    status: "OK",
    timestamp: new Date(),
    message: "API is working 🚀"
  });
}