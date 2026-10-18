#!/bin/bash
# Automated project checks (used by the Jenkins "Test" stage)
set -u
cd "$(dirname "$0")/.."
FAIL=0

check() {  # check "description" command...
    local desc="$1"; shift
    if "$@" >/dev/null 2>&1; then
        echo "[PASS] $desc"
    else
        echo "[FAIL] $desc"; FAIL=1
    fi
}

check "Student info file exists"        test -f Zhumabek_Abylai_info.txt
check "Info file contains Student ID"   grep -q "Student ID: 38304" Zhumabek_Abylai_info.txt
check "System script exists"            test -f scripts/Zhumabek_Abylai_system.sh
check "System script syntax is valid"   bash -n scripts/Zhumabek_Abylai_system.sh
check "Config file exists"              test -f config/app.conf
check "Application file exists"         test -f app/app.py
check "Dockerfile exists"               test -f Dockerfile
for instr in FROM WORKDIR COPY RUN EXPOSE CMD; do
    check "Dockerfile uses $instr"      grep -q "^$instr" Dockerfile
done
check "docker-compose.yml exists"       test -f docker-compose.yml
check ".gitignore ignores *.log"        grep -qx '\*.log' .gitignore

if [ "$FAIL" -ne 0 ]; then
    echo "Some tests FAILED"; exit 1
fi
echo "All tests PASSED"
