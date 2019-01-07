# echo "usage: create-docker=proj.sh  [-d <dockerhub>] [-p <proj-name>"]

dockerhub=""
newproj=""
os=""
basedir="/tmp/docker"
gitdldockerfiletemp="https://raw.githubusercontent.com/manumuc/tmmr01/docker/Dockerfile.template" 

# if : follows flag than i needs a value like "-d testproj"
while getops hd:p:o: option 
do
   case "${option}" in
      d) dockerhub=$1;;
      p) newproj=$2;;
      h) echo "usage: create-docker=proj.sh  [-d <dockerhub>] [-p <proj-name>"];;
   esac
done

# set variable manually
# dockerhub="enter-docker-hub-proj"
# newproj="enter-project-name"

# exit script if variable is empty or not for lx or win configured
if [ -z "$basedir" ]; then
   echo "No information about the OS or base directory not configured
   usage: create-docker=proj.sh  [-d <dockerhub>] [-p <proj-name>]
   for help type create-docker=proj.sh -h"; 
   exit 1;
fi
# create new project folder, change into it
mkdir -p $basedir/$dockerhub/newproj && cd newproject

# Download the template Dockerfile to the folder
#    wget --no-check-certificate --content-disposition https://URL-from-step3/
#    curl -LJO https://URL-from-step3/
 
