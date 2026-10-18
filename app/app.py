"""DevOps student application: prints student info and serves it over HTTP."""
import os
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer

NAME = os.getenv("STUDENT_NAME", "Abylai")
SURNAME = os.getenv("STUDENT_SURNAME", "Zhumabek")
GROUP = os.getenv("STUDENT_GROUP", "IT2-2306")
STUDENT_ID = os.getenv("STUDENT_ID", "38304")
PORT = int(os.getenv("APP_PORT", "8080"))

INFO = f"""================================
DevOps Student Application
================================
Name: {NAME}
Surname: {SURNAME}
Group: {GROUP}
Student ID: {STUDENT_ID}
Application is running successfully!
"""


class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        body = INFO.encode()
        self.send_response(200)
        self.send_header("Content-Type", "text/plain; charset=utf-8")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)


if __name__ == "__main__":
    print(INFO, flush=True)
    print(f"Listening on port {PORT}...", flush=True)
    ThreadingHTTPServer(("0.0.0.0", PORT), Handler).serve_forever()
