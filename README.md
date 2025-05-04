# Shell-Script-Practice
Scripts for practicing shell scripting and used in devops

Script Details:

1. **awsUsageScript.sh :**
    - This script can be used to manages AWS resources for a user and can also be scheduled at specific time using cronjob command.
      
1. **gitHubAPIIntegrationScript.sh :**
    - This script shows how to use GitHub APIs in shell script
    - It prints two things, first, it lists all the users having read access to provided GitHub Repo , second, it lists all the Pull Requests present in the specified GitHub Repo
    - How to run this script : <br>
      1. Define the github username and token by executing below commands : `export username=<GITHUB_USERNAME>` and `export token=<GITHUB_TOKEN>`
      2. Run following cmd : `./gitHubAPIIntegrationScript.sh <REPO_OWNER> <REPO_NAME>`  -> enter name of Repo Owner and Repo Name to execute GitHub APIs on, as first and second argument.
    


