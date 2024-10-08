#!/bin/bash
# Download jq
curl -Lo jq https://github.com/stedolan/jq/releases/latest/download/jq-linux64 && chmod +x jq
# Fetch the country name using curl and jq
country_name=$(curl -s https://ipapi.co/json/ | ./jq -r '.country_name')

if [ -z "$country_name" ]; then
  echo "Failed to fetch country name. Exiting."
  exit 1
fi

# Define the path to the file
file="statusPageTemplate.js"

# Make a backup of the original file
cp "$file" "$file.bak"

# Update the file
sed -i "s/Latency(Country)/Latency(From $country_name)/g" "$file"

echo "File updated successfully."
npm i express
