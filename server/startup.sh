#!/bin/bash

# Load environment variables from .env file
export "$(grep -v '^#' .env | xargs)"

# Restore the database using the connection string
#mongoimport --uri "$ATLAS_URI/sample_training"  --collection posts --type csv /dump/sample_training/posts.csv --fields _id,body,permalink,author,title,tags,comments,date
#echo "Database restored successfully"
npm run dev