# svn-to-gitlab
little bash script for bringing old svn repositories to gitlab

##Using
#####Get this repo
```bash
git clone https://github.com/supersoaker/svn-to-gitlab.git
cd svn-to-gitlab
chmod 755 ./import.sh
```
#####Update config.cfg
#####Update authors-file.txt (for user mapping)
#####Execute this script
```bash
./import.sh new-repository-name
```

##Tipps
If you have a dynamic svn repository name just update the svn url in the config file to the svn base url and execute import.sh with a second parameter
```bash
./import.sh new-repository-name old-svn-repository-name
```
