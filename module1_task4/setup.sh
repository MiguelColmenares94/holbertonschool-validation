#!/bin/bash

# Update package list and install required packages
apt-get update && apt-get install -y wget make git &> /dev/null

# Download Go version 1.20.4 && GoHugo version 0.84.0 binary files
wget https://go.dev/dl/go1.20.4.linux-amd64.tar.gz
wget https://github.com/gohugoio/hugo/releases/download/v0.84.0/hugo_extended_0.84.0_Linux-64bit.tar.gz

# Extract and move go binary to /usr/local
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.20.4.linux-amd64.tar.gz

# include /usr/local/go/bin in PATH
export PATH=$PATH:/usr/local/go/bin

# Extract GoHugo binary
tar -xzf https://github.com/gohugoio/hugo/releases/download/v0.84.0/hugo_extended_0.84.0_Linux-64bit.tar.gz

# Move GoHugo binary to PATH
mv hugo /usr/local/bin

# Clone git repo & move inside repo
git clone https://github.com/MiguelColmenares94/holbertonschool-validation
cd holbertonschool-validation/module1_task3

# Execute the make build command and capture the output and error
output=$(make build 2>&1)

# Print the output and error
echo "$output"

# Check if the error message exists in the output and exit with the error code
if [[ "$output" == *"recipe for target 'build' failed"* ]]; then
  exit 255
fi
