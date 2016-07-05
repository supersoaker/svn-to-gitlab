#!/bin/bash


mkdir -p svn-to-gitlab-temp
sudo rm -R svn-to-gitlab-temp
cd svn-to-gitlab-temp

git svn clone https://svn.example.com/ ./ --authors-file=authors-file.txt

curl -H "Content-Type:application/json" https://git.example.com/api/v3/projects?private_token=XXXXXXXXXXXXXXXXXXXX -d "{ \"name\": \"$2\", \"namespace_id\": \"10\" }"

git push --mirror https://git.example.com/XXNAMESPACEXX/$2.git

cd ..
echo "Finished !!1"