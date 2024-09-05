#!/bin/bash

# Download tmate binary
echo "Downloading tmate..."
curl -L https://github.com/tmate-io/tmate/releases/download/2.4.0/tmate-2.4.0-static-linux-amd64.tar.xz -o tmate.tar.xz

# Extract the downloaded archive
echo "Extracting tmate..."
tar -xf tmate.tar.xz

# Make tmate executable
echo "Making tmate executable..."
chmod +x tmate-2.4.0-static-linux-amd64/tmate

# Run tmate in the background
echo "Running tmate in the background..."
./tmate-2.4.0-static-linux-amd64/tmate -S /tmp/tmate.sock new-session -d

# Wait for tmate to start
echo "Waiting for tmate to start..."
sleep 5

# Display the SSH and Web session information
echo "Fetching SSH and Web connection info..."
./tmate-2.4.0-static-linux-amd64/tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'
./tmate-2.4.0-static-linux-amd64/tmate -S /tmp/tmate.sock display -p '#{tmate_ssh_ro}'
./tmate-2.4.0-static-linux-amd64/tmate -S /tmp/tmate.sock display -p '#{tmate_web}'

# Keep the session alive for 24 hours (86400 seconds)
echo "Keeping session alive for 24 hours..."
sleep 86400
