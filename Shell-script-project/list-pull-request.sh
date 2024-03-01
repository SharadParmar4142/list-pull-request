#!/bin/bash

##########
# Author: Sharad Parmar
# Date: 01.03.2024
# Purpose: It lists the pull requests that are present in an organization.
# Aruguments: Repo owner ,Repo name
###########



# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token
USERNAME=$username
TOKEN=$token

# User and Repository information
REPO_OWNER=$1
REPO_NAME=$2

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

    # Fetch the list of pull request on the repository
    pull_requests"="$(github_api_get "$endpoint" | jq -r '.[].title')"

    # Display the list of pull request
    if [[ -z "$pull_requests" ]]; then
        echo "No current pull request present for ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "Pull request present for ${REPO_OWNER}/${REPO_NAME}:"
        echo "$pull_requests"
    fi
}

function helper{
        expected_cmd_args=2
        if [ "$#" -ne "$expected_cmd_args" ]; then
                echo "Please execute the script with the required cmd args"
                echo "Usage: $0 <Repo_Owner> <Repo_Name>"
		exit 1
	fi
}



# Main script

helper "$@"

echo "Listing pull request to ${REPO_OWNER}/${REPO_NAME}..."
list_pull_request


