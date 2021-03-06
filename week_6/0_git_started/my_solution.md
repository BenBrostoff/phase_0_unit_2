## Release 2: Basic Git Commands
Define the following commands and describe how they work/what they do.  

### d-
Delete a branch 
Ex. git branch -d clean_up

### diff HEAD
Identify most recent commit

### diff STAGED
See changes you just staged 

### remote 
Push local repo to the github server

#### add
Add file to staging area - ex. git add example_file.txt 

#### branch
Create a copy (i.e. branch) to make separate commits to 

#### checkout
Switch branches 
Eliminate all changes since target
Ex. git checkout --octocat.txt 

#### clone
Clones repo into new directory

#### commit
Commit changes - one can add a description as well with -m [message] 

#### fetch
per Terminal, download objects and references from other repositories 

#### log
Remembers all commits in order changes were made

#### merge
If one has two separate branches, take changes from one branch and commit to the other	

#### pull
Check for changes on GitHub repo and pull any new changes 

#### push
Tells git where to put commits when ready; -u can be used to remember parameters 
Recall you have to use SSH of repo so you won't be asked for username and pass

#### reset
Unstage the most recently staged file 

#### rm
Remove files 

#### status
View current state of project

## Release 4: Git Workflow

- Push files to a remote repository
1. Navigate to the desired directoy in Terminal (meaning you have to go as far as exact folder file(s) are in)
2. Check git remote -v --> this will inform on remote origin (remember to use SSH)
2a.If necessary, create new git with git init
3. git status shows changes not staged for commit

- Fetch changes
4. git commit -m "Sample message" will commit with a message

- Commit locally
5. git push pushes changes to the remote repo

## UPDATE ON RELEASE 4

After talking to Armen about this exercise, I realized my Git Workflow is overly wrong.
A more efficient xroute.
1. Navigate to the most high level directory possible
2. git status and will show you changes within the directory
3. git add . (EMPHASIS ON DOT) will add all changes across the directory
4. git commit -m "message" to commit
5. git push

## Release 5: Reflection

I feel a bit more at ease with some of the git Terminal commands, although to be honest I'm still not as comfortable with it as I am using the Github desktop app.
I have yet to really test out creating separate branches and merging changes, or working with a team and fetching changes on forks. At this point, I'm capable of making simple changes in a repo and pushing them to a remote repo. 
It's obvious to me there are different levels of mastery with git and Github. I hope to improve over time and continue making use of free tutorials and DBC resources. 
