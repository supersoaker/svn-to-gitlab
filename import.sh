#!/bin/bash

temp_folder="svn-to-gitlab-temp"
source ./config.cfg

mkdir -p $temp_folder
sudo rm -R $temp_folder
mkdir -p $temp_folder
cd $temp_folder

echo -e "Creating git repository from svn"
git svn clone $svn_host_url/$2 ./ --authors-file=../authors-file.txt
echo -e "... done"

echo -e "Creating new repository in gitlab ... "
curl -H "Content-Type:application/json" $gitlab_host_url/api/v3/projects?private_token=$gitlab_private_token -d "{ \"name\": \"$1\", \"namespace_id\": \"$namespace_id\" }"
echo -e "... done"

echo -e "Pushing into new repository ..."
git push --mirror $gitlab_host_url/$namespace_name/$1.git
echo -e "... done"

cd ..
sudo rm -R $temp_folder
echo "Finished migrating svn repository to gitlab: $gitlab_host_url/$namespace_name/$1.git"
