#!/bin/bash
REPO="git@github.com:ppeoudr/i.git";
DIR=$(pwd);
BRANCHES=$(git branch --remotes --format='%(refname:lstrip=3)' | grep '[^master|HEAD]');
echo "Download [ $REPO ]";
echo "├─ info:";
echo "  ├─ PWD: $DIR";
echo "  ├─ REPO: $REPO";
echo "  ├─ BRANCHES: BRANCHES";
echo "├─ setting up branches"; cd ".."
for remote in $BRANCHES;  do
  echo "  ├── cloning [ $remote ] branche";
  mkdir $remote;
  git clone $REPO $remote;
  cd $remote;
  git checkout $remote;
	cd ..
done;

echo "└─ done"

exit 0;
