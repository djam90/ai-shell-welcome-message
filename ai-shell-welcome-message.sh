#!/bin/bash

fetch_welcome_message() {
    if [[ $- == *i* ]]; then
        TMPFILE=$(mktemp)

        if command -v jq >/dev/null 2>&1; then
            # jq is available
            curl -s -o "${TMPFILE}" -X POST 'https://api.openai.com/v1/chat/completions' \
            -H "Content-Type: application/json" \
            -H "Authorization: Bearer $OPENAI_API_KEY" \
            -d '{
              "model": "gpt-3.5-turbo",
              "messages": [{"role": "user", "content": "Say an inspiration quote. Quote:"}],
              "temperature": 0.7
            }'

            MESSAGE=$(jq -r '.choices[0].message.content' "${TMPFILE}" 2>/dev/null)

            if [[ $? -ne 0 ]]; then
                echo "Error in JSON parsing."
                cat "${TMPFILE}"
                return
            fi

        elif command -v python >/dev/null 2>&1; then
            # Python is available
            curl -s -o "${TMPFILE}" -X POST 'https://api.openai.com/v1/chat/completions' \
            -H "Content-Type: application/json" \
            -H "Authorization: Bearer $OPENAI_API_KEY" \
            -d '{
              "model": "gpt-3.5-turbo",
              "messages": [{"role": "user", "content": "Say an inspiration quote. Quote:"}],
              "temperature": 0.7
            }'

            MESSAGE=$(python -c "import sys, json; print(json.load(open('${TMPFILE}'))['choices'][0]['message']['content'])" 2>/dev/null)

            if [[ $? -ne 0 ]]; then
                echo "Error in JSON parsing."
                cat "${TMPFILE}"
                return
            fi
        else
            echo "Please install 'jq' or 'python' to use this script."
            return
        fi

        echo "${MESSAGE}"
    fi
}

fetch_welcome_message