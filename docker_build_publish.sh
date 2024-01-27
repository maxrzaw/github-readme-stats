#!/bin/bash

# Check if version number is provided as argument
if [ -z "$1" ]; then
    echo "Error: Version number not provided. Usage: $0 <version>"
    exit 1
fi

version="$1"
repository="github-stats"
registry="docker.anakin"

# Build Docker image
docker build -t $repository:$version .

# Tag the image with the version number and 'latest'
docker tag $repository:$version $registry/$repository:$version
docker tag $repository:$version $registry/$repository:latest

# Push the images to the Docker registry
docker push $registry/$repository:$version
docker push $registry/$repository:latest

echo "Docker image $repository:$version and $repository:latest successfully built, tagged, and published to $registry."

