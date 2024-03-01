+Purpose of this project:
As a devops engineer we are required to do manage github repository of an oraganization, wherein we need to give people permission or revoke the permissions to access certain repository or to know who are the members or owners of the organization, to do so we can either go to github and login in a traditional way or run a 
shell-script  to get all the details easily.

->So today we will write a shell script to revoke access of the person which is not in our organisation or team from the github repo, if he's present.

+How does shell-script interact with github?
It interacts with github using github integration which uses API to talk with shell-script.

+How we as a devops engineer know how to use API?
We read the API documentation of the API we want to use.
For example we want to get the list of all the pull requests present in a repository; so we read the API documentaion of github and get the command to list all the pull requests.

(For future reference remember: the link which is provided has some words in "CAPS" only those shall be replaced with our required data. Eg:
curl -L \
-H "Accept: application/vnd.github+json" \
-H "Authorization: Bearer <YOUR-TOKEN>" \
-H "X-GitHub-Api-Version: 2022-11-28" \
https://api.github.com/repos/OWNER/REPO/pulls

Here, YOUR-TOKEN, OWNER, REPO shall be replaced with our requied data rest all shall be left untouched)

+Task:
1. clone shellscript from a github repo code to list all the users on an EC2 instance.
2. Execute it on a repository to validate it.
3. Improve the shell-script.

+Working:
1. Launch an EC2 instance.
2. Log into the EC2 instance using ubuntu(command: ssh -i PATH_OF_PEM ubuntu@IP-of_EC2(public)
3. clone the repo.
4. Export your username and token
(command1: export username="your username"
 command2: export token=""
 To get tokenID(which is your access id to your github); Go to github setting>Developersetting> Tokens(classic)>create a new token and give it every permission except admin and copy the token id

Paste the id on command2 )

5. Execute the shell script followed by org name and repo name
Eg ./list-users.sh orgName repoName
(if you aren't the owner of a repo you won't be able to see who have read permission)









