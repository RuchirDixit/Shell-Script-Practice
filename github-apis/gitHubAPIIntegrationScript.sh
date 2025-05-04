#!/bin/bash

################################################################

# This script shows how to use GitHub APIs in shell script
# It has functions to list users with read access to the GitHub Repository and another functions that lists all the Pull Request in GitHub Repository
# Author : Ruchir Dixit

#####################################################################


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
		function list_users_with_read_access {
		    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

		        # Fetch the list of collaborators on the repository
			    collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

			# Display the list of collaborators with read access
	                if [[ -z "$collaborators" ]]; then
		          echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
		        else
			  echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
                          echo "$collaborators"
			fi
		}	

		# Function to list Pull Requests in the repository
		    function list_pull_requests_in_repo {
			local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/pulls"

			 pulls="$(github_api_get "$endpoint")"

               		 # Display the list of PRs
		         if [[ -z "$pulls" ]]; then
			   echo "No Pull Requests found for ${REPO_OWNER}/${REPO_NAME}."
			 else
			   echo "Pull Requests for ${REPO_OWNER}/${REPO_NAME}:"
                           echo "$pulls"
                         fi
		}

# Main script

echo "Listing PRs for ${REPO_OWNER}/${REPO_NAME}..."
#list_users_with_read_access
list_pull_requests_in_repo
