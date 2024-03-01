#!/bin/bash

##########
# Author: Sharad Parmar
# Date: 01.03.2024
# Purpose: It lists the pull requests that are present in an organization.
# Arguments: Repo owner, Repo name
###########

# GitHub API URL
API_URL="https://api.github.com"

# Function to make a GET request to the GitHub API
function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"

    # Send a GET request to the GitHub API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to list users with read access to the repository
function list_pull_request {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/pulls"


    echo "Fetching pull requests from: ${API_URL}/${endpoint}"

    # Fetch the list of pull requests on the repository
    pull_requests="$(github_api_get "$endpoint" | jq -r '.[].title')"



    echo "Response from API:"
    echo "$pull_requests"

    # Display the list of pull requests
    if [[ -z "$pull_requests" ]]; then
        echo "No current pull request present for ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "Pull request present for ${REPO_OWNER}/${REPO_NAME}:"
        echo "$pull_requests"
    fi
}

# Function to check command line arguments
function helper {
    expected_cmd_args=2
    if [ "$#" -ne "$expected_cmd_args" ]; then
        echo "Please execute the script with the required cmd args"
        echo "Usage: $0 <Repo_Owner> <Repo_Name>"
        exit 1
    fi
}

# Main script

# Check command line arguments
helper "$@"

# User and Repository information
REPO_OWNER="$1"
REPO_NAME="$2"

echo "Listing pull request to ${REPO_OWNER}/${REPO_NAME}..."
list_pull_request

