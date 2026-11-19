#!/bin/bash
cd "$(dirname "$0")"
source .venv/bin/activate

echo "Starting OpenShorts backend on port 8000..."
python -m uvicorn app:app --host 0.0.0.0 --port 8000 &
BACKEND_PID=$!

echo "Starting OpenShorts frontend on port 5175..."
cd dashboard
npm run dev -- --port 5175 &
FRONTEND_PID=$!

trap "kill $BACKEND_PID $FRONTEND_PID 2>/dev/null" SIGINT SIGTERM EXIT
echo ""
echo "=========================================================="
echo " OpenShorts Studio running at: http://localhost:5175"
echo " Press Ctrl+C to stop both servers."
echo "=========================================================="
echo ""
wait

