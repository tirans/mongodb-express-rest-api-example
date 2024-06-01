#!/bin/bash

# Set API base URL
API_URL="http://localhost:5050"

echo "Creating a new record..."
curl -X POST -H "Content-Type: application/json" -d "@post_values.json" $API_URL/posts

echo "Fetching all records..."
response=$(curl -s $API_URL/posts)

echo "Saving results to CSV file..."
echo "$response" | jq -r '
map({
    _id: (._id | tostring),
    body: (.body | tostring),
    permalink: (.permalink | tostring),
    author: (.author | tostring),
    title: (.title | tostring),
    tags: (if .tags then (.tags | join(", ")) else "" end),
    comments: (if .comments then (.comments | map([(.body | tostring), (.email | tostring), (.author | tostring)] | join("|")) | join("\n")) else "" end),
    date: (.date | tostring)
}) |
(
    ["_id", "body", "permalink", "author", "title", "tags", "comments", "date"] | @csv
), (
    .[] | [._id, .body, .permalink, .author, .title, .tags, .comments, .date] | @csv
)' > output.csv
echo "Script completed."