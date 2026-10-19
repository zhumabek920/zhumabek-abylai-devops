# zhumabek-abylai-devops

DevOps Laboratory Work 1 — Linux, Git, Docker and Jenkins.

| Field      | Value    |
|------------|----------|
| Name       | Abylai   |
| Surname    | Zhumabek |
| Group      | IT2-2306 |
| Student ID | 38304    |
| Course     | DevOps   |

## Structure
```
app/app.py                          Python application (prints student info, HTTP on 8080)
scripts/Zhumabek_Abylai_system.sh   Linux system information script
scripts/test.sh                     Project checks used by Jenkins "Test" stage
config/app.conf                     Application configuration
Zhumabek_Abylai_info.txt            Student information
Dockerfile, docker-compose.yml      Docker configuration
Jenkinsfile                         CI pipeline: Checkout → Build → Test → Docker Build → Docker Run
```

## Run
```bash
./scripts/Zhumabek_Abylai_system.sh
docker build -t zhumabek-abylai-devops .
docker run -d -p 5000:8080 --name zhumabek-abylai-container zhumabek-abylai-devops
curl http://localhost:5000
docker compose up -d && docker compose down
```

## Git workflow
- `main` — stable branch, used by Jenkins for builds
- `development` — branch for new changes and testing
- Changes are committed to `development` and then merged into `main`
