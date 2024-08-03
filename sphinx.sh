#!/bin/bash

# Combine all arguments to form the prompt
PROMPT="$*"

# Define the API endpoint
API_URL="http://localhost:11434/api/generate"

# Define the request payload using jq to ensure proper JSON formatting
PAYLOAD=$(jq -n --arg prompt "$PROMPT" '{"model": "llama3", "prompt": $prompt, "stream": false}')

# Use curl to send the request and jq to parse the JSON response
curl -sS -X POST "$API_URL" -H "Content-Type: application/json" -d "$PAYLOAD" | jq -r '.response' | wl-copy

wl-paste 
