#!/bin/bash

cd ..
current_dir=$(pwd)
logfile="$current_dir/git-log.log"
echo "output log: $logfile"

echo "/-- start commiting folders in $current_dir | $(date) --/"
gitfile="git-auto-commit.sh"


for file in $(find ./**/ -type d -name ".git")
do 
	folder=$(dirname $(realpath $file))    
	echo -e "\n---- uploading $folder ----"
	cd $folder
	git_folder_name=$(basename $(pwd))	
	git pull origin $git_folder_name	
	git add -A
	git commit -am "daily update"
	git push origin $git_folder_name
	#sh $gitfile #aaaa
	cd $current_dir
done

echo -e "\n-- done $(date)\n" #aaaa

exit 0;