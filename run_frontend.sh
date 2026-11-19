#!/bin/bash
cd "$(dirname "$0")/dashboard"
exec npm run dev -- --port 5175

