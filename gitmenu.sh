#!/bin/bash

actions=("Git Configuration" 
	 "Git Initialization" 
	 "Git Pull | Fetch from and integrate with another repository."
	 "Git Push | Update remote repository with local objects." 
	 "Branching | List, create, or delete branches."
	 "Merging | Join two or more development histories together."
	 "Reseting | Reset current HEAD to the specified state."
	 "Check log | Show commit logs."
	 "Exit") 

PS3="Select an OPTION: "

select action in "${actions[@]}"; do
	echo "------------------------"
	case $action in
		"Git Configuration")
			echo "- git config --global user.name <name>"
			echo "- git config --global user.email <your-email>"
			echo "- git config --global init.defaultBranch main"
			echo "- git config -l, shows your config file"
			echo "------------------------"
			echo
			;;
			
		"Git Initialization")
			echo "- git init"
			echo "- git remote add origin git@github.com:<ssh-link-from-github>, to link an existing local repository (directory) to a remote one." 
			echo "or"
			echo "git clone https://github.com/example/repository.git, to copy a remote repository locally."
			echo "------------------------"
			echo
			;;			
			
		"Git Pull | Fetch from and integrate with another repository.")
			echo "- git pull origin <remote-brance>, sync with the remote directory"
			echo "- git fetch origin <remote-brance>, like git-pull but doesnt automaticaly merges the changes to your local branch. Use it when you want to inspect the changes and use git-merge to apply them if you agree." 
			echo "------------------------"
			echo
			;;
			
		"Git Push | Update remote repository with local objects.")
			echo "- git status, check the changes"
			echo "- git add <file1> <file2>.. , add the files you want to commit to the staging area ( . for selecting all files.)"
			echo "- git commit -m\"Your message here\", commit the changes with a comment."
			echo "- git push origin <remote-brance-name>, push the changes to the correct remote directory."
			echo "------------------------"
			echo
			;;
						
		"Branching | List, create, or delete branches.")
			echo "- git branch -m <name>, move/rename a branch."
			echo "- git branch -d <name>, delete a branch."
			echo "- git branch -a, list all branches (local and remote ones."
			echo "------------------------"
			echo
			;;
			
		"Merging | Join two or more development histories together.")
			echo "- git merge <target-branch>"
			echo "- git merge --no-ff <branch>, disable fast forward to keep log of all the commits."
			echo "------------------------"
			echo
			;;	
			
		"Reseting | Reset current HEAD to the specified state.")
			echo "- git reset, reset any files uploaded in the staged area."
			echo "- git reset --soft HEAD~n, reset HEAD (n) commits back while keeping the changes."
			echo "- git reset --hard HEAD~n, reset HEAD (n) commits and discard all changes."
			echo "------------------------"
			echo
			;;		
		
		"Check log | Show commit logs.")
			echo "- git log"
			echo "- git log --oneline, simplified format in one line."
			echo "------------------------"
			echo
			;;
	
		"Exit")
			echo "Exiting..."
			sleep 1
			break;
			;;
	esac
done


			
